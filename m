Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B054252D2E8
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 14:47:50 +0200 (CEST)
Received: from localhost ([::1]:50694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrfZD-0006kh-Im
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 08:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfQs-0006UB-Jq
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:39:13 -0400
Received: from mail-os0jpn01on20725.outbound.protection.outlook.com
 ([2a01:111:f403:700c::725]:22702
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1nrfQq-0005D8-F5
 for qemu-devel@nongnu.org; Thu, 19 May 2022 08:39:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRht5Que12jyo9JGHY6g2BPEfoi9i4ogFZp8yL5ps1lJv8mWvgsc5BZqJGU0irJTwIw1HX6PnKDcpIS/AJYGN7zpXia8sLFZfUMloXBesou3wjLdbwZSECZeYGw9wOy/NeVuBlo3fVcsABeGDLP414pgLVhQJrGXdHGk09GFFgoyKPNs6p+Xs3v2oENdh2ZveDkeBk3og6odC+nVOsJgmfkRWA7snglIQiQAkuaoSXlb5JzUADvkx63nQhgpTtWqYMeGZz6P+zZxbhmB9vfp92IohMhlNs7uEgaZQ99K78cIOgTIT27ogtZWaTFvAnVf0x0CdfW1MT2EpuZLdTHeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XJwRT4PNG8Cu8Nf2KXsBunXVRA+RntPXOfgxq49WPA=;
 b=V8KFJYV0GH1AHrRhW8Dju2zGufMhNvXVMHifuf8M3yf7pntRSNaiW99T2YpPuVznQ0y3ThBbWfuMFOFPmxsUYyBTWYL3EuaAkqOsYvOJP3Ws4rXKbQgH5yoxeflNI8gapIExJb24Jyz5TQhWh1ccMUyhG+w3mHJbaOGIjdjbl3HmqLWXmBtghB61MmWyZ82rN6V0wn4IG9lI9j9HT8/zG2mkKPWkwnKXom0Aa9F2dbJI6+EWGMwsR3IZK4UrrqLbj36Q0cngvPTDTKYXU3RvuDs8IHhSV/cL3Ig8n/V/pcw8rv2ATicmavP1EuR16WCxprVmbQyQqjQrLzXagIHAbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XJwRT4PNG8Cu8Nf2KXsBunXVRA+RntPXOfgxq49WPA=;
 b=qxH0w+9JV0x6UPvepNiegc1Tgb9mkl0y3+fCGoTiMtlmPDhDEGwbWDCNoe7tQH5lYkW3PYkYDZf+CtmmLrdsRaTvxXwD7+HAHKant9vp58l8eLS7pDbBZ69Z0gkuMpT5rZwxCJgDC9YkV0EVMdYMEc2uo8oPvOG0ExPcIV+11vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:9e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Thu, 19 May 2022 12:39:04 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::bd99:5c83:e2dc:a8f7%7]) with mapi id 15.20.5273.015; Thu, 19 May 2022
 12:39:04 +0000
Date: Thu, 19 May 2022 20:38:57 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, contact@canokeys.org
Subject: [PATCH v5 3/6] meson: Add CanoKey
Message-ID: <YoY6YRD6cxH21mms@Sun>
References: <YoY5k0PQny8WtAHi@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoY5k0PQny8WtAHi@Sun>
X-Operating-System: Linux Sun 5.15.26 
X-Mailer: Mutt 2.2.1 (2022-02-19)
X-ClientProxiedBy: BYAPR02CA0072.namprd02.prod.outlook.com
 (2603:10b6:a03:54::49) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aadc2b32-dabe-48b3-975b-08da39948f10
