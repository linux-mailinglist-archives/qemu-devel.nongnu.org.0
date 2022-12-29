Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7D5658D12
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 14:26:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAsu2-0003Wm-HV; Thu, 29 Dec 2022 08:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ATMGND@OUTLOOK.COM>)
 id 1pAsu0-0003WE-Bu
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 08:24:56 -0500
Received: from mail-sy4aus01olkn20815.outbound.protection.outlook.com
 ([2a01:111:f403:7005::815]
 helo=AUS01-SY4-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ATMGND@OUTLOOK.COM>)
 id 1pAsty-0002oL-8E
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 08:24:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qtr5Fc1CeFgTcfKALWR2GyFQHWtvl/7w5Rq3xOzPnwsufV1DFVNJA/RtvULz/6H9mY3ODyaGRKKVnkTaU+6eXNi6q/PRiZ3mL/2HPDug5aAfMeDZg+EqmPSx292qg9zN2DT7AyRi6lT1HvODHIKwkz/YHZnuOQiAXKLtiUbOVFnLSepM/hrnr1Ua5eh8Ov3rPs899EGZXyyKfgJsx4X8kb+AG4V+Py6sYVsPrEpu4wKr74bSddoMf7abLdhIpFkiigqoThlPm5DUtUd/W4Ng8wcx+kYNrXQ3YwIRkFAxsiiK1O94Q7SCHc9vNB3gsBneesQ0gWoupTXrELFhqIoOhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoCRohe5/O2Tam+9l3tS53ntblHMCpUGiRjg7So8Vsw=;
 b=I8COouZv3FDHFWF+KUmmALHrSBJnAQzQbqymt+MZznIAzlfZPNUaQUka1pxgpZcJIlqrAgvPMqUKRl9Nrx0Vzrh8bitKL+cjpBQmy4oz+wY4QaQWHt0VTLY1DZDpnT80VwHrat0APoBkGffwmqrkNd2gKnv6VyZjggYzbTeW3PUBelsB6rHZYTEshZxpvGsHmgvyPYizK9mFBHl9qpheUU4vzM81OBT2tpnDQSawapBggY1pFdnYE6b+RaXzFIXrbY9wx8c0xF7QONAcPZikOvh3kMrdibQC68BW9kvuwD9w+gRDx/M4U8DVU3JV+igomzD0G+8G3V9joTFnw5eeJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoCRohe5/O2Tam+9l3tS53ntblHMCpUGiRjg7So8Vsw=;
 b=vSJKEJVxK6BGAN0TY64bNj5MOnHGKgKZzDWguaDQo54+jI00ZPQSdNa2PM2opdCRfhmV4c2u6aArPK2PuhXXuKAJBd7g9IxYVELbEfwAyeqBQT4MMYhE18CEOlOs+S3BU7k9CjLUlGindJ9zMp88O8pggnbnNyRkJnJ2dO9T6/XohCFFzt2vbz8/SgV9tQ4lHQ21lEox6BvcEa0uyb3FnXNbYLPbpi4HQcmhSWbhPfo88s42VMDAf/fYg4qz0ZeHPjE8qWNc9ieKZR3JcCMkuQ3E0ONRMHnZ9XUVOBBGMELKgSfDSfxQVq4CbcPsxIVxEN5/2sayZzGqvVAetXMJQw==
Received: from SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:169::6) by
 SY4P282MB2869.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:15c::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.17; Thu, 29 Dec 2022 13:19:43 +0000
