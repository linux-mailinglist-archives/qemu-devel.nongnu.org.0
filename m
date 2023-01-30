Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2012680A09
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:55:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQqy-0003DW-BA; Mon, 30 Jan 2023 04:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqU-00039r-HJ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:53:03 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=13943e2a21=bin.meng@windriver.com>)
 id 1pMQqS-00023q-Q7
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:53:02 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30U8OtRK025559; Mon, 30 Jan 2023 09:52:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=scX7/GExEU1Y5uS9tlcdpKJc4lxQrcY+YBKv1AXl5YA=;
 b=kOeXnQQffAbSGo97+Cog5tatlFbfok+T2+Uf6BlLED08eu1SVYHWBD8BMFSGKKVYIwMa
 9NmS96otRXM+3d8cQYwhUvsckK3bRnUp5h9NLVLUrbxpFYun9fOfuwBT8hrB9HO0Krqm
 Eq5fwmovvUK782jMQ6oNy1Jv6tRRM1DbEDvJb6aITvFKix9GuWbQ0wMHooTSMt0qpyR+
 QcwwqISIFCfP7iOmE8nKYX2sAA5TbCOSsepihpgwsmKoht31EseACrNhxw2uff8janhO
 j4Wr88LLWKKyv6Gl7Ti2ECPBn2V4HpQSiXeXsGmD11PcKAonW3ULrwis1j29yHxrtaGk Lw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nctpat10x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Jan 2023 09:52:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ofYjYS5ctjHnB5Td6JNQ3985ycsLZZKDuE/uY6Du4wlD82V+niutX59G2lr1pI9L8EEHmID0CYD9IvOuxbSUyDKdIZiA2Sr356n+fYSHHFdO+SsJTVdHEPBvEg+KDO5bwSEhVATALfhOONOKK2VRBKiam7/gC0BfCIBrHhktCRPR6UnQtIhcod4KF2r9944uP7/v2LU/q6e4fKm7PfHcWLFCMw82202YaffmTQDpkU0oOFA4iaeIrHJCSaYQe3QjFvV+lTMQ5RHuIBa9HAdZn2VdfL27hhM1Q6xsRXyGVoF1RxiAHfQrF5Uvt59bKGdfvQ4d5BMGpw/RwwG6XM4SgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scX7/GExEU1Y5uS9tlcdpKJc4lxQrcY+YBKv1AXl5YA=;
 b=WAUtz/szGey/E8BYLGwEbWRkLhGusyBMp25zl/xaN5f2qFhfms9HkRXmKwj4ckWJhj1JlKQ+VHTRY6KiTU3q1Dn9YfTGQVjKB8iRGJ4wIoOK699qEZ0205hDUxlicAqIhIx4MfQFmZlfFLNAwShaUETRDAP+A/J4Jkh2ABlQPy2TZ8eb66bI1Nv5RSA5oHoaazxYz64p+KeIObj/QF2D5LqrECLCJySErBCkxVzdwTFmROfjVkIDdn0LjLttsoxmk3BqrLUlM30bIHNq8Jq4/JpTIb03zsjJZsqagZF1k09I1VNwwlIGbZN5ky+T+JgbDVCGAFMwQcKNVMTW5Gsqqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 09:52:54 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%2]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 09:52:54 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 16/16] meson.build: Turn on virtfs for Windows
