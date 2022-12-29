Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C4658D78
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 14:37:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAt4l-0006wB-2G; Thu, 29 Dec 2022 08:36:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atmgnd@outlook.com>)
 id 1pAt4O-0006vX-L7
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 08:35:43 -0500
Received: from mail-me3aus01olkn20813.outbound.protection.outlook.com
 ([2a01:111:f403:7004::813]
 helo=AUS01-ME3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atmgnd@outlook.com>)
 id 1pAt4L-0007cq-Bo
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 08:35:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cin392Z4TsMxyuOMp7r5V+xavUWYe+G8HulgpmQpYI21DNXM9fK72CUdGHHUOZFNgfcNbeRgTWxLyr9FMVLHVineQQmTgBZmBTXf5N/W8xiZrSOvhvKDREJBeO70bgU/A0Bja05/f0JtoEZXEvGf420V947DBOx+3IkPTX1B7PVhuyid5qigQNtvym5PigN0KHatRotWzXY3u39CtuOcs/734d571o6NhuBIpGm6yQxAi52AB54t24YmVj9EzwQ2+wScpeAsNc87hWdCKi/9qCac3oPy3x2araH5AotTT9VpFy/fZzLye1wjZTo75bIGcY7qUQlHsX+TAh6H59Bv9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDgC7P0xA/voXLGuq0PP4a1utB6f58JPeJMijr+9AjU=;
 b=ZWVlm+9ojF9++CuBiv6/R4Ny7jgoUcJkZqlwvGKdSJRaUPTPtd7pF3XkG+126hYn6tyULZzqrAVCYyf9PdPQ1JJnLYpK80SdlWxfJB5w/LhHF3qPvJ8eyXIHxqTnj2bLDLJSvJBWehUCgi4wr1YgurRkEXzf+v7nzsEcX44/d+CYGehs239pZN8z4KT4alL+CUNWkU7NCBQK8y4IqtGZzo90eSoldT/zAD75JR740bly1CSguTAdTC/OaH6gk6NpHLvVCQF8H4JVuwvExwonbBsBzCxH86oW1rlt25hud5AEjzzGiTvG6iP/yrjH00FHxgWGFuLDY8e++vqWOk3c8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDgC7P0xA/voXLGuq0PP4a1utB6f58JPeJMijr+9AjU=;
 b=Tnx/3tHEZBL2WJaD/3anzP8h8DeTOC1bNR18k39TNpdg2Hnf0G8ELQVXN7QtDh4K7o7lPk96mdQ472Zun/w6EnAdP4lTOflFeJqXFKYVujD3SiMg4O7gsy8Py47hNfk4CreX/93laIJQ67YF5tq3e4q8fg9nbDBgtINchA6wmey5KbG0l2YfpW3Kon8oADaWCpYUk+v1vBzrKgboenUwt54ldhPSDIGiqtszs7CT0/IB5Ewd+S9LaKai5aR7c7WRfzMUC31iJRzW3QC0/r4R08rWmEmU46pGmXLRuHObwWh1rQELIrVdofpu542O1u/bxW0AJDYevSpBy2UN2n7qmw==
Received: from SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:169::6) by
 ME3P282MB2626.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:115::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.16; Thu, 29 Dec 2022 13:30:28 +0000
Received: from SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
 ([fe80::3021:4e2f:269f:86a2]) by SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
 ([fe80::3021:4e2f:269f:86a2%6]) with mapi id 15.20.5944.016; Thu, 29 Dec 2022
 13:30:28 +0000
