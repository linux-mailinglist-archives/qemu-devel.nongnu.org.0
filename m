Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 552C5650A06
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DHH-0003JT-P9; Mon, 19 Dec 2022 05:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DH5-0003Ep-5a
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:37 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9352c01a6b=bin.meng@windriver.com>)
 id 1p7DH3-0007WO-HW
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:21:34 -0500
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJ9uJ1k027775; Mon, 19 Dec 2022 10:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=kO364TjRE2+3rUbnbGQZB7EL5tyDvIdFZo8eACVoncw=;
 b=XWaFHwbFUi5DzZZ7wcUwigB8/uT2VvhViG2Zs6AXmnT896wO8PAymBF+td6U/Wu85fxL
 j3auT91fU9C7cFGHKGnzSXpVV0nK/auFs8LJaNeuXHGR9iDISYVbs1qv1rRmF0zLBbkd
 o6V+nnwUXLUHbhoZgjiVR1beGgo8FnArKAwunrc3pBESAg6lDJhOhTNUG39v33TbGFx8
 C9nQjxgdPFbkRPs9i0UUzXL5wexcNVwamsdxypuD6vrpfREhsp5JhqsC5gXhpD8aVOCQ
 lOy5bOhIJbfbDTyjgN9+neWpCUg6GuFiP0zEJbw8pNTRb4Q+0Z1WjULwR+sdrOvxY+Fa 2w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh301hdgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 10:21:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lf+y2dmiwZ+q8H5hE+jCESQMNXf6C0DFQtsGDIXE9/iteUU/c0u3kVTqV8HZRXJ5Qbai/GQ2q60jco/8WGU5Og7NQ79twOr39BLLyDNYqGrRHpmdzKFTNd7/4xx8Zxhte6Rx9eUGIEUvX1gUjN6/SQODYz1zmPn1GiCn1PRHgcJgHg3NVJ6e8imz8VNIDuPyeLRXKfq19O0m1mAYXqgN01UpGWHLNYbuWpHdPtezEyIWI6dErWHK8h65livj1ON5iNpS7er5pVTXHwTMYd7auVCWxgNO/+Gppj3ajd/r5M7LYlMaG7Pf+pmXFh4J3XvMoU7ARxyRXMyPlWZJOyQp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kO364TjRE2+3rUbnbGQZB7EL5tyDvIdFZo8eACVoncw=;
 b=Ey7G2NoOMaK5lgZDTvafG1qYJhBfK3+jpLmwGU1tFa6y9m1ZEtTXIyNzx/7HEUxvvjQYmCp8BHem4FRqf/7s+BE2H0qQPpt1oOvO3DZfq4Z4il7AW9UqwbMQb5nknLX/pqADIRBpQdqoGqL6u4SZdLlIcggQcnSlqjrVqkNs4TFfe9y9IwTovvcS8192C5sylVUmKHx4HFkFu/F5fzMAP//mgt/HR2G+1UqS5UVQfS2pdcn8w6VFnC4Yd2IUhunOCgBdyHtyn0GBij2I6cSXlYwMmYphZbFjhXCIM3g0q9eU57TXRCnEuuzRgbDBOzZDjxfQ8kw+2ll5LVUFMCcDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 CH3PR11MB7201.namprd11.prod.outlook.com (2603:10b6:610:143::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 10:21:22 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::8e5e:71da:1e29:bc15%5]) with mapi id 15.20.5880.019; Mon, 19 Dec 2022
 10:21:22 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 17/17] meson.build: Turn on virtfs for Windows