X-MS-TrafficTypeDiagnostic: TYCP286MB0941:EE_
X-Microsoft-Antispam-PRVS: <TYCP286MB0941F0F37CFE0D70AF31EE9CBCD09@TYCP286MB0941.JPNP286.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x20xwOGCb1aq0RN5NQ8iiVAE2qnnfyIpranAMuKY28Z56AlTqrJssbIU+HwtC19PCrH3euwI5VZQbifB16EoSxelcTGDI0NlrihxoZpMxH3TwkcwHRgJ6yRW79h4Z91pUJBuDByntulPLAWAcx7Jf4/VpjN+VyBj2RXGmn1PNvk7kF0ltAaR1qx1YEgtKXvUg4xirqgKGKubGAi5KSiIVVaBz3fB1XzMWGoHd2iV9plXqL9ciqmNLu9kXMztcJs3HStpUST502YdR3PhSzcR4Qclkx1JIpRASJGG/vB5kU49mA3l5KpGTwjJrR05o0yR7m2xm/DWKQPu1EoIAtV2Se37J1RXxI1VCIKlsOHTM7jcEx/JnBei300RWCHeTtE/CpIalENRO3Mz7+APvjI+1t7BfklFog9tMS2eOEoO+3KHluQ8mmfBrzex80uwO/x6K3rf+4eHhVyoffDmEGx8Gglxp2+ahmFS/Qh2lsTqNwlWr5JJhM82dIGFuHgFGvqvVL8HCm9xD6wV2nRjBaOJ+ouRDUrnuIViIJA8PJGtxkGZ09jBCNQKSRRk44cz+InfFSCovnz1D8lQPPhpnaUf1e4MYIufa+CFz5jmMczQY9xw2UAQmpvbC7MpGbuaSVOylLt45kGfalzV8zwl+JqYsAE23q2gQhtsbbrNNCV7rtlT7lqLIBTAheLSC7HPoMriZl6mKVillvRWjK9CjNUpAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(136003)(396003)(39830400003)(346002)(376002)(33716001)(2906002)(41300700001)(8676002)(508600001)(38100700002)(110136005)(4326008)(41320700001)(6486002)(316002)(786003)(6666004)(83380400001)(52116002)(9686003)(6512007)(6506007)(5660300002)(66476007)(66946007)(66556008)(8936002)(86362001)(186003)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LHRwR6N7blaFHMo4MkZlT2g25rV3WbOS2SdyVaZBwqv77ib1QwjLNy6Y3peq?=
 =?us-ascii?Q?VnDWhUR9RArwxMONGtIPdhDppMgXPmAthcdzwcbpUsF6ddoCkBLqOnjXO8ZG?=
 =?us-ascii?Q?NoonDDCHiHedibYdHntQdvy2lfldbjJ665YdcG3/30z+p6hFrgyjr14Fcb5v?=
 =?us-ascii?Q?OR4fc6nKuwRjLeyFT6dkgLaTHxuAAjKccvvaNXJC+NM4PQPinfz0ANEjI7nM?=
 =?us-ascii?Q?Yoty5cmWHeJBzanpid1OftdKoaR97xCdswzuRBigi9hDKvmA6opNqcxcqzNE?=
 =?us-ascii?Q?QTnIYXlFjwuSkDNyyCoegizGOWfNhlag5xaLr0tK669hrV01JIYcpj1voYmk?=
 =?us-ascii?Q?JhEQl/0pbs4pafqKMtegItuZinpTAnKotaY10fHw8rrvNfAtWZ/uQDT5Oe+t?=
 =?us-ascii?Q?OCuQgdMAv2taL55HwHsrwyoFv1mMynpmKMrtPGyRgV4c6MKtmwH0PlSjCgBm?=
 =?us-ascii?Q?SolbLxfiBWC05fJ0sg9iK2JKtcrtPDEcLhJjI1nhzgRhjGkxQO6Pd5JzfGoo?=
 =?us-ascii?Q?ZQ+BwklS2E+RIZWDFbBPTpVx46K901LmqU0bFdQwIwCRXe+sFgH3CPhZp0BH?=
 =?us-ascii?Q?KqM7QVX7Irg7IEUaEPKQnvwJzmVCtRIMi/bMOIuEiihymPJvweIXcV4U7iAU?=
 =?us-ascii?Q?5MmhIeYdraJ6m+7uLK2n3U8bgLKyYzu9KFXwHZOB+MAXLKUA74BrnzYa4kzo?=
 =?us-ascii?Q?+hEpSSock9xfztiX0LlvFcYrrZNpP4k2z2/dWP8+/Cpj/BBmGKo4oux0kRlw?=
 =?us-ascii?Q?Ed+G1bgbBVxYO6IQPlCxEreoqGcbh5MLXNe1zm3yhIO2fKbX3LGCuF9L+O3i?=
 =?us-ascii?Q?Mfl8ZfjTCXr2AeoZ/u6Q41k/h3tcpJ9UUASGWY8Gb+umKp94TsDsO4e0c+v5?=
 =?us-ascii?Q?Er3meyNpY6vgzlg/YttrhFmjtGkIDM+oG+9NF/K9rC7nvDaKBSGXHjsEhRzq?=
 =?us-ascii?Q?xdB0SJr2uCWxQTeWJI+pvmwdgiSlZKUcUML9jjKE7Ak3pBk+nJTzQU4ju0lR?=
 =?us-ascii?Q?XSaqR3ve4nRZHdlAqPJOhGvzyiMrB7aerm9g6Yd8QBCDXlEtD+c9c6K2aWzZ?=
 =?us-ascii?Q?ixchmChsg+NeXNEwZr/oV70eZpydc+CDvU6lqqOKXpiUSVOb/mEbU8cqY6ZE?=
 =?us-ascii?Q?LEjzMbm/UP14XeRpaBEA3riD9uCbg/EjG4HMSbUPPs/4GvrRbAGoetUM+d6N?=
 =?us-ascii?Q?Crzsrwp92PvAMG3/HHngAlt0ayHouvscxkr7iTaNTqD1t/oxWu/cRsmPH1Lh?=
 =?us-ascii?Q?nsb2rmXrgYVTv20RSL3EkQOjXnaOBDPbVQdVVHLkQfs9qF01iTDuLFvBSCpn?=
 =?us-ascii?Q?DTZ+opIsPG09Pc/9DFxnnUynjPudbExsAub2QmA9dp3nIig9ybvV+djRIFaQ?=
 =?us-ascii?Q?oRdv4HvwbFLmrhXQSWjSfGXz6ffLHewUG3aQwHXmN210k1LC1ehEj6pZt+W2?=
 =?us-ascii?Q?znYeqOcrMcc/GRASM3hvRoK8uylU2Wy6gTF485vYA0bFOC4XNhhB4/BDZE2b?=
 =?us-ascii?Q?klgAXyLbImG3QUPN03iS8SH8LlO3s5Zq36qn8erL6Rj7fGOCN4AxhMBB6Cof?=
 =?us-ascii?Q?GVAUOHyE5NguRRRYDl6cs8j3iFKZwam+7nTfIJPb8fWQ1qxqooH43V/DZzse?=
 =?us-ascii?Q?dwy3UkwArsyfV3TM10ztpwnW94Uxw2ImRME+kczjKQnkGgZPvjoBe7pmlCBe?=
 =?us-ascii?Q?OS+dw8TtwcC50qj8pupADr6haokYVmM26hc48M0NbdrNUsyVIpKuMeLYhLrM?=
 =?us-ascii?Q?mIQRqw5ztA=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: aadc2b32-dabe-48b3-975b-08da39948f10
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:39:04.7798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToBiFQhdnxNeCi7hzGC4kONTaPnu5eMzMInTrs4C33IyedaGDs7PTIOq4Gxf1skc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB0941
Received-SPF: pass client-ip=2a01:111:f403:700c::725;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
---
 hw/usb/Kconfig                | 5 +++++
 hw/usb/meson.build            | 5 +++++
 meson.build                   | 6 ++++++
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 3 +++
 5 files changed, 21 insertions(+)

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
index de853d780d..793df42e21 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -63,6 +63,11 @@ if u2f.found()
   softmmu_ss.add(when: 'CONFIG_USB_U2F', if_true: [u2f, files('u2f-emulated.c')])
 endif
 