From: qi zhou <atmgnd@outlook.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] fix gvtg cursor position if it is negative
Thread-Topic: [PATCH] fix gvtg cursor position if it is negative
Thread-Index: AQHZG4gkCslX+v8O2ku4IcEAac+4tq6E25ok
Date: Thu, 29 Dec 2022 13:30:27 +0000
Message-ID: <SYZP282MB3252F4152508E4E320989A38C9F39@SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM>
References: <SYZP282MB32524DE09ADA28D4E4205D49C9F39@SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <SYZP282MB32524DE09ADA28D4E4205D49C9F39@SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [9kO5RQbMxNC/SlOykITZTRKmWc1MZK+p]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SYZP282MB3252:EE_|ME3P282MB2626:EE_
x-ms-office365-filtering-correlation-id: 7174bd20-f49d-4c90-d319-08dae9a0d98d
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U0wTrM9bMZ10s+JVAptCC54cB6+isg8uAXoVKBB+qfmU7fiU7U5pOoNV4kiL7EGBUhATXhL6aRMQXFBnyyu4IV1eN74I29yPdb0MMlx/YRWcwCAZHYWi90IW55lCOVsKJS5pKjz9zhNsI0Jzt4yDy8JIy+cBL4lIl21JJBHhQbqznggD0qSxJALdUW/tQJr9xcRuAMLJH3nDTlK5PRnIZMPvg49uzrRAO+2mzugGleF1AAqtgXz9/Lj8dZ/n6uxBFKmf+GbP2tfPGdARNd69lFgcu/iSVsZJBL1d46m/Vub6NydFtLuqE9VrHUHGnOLzhYpX3YQCutuEcWdszlR9wdUMDmF11q8tu4aLBobvzLOXrGDWjnAgZyp8b6muVMxBjuRQrMY3TEFim1SeXGkYUNZ8HF/c2MXfVs8lEIzyQDbCgaQyyU3muEapZrIP2d7HF84jnLndAbxB+6iZoo5XzT6hKewVSk/2n+P1IX4kXdp2znbpTEXPZqaZBKKnGvigK/n4g8aMeUM7/bKf7w6ttQdIz8+E8bTecog0SHYiZwScbFahKom9d5zdmQjCAEkAm5CCj9MBLM/gAZvcBE3JLL2Vxo04GvfdL8bVJO4wVvr+WmEfnBhWF23zjYmMaVme
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ppOuzkF9peH4u0z9dTLcLYretK5YSGbX3G9kc6ALjLfSZURb7ufzBa5Q5m?=
 =?iso-8859-1?Q?NXlZqutnTnYs+21gNt1aYCkcZNE3FHhTFWl54zDGFR16ldvRN6oIYjNCd6?=
 =?iso-8859-1?Q?4u1BUFvlw9Phto5Df+MGtZOcIS0vBn7FRIYwZgNXMbmqPpr0Z5zcd65+eB?=
 =?iso-8859-1?Q?Km2drVKS0pPBpE3+uSTHlTCBaT7qmz/6BIoebuS31glCtfVK2lFaK8ZAjc?=
 =?iso-8859-1?Q?mmXA9kCJvGA3uCZKBhcLQi+/yejpf2l5wirKV7eqWbJfsqcStXlwB0+ayz?=
 =?iso-8859-1?Q?KBuVEfKKnWeoRwoVzoWL8JEv4HgFV+3KnLfui1/kbY6fZYmliajKoJlS+y?=
 =?iso-8859-1?Q?S5vCQYOkXhO0owI097wjL/nKvagUqO0N3oDDPSoVziqF/mV3qC8KV/e1B4?=
 =?iso-8859-1?Q?q3UzqWCUIk13+cx6X1c8zrRtGliDrBklI+Wmx7h84Bpc7YDcBTvv16A8Fb?=
 =?iso-8859-1?Q?YdIcciJzQIzO29tbv69MG/swZhMtnv3WzR2EDV2AQnpgkxwGMDPWqb8wrw?=
 =?iso-8859-1?Q?IsmBe8KStIUrrumnqvWBjLAD1YcHt12I12HCd1wOMuJVoLslz3Vv5hjq+f?=
 =?iso-8859-1?Q?SqKhyOUsL9Laznutnxaj3vLbiM0OTiaASZZhGQhsk2iiDtgiB2/RGOd3kh?=
 =?iso-8859-1?Q?nMiQvwlkCNoc2ZMDRD1dMbL19l5RA9RwWIdKvMlvfPfaDpXLU5lHUyKbfa?=
 =?iso-8859-1?Q?BLumwvgUvt/e4Aa4ts1zE1kX4Rt1PFfZBU5bCFwI7y5RRP30/3bGaq2spd?=
 =?iso-8859-1?Q?LdlCMDjKR0sNUTYLV3IqeMGjo7c3zDPEOzWHj4iDUfoTrrlMZ5hHsLuSIW?=
 =?iso-8859-1?Q?RvS7jtCchIzOha4a6ZqL4TFu+6TLL6VKBboA/HR4ZkA4EOOokB0yjMowq+?=
 =?iso-8859-1?Q?3bXN3yEeLnMnffvW6spYACpzmS800Ecau4ojt5OD5Jl88YPUfceK3jPe7g?=
 =?iso-8859-1?Q?2tGi0YteDVGLALPY77JHVI7Px1WbnRT39NlT26ayWtRdhJHRrhGrj1agl0?=
 =?iso-8859-1?Q?STLsCWMtxlG2nW4XJL6hX/P/uBmH9+4BfL0D2b2Jm3kkNAeyJln0MorXo5?=
 =?iso-8859-1?Q?AjqMgvVgQzqjjnH8H8+sOTJYNNRF4Ghet49R1t8ihpHnpqFi8rYTswpAih?=
 =?iso-8859-1?Q?v53zIXGSdpFEU4ajVcpjZbQ82ImH61fSExN3OphU+kChuT9oBPoDu0J4Ti?=
 =?iso-8859-1?Q?hanu2A2afti1PrjCj7tOmJ2cDkagQ+RheT+1VD/nDmFbuxsKV1DHRh2B/l?=
 =?iso-8859-1?Q?emkod9wbR6q5Z4WRszqCeyIX7/eIFzSRnT0wqU+7CS9+IdVrlu2MpvcDGz?=
 =?iso-8859-1?Q?IFJ/?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SYZP282MB3252.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7174bd20-f49d-4c90-d319-08dae9a0d98d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2022 13:30:27.9867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB2626
