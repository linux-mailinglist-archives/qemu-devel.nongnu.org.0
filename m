Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B373E6809F8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqC-0002xI-RQ; Mon, 30 Jan 2023 04:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqA-0002wm-E0
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:42 -0500
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQq7-0001zo-GD
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:52:41 -0500
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U9hjuB015618; Mon, 30 Jan 2023 01:52:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=ialO6gQ4OVteWAAPWqFQJ6DuDAz48BX9XcNlkAqBLro=;
 b=JMktPv8uVYg63F03Octd68e7VKWw6dj68IQ2B+4SsN24G9Lxe/jo51a1EgqUm9KpP6zI
 d/vcXb0T3ZSPB4K5lvG0oV9idqsNzEdOk2Bp3767iiniOOLvSqL2XnsI53/ohNAyOtN9
 pRSQ0x5ziwp3+l8UQNSyUdjIlfaTc5LtcVnnHBnxSpTPzsbSzw1pI/n1TvewVcL1zlIo
 epUvSSJ2RiMK3senui/+BSLSnEMgQzAqICDU9bO482wWwwbozxzydJ0MNJdySlAI76Mv
 /L77KaCxTdAZsyFpAEKKtRA/OSlwefXTRmeftN7/GS/bCMQOdC5iKBwGfb8fEYy4UTpm zQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nd43rhj5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 01:52:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUtIzh9ejn1JtN4d1llO8ZCvIEipExVFCax0MEwlNId0zLQjqXGmLR7T99FML5mMnmWiidxz0fSY0a103fKdCyUncsh9vjMZfObalf/UOISlnOtx3VcYGh6EinM37cBVzupk9lge4c7mqLli75/BbOII+rtcff6dyR8xrGfmXl6e9rIeaBJzlG2ItEgUDbtEsHj6xuT0EXQ8tgAPvPM72xrLacRGg1swc30Smk0KeUjyMSrae4BRkAq/RGuyDu+jUTBd4nkVmsqquY+oFjCbDUpn6JuwNya+u6GXZ1evIo/JFv9gLBvt/NDLl3I5HLQPo/0hF34bRJ/bh/+5yrBPmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ialO6gQ4OVteWAAPWqFQJ6DuDAz48BX9XcNlkAqBLro=;
 b=Yc0anqbO7v4ZpjowdHnP0X93B6RAsPurxcj8MuwJm4SbJitLHVMUMa2jhsAj6WfSpNGVoKKkuJ9J+EhlvrOiDnI7fZOx+YJ41aI3VeaF4zLdAM9aS56pUF7IEyqZtJYC44IKs3cX5Byuy6igtbqg9Sk1ZCKCMkFxyOFaN+aFzNlhkRxW2HbHokRANtasHb4C+KVLgegFvjTiOuwO+b8RtF5b56KXARAT4znXVyc+WVnADlQz1eoe5yj7yx/pgeWjORLQkZP8c8zVCMIPbUxLKQlEzxP+jiF9qphiXatohxYzlhQ0DXJDjFa4ofgyzxHjZsH0MTm8+ZNXnm/tg5IkJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:19 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:19 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 00/16] hw/9pfs: Add 9pfs support for Windows
