Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD294879F6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 16:55:13 +0100 (CET)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5raC-0006HS-OU
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 10:55:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rVY-0002iM-Sp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:50:24 -0500
Received: from [2a01:111:f403:700c::708] (port=47286
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n5rVT-0006YF-U0
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 10:50:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDTCoe1FE92sjm0QRihfZnO+HMKVH4Rd8RCfNdTCEl1mH2LKmUABgrCFZ+8LbyhDe3kNuMFLIxPQsVDJ0jiqcB9bc8Rv3a9qt5vuXwtxgcQ3/REAu/e6mWQSx4aUYEnMGIg+rtZlFPUTNOV5Hs54Dg7jCf+s7RMC9lK58VC+06+/04SUdkFFV/8+wlnwRJP/R3AXaPKHXz5N1OxEJQ2vCIipljMpXgq9LBrfzYYdybpLeLVUImIVNHvLG3sipgAkwVSnhM2MssOI0VTTo8z3dp+Cyz9ec5r7Y80UIc/jApCIB5/B37yOAuSEBK8MEWfhn/wjYA5ZK8N1yEUelynYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnHU92w9bgu7s0SkxGoZXURlTOc3wi1OZJQy1ftAyaI=;
 b=VoNe5795gKObldlv2J6FdnQOX0qv841PX+ov6g/vRb2fM25VSn8p7EYMA3uYCBa65cMH8GILRTyrmB9yNlU0YYnY2VJ0OobZR8QgYN8XyZ5qO0pFOqth2QsEchAT7PDyhUQtMMS3EABb/xR7akHBg9+emhHGxYju8HDXtDy8Xc9ciE2ul75JW2COA5QgrcWG5Mv08D0pYTuG8JUwU4S1KoRcBOOtEA2cUGPdz5JAPbODX0G20z1omWlga764+VFBIQt9qATUajFYsxPXLcKLbq/+sg3gOwCM5QwOJt7irptzVpBuYY6fiD47VAkhS887cGfO5KJyNOTFUAWuICZI1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnHU92w9bgu7s0SkxGoZXURlTOc3wi1OZJQy1ftAyaI=;
 b=XFhkDgSr4a0OyNQq7bZQ4++tZjjORG2VfVGE5pE3acFqDFjbirEZTXDiJHW/a28lOU/V/jDwCJKeFlfEAxUDIwEBGhUhZXi+kX8PP83Hba6JXIorEguBjf2243g/W5FYZmgMFRG0Lo+a46FtzuSRAWNjqt757SYhfDFdStXWu4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:801d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4867.10; Fri, 7 Jan 2022 15:35:35 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%7]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 15:35:35 +0000
Date: Fri, 7 Jan 2022 23:35:32 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/6] meson: Add CanoKey
Message-ID: <YdhdxLP0R8aOyGVh@Sun>
References: <Ydhc8cTsH0QNINT/@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydhc8cTsH0QNINT/@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.3 (2021-09-10)
X-ClientProxiedBy: HK2PR0302CA0015.apcprd03.prod.outlook.com
 (2603:1096:202::25) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3403a29-a3bb-4bd0-c4da-08d9d1f358ee