Date: Mon, 19 Dec 2022 18:20:21 +0800
Message-Id: <20221219102022.2167736-18-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219102022.2167736-1-bin.meng@windriver.com>
References: <20221219102022.2167736-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|CH3PR11MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e06652-caa3-4d05-75b8-08dae1aac699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vo/lJAR9gUMQq7vVO9UKWBB2sUrbJ85ijcgcW9cS5punGrB2tl12GrN3avAaoXNQ3yUU4Dee6fiGo5PXNGWmsuwvG7F9QMdrRcLv9/zoc7ZcugnUjkK0wHWJPq6Vm/IsUpArA44dIaorL8n/9ElFS8Ln3QRRXwk03w+8DQdPTdV54l949koiweZuFGuUgh0ZmcwHqkHrrjGKxAw7qD5Ttw8MsUTfDXWMvt67L3hkiBNdwleJ8dQM3GjHooOFcbAkebPUBBDoVrL3MJzI3fRPEGdattReEibpvPQTGPxbmW7R4JNfIsP6b9suSO7sO9Kd5UNaMQCGAN/y0xclSTmlT4x1aqwYWlhp8TmApPR5jTrhOYrYIEZAIUoMM1CsEs5LBE3qw4Fp8aSRgBWffKmq1wbRTko6bnmzOcu+xITJiHKHK3i8aC5o3b2Q3YiuMw4hZIuDDx3y9p1lX+FlmxvcezeLPr3bN2DMEJT6bUVik0gnWxTxAuWEIFcCc2Sj4ufLp9W8uUWktT5MVAHXqza5KnVIJ0Ah1CU1woLn+q2du1Q1YGCAJelfP4gbCI8vBhP/IzwS3WbzAby8NPn+njJBi3rK9jsIA6VQXPhlQxjcvx7hd97FEUOJ8W3SKMLHKf2F2UrcHUckx8CPPPcpB1SrTWEW7SKBVGPvu5JHSJaKBEXi/usTxVwMUD8S7e/RbV4T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39850400004)(346002)(366004)(396003)(136003)(451199015)(478600001)(41300700001)(38100700002)(38350700002)(26005)(186003)(52116002)(1076003)(2616005)(6506007)(36756003)(86362001)(6486002)(4326008)(2906002)(66476007)(66946007)(6512007)(66556008)(8676002)(5660300002)(8936002)(44832011)(83380400001)(316002)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WC+iivk3AXlTxeTsp5DYkVl4Z3gzuWxdbzLVs8yUc0sktFU7fmrkvzKxc151?=
 =?us-ascii?Q?WKLxjI8nBZ0eDtW/wCNinb8v3r4hoiL4uEKRtnNEsrfasrRdEB4b5foAWmHL?=
 =?us-ascii?Q?+mqEG1afHb5/sG8ifHWg1JbaJW/sHgfYVY+MYD5+fq6pMbFQGECyLCrj4Oaw?=
 =?us-ascii?Q?jVi6sCaAJJMmooz9ksJGpm9u485/YNJlW0XUcOYjlLZTSETdvWMMCiXuMU4D?=
 =?us-ascii?Q?73YuOocFEMyfXZYdGOGwOgZmbvGVdVbfQtP/NcPMVZHDWh5mOo1cZ0owfuUr?=
 =?us-ascii?Q?I3h4Y/5EQ64cvKOWScwb49aGAb15bse5yIfsNzqMeGMweu78p99xhz6fCRYX?=
 =?us-ascii?Q?W8oXdY0wOVinPFUKRrZNH64fCxziwdmfaDiJUpb9oLi1vjR51hqriwAcQtNz?=
 =?us-ascii?Q?K6cjHhIxv5v+TBHIr6Tf8FI32xNnp/8m09U0ugduY2RenX7CXJ7j1B0jJDMw?=
 =?us-ascii?Q?hpgwekpHWLTDMYu/IHsju3ppvvAVZ4dhy/gWrwXkiTqHPI2HxVrWtKWZNZyC?=
 =?us-ascii?Q?pr4o5ntWJIqC9f+oSGfrljJTBD0V3XsT/pTXS5oh8QBMgQ3wpsF/Q+JTQYNg?=
 =?us-ascii?Q?sXtNFE3I9yOoYqVVIPKMmPZmX0xRMzZnubXLa01utaeRvhrDCxtHHXz9IwsD?=
 =?us-ascii?Q?HHn8vLawfXHFwgpduIG0JB/hM7FentJ8WbwbqpYXMKJkJcCBq8yC4v0HOiOh?=
 =?us-ascii?Q?18arD9p78cBR9AYgD7Xcdlyq6S0wybURweXOpF3fYBnszfS2fhK6IhpsxKAA?=
 =?us-ascii?Q?s5cUtOD93LthmOFhoxSbeOCk6o+8KDJ8Sbzv8KaEjtCpTYhAQ+nsFAmruugm?=
 =?us-ascii?Q?ccBo8HKbiwippsi+UGd/2ciELVPIznbAuRaiYox4aTyQxt+sBJAYihz1nWMT?=
 =?us-ascii?Q?AwpGSHtm8nc+BSM3v+W3ZhCqvHgf54cIf9HQVNuzq8F/kIqDxumFE8P1x1Lr?=
 =?us-ascii?Q?cYTUTc/e7yELSjn9wvX8UtmDvGVYx29Qkgdu31anTfcggravQ2x+mcfIq8CR?=
 =?us-ascii?Q?Oyc0cIbJL14IbjegwaQ3JYYBgFbjGWFpvjtnI4V/rz7FpqkWBV/+pmU9u7ZJ?=
 =?us-ascii?Q?mwbByB41qPz1Ptd/2c+LjyiKJgQTIhXxcOZu9O4BoiE6kZJYsLoVUXGmM3n0?=
 =?us-ascii?Q?/w2Ldg84oCgMoAgx6LDiyhavVNoDBOjF9nj4CXeFosy4IDoY4dsUUqOSwzxc?=
 =?us-ascii?Q?y07SECpNbgYEAg48Z782PrwSmCBAhdoQVe+9huKQ56PRCmB6pPIj5jQ2tbba?=
 =?us-ascii?Q?4SVIPvJCf8CkPewG7Z6CAhGDkuH6BwNLqy/TuTG/wsYiTrpPe7BEwtDYlx5J?=
 =?us-ascii?Q?EF6dT+IZO45MuMi/G5of0mxRYUcorW9MXffCX0RTt0t7SrWMEqS4WrTdYmrQ?=
 =?us-ascii?Q?K4AtDDzFHTWCkAH05kyhc0MAcIdePmVurjovklv4e68DbYisRa+kUTyuj5jZ?=
 =?us-ascii?Q?7sNJ2eANFWbUbPMS6pU3SMaUTsojHaYBWXN9QcS3omj9D3FVNH8U8ctganOt?=
 =?us-ascii?Q?07paNqH2sSkeJ0NveXVtWCjzBLVl5wcAQUnw3Rktezeet/mH3bd5gUXMHTZN?=
 =?us-ascii?Q?DpGfFWyhpaZ/KQ1x5q8C6y5oTPZL4YogFicM0zfB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e06652-caa3-4d05-75b8-08dae1aac699
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 10:21:22.0387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mune/3QppHyWgsZq9rvpE5IDJRJsbi4anrQGKHxQzzMcqOzVHPZtNVXUtnzQZMq5BtJomw+ZEDztU0ZH5XhYhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7201
X-Proofpoint-ORIG-GUID: QmyDWUVccgk_f7_1yRfyFDuKGww-dd0N
X-Proofpoint-GUID: QmyDWUVccgk_f7_1yRfyFDuKGww-dd0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_13,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=829 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212190092
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=9352c01a6b=bin.meng@windriver.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Guohuai Shi <guohuai.shi@windriver.com>

