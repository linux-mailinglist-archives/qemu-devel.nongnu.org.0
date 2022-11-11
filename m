Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714AF62526C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 05:25:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otLZd-0000Y5-FC; Thu, 10 Nov 2022 23:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZa-0000Vq-3U
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:22 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=83144312e2=bin.meng@windriver.com>)
 id 1otLZY-0001aE-8v
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 23:23:21 -0500
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AB4N5DL004957; Thu, 10 Nov 2022 20:23:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Dmn8cxCuCasBpx6D2YuQdb2GNbvlUJ/73O84cHLcKJw=;
 b=V9S890k4H6agRhaImhPuTRc2Thjw0F1gtCSWXb6cR8PSyGnxZ7FvPceiDi/rnLCQ224j
 w/UB8SVKZw0A5sFin8tFeozzc9VXEpoBBqFv3lh26T+KVB0sa+vMO7AcUT/tY6uuHuWB
 ftLXokG061i5KmayjYrMF/vGVbPjHTmVP0Rcu8Yf4bCXKIfOC5haAjwzBPz7oTbikR3R
 IkU3sE/PaH+Juf2xm/hXjTcaB5GCqCQLbMRumefzxW7YMmDKnNz58M6eIL7c3znY4p5p
 on6IXA8Z2qgIYMQWla6hXBlkeqrOk++iD4atxpTxYILxKuLdltm/wib+ueDQ9KkVhQMF 2g== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knk43d9m3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 20:22:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHOZQ9R4lL/3Wi3BSXKctyvbgR1X5Z9yZPo7q88SqUQXPiZbhTTkNk5r2Zk4r2wxfhSsN6lyQfpZX4Km+lkBjY0E4vj0W3yq8PwZ0OVwVbGMRQ/OMNDF6S/jpwln0cbM5e8PtWhaIJeJhrkfQBxK9j7x1XCa/XxDzwURb9qUVjnnxjHrsYJvPzr9zhE6wQO4uEMoijoB5q1NFLHGOtlCIvf/D+BBLRPonD0TPngqiqWYRTY9fgA+JDl8lXwvvuEsZtuyFg5dbylXj3Z1pnCKZhSTCEN/JrvaKbHqkBt4uxRKrJsbc9aLkFjW1k7tmObzDsx5bAHc5dNAhXO7UPzdPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dmn8cxCuCasBpx6D2YuQdb2GNbvlUJ/73O84cHLcKJw=;
 b=W+wfmTC2GpqNkBUd1j6xBjmZ0pmbjI/Pf2wTS6R0nG/RX86U0QU6ikA9rSvJsr49bYbwZczuxk3d0RWMytafSriENSsqNgXAdj6GggiHlMccIcqIUGiltsiTP4jo+yPfid7FLVwYSBbJLwXniStg5NaaCLAyx/my3TOfFkd5HrwN7SaWAnaTHJAyXaKt58AU6/hoySQExqUp8t7I1sV8TscAukCnvW/OsJRWeONpfWb5Y0cw3oIZduJmQ549Bnvztm9z6vywWrlQZ8QDCD52wYWR0lT/oUPGNQcyb981RUSryTXhOqB01S+9TpiVS4d6R7j05BBQp2eRazTcnsSl0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 04:22:46 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 04:22:46 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, Keno Fischer <keno@juliacomputing.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 00/19] At present there is no Windows support for 9p file
 system.
