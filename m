Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1748DD8D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 19:19:45 +0100 (CET)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n84hM-0007hm-JV
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 13:19:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84Zk-0000z6-Lg
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:11:52 -0500
Received: from [2a01:111:f403:7010::702] (port=49479
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i@zenithal.me>) id 1n84Zc-0001t7-PO
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 13:11:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jnSYeH8o/s9TqbEl8NhnXVm9bIGlH7hFyIBMK+dJJ5xxXUipaYBqEqsEBz/51zlU3oucQfGBp71jSbEjsxKInjjLjiPw0EZunJo2N2txSJypbsqsc4VWPtsz6aBHJypicZkm2P4JEgZnghBLAFb2Xfeign8+Fp4O+14cUZcCVCW9ruixyVPI8Cr3RYWEp3yR8jrMhjTJBlHMRpGL8b2QTOBsecFG3J68J7HjxNFuqiGQ/ZtVjmaBLSfl4c1vFnb4+pkS359kXRkJ/hOt6OBeBkDfK/YuhI800VWFQibe25M8B3MRqDfaRXRt1o5hRvoDB9IbK9+LFqrk4YHrd9U4fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PBc5QjGjN0cyimI8SWc/GYiN9RNBNKFiQItH69aFsY=;
 b=YJU3w2IrSegpQ2a9k7hl5UIb9I64acqSW9E+jfWxAVNKlU4BYWvcxsnixwR5khsF/zry/iiwOXRu/bdvTkhdgv1Me0VDM5k0sp+x+zWCZhV4CLIK2zlYzPMVS9kaxNla1ZF42/5PdB7Wn+0NYvov1T4yOB0jXDPgamkM28Yt6P2jk3fICut83MAuq974cxevFB1JBfTRnv/CPhnDLo+zbmAkxh4ED76kvhFuBEWX7TGVrI4Gj8kjRse0rcRNc2FkO2MdlDv9wQUtAJ3FvEH2jKYMhbQU2lguKR4vqRy+HGnKAFMQMSlZSrs2KWsEmbfg4uvBD4saR2M3PGBHcvO7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PBc5QjGjN0cyimI8SWc/GYiN9RNBNKFiQItH69aFsY=;
 b=ZlffYc5BrvNMQam9YA++ttiFgPB8zamNhTmwgKVV/mAeRzHyG142YEkVfbLqKsY4SVzNJgSWwaTVHsCmNujQAMJihnC5IOUvrvnzkdpasNHAtvussP4rQSrajuVbP+sMnhew+1i664RkXJyFdhPTouvdvnF25a5JtD/BSR3anDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=zenithal.me;
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:c0::6) by
 OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:13b::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9; Thu, 13 Jan 2022 18:11:10 +0000
Received: from TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9]) by TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5cf9:8c86:9001:90d9%8]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 18:11:10 +0000
Date: Fri, 14 Jan 2022 02:11:08 +0800
From: "Hongren (Zenithal) Zheng" <i@zenithal.me>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] meson: Add CanoKey
Message-ID: <YeBrPMiRMoV93/Q8@Sun>
References: <YeBqg2AmIVYkrJcD@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YeBqg2AmIVYkrJcD@Sun>
X-Operating-System: Linux Sun 5.10.81 
X-Mailer: Mutt 2.1.5 (2021-12-30)
X-ClientProxiedBy: HK2PR04CA0060.apcprd04.prod.outlook.com
 (2603:1096:202:14::28) To TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:c0::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da3aa151-855a-452b-b023-08d9d6c0138e