Enable virtfs configuration option for Windows host.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

(no changes since v1)

 meson.build         | 10 +++++-----
 fsdev/meson.build   |  1 +
 hw/9pfs/meson.build |  8 +++++---
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 5c6b5a1c75..532625bdbe 100644
--- a/meson.build
+++ b/meson.build
@@ -1743,16 +1743,16 @@ dbus_display = get_option('dbus_display') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
-    .require(targetos == 'linux' or targetos == 'darwin',
-             error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
-    .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
+    .require(targetos == 'linux' or targetos == 'darwin' or targetos == 'windows',
+             error_message: 'virtio-9p (virtfs) requires Linux or macOS or Windows') \
+    .require(targetos == 'linux' or targetos == 'windows' or cc.has_function('pthread_fchdir_np'),
              error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
-    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
+    .require(targetos == 'darwin' or targetos == 'windows' or (libattr.found() and libcap_ng.found()),
              error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
     .disable_auto_if(not have_tools and not have_system) \
     .allowed()
 
-have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
+have_virtfs_proxy_helper = targetos != 'darwin' and targetos != 'windows' and have_virtfs and have_tools
 
 if get_option('block_drv_ro_whitelist') == ''
   config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
diff --git a/fsdev/meson.build b/fsdev/meson.build
index b632b66348..2aad081aef 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -8,6 +8,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
 softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
+softmmu_ss.add_all(when: 'CONFIG_WIN32', if_true: fsdev_ss)
 
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
diff --git a/hw/9pfs/meson.build b/hw/9pfs/meson.build
index 12443b6ad5..aaa50e71f7 100644
--- a/hw/9pfs/meson.build
+++ b/hw/9pfs/meson.build
@@ -2,7 +2,6 @@ fs_ss = ss.source_set()
 fs_ss.add(files(
   '9p-local.c',
   '9p-posix-acl.c',
-  '9p-proxy.c',
   '9p-synth.c',
   '9p-xattr-user.c',
   '9p-xattr.c',
@@ -13,8 +12,11 @@ fs_ss.add(files(
   'coth.c',
   'coxattr.c',
 ))
-fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-util-linux.c'))
-fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-util-darwin.c'))
+fs_ss.add(when: 'CONFIG_LINUX', if_true: files('9p-proxy.c',
+                                               '9p-util-linux.c'))
+fs_ss.add(when: 'CONFIG_DARWIN', if_true: files('9p-proxy.c',
+                                                '9p-util-darwin.c'))
+fs_ss.add(when: 'CONFIG_WIN32', if_true: files('9p-util-win32.c'))
 fs_ss.add(when: 'CONFIG_XEN', if_true: files('xen-9p-backend.c'))
 softmmu_ss.add_all(when: 'CONFIG_FSDEV_9P', if_true: fs_ss)
 
-- 
2.25.1