Date: Mon, 30 Jan 2023 17:51:46 +0800
Message-Id: <20230130095202.2773186-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 90628557-0cbb-47ea-839d-08db02a7ad21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3yiOik7vpP4UWhdoDyJeW1rIK9WQioK2yt16Uk7toJ3S6P6nwSoOsxq6etE4hLMOJW4A+d2zdOSU1+iaaVSyK5Cf0cC20GzrZJ3XVjRtQ+v9m0UNar15EV2jMU6EMO95d3GAnfXPCOjOu+5NhB5Cw3UXw3zDZPAnQkEnDBiVOV0yZ7ZjHsBGE0eL5MpliGoTQlkgbf8V6WCAnJqi7igNpcQ1hTCPwVLAARjbdlAX6ohhyURC5z3P7g3vSKtg0YtKwmCUgLC+NBNVc/4gBqG4Q+4v3061CzLaM5xu4stJSevfP6eps3C+3G4+CtSDIHwt7Q0uEWNSGWgxXiJ4AKjR3kEvjN2i2sY2ObaFqQlGt5vdKBZwOr5aLTcT62nt5GCEe6MOZuFiB+gThdU2w5QQwewa4BhFmWtuwFk+hxSQ1vfd81wUuagmI5lC3roo5wCKbugkUPAI8fYu8arAioXLTCVsyp7MZS3GOEvWvphRY+SYVGMFfCPHyoY+W5UdejO7TyooSw5k/MOg3+dySXyp5bELXC0AsYiFl+B2nnj55c/5X/oR+0b6rTMVi1gVemg26frkfBFje4Mv5GjZNilaOhtt+kjo2E1e2meBzlmXxSDh9HyLdYfL/wpzgBiNe0nymDnkfENmGgMST+8e3bbnxXbIwnE7Gckdf6JxPvAx6GjpngznsYYXFR9OzgM6d88hfAIr85zn1N40lx938bpXkQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(376002)(136003)(39850400004)(346002)(451199018)(86362001)(38100700002)(38350700002)(478600001)(36756003)(2906002)(54906003)(110136005)(6666004)(52116002)(6486002)(41300700001)(26005)(8936002)(5660300002)(44832011)(66946007)(316002)(8676002)(4326008)(83380400001)(66556008)(66476007)(6512007)(186003)(1076003)(6506007)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SytoaHJKK2hONUNCVWdqMHVERmZVVzlFQlJoaSsybVl3MzRnNE9HMU9zMnJp?=
 =?utf-8?B?VUpWQ2UwQ1l2RGtSNFhSNVdRdEFSTGlXQ3hlV0FxbjA1elcvVlYxYXI4eWZY?=
 =?utf-8?B?TGRlbktPbTBEc3QwOGNmdTEwaHpwQ210U3JDbzJkZ2N2NHk4enhESlgreldP?=
 =?utf-8?B?a0RQYVN6TmNTMzhvaUV6Q0ovNUZ2aXpEZ0ZLcFRZWDVycFU4MUFIZDU1U1A3?=
 =?utf-8?B?Umx2OEFybUpBZWdZeUFnb1J0WnZIUUoydHRkcGJ5WVdzLzNvTFhUVEExZVdW?=
 =?utf-8?B?SU5WU2VWNTRCZllmWGIxVWgwK21aWEdGaGhyc203a1o2ZXNBdXZBRG5jc3RO?=
 =?utf-8?B?TTRZdHNHeWhCaVVwNHBNNW8zVUJrNVFybkxkUzY3OGpzV1J2V1FyZjRwMUFK?=
 =?utf-8?B?VlhEejVrMzNPM2M5NEdDUzUwc2VndXdNa01lYWhBbGIyRHZhbGtDZzlnY0xQ?=
 =?utf-8?B?WG9CS1oxdkkzWjY4Vm1iOFl0UEUwMXAxelhqNDdsL3FNeHZjUVlha2JyK3Rv?=
 =?utf-8?B?WTVrVU9qQ293NWdkQXY5Tk5rYmpUS2J4bjJzOHo0R0MwSFdQYVZrUTI0SThw?=
 =?utf-8?B?Z2ZNNEExLzdzcWhtV1JEOUhZUHczc1A4TDZ0WDZzdEdGMVNwamdrci9tYU1u?=
 =?utf-8?B?MHpjQWpOUkdUMGhpR05QQ0VMMVVvRm5BcFBzZWh3aGwzUnAwcFJLd1NKS2U1?=
 =?utf-8?B?ZXczbEREWVJ6bHNSNE10YWEycndmOHJxS1VISDNGQUtDUmRJNXpnV1lrSG9h?=
 =?utf-8?B?eC9FM01jdXhMVmZaaTVacU1mb29GeDZNL0d6Z3g0UmlyYUVia3ZnRlB2d01s?=
 =?utf-8?B?RlVqUDJYenRweGR0d1dkOURmMktlWmdsbExMQlhPbE5XbVRJKzhxenpNWW5H?=
 =?utf-8?B?MmExamRSZ1pFMjlSR1QwS0tGWjh4WThUaHVrZDEvcFJCbFd6eWtWamdQL2tM?=
 =?utf-8?B?NWNaaytjUVJlV3QydStaZ3duWXgxZW9jZ3NYeEJVOHl0K2hSWmdCcHpqOHEx?=
 =?utf-8?B?TEJHY3V6eUhvdjhjZnluSDNVWkV5Ym9BZkgzK2dvNkhENXp1MEw2U0hhY09U?=
 =?utf-8?B?T3VEYnkvSTJKVTNWbGxjdFduQTFWVVlSNDFmRGpXeWdmMXZpaE03YzJTOHpj?=
 =?utf-8?B?RnNHbGxtYTdEdXpsdDRYQ2FzNGxjS1kvbExhVEJySGRLTTVWelpFUXRHZE94?=
 =?utf-8?B?a2JTTitpY1JVV2hSRFJtWEtKSDNjZ0h2QWx2d0U0TUdnNzljY1JpdmgvclA2?=
 =?utf-8?B?anBJc3duUENVUUFuMXNQQm1YU292QVlzT295WXUwTHUydDhUalJTYkVrd2po?=
 =?utf-8?B?aUtReEJkNGQ2K0NBZ1JBZHFTTVQvV0p4WDQxUVVrSExiN1J3T3gwck5JcGxr?=
 =?utf-8?B?RTIwYU9VTjN3enZZR21PWFlpY1BuUWUwZHBaVDNRZlZmSUdZbm05eGYzM3hQ?=
 =?utf-8?B?RUdDMjk3US9XYlprbnF4WlMwSDFkVnV1UjFEVitVdjNjTmo2ZFAvZTZTTW16?=
 =?utf-8?B?RjUvQlBDZ0h6Q2U0Qlk5djZDM3pBRnlWdFp6c2tIM0hNWXBuVGNVK3l0SmNI?=
 =?utf-8?B?a0l6OVhGSENvRlZwczV5SUdkVVNCYzBnUStERTU0VjZmUWE4Zm51cFlybTFQ?=
 =?utf-8?B?cmVkYjBHeVYzRVNXNU1NbVppbkVnQWFHTkxTQkkyMUpaQStoaUU1UmF2RXgv?=
 =?utf-8?B?SzJzNUZ6aExFQTFiNytBZE9wRVhIMHVWcTdVZ0o5Uk9qSkplWDhVUzVXTGRV?=
 =?utf-8?B?YSsyQzR2VklkL1dsMGsycUdQcVdlRnlIT1VUMzVsTUY2OTl5eWJ2K3Z2OUdG?=
 =?utf-8?B?THZEclZFMlc3d1paeUxwQjBsVXk0elo3K2xLZG1aS1hOOFkrSTFmVm5FN1lQ?=
 =?utf-8?B?QStBNFFYcXZaNlZFdmRVbG9hbkd2ai9qeEx5bktGSHJLMC92LzFxUllPTWRm?=
 =?utf-8?B?L2tHLzcrRnl1Zk1MbzF2L0dDbzdJQ0xKNXBCeUpERytHZVZBKzdIQVBkNlhs?=
 =?utf-8?B?M0VTZUI2TkFPc0dEa1VQZXBFdGRuRVJvS2dvczZQV2k1VzZJL29UQmxkWS8w?=
 =?utf-8?B?V2hpUlFZdWtMaTd6ei9vV2V2WXZpRzA5MitiMEhONXNBK0cvcTVZZ3ZGcmpz?=
 =?utf-8?Q?6u+O8tnLU27z4k7GmS21hVFKy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90628557-0cbb-47ea-839d-08db02a7ad21
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:19.4112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G680cOnMuXj3RghpDg8YGqGSfgr1fAltYZk+Hm+/zHvySlW3EVD7y5yUjmb6mGf9A6MhsF5gCKN8SJSmlxt+aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-Proofpoint-ORIG-GUID: zE2NxeL8I_iPubB0GyzlXsQUIy-u9Qli
X-Proofpoint-GUID: zE2NxeL8I_iPubB0GyzlXsQUIy-u9Qli
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxlogscore=536
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.166.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
 helo=mx0a-0064b401.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