Received-SPF: pass client-ip=2a01:111:f403:7004::813;
 envelope-from=atmgnd@outlook.com;
 helo=AUS01-ME3-obe.outbound.protection.outlook.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_SBL_A=0.1 autolearn=no autolearn_force=no
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

To test, you need patch linux kernel too, I paste it here for convenience, =
and it have been sent to kernel devel mailling list=0A=
=0A=
also I have record two video for this patch, see https://1drv.ms/u/s!As-Ec5=
SPH0fuiy6ejq7TXOl8QenV?e=3DLzh97y=0A=
=0A=
From 8d2a0c2c265119cb481deab825ea59c9605f3bd8 Mon Sep 17 00:00:00 2001=0A=
From: Qi Zhou <atmgnd@outlook.com>=0A=
Date: Thu, 29 Dec 2022 20:15:51 +0800=0A=
Subject: [PATCH] fix gvtg cursor position if it is negative=0A=
=0A=
It is valid if position of cursor is negative(not hotspot coordinates). for=
=0A=
example: precision section, resize, move, north east arrow...=0A=
=0A=
Signed-off-by: Qi Zhou <atmgnd@outlook.com>=0A=
---=0A=
 drivers/gpu/drm/i915/gvt/dmabuf.c | 5 ++---=0A=
 drivers/gpu/drm/i915/gvt/dmabuf.h | 4 ++--=0A=
 include/uapi/linux/vfio.h         | 4 ++--=0A=
 3 files changed, 6 insertions(+), 7 deletions(-)=0A=
