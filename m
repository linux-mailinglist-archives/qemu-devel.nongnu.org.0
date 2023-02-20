Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E7669C85C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 11:15:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU36k-0008CR-59; Mon, 20 Feb 2023 05:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36h-0008Bk-FU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:15 -0500
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1415163841=bin.meng@windriver.com>)
 id 1pU36f-0000C6-Qf
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 05:09:15 -0500
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31K8ieNr022312; Mon, 20 Feb 2023 10:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=pj6CpAiOkn0C8N0WeNVo6qDdPxsqZlnzg156xpWuFDU=;
 b=bbQIAb4BwzsgSLgMyxZgHowgRkqFTwbeOFM0IrB8R3aJWvkFzvNOckaczT+wfdd18hBQ
 wcGci5jXLhqiZ6fkLHdtrAri7U7o9BEdDyvIkDWl+MqU5lMZICiUoilwOt0IV4NA6s5A
 F738r6PMQ8PhLHiHWLKCnbBhqlmVSORQxCTyoNJ/2wMw+qotnjL8LqbhH3PuqruX+MBL
 63tM9I4DvcKHAv/m9NIiuP2v/vLm2HoajdWq7L3qMd/+ESn1+Kawd506u5gTyOvpkDSC
 j0OxpH/QqS5u71RXVQxr19yfeagMk3y4p+fd75Caj0Bomc+/ZPbIHy9yaf8lnmTlTXrc fQ== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem1kww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Feb 2023 10:09:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0pKnxCVg4vATcCIfISMO0L/CvXXLH2IxpDVCPSfp1OeCGZF2F/5QKV0nqyqOxCFdGdN2/hj6POBn8iBs9k97kdMOH7gut5qkGBApS5reUnlqU3+XRra2GFXgfZPr8MQBITpXVGqcKV2HrIYIuRY/nrYsEnN17mntvQ9K+HbqbGKBhunyAG1eo/1dZsuNumHm+SSUOfjkJyA3ppOKr+vneTCPMISv4/g7QKg7wGLEAAnVFKH1tdSyLjO7Vdl4fB8rpKP7Fu25CRTvyBE3tQUp46kEAD0WOf1AUQ736iQw5MKDjFZgsDFVnh0xSXeGEHYbdzoAHTSBxY6+r+/TvOX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj6CpAiOkn0C8N0WeNVo6qDdPxsqZlnzg156xpWuFDU=;
 b=dvjkFP13B+OSzSxeLpNvVE1xpDQ57aVxpzTK014LU05E4piW8dmold143yLitq2VvlutWHY/ZPfxY20uHL29+LIn9jlBZv0e3L3nwVIcLe/CC7w+cTLooefk5E7wp1d3QrnNduibh51B6AvjpWPQkb6jQCQbWpe9qFzL/Z5ZgGB7V+K9yOZ0gmM0WamabTBly7pYGX5GoCNNebKymNIAV+aiATc769xGWQLt8uRKMmBgx44bLrlhYAs+cBDBIbm/mUFcvbC/ebCmit7IQCqGMJAZte+OLghdNZMaYqIS8Ccv1+7ILCpcW7WMjTsD3L3S3Rmh+G0Akyoxdg1VG7yYGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5358.namprd11.prod.outlook.com (2603:10b6:5:395::7) by
 IA0PR11MB7912.namprd11.prod.outlook.com (2603:10b6:208:3dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Mon, 20 Feb
 2023 10:09:01 +0000
Received: from DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9]) by DM4PR11MB5358.namprd11.prod.outlook.com
 ([fe80::6c5d:5b92:1599:ce9%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 10:09:01 +0000
From: Bin Meng <bin.meng@windriver.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Cc: Guohuai Shi <guohuai.shi@windriver.com>
Subject: [PATCH v5 16/16] meson.build: Turn on virtfs for Windows
Date: Mon, 20 Feb 2023 18:08:15 +0800
Message-Id: <20230220100815.1624266-17-bin.meng@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220100815.1624266-1-bin.meng@windriver.com>
References: <20230220100815.1624266-1-bin.meng@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To DM4PR11MB5358.namprd11.prod.outlook.com
 (2603:10b6:5:395::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5358:EE_|IA0PR11MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d1f00de-53bf-47ec-5a45-08db132a7ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jcY0hhbY9V8Meg1oHot4WuUmrP/Zli4KVShJxMl8DAOnkxx3Pt0I7SW5aUF83KIV8QraEu4T3Ik3z0P6ucGs5RrjXeJPOgJD2Q1x1b/ezUtUsGNQlXkXeDJ86BX7GJ1U9EEDa9Ywt4fVkaHaFDQnWadA+Rd9ZFOSQGOxWspVYp6hQ0Ge/w41fgATxYRGgfSACJLaHJqcAkW4AZihYEOvy2/fMlB3vgILUTFDTdvVd5au1FVEaweP8wSbAjwOw5x/G5CPzbj8uuOw/ma0gminlWhyJJ0wMOdwXPw2aDpR3dANCpRMW4miSoS/5/ZkQu6BJNCqnbEBrppeG9qMJlzvsRbAVbXilMBwXHnzBOtFrGI4pwb87HwcDpqfx4vntR3SJHI/AIwXYEEX8mk80SKSurhO4rIj6KyhLpUDuZgDMD89guNSK3Wk+I9NEy1m1KCasCUDChDN/JOv6HGuDlpXo7z6JRbWL5j1aFt5cumFfskYSWuufaReP4BhHwy72wpccKZ6fUIrntj6zVrDy1Up03PbNZpcoSPA8iPHctH/ik+shxmcbLrQvYHeOaBBQJNwFOFJk9dW0nNuPlfgl92WI1oeuo5c0b68OAkuW09SZrmD/T2HHbmxOPu54a5jhPTWNStzlBAlaEf5TL7TmhAvHL3Pmencsx9A1+ohOHy0IZirlakOM5qF8XHFYObZgy9NDZDvL2hnKOh6qSVCYsUKLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5358.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(39850400004)(366004)(136003)(451199018)(8936002)(83380400001)(5660300002)(41300700001)(86362001)(44832011)(2906002)(4326008)(52116002)(6486002)(6666004)(186003)(26005)(6512007)(1076003)(107886003)(66556008)(8676002)(66946007)(66476007)(316002)(478600001)(2616005)(110136005)(38350700002)(36756003)(38100700002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XTVTLAyZw54KovutCqxJY88Jtwr3l0DKGHnJtnAxpqKFfElCEQVMysD10lDg?=
 =?us-ascii?Q?+z42Je2w602dQw3/lcZZZpc5OZBccas3r5nE6+OgDUUtyWb7i5ptjphi03V7?=
 =?us-ascii?Q?sVFI/bUU+uVyQmsPlAZKW6aPrCrzdEqo/gc/tY43JEodntXuUa1PWAIBEmQ6?=
 =?us-ascii?Q?u28tbWxskgfNpJqMn+FVgd7iB9caH0K8cdTWV31Pdf6pK2rE5OWRq0fzJrYh?=
 =?us-ascii?Q?Eer1hT81KfOrCV7PPvfyNwL1WeKKNdp0f2zGdpaBv7O7bhltcMDSqVJNhI56?=
 =?us-ascii?Q?l+cRGIs0oG+2BOHrg5vw7p7dOZbboMEJ7+YGXZ+x8dQYV6xhZ20RhqGUVVXr?=
 =?us-ascii?Q?gYtzf8xhp39FLaGImOAtiE17j6yyPAlFgmQwvmjjy0WfObKnAzIHyXL50MEo?=
 =?us-ascii?Q?NATYWk13yEoAvX5eFxyXogcxus44Kkdh5ICF2od/yrBkcC+sLSf+gjdl0c3y?=
 =?us-ascii?Q?0Syuvk0wVMfW793r4o+DkK39XapkHa/Mm4h/FgnW+fFYWTm9FelADl0wINw+?=
 =?us-ascii?Q?E3yiVs+5K6YTJ/9ej3zJ6o/AvHMBge3Mc6FxJGCCQ8ckmzQy+GuF9oIp20J6?=
 =?us-ascii?Q?3Ecw36TO1epgE7svWKEqRiYoSprQf1MPhjCR9ifUlxjXfHyXFVe1bXBwYAtd?=
 =?us-ascii?Q?hqCcKaAJZk3YTtpRY8bYtqDkcfLKKk0Ku1xVmFKLygTmbrS/2v1D5VmK2eMT?=
 =?us-ascii?Q?gvN3/asv/W1XS9bGrGR9ZRcnPncWM4DHbOPzSQtkiPyBlfPZv0q7UcH/sUSd?=
 =?us-ascii?Q?E1uXUgb3offwliRCq366e1CozAeFJ7X335Od7P7nWkzaiy1xP3jKcwM0Y7Xa?=
 =?us-ascii?Q?+8SbE0REYLYAdIIfK/vcnGIdwIU1EwumSHSGmfpIfS3XjHBs2WTB+9WjsvGf?=
 =?us-ascii?Q?Aa0vmdAGuQlcbCF+KyJqEOL1TOQWmFTwf4NiYC8ZTEhO06wAgRjl/nmA6czx?=
 =?us-ascii?Q?vK1KrnJr4AZ8+AVmc46Ej/c28j+FTYmMFE+Jidf+AzUM/MRnNqHaf1tw1JHC?=
 =?us-ascii?Q?sSNcGSAxDuj+tO06Mg39upS5LtcG7hF/sWY05ueT97naO4yDTJ63TXfLttLJ?=
 =?us-ascii?Q?vO8DnTpLcahajQ9dc9gnrdd2FrZD44cjfqcFaJMdUPuusedfwLTEWmvQufMB?=
 =?us-ascii?Q?0vpZ3bESmYLNhlZFpHRNmOGA9O7gclkyMKPJ53QgYmtipWDr0BIqLBnLGiot?=
 =?us-ascii?Q?BmyY1T5uHOqThDDS3OoKv/1ctjRUR5W3uQpDiKTgEU25eY2FuCd9CUtHE91/?=
 =?us-ascii?Q?M5Vso8taeKZVpQWrQFMKV4aj/sz94UK8rD5+g+p0okBUbXpo2dnYTn9k7kVr?=
 =?us-ascii?Q?OZCx0jHTE8njD+Dfx0b/VTe/JYdEpsrSvUDWn1kKQv6LePnn92MMWuQ9mPI5?=
 =?us-ascii?Q?/YCPf3C3vEAjhknKZS3dTeo8+F/l2wChlM/nJ5nZIrj9nsfALxGW7bEZcJpK?=
 =?us-ascii?Q?6A2SN1o6dPoQdDOxVr/yLyZp4XrC6t9zhsvNAhOo8fGyMshqYmx4peYPKTGJ?=
 =?us-ascii?Q?A2TDR2oE/okSc4VrstN0naT0SkHbzuOeYOHyYyAhP6mceHiVGA0rRe7gsxWO?=
 =?us-ascii?Q?Gt6vVVaQ6yC9OnGBcP6hT08DsgpWhPJcp6CWq9zv7560nv+j8fb52xtdwZyz?=
 =?us-ascii?Q?og=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1f00de-53bf-47ec-5a45-08db132a7ced
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 10:09:01.1208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDFeV+wkSyrH9pTIgO9x43BxOrqzxYzBz7xyhJ4G6AVuNrBGxj+lgkqYrF8zEds45pGJUbVpN+h/M6JVE7pTNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7912
X-Proofpoint-ORIG-GUID: VkG3uUhFA3sWYviGuXm8alQeqFiUZGUj
X-Proofpoint-GUID: VkG3uUhFA3sWYviGuXm8alQeqFiUZGUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_07,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=949
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200089
Received-SPF: pass client-ip=205.220.178.238;
 envelope-from=prvs=1415163841=bin.meng@windriver.com;
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
index a76c855312..9ddf254e78 100644
--- a/meson.build
+++ b/meson.build
@@ -1755,16 +1755,16 @@ dbus_display = get_option('dbus_display') \
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