Date: Fri, 11 Nov 2022 12:22:06 +0800
Message-Id: <20221111042225.1115931-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0138.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1::17) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 6291fe57-76f9-4002-fa62-08dac39c62a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UbBe6ahvpMefa4pMfXQNidVJhM4Paqf9DcuvdXUcmUZamHhR/yDMmDSFijUZSFKdv/pKEp+uGnK93tYqxRcIec4SWGKLJSXtBIYvwnbG6jg6NL/yP50Z3ICEOE8Bdp56KgX8ApJsb8dHqPSHAMxynvbJYMabuiI1iQGDz52QXj2PMSAf2ShLSmHfclAGxGp1KuI97sbuAg3MIsFVoQZpiZafmTAvw2CTp6iXa1XbpQsrbwEGO7/AX7sgHdbuQHjgBXB4OyF9OkxWpu9FSpcNfiIFYzL0m+eVFrwYqPsazrrkasnHN5RbrkpsXgdWYcQyu+kh02YqzGxjqS4vNJ1t/9LfkApzfKIXu+nMWmq6F0w1t9JQGlfy4iXXlowwe1GeSjwgUmPnvnKKOKGIlUg5FJ+SG05WGEZ1ADAX14ZRA9wJ+7Wp+w2rixLiDLh8ndj9Ief1bXcwTTjMZ+kUkGcWF691zPUaLBlyEPJOBOMdTgBGe4HjqFsJy9LuK3p7KdM+yNPYyiS0GZxxZYEp6RSRBJw4jAaVz6JEFOxS4OzaHmbPRHa2eYXNfBeyFoViK8juhQLHw/OvKkZf1hOqbOEjNsUgpgLLpuNUH3xyB/+lOT5EDsVoBS/U36ZvtI5yVgAjGJl8kZG5Ea9JxaRB2kAo1Nql8/DynvYzEGZDgasPEYioT6+bht5BHNYwFUArDFQTuvDGajEoiKJFjkDCt7dr6F++DbOU/DIAuT84l0bziQNsQXoMDafk8QMA1qv+Ecy1E/wxNOMDwurq3Ou9Glu3QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(66556008)(316002)(86362001)(8676002)(66476007)(66946007)(4326008)(38350700002)(38100700002)(36756003)(44832011)(83380400001)(52116002)(6512007)(2616005)(1076003)(26005)(6506007)(478600001)(6666004)(186003)(6486002)(8936002)(41300700001)(6916009)(2906002)(54906003)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P3Y1BHi5C2dSS1wjRGOx4N6RZCPZHSYo++wdusK/etB89XyajA86/+X8Gvww?=
 =?us-ascii?Q?UCx4vl2iVeuBjsZZFHogz1aqjTM9soE7SRtLPHC8kfdkfBqMKTXBl9iAk8EK?=
 =?us-ascii?Q?jv/xDKawm5gtXqYyqj8YFDMJhFu7cJ9KHmnFkAD9M9xF2CzMDCnLsVkDLGvs?=
 =?us-ascii?Q?4rtKdZcsa3ncrJpBYyjpv1tJM5yDCbPIa5fDigoP6KQQ3NeWGG7TI1saJvZG?=
 =?us-ascii?Q?9EFgL+gzW2R1Ps/P+sOzoNE/k2vpHIKi7kCdZ7GThrPDK+jE/yA/SR0qKcd6?=
 =?us-ascii?Q?iloLGFPFWoMSEh46e9ukmsoJ8BMTqsaPvIm5LCa7hpnQd/4aXCOpq6okEHJk?=
 =?us-ascii?Q?8PNKYyJTILB6/XrUeqbgypHPJ7mLiviMyg4eXwZKSL46FjNZh8K2G+dUUPZp?=
 =?us-ascii?Q?1K+dL9Tots2vMj20uD4/ntt3NQeeKPQTh+UPMnUtm27aaS/HKSa8DPeEmYKR?=
 =?us-ascii?Q?hJ73M4oUo15Dy+HTogelSH0RjPYqea1/8Y6JD7zzxHK1kNNti2psJh1ntDQz?=
 =?us-ascii?Q?okSsrCLbRn0MXozUdad0wU+p7vkKgUMYpRw504eMDgj/OkRXTzeLJaqfEh/J?=
 =?us-ascii?Q?/8tuZ7HVMew8i7k7ChfUci5k7Xjzh6TjgN3GfGhzFcAmk0reNVRxzDN1FZFU?=
 =?us-ascii?Q?01FyUJh1ycpGxtdJOPDkjTfa+Q6rKbNT+3/EgLhu4aVL7477OvQmf8qabEEQ?=
 =?us-ascii?Q?YljQfPOS7oYkeZs4vVaDi16+meJvMWtAo5nXUU5O0KIHzZwjqULRrDnzOwhu?=
 =?us-ascii?Q?YUUpRwOTzLsnklC9ZBzBEnYEbskztvciO52asH9C3oSdngSK+JbrFTy4fVw/?=
 =?us-ascii?Q?tPGkTdxgBVREkwa02tc7naUkKctJku/yuIHauTWmvD/U/fVx+vsd6r3/Bs9Q?=
 =?us-ascii?Q?xiUoxPPv6UUP7XLaOocYyLymHykI4dogF/FF7Y21HeXo646JM8ANb36tKl9r?=
 =?us-ascii?Q?Hy32/paZI9lQlOIwgDd/6IjQ4lV6qrGfjzG9AM2ndn+cv5a6NNReYPnzA4nX?=
 =?us-ascii?Q?zaQJlCS1+geZs1DKqL+/oJWPjLOtvt/4Et9BhM38gHdUjcPC/GDxCOpFpAWe?=
 =?us-ascii?Q?JWo+g7zpHdql1aevFRuRISfgCSqJoOLcrHLUI1VDCs1a2v7ZbvTckOFZ7ef2?=
 =?us-ascii?Q?Mf+gBFrM/ffuoaknsdIP3XxPTKmBIHUmxMV1t/ZvU7kQZvklAGlWIkVdxTWF?=
 =?us-ascii?Q?Or51M8+qgZBrNs29klCJPDmjIpOUYAolMx3mPycPi2SP1E4acihMY1ZMWc/q?=
 =?us-ascii?Q?n1USujPeOIOs/1d4ITC10FfkzxSZEYbSOiXYEtrjOovecrTYAYyXQgX6wRO5?=
 =?us-ascii?Q?sxjVp8SaKSgsk2Hejz1Lq8mew31wHKYqCF63Z+Bldb5wTX4fSaoyBKifn64A?=
 =?us-ascii?Q?mgjj/kyJiaKfbPEuFhzfhMshyJQN2DWu99k6YsbW+4KwTWG9qiGma7pbwgwW?=
 =?us-ascii?Q?kDTw9ef8mJXVXgD2Nb4tkMmgWrO5VQPRHttSClJqw9TjSxmiVMzaYHNdxwGS?=
 =?us-ascii?Q?oYdQSTKyPcPQy6PyOdElDMfeCsV8ENGFX7q2hwgxQRjhop+qSj5DHhtuddyg?=
 =?us-ascii?Q?00IPPJes/SopQ1ZGiD9jc7pVtO0KGx4sbA7IKH4Xwt+2I922V1VLshXR1uxC?=
 =?us-ascii?Q?Ag=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6291fe57-76f9-4002-fa62-08dac39c62a4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 04:22:46.5983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oT7GjAjz7BbV8tzHBM+2i1DZdV6pExK/Rur979hW7y7TOSL9a4m2h7lvk3SvsusOp9MnP68vIclYzXGYD9xGiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-Proofpoint-ORIG-GUID: sJ-9YnAxgLmQO1Qoil7RWhJQliZDdgQ8
