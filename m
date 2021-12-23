Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60B147E911
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 22:28:53 +0100 (CET)
Received: from localhost ([::1]:51870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Vds-0007oW-Or
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 16:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0RwN-0005ht-Qa
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:31:43 -0500
Received: from [2a01:111:f403:7010::703] (port=17069
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n0RwK-0008C7-NN
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 12:31:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAtwsLN1+/nzBrNBy1YwHU1q+koCp1B3UXY0UELVzEH9do7uxggGmVLGhCEkSJsudRSk8uaQig3MxDsqunTBCxj6XdTKDtUxD4uI8NU3mR1FF+hVLFJKbU06UKDyNFH4ARb/CM3pRQPtmk+ZKvqKWKHT9Anzydvd+3R+ddURsoCc1vD3ryQ0LVgZwgAyzsFYsbdZslhacHBbyJmYXvt+/eGYahuEAF6iWOQwTHE0NJov34eJ6s0fzgIpTvhdBaTGUDXP7psXXb8QZBeEdqDUN6tc8KbmZMr3Bl7kFNIgp8USH4nmeoYK+jMgKebd/BN/VUDDSLmFBbM9hceDPe8R/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZ7miJnzwDkSCf1QIbuuS3GUu4ErmZtwNi/9K3/bX2g=;
 b=EAhx6L+oFpUb+xwenDnV6iYktwAogQQyOlSftRPjuusKhs9FPpTof/QPxPedOuiK7uA0rzEGD4qM0zrBPl5Ro4btR3/5agLOw4rq87FCZCUyBOfY7o+OHzDrdHWtwovQIYAWd97tBpNH/np1VIQSuQuw6ZVZaPChffEg4StKTXrkDqZaUW+5wpMcp7YUtx7i3lWsvIPpesaxVil0iLWqXChyvbB67g/J1f9vM15GFT83hxvQzGXXBGZwoDOvpxaI9R7xwmbNAzEWo9xDCNiS5llB0VQHVC6kOQ4XHA22lZHlDmzEG2eVErZywTHzyTdfqbbyXUH2EPUVeCMt9coofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZ7miJnzwDkSCf1QIbuuS3GUu4ErmZtwNi/9K3/bX2g=;
 b=UgM5E2JdAZIK7eCXJpDK7qMH9gsKjG7C5G9aP51LMkqUB+T6Nx+91vWXcuJOJgxC44iajNAukIVh4v6PgzFgpeP5PNMEZWuB2FSCjgm7qm0vFrLXMQMlD3imH1Tw8Srn/D5V9oVO4IZIUfo1RMUHrc1XL+MBFOot6djywSSbN1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0032.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.18; Thu, 23 Dec 2021 17:16:14 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4823.021; Thu, 23 Dec 2021
 17:16:14 +0000
Date: Fri, 24 Dec 2021 01:16:12 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] meson: Add CanoKey
Message-ID: <YcSu3CBvpXdseAef@Sun>
References: <YcSt+qozrl+J8ool@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcSt+qozrl+J8ool@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2PR03CA0051.apcprd03.prod.outlook.com
 (2603:1096:202:17::21) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75881dec-e165-4123-a0ac-08d9c637ec7d
X-MS-TrafficTypeDiagnostic: TYBP286MB0032:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB0032DE4B979F5C342C8C3F02BC7E9@TYBP286MB0032.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VPm7zMxAagCaNi9OEoQy1RVhSDBVX4EFIJvXqUbR4ikM1qkVJ251Tx2+bDtYpqG+zuWBrSif8+oDewd9spO5z7SPRU4Ish8Qz5WRO6eDfOYPMRfYTcxceUhwqT8bNbRmQ7nJKyQkNgGRkq6z+PmPm97U2J1kqUf1eDBozCWiLFyWcZSCP42T89YvC/2VDMxuY+UeHjpMBjylh4AhgAFNYkgKgWF9H2DvBuZhDdBwkV1LVX3fcCZrTLF2kLmeztLGmOY9kkFnudcdtbFJhOZ8GVMhjVpTGkpbe+VvyaGAJ6TMbHwcSVygP1vLflzAL9V0X9e9sNw5erj3s+ga4MmpKWDzkvEmXH3oP+/10C3i3X4t53byRp1OWnUzyUiw1y2lCEhWiKepSKJ5zAjRU+1qZ3a6YHMduZ07PQwFRwCkR+3T5zhraEhd+tagv4/Ih4JEwapwbnAwtjPo0fJIpnXly9vCeIFEA/wzl2SgnRXdiGnf1mlfQj09eKLVrrtgzgI7yD98vrDK76if+Y5F4pAELva7cwctBPMRQIVR6ANNJpSLmk4q6PVIdqG8NCH5hLdxiy4KbV6+M01obEFAcMDYulgT374kgUMlB+rOGcxEwpb5nn5r05pkuWDloCAILU9nYom53lCVDNFMWHo9/n3dr7sRHNQfbG6L59VvllXDM00bWwOWgtmCPrAQ5nXHoY3cyKhjft49IO6sJKlvNaunXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(366004)(346002)(186003)(4326008)(6512007)(9686003)(6486002)(52116002)(38100700002)(508600001)(5660300002)(6506007)(6916009)(66476007)(786003)(8676002)(2906002)(8936002)(66946007)(66556008)(316002)(86362001)(83380400001)(33716001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SBrKzUFFwZWRpfw6kIWDvIi+BUv43SJMChLXgvCqiNPj46TOqYXq7DT8hkb5?=
 =?us-ascii?Q?ZhDI3qEGBH3oWvCj/iE/1md75s7jv8A9/Ads5w+AhJ9k82pBqMVkgAgGv0C1?=
 =?us-ascii?Q?jwcX8lZoAxsUyD/DJ92cvh2wYYbc2ldi1L8dRV2dhIjZR1SvuVc2qG9KfA1q?=
 =?us-ascii?Q?zn5tEwC0yvE4e3nAG625IsuvCJK+Q+5J0i77ZbkvGugqPR8/T/hCPpx7Ginc?=
 =?us-ascii?Q?1u3klcX7t6Fts3dp+Ghx5d1yIbrv9jrYj84CCnJhlsKSprrWu1pq8FwxCkvI?=
 =?us-ascii?Q?9pQxTDr4gTOzghgE7KqoVA+tPxEyvJW2CBh7eU84r90QKDRtwkUt3xpeiaFe?=
 =?us-ascii?Q?DmDToCN7TA/kfjGMO5WTGj2xb0HpHhnpopOuoMPVT4r94dTuyWNIGptMm32I?=
 =?us-ascii?Q?TEren0POqXCS4GN9A3mKlnAIe98DGDSK4ju3MtB/vEBCwh0KWACwzdJKWJVT?=
 =?us-ascii?Q?cOpiAIrjYRaekX5j1Brvj2kA9QdRkqtjrJ+5puFhJy+3z5W/wYH5YLRupLTa?=
 =?us-ascii?Q?bIiWwUydHjseUYy2aW/6LcyZWFKZImX/KlDnDGFcUuA+dlZCll4jbApb/TRy?=
 =?us-ascii?Q?ffYflBG0hJiyam5IB7+Dm4G+q/tvX2pJ+nkbfhM0LtoH6e/RSSgJ86fXdneS?=
 =?us-ascii?Q?+BPqmEtTz3M3Hcijv0OTGhIn4aK5KtCLJheiuKKNI6R3EkczFhK1bv0J/WvD?=
 =?us-ascii?Q?nepxc+2J8DS6QM23DzXT8lhLrvg6OB/7iv9k4euVUC55jAxu4HRV9wqx0LFD?=
 =?us-ascii?Q?g3yVFa9ClyRrwoGOTcVhoihqXGQLP+MxM53Ung58yWRc7Vmbs7b9jidwnnkl?=
 =?us-ascii?Q?HQE9eQTBgt17H0S+NfTNImSGFousBaUD6ibaJwUVLVb8CpJwgTc5GbAlSNZc?=
 =?us-ascii?Q?rPEKWDx9QWP6FwAc3SzuHrwEz86F+dUuUw/zyoDoOBvtsjPasB6OSGcBJoJQ?=
 =?us-ascii?Q?OU/7RQYwttAIHpHvrdXYQpn3uLoWyu+YUXiaXhoKAJFY7P+cj+R1224jxkLx?=
 =?us-ascii?Q?EnZ0Naf/Oq7pEd1ezwoE47vbF2kX2qnXvuIvA3pvNZLpPK1R9T40l1DQ9WFT?=
 =?us-ascii?Q?zUwcB8vL8v3vLWnP7zdF2Ge26kK83B5PVBK8kzoRcgo3jkTNV+G98gPgmzbH?=
 =?us-ascii?Q?ZMRwIbhduIjU1gIvGwbMGqNkTnZUrGsQOU3TLA0K3MJCDApRZNayI0L6a8QH?=
 =?us-ascii?Q?TY0XyrpdEkYZyY9oucd+kc/vAZWRax6FGkFK2A+JrTTbIGVUfxJSoJtx0aP1?=
 =?us-ascii?Q?jCBMDT4150FxXVAmKKJJBfQqulgMQC+dX5rvR2qVLPXC0g8rA0DF51TviX4V?=
 =?us-ascii?Q?FvowVoUtTP8GEa5VJxnk9SPd84mWGS7UEyaRKK5KFG/aJmfBNCWTzMKGKFD1?=
 =?us-ascii?Q?6zwWLVeWbYTph44Ukz5VKgF86gIY6ciAYB+RG+/bIUnMKVQ4wsq73llulh92?=
 =?us-ascii?Q?t8g+plGAZOiTjY6BHUKMtH7eO/AjCfhFkt9jvgCbbar82RF8HgsYZ4CyiGjQ?=
 =?us-ascii?Q?PWNeIzdfjKRuXH9mlo+31Uq6TpcTkAZGxo6VBK866HgIda/4eE5t/9cFym+J?=
 =?us-ascii?Q?v/8feWwmWTE+Ac/dMc1gMU5wun/YTiqUvjwVRNgv?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 75881dec-e165-4123-a0ac-08d9c637ec7d
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 17:16:14.4211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hE75fJ4zNjoUPzG623JrzTxaGDi3N5sBeFJqTC2AQdG2fHiW4+XB2UJtax1SJMkK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0032
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::703
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::703;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Dec 2021 16:25:05 -0500
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, contact@canokeys.org
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
index 17c7280f78..c3558d0de9 100644
--- a/meson.build
+++ b/meson.build
@@ -1181,6 +1181,12 @@ if have_system
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
index 50bd7bed4d..56ae780d4f 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -28,6 +28,7 @@ meson_options_help() {
   printf "%s\n" '  bpf             eBPF support'
   printf "%s\n" '  brlapi          brlapi character device driver'
   printf "%s\n" '  bzip2           bzip2 support for DMG images'
+  printf "%s\n" '  canokey         CanoKey support'
   printf "%s\n" '  cap-ng          cap_ng support'
   printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
   printf "%s\n" '  coreaudio       CoreAudio sound support'
@@ -115,6 +116,8 @@ _meson_option_parse() {
     --disable-brlapi) printf "%s" -Dbrlapi=disabled ;;
     --enable-bzip2) printf "%s" -Dbzip2=enabled ;;
     --disable-bzip2) printf "%s" -Dbzip2=disabled ;;
+    --enable-canokey) printf "%s" -Dcanokey=enabled ;;
+    --disable-canokey) printf "%s" -Dcanokey=disabled ;;
     --enable-cap-ng) printf "%s" -Dcap_ng=enabled ;;
     --disable-cap-ng) printf "%s" -Dcap_ng=disabled ;;
     --enable-capstone) printf "%s" -Dcapstone=enabled ;;
-- 
2.34.0