Received: from SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
 ([fe80::3021:4e2f:269f:86a2]) by SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
 ([fe80::3021:4e2f:269f:86a2%6]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 13:19:43 +0000
From: qi zhou <atmgnd@outlook.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, qi zhou
 <ATMGND@OUTLOOK.COM>
Subject: [PATCH] fix gvtg cursor position if it is negative
Thread-Topic: [PATCH] fix gvtg cursor position if it is negative
Thread-Index: AQHZG4gkCslX+v8O2ku4IcEAac+4tg==
Date: Thu, 29 Dec 2022 13:19:43 +0000
Message-ID: <SYZP282MB32524DE09ADA28D4E4205D49C9F39@SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [7R5Ui3fxFaq7xhmBcCAmwtUWDTiBYK8U]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYZP282MB3252:EE_|SY4P282MB2869:EE_
x-ms-office365-filtering-correlation-id: 16e7f1dc-efdf-4835-e5d7-08dae99f598a
x-ms-exchange-slblob-mailprops: EgT5Wr3QDKz918u76bcdvRMWUZXhBQCAzk+KFi//9swbnAKLvLLIDJyklyNeMRFBqU6FJjpf+n7svQVxBALH+hrUeg5xU1DGgyTho9kFg3VWt9+KIn3FI+t8Hld6h7pdkl2/8MVnNdJLtQbiSXQgoWxU3DP6lU95w2ZBspRPvfRt7RFRFZHiynErJyLxJkooUCYOD3bv04amA/6EBMQAngWAySVyLfXw3L1wEkJHv+roJ2i6sys0xAQFuB9pSOSZEXKrL2KSqmSesd76sOnr4k5WzQDSc/RceGzOMC3/S2myiwQwD3QY0Pp160TP9r4tOyfvoGoLuJ/wmNmtvnvbtROjmZGemsgVW63o8D5uSI4gKzoxVIf3QFdyKzRAw3zePRMB8VvnD6is9J8Im2+MQJ3zRQkkg36s1LgPXkTptd6wc4TvZzr3+npe4qzIfryxJhfKXIUpR8TQS7b00z2dITUcIW1Bv84rZ6MxCxruc4WdnFwb6hafxUjOGLwseoAcFuqKOxFvs2T0skkGRkxFH85NbvK/r5V99d0uFBkzeyTPr7GJgHDMM+Pg7qLk45cjWE5JzblHJKhYw8vEW7IOcEsGx750y6wcmAzMhFBPDOUKRS2JZO6lT/UAnEv0Di6TIupcLWpsl/8rLru/ycotTcWR/A2LrTDrBz7NckXkrM4wZqWKns7vrGY3v/zTfG8qonuwdL4y+0pPsTCCTm84tBZXiwFW0HsHscJnroMFYLs=
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z4qeVU8cqIsKcNGxIuyV+jVKX09rv3qkpUS5UD0ICXYiIqc1GzvaUC0EWrI1OYczWo8Kp8ojaLmJa6pZvMEW6xmG4Y7+IWtcBxwioZ1CVcWc9mwbmOa6mBOtO14DvArF2zZQehxil/rqEqnt60//yB8kXVP6POaMb5z7B8hsfPhXfGB27+sIdcTkYcAjry/nyvZrc0tZm2Wh+f+FmbL1qHrt+qASbIN91l/HpoQE+Gy/ntIyrwWkp3a3L/4BHCtNBVSxWY1Kwf9Yvxlqnr44TeA+89yuEaLrkFdwIJbaA6lqm3FpA1B6CEhWFr1KKa7YOswQLvjLXJegBQ9kEPf3Wxj4+x7ZutclZCC03u0Os40/bgrFc0vzMw+KLObhGzPbp0f9M09sN+36jvSDkU4PnqaDEYvE+BkGJaiN1ssIbb6kUlsLPdIAycmWA+sNEjaa1D7hfHHUF6GJyFoCzdC0XepvYEXIqdKv236Z65xsmpPhY+qyF1wwRIC1CTftZj3fuRNPbBOBqpeSZ5pqcdT+zyGJ/pb+rNTqbK4916Iz+ymHxrB5azGiYNaNhi3e+rS1FtnfMIuuerFSI3Yn6eMnFbORBHhQFaLR3usOL7QR7s9F0KCaaKzYFPuAefUv96NvD0NemeqLTDfEVFK57venyw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MvyoDP8cvASoeJocoz8zZJXqF4To+MFx66gECntxcA8DJh+gdm+3g0URKF?=
 =?iso-8859-1?Q?I5b7wYypxXwHujK+yamXL0e/DhLkrGZ8o+NzxMFnUdjdLH8NxVURREFiwr?=
 =?iso-8859-1?Q?eJZc8PRC1doxgiqpfWKmQrIVGeQ/2Rbg/3UCUbbPsykgqCmCj+rw0rx461?=
 =?iso-8859-1?Q?YQQtxB4wTYp1EYIyHfmRU+Von8xY1eoHSdIkVY4S8+4wzIinfeFthk5j2Y?=
 =?iso-8859-1?Q?nix5hooglQMmqS+H1OiyLRkqYfCBYgZgc+LqxePSTWctoi842DhwYkjY2W?=
 =?iso-8859-1?Q?uVRC2GckSf3pnEVTEdATB4CAYcDN+HCKWNIks7WFYt8UkU3U+Bw3Qd50aW?=
 =?iso-8859-1?Q?l5sFxm5ZmlyX1OV41kovVzz40v3ux7ntbOhZ48aGv7IN8SG52wUEUkDSt8?=
 =?iso-8859-1?Q?NyBcZ5jRvVbzba5/D9iAzNhgbuK4qO6EU+B6XezkTzEFdezmBFgT+59Agv?=
 =?iso-8859-1?Q?n14XpIbYF8KF3Akisia78C0KM2SfqFPQLF7bVcRvS25TfK2X88Rtm6qRa1?=
 =?iso-8859-1?Q?yzlETNdsPl2Yjam9EeG4pg2JJaPHk1IgR5r1+wjXSeFyqSm9eklCbZ1b02?=
 =?iso-8859-1?Q?vmHYci5mTmFqV/js5xgwOPKJUCtbg7BfGqSz3eAAiyvD6oF/I7qt9iZaZQ?=
 =?iso-8859-1?Q?VmSeBV5lvX7gBWZ6wyoWP3HVkW4g+LdAD2ndWDFzosOqu6xNmoiCkLhPnM?=
 =?iso-8859-1?Q?7SNgz0a48Cz8q5Ubft3VFPPjU62dS7D8UjkHFpjcKBLsbmg+Q/MQ10Rvej?=
 =?iso-8859-1?Q?2Wx9+rNLZ0RcpO47ptOjqD+cqNvMR0znyKi5OhO+GdvdQvvmxEc8aeDTFP?=
 =?iso-8859-1?Q?L92nVrNkjwyq3Dkb4WYKwk5rx6hgTCiE2Bf2CrfrbfWmVHlHsar/Wi7q1t?=
 =?iso-8859-1?Q?bs8hF12XLux4EhuxXwt2+XwJ+tr6Jtnfj/U8p9jvqAEfX9q9wDAbILmzNW?=
 =?iso-8859-1?Q?3lU4FDS2mrpQQbXOzyx5sKutq9oPdizIuHmCppGgYDtSDeJmKOZxLnPNFs?=
 =?iso-8859-1?Q?DZJBgBlutz+9hCuEf9j7OyCjup1bcRgXTNaNBr/qrvrw2efHNvq2D7Ib8Z?=
 =?iso-8859-1?Q?LVUcrEvq3q+wGwM5hisbrpR/4wGzkkCCYr8+lOFgvR45gzQ3gVLS3FKKdn?=
 =?iso-8859-1?Q?2rqujJnQpDUOT8xVXsgf9dpw+OLUkJJueBSVL/dHputyCKUUaVy17TW26M?=
 =?iso-8859-1?Q?iI98gZLCU3pQjicEITkHh+LtEAV99hasvLh3b6ItZccH6iln2SP5+v1wGk?=
 =?iso-8859-1?Q?gkIcW2IOOzM2dXWKhni3bA4Fwxv0+/NAsdB4jCoHW0mAGnp4paaCi42gqu?=
 =?iso-8859-1?Q?2CeP?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e7f1dc-efdf-4835-e5d7-08dae99f598a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 13:19:43.7224 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4P282MB2869
Received-SPF: pass client-ip=2a01:111:f403:7005::815;
 envelope-from=ATMGND@OUTLOOK.COM;
 helo=AUS01-SY4-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From 4f14d6216d3f05f01ffe419ff0baeebe416a3e58 Mon Sep 17 00:00:00 2001=0A=
From: Qi Zhou <atmgnd@outlook.com>=0A=
Date: Thu, 29 Dec 2022 20:25:06 +0800=0A=
Subject: [PATCH] fix gvtg cursor position if it is negative=0A=
=0A=
It is valid if position of cursor is negative(not hotspot coordinates). for=
=0A=
example: precision section, resize, move, north east arrow...=0A=
=0A=
Signed-off-by: Qi Zhou <atmgnd@outlook.com>=0A=
---=0A=
 include/hw/vfio/vfio-common.h | 6 ++++--=0A=
 include/ui/console.h          | 4 ++--=0A=
 include/ui/gtk.h              | 2 +-=0A=
 linux-headers/linux/vfio.h    | 4 ++--=0A=
 ui/console.c                  | 2 +-=0A=
 ui/dbus-listener.c            | 2 +-=0A=
 ui/egl-headless.c             | 2 +-=0A=
 ui/gtk-egl.c                  | 2 +-=0A=
 ui/spice-display.c            | 2 +-=0A=
 9 files changed, 14 insertions(+), 12 deletions(-)=0A=
=0A=
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h=
=0A=
index e573f5a9f1..8048816176 100644=0A=
--- a/include/hw/vfio/vfio-common.h=0A=
+++ b/include/hw/vfio/vfio-common.h=0A=
@@ -166,8 +166,10 @@ typedef struct VFIOGroup {=0A=
 =0A=
 typedef struct VFIODMABuf {=0A=
     QemuDmaBuf buf;=0A=
-    uint32_t pos_x, pos_y, pos_updates;=0A=
-    uint32_t hot_x, hot_y, hot_updates;=0A=
+    int32_t pos_x, pos_y;=0A=
+    uint32_t pos_updates;=0A=
+    uint32_t hot_x, hot_y;=0A=
+    uint32_t hot_updates;=0A=
     int dmabuf_id;=0A=
     QTAILQ_ENTRY(VFIODMABuf) next;=0A=
 } VFIODMABuf;=0A=
diff --git a/include/ui/console.h b/include/ui/console.h=0A=
index e400ee9fa7..589d0fd621 100644=0A=
--- a/include/ui/console.h=0A=
+++ b/include/ui/console.h=0A=
@@ -264,7 +264,7 @@ typedef struct DisplayChangeListenerOps {=0A=
                                  uint32_t hot_x, uint32_t hot_y);=0A=
     /* optional */=0A=
     void (*dpy_gl_cursor_position)(DisplayChangeListener *dcl,=0A=
-                                   uint32_t pos_x, uint32_t pos_y);=0A=
+                                   int32_t pos_x, int32_t pos_y);=0A=
     /* optional */=0A=
     void (*dpy_gl_release_dmabuf)(DisplayChangeListener *dcl,=0A=
                                   QemuDmaBuf *dmabuf);=0A=
@@ -362,7 +362,7 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,=0A=
 void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,=0A=
                           bool have_hot, uint32_t hot_x, uint32_t hot_y);=