X-MS-TrafficTypeDiagnostic: OSZP286MB1166:EE_
X-Microsoft-Antispam-PRVS: <OSZP286MB1166009E52CE52FDA9AFC0BEBC539@OSZP286MB1166.JPNP286.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:238;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TIT6VbiLsA5A/e4HwJ+6bJtWmmgmz/5mJbugtK/QwSs//G6Lpc6kqsTdcuKLqkhqICJZBFNZDTTTEJl27jZ1CUVS64Q07YQevSmyWoD3okQ78avxA+aaGTngNsLRGInVjD2qlakc66g7zVrldVkbU6xYyWXSRDSETmD0bm6QeWUrAMkgrMaA4XPk1sdxCKJBnuKpTTqde28Ef9wdH8gGc/tymiu1gaoESYmzeFzBjztfQNOpmDq2GsEiFpAVktxVs6/lb8INYx5ynSM4Gj33cqY4Qz/MHA6yCmpnOD/TgeISmgWd6gwFdSL9kHhiZ73SKvCLlq/Cz1vSWMOfwUWFWMUug101VJWHwB0gmDJQbcMjK/yjf9p6fNzcof1gOIuHa7RDszjKfN3lblbqF1mv/f68BJJkxOXAPFs6Ot6X9fXi9cx8jmCU5vf6EFHCaLodc+pWQM3/ILBHDmbIyMFPgNpL8vc+AcX/7+s3ttqN69chZShl1TtFvYRkrbjFdo5JH6aj8QUx3qgAS+6U36/2MIDGNB/dYl9OlUDJgJtzBSUFHFHaOwIXx2pGFn/dkteROZJRQ6OnFwEG+tr5iYS7GUOArORlQwUCjLs5G70mLKVEcy6UfWOanAjvB+TiLq63U5LN95AL16OyX2IUDrK2m0QtRfPaLIe/EW8rR3OMn+U4hlW7vyVJNgBJl0KZ+zUF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(346002)(39830400003)(366004)(136003)(376002)(6486002)(54906003)(8676002)(186003)(4326008)(52116002)(5660300002)(8936002)(6506007)(2906002)(38100700002)(66946007)(66556008)(66476007)(316002)(9686003)(6916009)(6512007)(86362001)(508600001)(33716001)(786003)(83380400001)(49092004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9FacLOo7Fnn9ZG2y+USx+T5vEaKd0JImVWlo6iacVZnFW5d02yUkv8kUtpVA?=
 =?us-ascii?Q?tVWfqiraIoSRwOFz0sGCfFLVEPGH1TiCxJkYaQA9VUTbkD2f8z2QOgj1Xp92?=
 =?us-ascii?Q?w6rbaPjirVwUZUqU1qzJMQoQVeq+QBQARLU5KTS5sct0qHTowW7nNiAMpMEu?=
 =?us-ascii?Q?B2bOd8ydnO5s0PS76HaMgQKFP6xUZH4cAO071SOD0L3nQgzQzfY1OejX1MJi?=
 =?us-ascii?Q?C4VZCcETUhx1FTbCtSpRdHSTTfeW4ZcevqBUZ/pNkEcflR13ithk0+qi8v0f?=
 =?us-ascii?Q?Sci6UCkaC8LVQL2nie3oqyJkPMvlAciUn0W8f+tcAUCFZqPbvgd/D3YWzyKP?=
 =?us-ascii?Q?fv0yuVYQjtEqjd+0lqFxWrn3UvkMTYATUXAHtVI5gzyVE5/aInpsjeXnR/rR?=
 =?us-ascii?Q?cMCfIMNb7tvgFmi+HUOvqB/aZ25BUvCuSIWVkKliNOfwXBSodBK9u3JetGT7?=
 =?us-ascii?Q?oERqOTa10rvTlLa/arPW2imxuhkb+wrTmXiSSerAXfBp0rWIPAtJYKGTSiMc?=
 =?us-ascii?Q?R6EtAWkzNJpV6ygxEquwlf5oNfVK7WKUucoPuqcN7pg/BNOg7a/i3hfauniZ?=
 =?us-ascii?Q?VW6AQ3qOxFNJ3+rW0PZb+M35Y5X2TeL/9Y9ZTbgUhEYz4Z/vuwz/aSVIFKSk?=
 =?us-ascii?Q?s5uDhjJvYc95ua13uilCD8iZg0KpEUAVCsHJ70a5dV0WXRna7KH1X2WmoXJy?=
 =?us-ascii?Q?jHp2C98BaZbXypqFlBSr4u0mfbey6uO0D+IZnwrxF7Cd0ln3rHfqoFYsP3ca?=
 =?us-ascii?Q?/xo3KuejRXS4cbbHPmpjaQG3grWLK452e9TCn2opdVKZcy5+l3tdk98DFvFg?=
 =?us-ascii?Q?AxNnKggfLGz8ZnTriIQ9DH9GbgVKx8NP5tWg0EpqofCGBp3C2C9KzjhLEy0o?=
 =?us-ascii?Q?8ZZGexXzubDGZZ+QlajyL8IleW93+swoNpS+NTV6ZEqCjI122hmfucgshCCY?=
 =?us-ascii?Q?yTAqwfrpnM/3tmdf9TEie6jzvf/t7o7B/23W7xIlly2s5voAvlF96lVVTLdW?=
 =?us-ascii?Q?4Yn9jlDOKqlKc8QnjlzSXG+l2PpTNnAJzI1l7s508MzeC8O1xohGRKCSPBxI?=
 =?us-ascii?Q?po1nx1RuGkc4yOxcjw014GMRYwOl/BXHgk+kHLgFZgXRByjAIsRcAUsThk5e?=
 =?us-ascii?Q?IrEuhC29OXXQ3CrTt+iAGP6bQk6BIk8a5js36ML/SJTUmFA5MI5BIaYSaASs?=
 =?us-ascii?Q?96ab2VkdppZZPrNK3R7OwLQpLijS5ODC++6Gshf+au0O3f/hsMwgQJPQ/WfA?=
 =?us-ascii?Q?mlepAq3faEzJEHUzUYjtg3K641Y+a0MbjP9Xzji7Rpxf+AsDFI2H88chij1T?=
 =?us-ascii?Q?/jluaEEhRCMV6TOKn6/1LAqLpDXUldiPDDossvA+hJzlaCO0KEzEzvaE+A1B?=
 =?us-ascii?Q?Sbf9pfWF/gIHiW1RF0wIyBB1jFEkyWaKlTkAj/+o0Sbs1N9Rg2/uHVrIW5ka?=
 =?us-ascii?Q?ptH0/k55DB2k7hGVKle6KqAW/uD4S8C8Y59JEGU57G3NwkQvpqKnvPQbvaD5?=
 =?us-ascii?Q?W5lUuQ8kAy8pDF7Ewg6n/ogFcRUQkSTWwkaeNIu+ZBcoHwZJay4rfgy+8us2?=
 =?us-ascii?Q?MwIRy9L5rf1sEgZWwtoQ1cnT8iVelMUKIGjRf82D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: da3aa151-855a-452b-b023-08d9d6c0138e
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB1393.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 18:11:10.1075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hs+4+U7eceNqlTYCNxZNL/Pr8iYa5G06QLKFKeVaPoSeaHmVEWPnc3iMnSt4lG5W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1166
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f403:7010::702
 (failed)
Received-SPF: pass client-ip=2a01:111:f403:7010::702;
 envelope-from=i@zenithal.me;
 helo=JPN01-TYC-obe.outbound.protection.outlook.com
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
2.34.1