=0A=
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/d=
mabuf.c=0A=
index 355f1c0e8664..b91122b33222 100644=0A=
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c=0A=
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c=0A=
@@ -299,9 +299,8 @@ static int vgpu_get_plane_info(struct drm_device *dev,=
=0A=
 		info->stride =3D c.width * (c.bpp / 8);=0A=
 		info->drm_format =3D c.drm_format;=0A=
 		info->drm_format_mod =3D 0;=0A=
-		info->x_pos =3D c.x_pos;=0A=
-		info->y_pos =3D c.y_pos;=0A=
-=0A=
+		info->x_pos =3D c.x_sign ? -c.x_pos : c.x_pos;=0A=
+		info->y_pos =3D c.y_sign ? -c.y_pos : c.y_pos;=0A=
 		if (validate_hotspot(&c)) {=0A=
 			info->x_hot =3D c.x_hot;=0A=
 			info->y_hot =3D c.y_hot;=0A=
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.h b/drivers/gpu/drm/i915/gvt/d=
mabuf.h=0A=
index 3dcdb6570eda..4103106d7cc2 100644=0A=
--- a/drivers/gpu/drm/i915/gvt/dmabuf.h=0A=
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.h=0A=
@@ -41,8 +41,8 @@ struct intel_vgpu_fb_info {=0A=
 	__u32 height;	/* height of plane */=0A=
 	__u32 stride;	/* stride of plane */=0A=
 	__u32 size;	/* size of plane in bytes, align on page */=0A=
-	__u32 x_pos;	/* horizontal position of cursor plane */=0A=
-	__u32 y_pos;	/* vertical position of cursor plane */=0A=
+	__s32 x_pos;	/* horizontal position of cursor plane */=0A=
+	__s32 y_pos;	/* vertical position of cursor plane */=0A=
 	__u32 x_hot;    /* horizontal position of cursor hotspot */=0A=
 	__u32 y_hot;    /* vertical position of cursor hotspot */=0A=
 	struct intel_vgpu_dmabuf_obj *obj;=0A=
diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h=0A=
index 23105eb036fa..a9b93251ac7f 100644=0A=
--- a/include/uapi/linux/vfio.h=0A=
+++ b/include/uapi/linux/vfio.h=0A=
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
-- =0A=
2.25.1=0A=
=0A=
=0A=
From: qi zhou <atmgnd@outlook.com>=0A=
Sent: Thursday, December 29, 2022 21:19=0A=
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; zhou qi <ATMGND@OUTLOOK.=
COM>=0A=
Subject: [PATCH] fix gvtg cursor position if it is negative =0A=
=A0=0A=
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
=A0include/hw/vfio/vfio-common.h | 6 ++++--=0A=
=A0include/ui/console.h=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 4 ++--=0A=
=A0include/ui/gtk.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-=0A=
=A0linux-headers/linux/vfio.h=A0=A0=A0 | 4 ++--=0A=
=A0ui/console.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-=
=0A=
=A0ui/dbus-listener.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-=0A=
=A0ui/egl-headless.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-=0A=
=A0ui/gtk-egl.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-=
=0A=
=A0ui/spice-display.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 2 +-=0A=
=A09 files changed, 14 insertions(+), 12 deletions(-)=0A=
=0A=
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h=
=0A=
index e573f5a9f1..8048816176 100644=0A=
--- a/include/hw/vfio/vfio-common.h=0A=
+++ b/include/hw/vfio/vfio-common.h=0A=
@@ -166,8 +166,10 @@ typedef struct VFIOGroup {=0A=
=A0=0A=
=A0typedef struct VFIODMABuf {=0A=
=A0=A0=A0=A0 QemuDmaBuf buf;=0A=
-=A0=A0=A0 uint32_t pos_x, pos_y, pos_updates;=0A=
-=A0=A0=A0 uint32_t hot_x, hot_y, hot_updates;=0A=
+=A0=A0=A0 int32_t pos_x, pos_y;=0A=
+=A0=A0=A0 uint32_t pos_updates;=0A=
+=A0=A0=A0 uint32_t hot_x, hot_y;=0A=
+=A0=A0=A0 uint32_t hot_updates;=0A=
=A0=A0=A0=A0 int dmabuf_id;=0A=
=A0=A0=A0=A0 QTAILQ_ENTRY(VFIODMABuf) next;=0A=
=A0} VFIODMABuf;=0A=
diff --git a/include/ui/console.h b/include/ui/console.h=0A=
index e400ee9fa7..589d0fd621 100644=0A=
--- a/include/ui/console.h=0A=
+++ b/include/ui/console.h=0A=
@@ -264,7 +264,7 @@ typedef struct DisplayChangeListenerOps {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 uint32_t hot_x, uint32_t hot_y);=0A=
=A0=A0=A0=A0 /* optional */=0A=
=A0=A0=A0=A0 void (*dpy_gl_cursor_position)(DisplayChangeListener *dcl,=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint32_t pos_x, uint32_t pos_y);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int32_t pos_x, int32_t pos_y);=0A=
=A0=A0=A0=A0 /* optional */=0A=
=A0=A0=A0=A0 void (*dpy_gl_release_dmabuf)(DisplayChangeListener *dcl,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 QemuDmaBuf *dmabuf);=0A=
@@ -362,7 +362,7 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,=0A=
=A0void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 bool have_hot, uint32_t hot_x, uint32_t hot_y);=0A=
=A0void dpy_gl_cursor_position(QemuConsole *con,=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 uint32_t pos_x, uint32_t pos_y);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 int32_t pos_x, int32_t pos_y);=0A=
=A0void dpy_gl_release_dmabuf(QemuConsole *con,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 QemuDmaBuf *dmabuf);=0A=
=A0void dpy_gl_update(QemuConsole *con,=0A=
diff --git a/include/ui/gtk.h b/include/ui/gtk.h=0A=
index ae0f53740d..bb28360185 100644=0A=
--- a/include/ui/gtk.h=0A=
+++ b/include/ui/gtk.h=0A=
@@ -182,7 +182,7 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 QemuDmaBuf *dmabuf, bool have_hot,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 uint32_t hot_x, uint32_t hot_y);=0A=
=A0void gd_egl_cursor_position(DisplayChangeListener *dcl,=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 uint32_t pos_x, uint32_t pos_y);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 int32_t pos_x, int32_t pos_y);=0A=
=A0void gd_egl_flush(DisplayChangeListener *dcl,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint32_t x, uint32_t=
 y, uint32_t w, uint32_t h);=0A=