=0A=
 void dpy_gl_cursor_position(QemuConsole *con,=0A=
-                            uint32_t pos_x, uint32_t pos_y);=0A=
+                            int32_t pos_x, int32_t pos_y);=0A=
 void dpy_gl_release_dmabuf(QemuConsole *con,=0A=
                            QemuDmaBuf *dmabuf);=0A=
 void dpy_gl_update(QemuConsole *con,=0A=
diff --git a/include/ui/gtk.h b/include/ui/gtk.h=0A=
index ae0f53740d..bb28360185 100644=0A=
--- a/include/ui/gtk.h=0A=
+++ b/include/ui/gtk.h=0A=
@@ -182,7 +182,7 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,=
=0A=
                           QemuDmaBuf *dmabuf, bool have_hot,=0A=
                           uint32_t hot_x, uint32_t hot_y);=0A=
 void gd_egl_cursor_position(DisplayChangeListener *dcl,=0A=
-                            uint32_t pos_x, uint32_t pos_y);=0A=
+                            int32_t pos_x, int32_t pos_y);=0A=
 void gd_egl_flush(DisplayChangeListener *dcl,=0A=
                   uint32_t x, uint32_t y, uint32_t w, uint32_t h);=0A=
 void gd_egl_scanout_flush(DisplayChangeListener *dcl,=0A=
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h=0A=
index ede44b5572..646db069b8 100644=0A=
--- a/linux-headers/linux/vfio.h=0A=
+++ b/linux-headers/linux/vfio.h=0A=
@@ -720,8 +720,8 @@ struct vfio_device_gfx_plane_info {=0A=
 	__u32 height;	/* height of plane */=0A=
 	__u32 stride;	/* stride of plane */=0A=
 	__u32 size;	/* size of plane in bytes, align on page*/=0A=
-	__u32 x_pos;	/* horizontal position of cursor plane */=0A=
-	__u32 y_pos;	/* vertical position of cursor plane*/=0A=
+	__s32 x_pos;	/* horizontal position of cursor plane */=0A=
+	__s32 y_pos;	/* vertical position of cursor plane*/=0A=
 	__u32 x_hot;    /* horizontal position of cursor hotspot */=0A=
 	__u32 y_hot;    /* vertical position of cursor hotspot */=0A=
 	union {=0A=
diff --git a/ui/console.c b/ui/console.c=0A=
index 9ff9217f9b..8dffacf07d 100644=0A=
--- a/ui/console.c=0A=
+++ b/ui/console.c=0A=
@@ -2049,7 +2049,7 @@ void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBu=
f *dmabuf,=0A=
 }=0A=
 =0A=
 void dpy_gl_cursor_position(QemuConsole *con,=0A=
-                            uint32_t pos_x, uint32_t pos_y)=0A=
+                            int32_t pos_x, int32_t pos_y)=0A=
 {=0A=
     DisplayState *s =3D con->ds;=0A=
     DisplayChangeListener *dcl;=0A=
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c=0A=
index f9fc8eda51..43c00b7a75 100644=0A=
--- a/ui/dbus-listener.c=0A=
+++ b/ui/dbus-listener.c=0A=
@@ -188,7 +188,7 @@ static void dbus_cursor_dmabuf(DisplayChangeListener *d=
cl,=0A=
 }=0A=
 =0A=
 static void dbus_cursor_position(DisplayChangeListener *dcl,=0A=
-                                 uint32_t pos_x, uint32_t pos_y)=0A=
+                                 int32_t pos_x, int32_t pos_y)=0A=
 {=0A=
     DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener, dc=
l);=0A=
 =0A=
diff --git a/ui/egl-headless.c b/ui/egl-headless.c=0A=
index 7a30fd9777..7a03b08d46 100644=0A=
--- a/ui/egl-headless.c=0A=
+++ b/ui/egl-headless.c=0A=
@@ -110,7 +110,7 @@ static void egl_cursor_dmabuf(DisplayChangeListener *dc=
l,=0A=
 }=0A=
 =0A=
 static void egl_cursor_position(DisplayChangeListener *dcl,=0A=
-                                uint32_t pos_x, uint32_t pos_y)=0A=
+                                int32_t pos_x, int32_t pos_y)=0A=
 {=0A=
     egl_dpy *edpy =3D container_of(dcl, egl_dpy, dcl);=0A=
 =0A=
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c=0A=
index e84431790c..a454402212 100644=0A=
--- a/ui/gtk-egl.c=0A=
+++ b/ui/gtk-egl.c=0A=
@@ -286,7 +286,7 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,=
=0A=
 }=0A=
 =0A=
 void gd_egl_cursor_position(DisplayChangeListener *dcl,=0A=
-                            uint32_t pos_x, uint32_t pos_y)=0A=
+                            int32_t pos_x, int32_t pos_y)=0A=
 {=0A=
     VirtualConsole *vc =3D container_of(dcl, VirtualConsole, gfx.dcl);=0A=
 =0A=
diff --git a/ui/spice-display.c b/ui/spice-display.c=0A=
index 494168e7fe..347c3917bf 100644=0A=
--- a/ui/spice-display.c=0A=
+++ b/ui/spice-display.c=0A=
@@ -1002,7 +1002,7 @@ static void qemu_spice_gl_cursor_dmabuf(DisplayChange=
Listener *dcl,=0A=
 }=0A=
 =0A=
 static void qemu_spice_gl_cursor_position(DisplayChangeListener *dcl,=0A=
-                                          uint32_t pos_x, uint32_t pos_y)=
=0A=
+                                          int32_t pos_x, int32_t pos_y)=0A=
 {=0A=
     SimpleSpiceDisplay *ssd =3D container_of(dcl, SimpleSpiceDisplay, dcl)=
;=0A=
 =0A=
-- =0A=
2.25.1=0A=

