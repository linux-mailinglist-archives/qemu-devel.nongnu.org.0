Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1026099AC
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:15:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompYd-0004i9-6U; Mon, 24 Oct 2022 00:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXs-0003ry-7O
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:41 -0400
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=72963f20b2=bin.meng@windriver.com>)
 id 1ompXp-00067z-1r
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 00:58:38 -0400
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 29O4wBlu017153; Mon, 24 Oct 2022 04:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=7d2WqDzhYuOnmt2P9ArzjvElFMaS4t33HUS9hOx+Ryc=;
 b=YbH4hPCzrcA3LYCpuWMW5fGUMG456kY41G8YyIsXgTa+6+GLRiBUxVocWhgQgZQaknaf
 fnSDCa3vGhEcpi5CyFF5MjA1MF+dfBt9z0IRIDSAQ6bCoX+VyStzrc2xHMRFunaBEWRd
 PhjquBosOp0SmRbxUFhc2YEZOoGxXzeO0o4oQ1Ew7WRsn8Jsh2utQQH00E+NISZZNDTy
 xiM0MSlCX1XyGmKRwIFuA9kUVX2/A+ymE1iSqarD33DJ1UQba3NgWMHrrypnGv1D4gvs
 9FgdsBydu32q56DPBu8WJYTzpf3c1JVJHpgBpcAvKGOUruSkAtsKTxOxmU4jUS/nnnOd WA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kc5r2svr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 04:58:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwGn+4pAilTgjems46sWC/O3rFB25oY7qYdBwvHq3eGhO6U7kb8t+hoZTltVkbJVvNon2T8Bmk8nntZ6I9gsiv4XQ8FNz+46A4y6/53ivUJ2JpdQuJk8cr1cBJOksk677UCSguJovfppH7g94my61VvEtmZhtysetCIOQ6/6DSVX1bNwru4MhVUH0YhMnULHGpJwW4R0RBj6v2/+cZ6kNdEAM+mqUcEdZx9/Sh07gSa+QH9RBEeZmVh+ACY4lTBeFjrMe95X3KB6bLYm8yiP/dUdvKTuL+JhMwDUu106FN6TXSckxrUs43KVDYiYmEhqh23VbUG/tW3CMqW4kmJOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d2WqDzhYuOnmt2P9ArzjvElFMaS4t33HUS9hOx+Ryc=;
 b=MRCbBEyLsyiN4WVaUAj9pSIP6cr8HBXh0GT7QwaaZK+AwnFR/vTdSS8ovw10Rbc6Zc7WrM07qlo7B0pQ10GVFY+w6NyAfpXvR4zsJPA2u5s8aqhqXlZ5BoGDA+lK8vQ+KxmtwbFO2clDkTkrkkICsLQvyJUyhVqPhfE2VBShQtVdTTiXsANhiu0G3kPMd2cmsYDrVik8Pcr9hj21zxz36Ur6KFvq8UDbZsQHeDZstb8T/JPPftdTUVrbgiXkbFnfDlswAm9Xb8MprRzdRnKl3KLyFob+MLgchP3fhAIdY6Zrj0dkkA2huJl+zg4V7g3eAyH6RuHwmque8MpeuGQIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 04:58:15 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::b051:27b7:c1c1:7cb9%4]) with mapi id 15.20.5746.025; Mon, 24 Oct 2022
 04:58:15 +0000