X-Proofpoint-GUID: sJ-9YnAxgLmQO1Qoil7RWhJQliZDdgQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_01,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxlogscore=339 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110027
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=83144312e2=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series adds initial Windows support for 9p file system.

'local' file system backend driver is supported on Windows,
including open, read, write, close, rename, remove, etc.
All security models are supported. The mapped (mapped-xattr)
security model is implemented using NTFS Alternate Data Stream
(ADS) so the 9p export path shall be on an NTFS partition.

'synth' driver is adapted for Windows too so that we can now
run qtests on Windows for 9p related regression testing.

Example command line to test:

  "-fsdev local,path=c:\msys64,security_model=mapped,id=p9 -device virtio-9p-pci,fsdev=p9,mount_tag=p9fs"

Changes in v2:
- Change to introduce QemuFd_t in osdep.h
- Use the new QemuFd_t type
- Add S_IFLNK related macros to support symbolic link
- Support symbolic link when security model is "mapped-xattr" or "mapped-file"
- Update to support symbolic link when applicable
- Warn user if a specific 9pfs operation is not supported
- Use qemu_dirent_off() directly instead of coroutine
- new patch: "hw/9pfs: Add a helper qemu_stat_rdev()"
- new patch: "hw/9pfs: Add a helper qemu_stat_blksize()"
- Use precise platform check in ifdefs to avoid automatically
  opting-out other future platforms unintentionally