At present there is no Windows support for 9p file system.
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

Base-commit: 13356edb87506c148b163b8c7eb0695647d00c2a

Changes in v4:
- Fixed 9pfs mounted as read-only issue on Windows host, adding a
  win32_error_to_posix() to translate Windows native API error to
  POSIX one.
- Fixed errors of handling symbolic links
- Added forward declaration to avoid using 'void *'
- Implemented Windows specific xxxdir() APIs for safe directory access

Bin Meng (2):
  hw/9pfs: Update helper qemu_stat_rdev()
  hw/9pfs: Add a helper qemu_stat_blksize()

Guohuai Shi (14):
  hw/9pfs: Add missing definitions for Windows
  hw/9pfs: Implement Windows specific utilities functions for 9pfs
  hw/9pfs: Replace the direct call to xxxdir() APIs with a wrapper
  hw/9pfs: Implement Windows specific xxxdir() APIs
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

 meson.build                           |   10 +-
 fsdev/file-op-9p.h                    |   33 +
 hw/9pfs/9p-linux-errno.h              |  151 +++
 hw/9pfs/9p-local.h                    |    8 +
 hw/9pfs/9p-util.h                     |  139 ++-
 hw/9pfs/9p.h                          |   43 +
 tests/qtest/libqos/virtio-9p-client.h |    7 +
 fsdev/qemu-fsdev.c                    |    2 +
 hw/9pfs/9p-local.c                    |  269 ++++-
 hw/9pfs/9p-synth.c                    |    5 +-
 hw/9pfs/9p-util-win32.c               | 1305 +++++++++++++++++++++++++
 hw/9pfs/9p.c                          |   90 +-
 hw/9pfs/codir.c                       |    2 +-
 fsdev/meson.build                     |    1 +
 hw/9pfs/meson.build                   |    8 +-
 15 files changed, 2008 insertions(+), 65 deletions(-)
 create mode 100644 hw/9pfs/9p-linux-errno.h
 create mode 100644 hw/9pfs/9p-util-win32.c

-- 
2.25.1