From: Bin Meng <bin.meng@windriver.com>
To: qemu-devel@nongnu.org
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Will Cohen <wwcohen@gmail.com>
Subject: [PATCH 00/16] hw/9pfs: Add 9pfs support for Windows
Date: Mon, 24 Oct 2022 12:57:43 +0800
Message-Id: <20221024045759.448014-1-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 49322fb9-d49c-4715-8b8b-08dab57c5c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mjrhErO2Y+wavoHW/3YfdejzIFHlscPcOUSbaLT+zQunHc+qIYgTkVj318z/HZLJng2CuFSXWuPMVlf9S0ksA8GDfv/pjoomxEnNcQXQBW6wWPP/PR5Gng1FHtkoyyA/5lHVZ/FTYjGMPj9sz11Q4YVNzUQJ6X14Ak/u2eixNR2N+XqoGT54/sy5vs33uegvdS4moe7dIZ/lPSsT3ZZgeWzWTMBGzZb/7BeE119SOBaaQfg58IHsGVBOgDnFAS8dM6aBNLBpx/Px+7oy5xlXLNcHFrlb6pqv35ak55tCMjXxGHZBPCuZAXPnSvlE0ACBB8SGtuwhf8os4J8U+Q0tFakB0IlwPczJKKTrf/2I6Kpx+dcvp3yUn2dlGR55j+irCssUsoTjdRoLRl4SUXihWHFZhILwiCAEolRdCIZEhXXVVpmVdCnXxw8SayHpsfVzj5TyfyNCvBqwXFqUe7Iao8JUqJ/u2CElySJWxZBdkaOYnE8dTM64uU8y8IL5vQ+l9Bi8IpJ/0Ky6HDuF/7SlXq/czdMKJl8LUGy1Zd1KVnR0jcNTVHJdeygOWLE4RmdKGxmVBS3cVya5NfBdrYDmcjmAVMr4e5KcYxp3UqJPMWlcGJaCcXdjZ5OAjFQ2oCH322kRGjd3peAakVxN2xjpbCWNIzn3I+eE07xTsRtZ0VJCtLQkeiYFkAC+FXUMrhEcLc2Qrr4jy4biMc3q393Urdp7aq0P6IjrJsC5aq30TP2Dyu1fJFxv0zqWB+ZCrrFIhL0KAgfOGvqOW4XsDKlg1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(451199015)(6666004)(6506007)(2616005)(52116002)(6512007)(26005)(1076003)(186003)(83380400001)(44832011)(2906002)(6916009)(54906003)(316002)(478600001)(6486002)(5660300002)(8936002)(41300700001)(66946007)(66556008)(4326008)(8676002)(66476007)(86362001)(36756003)(38100700002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n1FEP6WXZ4XYvMyJmT6cudI8587w2VnCQGJHFz3TOcE/TVnjI296qw38U4np?=
 =?us-ascii?Q?xsL9xcLpG/+ObwS4QYd58vAN8RLbvgqdcjg4yQDiBKZLIhEmLQddbw78pVVA?=
 =?us-ascii?Q?AONQS6kouxurOw0flOZfBU8RKED8mIo1m4IolV9vFL3zTdTw/spbeZyXmSpb?=
 =?us-ascii?Q?sGUl4ZITHr63biZI1OPkpbzx8m48NP1sS/qBpIdeTWOeo0vaRupv7qOZchcP?=
 =?us-ascii?Q?oeypjgpQXIjXnbDE0Ls2XjFmaBC2V32QNJ5U4oectkYwYdyA59dqMJa6NqDo?=
 =?us-ascii?Q?1mrUU9xI4Q6Hhsg3sl6FuhoV/rG9Q/1fJulPpg/paOTQ+RMWXJn6Adi41g+P?=
 =?us-ascii?Q?BvA1dXG5Eg38Pfr0bHu9j4pP/kk9CVC9NAFrWCrXYFCk4sh+9xNBLcAWfavT?=
 =?us-ascii?Q?dXDaMfCSFg3DPZddKfo56KfM/fARsmnVZhtvM98k23pAkUAOXjTgp8hmLcnr?=
 =?us-ascii?Q?Nd4rAnA1eITcB1qC0kzZlP9li1GRU29MywvCSYWP8bLkVqlyq2CWklsoPcKh?=
 =?us-ascii?Q?mz3nfatwpKZ1OmP3vTEe416YlN0NvWF78c/R8A4XOIEDHw0YWFWMbuP6vpkx?=
 =?us-ascii?Q?nPUNMST/Z22c6m/HLi0MdpFZMaC+CAPiCZXQ9QIDVPiaQnOsaWvjKti6dbZK?=
 =?us-ascii?Q?SdcZtajZu90rKpnw9DWAINJBKfubgLQ460TgSMNzbzKP7bolXihUMfvzOnLR?=
 =?us-ascii?Q?qaXYzQYNp28g2zg8v2GhL7kG8fSGndfUeNGrGA08BOtOslqRdjq5qehz8FIe?=
 =?us-ascii?Q?pHPW+v9B4aL9Bde2+4NaxpvpDRs1gEL7f6XuVChwNB6AHK8LR7/NGW3yQH7F?=
 =?us-ascii?Q?VQEmz3ODRTSYzh2EGDko4m9vVD730FfCp4cA/Ey3PL2JscLtxLI9TLWoZHWK?=
 =?us-ascii?Q?BW3WQKzX6HQXdAVR93ppMdiBY0l8vfM6jaok8p9yWatqrc9QV4d1xs/G5y6f?=
 =?us-ascii?Q?fWYP2XjIr1M9oyr6lkcArdR14Q1LUbITHJw5CDUfPdmTPl6lzwKRCHrg+jgi?=
 =?us-ascii?Q?hJR5FtB1uDtJDsClR1ZeYsyJxzEqrcs2BPELODzsEQXmIS2fEabsyvhId6Ic?=
 =?us-ascii?Q?LI/T/TJaglygY1T+pPyTtNNuUKbyxpLdwfJMHe+C0BU2SoUbp+RyLLuj10it?=
 =?us-ascii?Q?yYbXNgLvDV63kUXOghJied6rk0zwaQKmYFKCWTzjggS5uit0ddH6rDcJx5KO?=
 =?us-ascii?Q?XSnT7Zy7Y/t/P+h3aQFICS3+yAK2dwh0D9bDrFJEhotvn+v08rd47Z1DDngi?=
 =?us-ascii?Q?BFd69jOslHek6/KiFTshyVum29oJNACvaNLttRudDIl2/cPg7yxah6RVtrmC?=
 =?us-ascii?Q?E2iuJYhFVU7DugWl0dwh1hl75/Wa3ohLDVQTicJhDYYwOd/ijA7fFEmEvTBz?=
 =?us-ascii?Q?T+YgjaWemHxUtr3tEmtIwS8UjpWn6q+gTBYYawabuV0wOy+3yOYUJ/4aBZLL?=
 =?us-ascii?Q?GF4Lkm56fRt1jmeZRX57QbIAZ7pHJU8K17mJZXfEy5ug0zjxGCPfg3i3PLYl?=
 =?us-ascii?Q?DIQiWoPcu6C3RuepH8mlA8a6uJH0yMkJZ8YXCklUZRHbM/xOTOff9vJ173rF?=
 =?us-ascii?Q?JzHeQkpIfZRMnfqJUwnqepz8jXHMz+5vNVP2VWJ8ObQp/z1ij6H2OlJSYQdJ?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49322fb9-d49c-4715-8b8b-08dab57c5c3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 04:58:15.6238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZBd13GCRRIU5kwK5eA9Df6WGJFpdLQFdpe7olDFHp6HuQGlw+6tQnWh5qZ1KqGiuw1GKvo0RiphdLiqNqsxOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-Proofpoint-ORIG-GUID: TrDo9q1AHbfgusZjtRarlK7XlME3-oMT
X-Proofpoint-GUID: TrDo9q1AHbfgusZjtRarlK7XlME3-oMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=257 mlxscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 clxscore=1011
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210240031
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=72963f20b2=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


Bin Meng (5):
  qemu/xattr.h: Exclude <sys/xattr.h> for Windows
  hw/9pfs: Drop unnecessary *xattr wrapper API declarations
  hw/9pfs: Replace the direct call to xxxat() APIs with a wrapper
  hw/9pfs: Introduce an opaque type 9P_FILE_ID
  hw/9pfs: Update P9_FILE_ID to support Windows

Guohuai Shi (11):
  hw/9pfs: Add missing definitions for Windows
  hw/9pfs: Implement Windows specific utilities functions for 9pfs
  hw/9pfs: Handle current directory offset for Windows
  hw/9pfs: Disable unsupported flags and features for Windows
  hw/9pfs: Update the local fs driver to support Windows
  hw/9pfs: Add Linux error number definition
  hw/9pfs: Translate Windows errno to Linux value
  fsdev: Disable proxy fs driver on Windows
  hw/9pfs: Update synth fs driver for Windows
  tests/qtest: virtio-9p-test: Adapt the case for win32
  meson.build: Turn on virtfs for Windows

 meson.build                  |  10 +-
 fsdev/file-op-9p.h           |  33 ++
 hw/9pfs/9p-file-id.h         |  29 ++
 hw/9pfs/9p-linux-errno.h     | 151 ++++++
 hw/9pfs/9p-local.h           |  15 +-
 hw/9pfs/9p-util.h            | 158 +++++--
 hw/9pfs/9p.h                 |  11 +
 include/qemu/xattr.h         |   4 +-
 fsdev/qemu-fsdev.c           |   2 +
 hw/9pfs/9p-local.c           | 532 ++++++++++++++++-----
 hw/9pfs/9p-synth.c           |   5 +-
 hw/9pfs/9p-util-darwin.c     |  14 +-
 hw/9pfs/9p-util-linux.c      |  14 +-
 hw/9pfs/9p-util-win32.c      | 885 +++++++++++++++++++++++++++++++++++
 hw/9pfs/9p-xattr.c           |  16 +-
 hw/9pfs/9p.c                 | 106 ++++-
 hw/9pfs/codir.c              |  15 +
 tests/qtest/virtio-9p-test.c |   7 +
 fsdev/meson.build            |   1 +
 hw/9pfs/meson.build          |   8 +-
 20 files changed, 1822 insertions(+), 194 deletions(-)
 create mode 100644 hw/9pfs/9p-file-id.h
 create mode 100644 hw/9pfs/9p-linux-errno.h
 create mode 100644 hw/9pfs/9p-util-win32.c

-- 
2.25.1