- new patch: "hw/9pfs: Update v9fs_set_fd_limit() for Windows"
- Use a more compact solution in the switch..case.. block
- Move getuid() to virtio-9p-client.h

Bin Meng (7):
  qemu/xattr.h: Exclude <sys/xattr.h> for Windows
  hw/9pfs: Drop unnecessary *xattr wrapper API declarations
  hw/9pfs: Replace the direct call to xxxat() APIs with a wrapper
  osdep.h: Introduce a QEMU file descriptor type
  hw/9pfs: Update 9pfs to use the new QemuFd_t type
  hw/9pfs: Add a helper qemu_stat_rdev()
  hw/9pfs: Add a helper qemu_stat_blksize()

Guohuai Shi (12):
  hw/9pfs: Add missing definitions for Windows
  hw/9pfs: Implement Windows specific utilities functions for 9pfs
  hw/9pfs: Update the local fs driver to support Windows
  hw/9pfs: Support getting current directory offset for Windows
  hw/9pfs: Disable unsupported flags and features for Windows
  hw/9pfs: Update v9fs_set_fd_limit() for Windows
  hw/9pfs: Add Linux error number definition
  hw/9pfs: Translate Windows errno to Linux value
  fsdev: Disable proxy fs driver on Windows
  hw/9pfs: Update synth fs driver for Windows
  tests/qtest: virtio-9p-test: Adapt the case for win32
  meson.build: Turn on virtfs for Windows

 meson.build                           |  10 +-
 fsdev/file-op-9p.h                    |  33 +
 hw/9pfs/9p-linux-errno.h              | 151 ++++
 hw/9pfs/9p-local.h                    |  14 +-
 hw/9pfs/9p-util.h                     | 170 +++--
 hw/9pfs/9p.h                          |  33 +
 include/qemu/osdep.h                  |  26 +
 include/qemu/xattr.h                  |   4 +-
 tests/qtest/libqos/virtio-9p-client.h |   7 +
 fsdev/qemu-fsdev.c                    |   2 +
 hw/9pfs/9p-local.c                    | 592 +++++++++++++---
 hw/9pfs/9p-synth.c                    |   5 +-
 hw/9pfs/9p-util-darwin.c              |  14 +-
 hw/9pfs/9p-util-linux.c               |  14 +-
 hw/9pfs/9p-util-win32.c               | 963 ++++++++++++++++++++++++++
 hw/9pfs/9p-xattr.c                    |  16 +-
 hw/9pfs/9p.c                          |  86 ++-
 hw/9pfs/codir.c                       |   2 +-
 fsdev/meson.build                     |   1 +
 hw/9pfs/meson.build                   |   8 +-
 20 files changed, 1939 insertions(+), 212 deletions(-)
 create mode 100644 hw/9pfs/9p-linux-errno.h
 create mode 100644 hw/9pfs/9p-util-win32.c

-- 
2.25.1