=A0void gd_egl_scanout_flush(DisplayChangeListener *dcl,=0A=
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h=0A=
index ede44b5572..646db069b8 100644=0A=
--- a/linux-headers/linux/vfio.h=0A=
+++ b/linux-headers/linux/vfio.h=0A=
@@ -720,8 +720,8 @@ struct vfio_device_gfx_plane_info {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 height;=A0=A0 /* height of plane */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 stride;=A0=A0 /* stride of plane */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 size;=A0=A0=A0=A0 /* size of plane in bytes,=
 align on page*/=0A=
-=A0=A0=A0=A0=A0=A0 __u32 x_pos;=A0=A0=A0 /* horizontal position of cursor =
plane */=0A=
-=A0=A0=A0=A0=A0=A0 __u32 y_pos;=A0=A0=A0 /* vertical position of cursor pl=
ane*/=0A=
+=A0=A0=A0=A0=A0=A0 __s32 x_pos;=A0=A0=A0 /* horizontal position of cursor =
plane */=0A=
+=A0=A0=A0=A0=A0=A0 __s32 y_pos;=A0=A0=A0 /* vertical position of cursor pl=
ane*/=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 x_hot;=A0=A0=A0 /* horizontal position of cu=
rsor hotspot */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 __u32 y_hot;=A0=A0=A0 /* vertical position of curs=
or hotspot */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 union {=0A=
diff --git a/ui/console.c b/ui/console.c=0A=
index 9ff9217f9b..8dffacf07d 100644=0A=
--- a/ui/console.c=0A=
+++ b/ui/console.c=0A=
@@ -2049,7 +2049,7 @@ void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBu=
f *dmabuf,=0A=
=A0}=0A=
=A0=0A=
=A0void dpy_gl_cursor_position(QemuConsole *con,=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 uint32_t pos_x, uint32_t pos_y)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 int32_t pos_x, int32_t pos_y)=0A=
=A0{=0A=
=A0=A0=A0=A0 DisplayState *s =3D con->ds;=0A=
=A0=A0=A0=A0 DisplayChangeListener *dcl;=0A=
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c=0A=
index f9fc8eda51..43c00b7a75 100644=0A=
--- a/ui/dbus-listener.c=0A=
+++ b/ui/dbus-listener.c=0A=
@@ -188,7 +188,7 @@ static void dbus_cursor_dmabuf(DisplayChangeListener *d=
cl,=0A=
=A0}=0A=
=A0=0A=
=A0static void dbus_cursor_position(DisplayChangeListener *dcl,=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 uint32_t pos_x, uint32_t pos_y)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 int32_t pos_x, int32_t pos_y)=0A=
=A0{=0A=
=A0=A0=A0=A0 DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayList=
ener, dcl);=0A=
=A0=0A=
diff --git a/ui/egl-headless.c b/ui/egl-headless.c=0A=
index 7a30fd9777..7a03b08d46 100644=0A=
--- a/ui/egl-headless.c=0A=
+++ b/ui/egl-headless.c=0A=
@@ -110,7 +110,7 @@ static void egl_cursor_dmabuf(DisplayChangeListener *dc=
l,=0A=
=A0}=0A=
=A0=0A=
=A0static void egl_cursor_position(DisplayChangeListener *dcl,=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 uint32_t pos_x, uint32_t pos_y)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 int32_t pos_x, int32_t pos_y)=0A=
=A0{=0A=
=A0=A0=A0=A0 egl_dpy *edpy =3D container_of(dcl, egl_dpy, dcl);=0A=
=A0=0A=
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c=0A=
index e84431790c..a454402212 100644=0A=
--- a/ui/gtk-egl.c=0A=
+++ b/ui/gtk-egl.c=0A=
@@ -286,7 +286,7 @@ void gd_egl_cursor_dmabuf(DisplayChangeListener *dcl,=
=0A=
=A0}=0A=
=A0=0A=
=A0void gd_egl_cursor_position(DisplayChangeListener *dcl,=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 uint32_t pos_x, uint32_t pos_y)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 int32_t pos_x, int32_t pos_y)=0A=
=A0{=0A=
=A0=A0=A0=A0 VirtualConsole *vc =3D container_of(dcl, VirtualConsole, gfx.d=
cl);=0A=
=A0=0A=
diff --git a/ui/spice-display.c b/ui/spice-display.c=0A=
index 494168e7fe..347c3917bf 100644=0A=
--- a/ui/spice-display.c=0A=
+++ b/ui/spice-display.c=0A=
@@ -1002,7 +1002,7 @@ static void qemu_spice_gl_cursor_dmabuf(DisplayChange=
Listener *dcl,=0A=
=A0}=0A=
=A0=0A=
=A0static void qemu_spice_gl_cursor_position(DisplayChangeListener *dcl,=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 uint32_t pos_x, uint32_=
t pos_y)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 int32_t pos_x, int32_t =
pos_y)=0A=
=A0{=0A=
=A0=A0=A0=A0 SimpleSpiceDisplay *ssd =3D container_of(dcl, SimpleSpiceDispl=
ay, dcl);=0A=
=A0=0A=
-- =0A=
2.25.1=