+# CanoKey
+if canokey.found()
+  softmmu_ss.add(when: 'CONFIG_USB_CANOKEY', if_true: [canokey, files('canokey.c')])
+endif
+
 # usb redirect
 if usbredir.found()
   usbredir_ss = ss.source_set()
diff --git a/meson.build b/meson.build
index 53a4728250..7f90e49ee6 100644
--- a/meson.build
+++ b/meson.build
@@ -1383,6 +1383,12 @@ if have_system
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
index 29c6b90cec..b41066aa11 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -189,6 +189,8 @@ option('spice_protocol', type : 'feature', value : 'auto',
        description: 'Spice protocol support')
 option('u2f', type : 'feature', value : 'auto',
        description: 'U2F emulation support')
+option('canokey', type : 'feature', value : 'auto',
+       description: 'CanoKey support')
 option('usb_redir', type : 'feature', value : 'auto',
        description: 'libusbredir support')
 option('l2tpv3', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 5d2172bfb4..af2e7bc8e5 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -76,6 +76,7 @@ meson_options_help() {
   printf "%s\n" '  bpf             eBPF support'
   printf "%s\n" '  brlapi          brlapi character device driver'
   printf "%s\n" '  bzip2           bzip2 support for DMG images'
+  printf "%s\n" '  canokey         CanoKey support'
   printf "%s\n" '  cap-ng          cap_ng support'
   printf "%s\n" '  cloop           cloop image format support'
   printf "%s\n" '  cocoa           Cocoa user interface (macOS only)'
@@ -205,6 +206,8 @@ _meson_option_parse() {
     --disable-brlapi) printf "%s" -Dbrlapi=disabled ;;
     --enable-bzip2) printf "%s" -Dbzip2=enabled ;;
     --disable-bzip2) printf "%s" -Dbzip2=disabled ;;
+    --enable-canokey) printf "%s" -Dcanokey=enabled ;;
+    --disable-canokey) printf "%s" -Dcanokey=disabled ;;
     --enable-cap-ng) printf "%s" -Dcap_ng=enabled ;;
     --disable-cap-ng) printf "%s" -Dcap_ng=disabled ;;
     --enable-capstone) printf "%s" -Dcapstone=enabled ;;
-- 
2.35.1


