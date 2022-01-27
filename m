Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4E649DEA3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 11:01:11 +0100 (CET)
Received: from localhost ([::1]:46564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD1aY-0008Kb-BG
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 05:01:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1MW-0001bs-GX
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:46:41 -0500
Received: from [2a01:111:f403:7010::71c] (port=58595
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nD1MN-0001n6-Mg
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 04:46:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iN73N2vMk/Sprka5CewN5Q2Ex4VMpHuEC0zHG8qd4M4xzQ+Ay3XsApq8AUW/Ri5PrDfJ9HZ75ZVSyALdnHBFH285GJXjc7ouMTLq/x1e/3gAynF/pbgh+HbnnLAEhz5w9kNywJzd3pPQ2bvXmFfpw64q2kFchyQgG1aGTVUXrEaSI7BD2Hife46XOWv1xYKbjW45KcmUnGjIJOxvJDdixUNklAaQaEQ1R7ae6fqqMHKdDH/u/jviS0ZOnud3Lhnv9JnZgGOQRHUbvJt3rk4u0uQgbeM1A1jx2srku5rBxl7EcNONlw5L7P4y+dO1OA50bRyMh6xzZJPjULMLMCrMBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lw5FQ4ezBYfJZoerq+uoXzrptHKBmP0GbF8PKifCavw=;
 b=F+YyMOWIbFvIxpuiMe3rEGuebtGPYrUkuWzKIDnP4MHHRGOYEpyzmKK+yQJNI+gEUee5lEPJo/YYiUZrqe2Zkh+JILVTrVriLJN7p6Al4RptjBwYWrPTsY3fBobL9Cnx07riqmKC4WD5ACfE/P/+XJA+yX5UoAB6pn+eYhMvOhapI+L9ai2/1tOorLckG4jLS04TuLY27eRB/18oagSsJneIEKOa5S1fctB/I+CR8ge4pHuA5dWe7yUcl/5XsZV3bBrVVgUZwO3WL3qRoA843K9Vw7OkmLIvBOiIKuwyglCyUxbcdjCR8hjqTIO6e4H99cSQVUZCEDZ2CMEV0nyE3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lw5FQ4ezBYfJZoerq+uoXzrptHKBmP0GbF8PKifCavw=;
 b=i6biFj1ZjhSLuyVfY+lLlI9PiyBU8UVlaw1rWlKqvr0IU0+HGAYGrhkGwUTDfJ3u+NcCM7k3LvTgqIK/g4jTnHk+90rAYj5cDuFtVwg4n97KxnD0bgFWXUBGPBQBZXmsUUadJnPmJlM1C6+xe9yjK5TKnVWnuAG0Tx+MDWas7HU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OS0P286MB0482.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:ac::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Thu, 27 Jan 2022 09:46:30 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 09:46:30 +0000
Date: Thu, 27 Jan 2022 17:46:28 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/6] meson: Add CanoKey
Message-ID: <YfJp9Al4VeXOz6OE@Sun>
References: <YfJozy5qjVYh24Xp@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YfJozy5qjVYh24Xp@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR02CA0203.apcprd02.prod.outlook.com
 (2603:1096:201:20::15) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28ca478c-6aa7-4cb7-6788-08d9e179e532
X-MS-TrafficTypeDiagnostic: OS0P286MB0482:EE_
X-Microsoft-Antispam-PRVS: <OS0P286MB0482C445F1155DF9CF48E345BC219@OS0P286MB0482.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YTF78c8vCfUJTe+fotQLfjA3NpQWWjOSayEgJJ0z9jA2EGkU0M+BHBaJfNsWgWJdBfmI5WQTUBMtXYxSwa0HZn9TWBl52c7nD62O6iSu5a4/IYOP11PPTcDFxqfq78y+uv757Cwh54QlJqCiI5Yp+8VeqrgsrcUf/otvMHH3EC6oufJQZ5kXo4HoowOOUg29r/JV3s3+orh0w2TiQF7oBzXvMWveyz8DeMJAYgCpyFKBse4+laI/1zMFLgmr5mlDzD5UkFyWCa6JF7CYgLL+b9gm0CEVmrTk1Pq5iXwezInWYIuv7OGWAfqpFq9xeupiPOlrb9S6Pi/zL5SnfoqZlvk2VH21wtmHvx7ZyNBvBueEm6EtQRQbOvST9i69KoOn5JUNEf85AhS65nPhwlvf8lLx2IQQ06IQyDhS2ynz84RdboB70V0zxPxQa72V8QkaWwKjBbI4VKgajTRNpJzZ3+wnt7T0piwn618551blxtd72Qt4YZpY8zV2cVtMchqLTrcE/N6KLiJhnDJ/W832FYli4Yl9nZSOFkWvyhsHgsjgWw7JhvbfYX0HOFxB/aGCoNlsMd/FTaJjrIEf3Biv0XzIPxNS6YhVujfiYzJS5dRjpoW/+x9iIefYbOfWqQ/U4M3U2OXVebk6yzNAORvXUse4fzvx/YiKyRdRHPdO6L50CEwn6Htz/AiK0hw8i07A2ZBetukLEHBL5KB4asaAjFalsl0AgBivuzBNnBTYX5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(376002)(136003)(39830400003)(366004)(396003)(346002)(186003)(26005)(9686003)(86362001)(6506007)(6512007)(2906002)(38350700002)(38100700002)(508600001)(6486002)(33716001)(83380400001)(5660300002)(6916009)(8936002)(66476007)(66556008)(8676002)(4326008)(66946007)(52116002)(54906003)(786003)(316002)(49092004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q2vnc5vjCmb0ZXc2bKYOGTYybEh4tJ0yKfN08NCy9Cs0irY4rBSyZqKZhFw6?=
 =?us-ascii?Q?ksxyWLq60QYONtHPVZXjqMeKUpDGhddeQLIAtzRjdPcrEetPxYPoZ1lOsxoW?=
 =?us-ascii?Q?9ajmmny8yfRvV/bdoESnPwswOkpE3G6e48GNZ68snk2nasmP07iYtb4s+mD1?=
 =?us-ascii?Q?EtYk50hnM8Bnp/T+iWnpsa9lglHDkAhJheAzl+e76yg2ElySTa1sfGX+NE87?=
 =?us-ascii?Q?eomsGMgh5FLFyXRaZzorvHXOakeoYdU7QUsoekF18do74IaY6s3bgc7s20xq?=
 =?us-ascii?Q?6Ka0RL5u7Yy9rJ60nJdk7RVBmr57rD8IUTDwYYvB//ld2sqoYPmMRcPyY9F1?=
 =?us-ascii?Q?KntZvL9NNfcQ7feJbQ7D7DDBVYgilV1Tgf4McFhSko4+RBs+bW9Af6agbf0J?=
 =?us-ascii?Q?6ynTmHJNwz/N3T/fDokWb2+QmFcnqiWBxq6bTSBQSHVjxEBLuKJTSCpdP3tQ?=
 =?us-ascii?Q?QUsifedjM8MBvjtlhWdXjuAUNFGcl726fOYLu4pUV2e0Uko5mE6RF19VjPQM?=
 =?us-ascii?Q?EomtObVTnodSzqqgYzBrORyXgGY2jZY2CrXpe3J3WNf7jijI6UcSF0GHT+sh?=
 =?us-ascii?Q?2z8JRTyWR7qQsytpKrlx7qI3Gejyfd+pl+fBnbv4bqmgE56l5aVCbu4J6nWX?=
 =?us-ascii?Q?qT7Y31mGaED+a1dfTZe1zcpkIydNNtp+8N7U9g9Z0966wcq2JRdKJXdUsamF?=
 =?us-ascii?Q?GAvVtM/azBn0UNPsx1n76+Qh2V1e3kzZOLro08Zbsee1bYPDLigYzKdl2OYl?=
 =?us-ascii?Q?RIgRKsmn1ZioZXZnV8+ZRyqg5om722nzF4SN5NA5iatjw2OWcgz99gOfpiR/?=
 =?us-ascii?Q?iNqkCB9IZ25KrZ77lSWHNnVboo1d4QypIvLpRLF8yofVIq89o4Pbjy8Ek4ah?=
 =?us-ascii?Q?O1/+0IJM/QcS/tyJczCqHWIcLgpAObXevkARZ/SpEEO/LZ5SsracSfqZbrRg?=
 =?us-ascii?Q?NaBK2MLw2uN07D9Guo3LR4GCbLteJcRoImSpvn7OEvsoJBpoeEnAYoavS97p?=
 =?us-ascii?Q?0jwx+GBYA3+rZArer2fBBeFzwVFtKfQQW+GePqrjoTRMABuCdqGU6qUdZ9x3?=
 =?us-ascii?Q?AouZhrokaqAN353bvJwtvppttUWl+yBwV/oCy7jn5U7S2O9o3NeM9SLH5Rht?=
 =?us-ascii?Q?guPaq7MPK8dcxHyo4eqDlsyGViyQN31W0mqkGVB17frALdOeBYGJXUUvjtzF?=
 =?us-ascii?Q?S0h7jqHbdNWA8+XkxUKAhj+ruJpR85FaKYUnrNWbQiXt4/f1iIr+ROM8XQIz?=
 =?us-ascii?Q?B27wDFVTi9g/vruWVHyx+VXHQoakAnWOP7O0KeZe0tVL/NZQrrsIsVRb7f1T?=
 =?us-ascii?Q?u27hNmyfOoQi9lagOFIchqDgRiXjSSZ4ONcDArQAetNZckCR16f7XWPHtJl6?=
 =?us-ascii?Q?+VqhfNj4fAFbzpqS4COfz1tgpLU7cpkF2j/92athKT2l+P9dXvYki17fWvTR?=
 =?us-ascii?Q?i+OxbrxpsTlCAkdhqXBdixDvzhXnljpl1/skNquVq/6Ncq74GYiR2fuzHTYr?=
 =?us-ascii?Q?D9J3j4zPG1jRjTRspjQPjXkKiU9t3EtZm31oF4NXLMK1xxNsWuF/gIpOzJbu?=
 =?us-ascii?Q?qfjbvTgdnKi7Juxg87M=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ca478c-6aa7-4cb7-6788-08d9e179e532
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 09:46:30.3464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzlQQTYmMJwtsGfQifRzZtLUAdhQMDCtDY72n5qfCQyP3+OURMs1UaVyRmJfOZQ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0P286MB0482
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::71c
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::71c;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 contact@canokeys.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/Kconfig                | 5 +++++
 hw/usb/meson.build            | 3 +++
 meson.build                   | 6 ++++++
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 5 files changed, 19 insertions(+)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 53f8283ffd..ce4f433976 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -119,6 +119,11 @@ config USB_U2F
     default y
     depends on USB
 
+config USB_CANOKEY
+    bool
+    default y
+    depends on USB
+
 config IMX_USBPHY
     bool
     default y
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index de853d780d..8390a29f8c 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -63,6 +63,9 @@ if u2f.found()
   softmmu_ss.add(when: 'CONFIG_USB_U2F', if_true: [u2f, files('u2f-emulated.c')])
 endif
 
+# CanoKey
+softmmu_ss.add(when: 'CONFIG_USB_CANOKEY', if_true: [canokey, files('canokey.c')])
+
 # usb redirect
 if usbredir.found()
   usbredir_ss = ss.source_set()
diff --git a/meson.build b/meson.build
index 833fd6bc4c..0bedebca49 100644
--- a/meson.build
+++ b/meson.build
@@ -1194,6 +1194,12 @@ if have_system
                    method: 'pkg-config',
                    kwargs: static_kwargs)
 endif
+canokey = not_found
+if have_system
+  canokey = dependency('canokey-qemu', required: get_option('canokey'),
+                   method: 'pkg-config',
+                   kwargs: static_kwargs)
+endif
 usbredir = not_found
 if not get_option('usb_redir').auto() or have_system
   usbredir = dependency('libusbredirparser-0.5', required: get_option('usb_redir'),
diff --git a/meson_options.txt b/meson_options.txt
index 921967eddb..7f5ffba35c 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -143,6 +143,8 @@ option('spice_protocol', type : 'feature', value : 'auto',
        description: 'Spice protocol support')
 option('u2f', type : 'feature', value : 'auto',
        description: 'U2F emulation support')
+option('canokey', type : 'feature', value : 'auto',
+       description: 'CanoKey support')
 option('usb_redir', type : 'feature', value : 'auto',
        description: 'libusbredir support')
 option('l2tpv3', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index a4af02c527..3205ff7d63 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -29,6 +29,7 @@ meson_options_help() {
   printf "%s\n" '  bpf             eBPF support'
   printf "%s\n" '  brlapi          brlapi character device driver'
   printf "%s\n" '  bzip2           bzip2 support for DMG images'
+  printf "%s\n" '  canokey         CanoKey support'
   printf "%s\n" '  cap-ng          cap_ng support'
   printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
   printf "%s\n" '  coreaudio       CoreAudio sound support'
@@ -116,6 +117,8 @@ _meson_option_parse() {
     --disable-brlapi) printf "%s" -Dbrlapi=disabled ;;
     --enable-bzip2) printf "%s" -Dbzip2=enabled ;;
     --disable-bzip2) printf "%s" -Dbzip2=disabled ;;
+    --enable-canokey) printf "%s" -Dcanokey=enabled ;;
+    --disable-canokey) printf "%s" -Dcanokey=disabled ;;
     --enable-cap-ng) printf "%s" -Dcap_ng=enabled ;;
     --disable-cap-ng) printf "%s" -Dcap_ng=disabled ;;
     --enable-capstone) printf "%s" -Dcapstone=enabled ;;
-- 
2.34.1