Date: Mon, 30 Jan 2023 17:52:02 +0800
Message-Id: <20230130095202.2773186-17-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130095202.2773186-1-bin.meng@windriver.com>
References: <20230130095202.2773186-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0061.namprd02.prod.outlook.com
 (2603:10b6:a03:54::38) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: e518301f-6713-4e87-2d1f-08db02a7c236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKzu4wtHYICGXchgaaZgpyHuL37pn3cNUlEENodYT8A4vnPYG9EkS3XRS/80Se29HsFZUD9ysBPgKeHl3ywJfMxqIr+jCtLcHTNDe3oJqfouoxiFnfPeAyUV5szt1FQWvqus/yjdeA9NTFKGwCBQhVmFV6sJNGPrKP2tw32NwwPCoEjnFn2gQRsinRdIrVJ0wOZcmMm8YFzYSH8WbEuDQqQUft1YSky0PN/QabEL+BzpqxHxdvzIOyXAx5dkXPg5/oIXgK8353g+8BDibu+ury4ll2XIUCm11nuWMLx87JS3SLMLoxBu+HwLRsUMh6P19qHKahEGM45kfnplb5w2YCr0Jg9K8kkk70BWvP/ZGf8/TicFbAeCRu7Pz+M29Vj7TqT5R9LIblMw15W4Kox+NtLGPMTSwsiei4abGt+kLbprQYF5/vKZmfFTEJgIj4bv8+Xv2VKbGmz1HLZwUrWV8BlTvK0Hog0UvjYcqCQAxHV85vW4rA8mmdyXfVCoxkijEc5ThquYiXFuzR4a4NWzFsObM2ykjfmCBpmtzS6r3DYNgoQ7MBUE4q3nacvJ9/b1aQ6Jhtnn5UhMSWvHEpF2lRMxnSTQTTHU3PTE660jiOCeM9wlLKnTMYPKBPq3eLg3+AG8zib611/Ul10XeiiXMNlfjr6OEUpGOkX8lPH3PaccfByhhVeFU+1f9ZPy7ObPZ9sqndzTyKQ2sKfdUSXBKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(39850400004)(366004)(346002)(136003)(451199018)(2906002)(83380400001)(66556008)(41300700001)(8936002)(44832011)(6512007)(26005)(6506007)(6666004)(1076003)(2616005)(186003)(5660300002)(86362001)(38100700002)(38350700002)(66476007)(4326008)(66946007)(54906003)(316002)(478600001)(110136005)(8676002)(52116002)(36756003)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aDNmtD5fsRhMc29CDN4mXwfefnq1tGWmZzAQa/54PM4yycZAKcWr9uG328BI?=
 =?us-ascii?Q?ZYK2l2Z4JjR2OAdfIebOc28d9oF+vXmyFFRuHBGH6HBcklZ2n5t4Snfh/Mnd?=
 =?us-ascii?Q?6Lmqz9FCIGk3A1E2kMRzpHQAjrlFbdXCQnTbIWqfs8ElIE7UbLe3vSt9846t?=
 =?us-ascii?Q?vhWUlt0h1jxd3GBu17a1cSMzmsflHFD19AEEVIvLyZQ+7m7zT4+4yaieFMB4?=
 =?us-ascii?Q?zIm149LklSScFzMAGTDCxmq1OO8bwEV/yYCBY8ROysFjb2lDSQ4fl7AlhpQg?=
 =?us-ascii?Q?FlDleEX8Lyuw2j8KgnhWtWlYYhP043gEnKogof0E98/1zsctYtbjJ001HNRo?=
 =?us-ascii?Q?QlPFz0T9A2PqqYNgSETaSsrBxw/9cNr0MDUDmvpykrqJO8na7O7CpGz1Bm/H?=
 =?us-ascii?Q?ey05pNphvHvq+IRhEoLd5Ye/Xx2ef8a+6na3Ms9Rhdz6NMedlKqLJcRsZivK?=
 =?us-ascii?Q?qfmxwMv1cfJs9M1h5Ye9jzM88OL986PzWcX27+uV/P1Kg0RVjbHDjDM3e9Hu?=
 =?us-ascii?Q?BQE9TwI4e+GjqESUbgBFW5wgXaQa1+NDq2xynFMlCeRnyRYazmo4n2jiQUYf?=
 =?us-ascii?Q?uhK/H0QNsKGEfQ+KPpsF6+tba7H20xwiMQKQVVG6Unj2+MiGBY57ibtYmER+?=
 =?us-ascii?Q?3BtBD9TF5cE164hcFww3F3u9YCKrIJAw6tONSB/m5HEacX3QSvhWOesDy9ON?=
 =?us-ascii?Q?3g/9w8GgwILyvfgwvVgZUnRVMgrOK/Q5DLn4kkEIu9yHYkmTFBq34XwyQWYZ?=
 =?us-ascii?Q?qKkf8NZINvAirbHY4G4kigZ3ShLUm2RQRb47+K2w5NPX0AchLtxx7Jb87kOc?=
 =?us-ascii?Q?iKcr13cq9ZgeQo1JN/LIrh5v9GjGLaM3NS5AwNsvUlcE1jvMr440uvazJM6L?=
 =?us-ascii?Q?cgyHmbJTArxa7gi/LEQj+erEdHa3uaq+0XahqYNeiAJ4m6m2zsf+d8fWD1Cl?=
 =?us-ascii?Q?n3Qx3tPpC3yv5UsF/vswOXZrri2mezSaWw9/earQ6vo1r4/hVa+HVTKPpNqA?=
 =?us-ascii?Q?MQ8tv3yReaBDGaNW3+9ztGESPftG9wOQKDOvYYxVJjHOG6jbsNYYli2UPxu0?=
 =?us-ascii?Q?vJSsxgwfP5zozf7hVFU8rOJrmUNmvagHUQf94avuxSnVcds5/bzh7Gr54wPI?=
 =?us-ascii?Q?T7uQI0T2OmRp8t6q5np6A5bP/p0XwS8KNUtuJEQ7VVs0KcAz3JbUrW/OuolF?=
 =?us-ascii?Q?K5kJooG1WIHdW+OIXn/BAj/oSJj0ehMHxlJfCDvh6qFYAgrchAb1IMs/PiDh?=
 =?us-ascii?Q?aUQA4UZme13CDQcTbf1zLQuH46dZLcpz43k/nvBqkDK5oM/r/eXlJDiAg6T6?=
 =?us-ascii?Q?p+6lpSq7uzykBMtnyxFIWt+B0EI6/Rrp6kp1nLmRYQu2X5QRBt8WAwui87Bo?=
 =?us-ascii?Q?m+T4d+/LiebyG+k6o8knkOFZmKRjV7iNDfc+FbhXIJZBkfLTIGgF7ovRKrdT?=
 =?us-ascii?Q?D4nHeergqma4Yyt6EMtLO9GfrvDlK8JNvOv3OdQ3Wfgmd4ymG8fdnHOsyHg+?=
 =?us-ascii?Q?J6h2EQX6bzxdhqOgKdhRdxNOzfjXXdowoENxlOfgwNcH/Usu2yt1m1XfB1C/?=
 =?us-ascii?Q?ozJjb7LNwiheXMFxt/Kme6loIXqKcJ1Kj8j0XIRPC4eXi5VDxthFjBTCrG8o?=
 =?us-ascii?Q?+w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e518301f-6713-4e87-2d1f-08db02a7c236
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 09:52:54.7318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wf3+hLvGuHrxy3Wgc9oEK4JwgyEd6zJqPKNPPw7l87jU3k6ZDKUyS9JGGbI/9xkyao9e1vx4LKjBiD0Xb0FRDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
X-Proofpoint-GUID: IEoQJcG0g5ostKxyf298g-cxnCKJOk0B
X-Proofpoint-ORIG-GUID: IEoQJcG0g5ostKxyf298g-cxnCKJOk0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-30_09,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 mlxlogscore=803 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301300094
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=13943e2a21=bin.meng@windriver.com;
 helo=mx0b-0064b401.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

 meson.build         | 10 +++++-----
 fsdev/meson.build   |  1 +
 hw/9pfs/meson.build |  8 +++++---
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 6d3b665629..8123136fdf 100644
--- a/meson.build
+++ b/meson.build
@@ -1751,16 +1751,16 @@ dbus_display = get_option('dbus_display') \
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