X-MS-TrafficTypeDiagnostic: TYBP286MB0432:EE_
X-Microsoft-Antispam-PRVS: <TYBP286MB0432DE88B2B875687A44D8C0BC4D9@TYBP286MB0432.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r4hgH2XU19i+Ll/k4S5UeHqvndTeMAnCnjl5WRin5nRZV0qRJxJEbkzNFh2wZH7l3aohVKf0c+3Xf/cmpvMEsbk23VMybRLyMT/1bmUgmhruE68MeErs5RQ/Yw6+relsJjuVklAP4pcCaoYvEtEI+9qtuWiVCugbIdB5OA6KPJC21A2L49Lgn+dVSnChyDMf89/s9za9dNhQ50N/UsKt19iuG8SfW31caNoHHIN38yeCT4hnhD0bFc0ueR/6/wJ6aAzGdAqikr72dYqrSgXp1bWZVeJL+9sP5kgjzelKrjUryDWbBdsE1+RUhBVIIL1qC7qexfmwILGH5I6iBUBHDxJgPs77sYDDVGCYwy6fdWULq/Y1t01vvP3oQJLOttV0+WKSAaUR4IZQEN6Jc3RW0rr8oYTxzn/6DKep8o0nfmz5kf/2hp8c5yyJ5fjfVVrJGQBfSSF8pxxh3rqU3lk0L8ooy3TzPdnxZ54JdAFmo8qtka/4ziRBOrGPi9GUM4n0Lx8rpR/cqhGCJsYCJvV1qdsvPVlN3xXE6wwUPskgWCkqUymn6Eo6PXFbYEIvl7ictFt/ims4ziAIluRRRiL5gNDbsDVv6bWtamq/4iggqkG9aI+2jXfwBh5Js3SiBIo3YOmV5L0hiqhnzQ/F+5QzMA57TKHuOn4u9Zhb3U6pklwvoezgEvrX6GV6ZjPAidj8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(39830400003)(376002)(136003)(396003)(346002)(366004)(4326008)(6666004)(6916009)(66946007)(9686003)(33716001)(86362001)(2906002)(6486002)(54906003)(786003)(6512007)(316002)(5660300002)(38100700002)(83380400001)(66476007)(66556008)(186003)(8936002)(52116002)(508600001)(8676002)(6506007)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nIzG2NK4YpydGnB0zuQiqxyZ79d5tD4d+EpRWw5IcJj1e7TbP7n10Oiu5Yrt?=
 =?us-ascii?Q?0jY8P7Yc07pmUpIplvFWt1G9bcwXLqPgz7frFWj7eYX19WJfyJ4Y0eKJotK6?=
 =?us-ascii?Q?e9aq+pagA7LmplQMyY87Hg98IaWNsyJCrZx4bIcR3oPTyJHfNOSPiM+jLq7R?=
 =?us-ascii?Q?gly0YJ1KKs1F0Wltxpuf2tt0+YRRXwGHgFlLsPeYMa33xUkbHP3DoY9dzDow?=
 =?us-ascii?Q?tukugdr++GAwPIfutRjS06DHDUMCwlzdzZ9XJ34+jXBhP6YNKmuXrJMHgYD/?=
 =?us-ascii?Q?Ez6af1y8Mt1J4+nhpik8RtaZF++qz0ZYKNvwG/yLdYgnukUxuAQfN5SDcCte?=
 =?us-ascii?Q?2c2pnnfkrEBtN49TiM8ynA6pm6aWvcGZworYOfY4rjQ+vGbTgxKW2qidxzAQ?=
 =?us-ascii?Q?AGCp+8B7MsvKfiOcKDo9oYs3qAjNyceeBpqhgPoNQKH4TBrbEVmcLz4+sR6K?=
 =?us-ascii?Q?oH73pk1HdqDvmjncE9XZegOPYb73UKN9zcGClHzU4c9fP5OTD+/i7qX2toJh?=
 =?us-ascii?Q?kLA7Txqvob209XRQglfP6wY6iw0dFxsCBi87rkuBz1jM1bzFlneAchZghCgq?=
 =?us-ascii?Q?OM+VVyDpeBpUwt4EUJ6ttYUGFUCVekgKNPCSspdHPUTwvcxC4XptzmNyt0kg?=
 =?us-ascii?Q?2vI/KnKzWYHETJRA/t7Fjk9HogfjJlz5zc22dLiB2MyeRVuoIUPz/UEtkwC1?=
 =?us-ascii?Q?c4qUatFJGybd2NMtICA4uZdG010OZdgZeDMLQa/KFLuVOYXg4IXM0zEDoulZ?=
 =?us-ascii?Q?mLKNcOhO+VYoHMxB/vsnFtzTcl+4FKbe1MQYAZiWU+eK/CQD2jQcOmZ1LDfj?=
 =?us-ascii?Q?920HSw9c43wid3TAhieRhfwmyOffY58r8rZS7mx4JBsZsoyC+/E1DAo3Geu9?=
 =?us-ascii?Q?K12afFZZfrlWha7epkrn8O5qsEZE89MOhAH02hfEovKBiubsHdHLvsNfIsaq?=
 =?us-ascii?Q?5PcYBGMr16mINhGGv8PWsgAhNrYoltr4pvuMKXFewzI+u2CojoJOUyeIoyTd?=
 =?us-ascii?Q?VgZIzSS0F+FVQBst/9OYEOD7O8J7A+KXXh7LsbYzrtaHHVV5lH/L3rBjhoY5?=
 =?us-ascii?Q?g3BHCvAEv1d1vP6AC1wteESPG569iWz3AqGMpmtLfHrmbwJMpgNVxcO8CfUx?=
 =?us-ascii?Q?1D36BxY9ai2D8uSHTZGYRHwjSkBFbEAVYZdOpSqZPYAlkfWvfL1Ga6iGai9j?=
 =?us-ascii?Q?OBPtgHoSCgGd0AX1cdBINwNaw1jgcwuGdNJxgec/AcOdpsJxWuUmNcVRJFCX?=
 =?us-ascii?Q?mN+F+RLW/TWxw//PnV6qaLQX3d44UpgJkKj9bb3fPoz55MTcsql7RsyxfxC0?=
 =?us-ascii?Q?xkpZFQAtMhB8VOlU/UkL+/6nRxSuXrz3KrXKBZqJ2h1o8y6UuzCBXS8zJMsE?=
 =?us-ascii?Q?hb0JLqIqLtpg3urYfkJb0ShW+reuRGXeCpdIvio2vvkZRox5zrE2QDuaLehe?=
 =?us-ascii?Q?DUiPUS30k3DBuS7CnbLBvv5CbWg0dG5maEXzm1ahJyrCuTXHhEJdWWqbRmfg?=
 =?us-ascii?Q?PLK4o33tFuGZLpp87e+vrrPBSGdxWtvHYAbH1pGwQVIaJXvy5P6Nl68vRfNf?=
 =?us-ascii?Q?siH9NMGZxW3gYyeKE3x3OEaDBq3uEIpVrVoJWyRY?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: e3403a29-a3bb-4bd0-c4da-08d9d1f358ee
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 15:35:35.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nzZ9m1L40vciym0IjFR0DsorAOrWeIrRCQ6scbOuEFxYr4cLBl44AuHYPYa9qaL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBP286MB0432
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:700c::708
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:700c::708;
 envelope-from=i@zenithal.me;
 helo=JPN01-OS0-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index 53065e96ec..89324cecbb 100644
--- a/meson.build
+++ b/meson.build
@@ -1186,6 +1186,12 @@ if have_system
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


