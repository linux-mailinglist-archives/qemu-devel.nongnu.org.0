Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80D66C24D8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 23:41:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peOAm-0002bL-1j; Mon, 20 Mar 2023 18:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1peOAh-0002ZV-Q4
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:40:08 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1peOAe-0004k2-0A
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 18:40:05 -0400
Received: by mail-ed1-x535.google.com with SMTP id cy23so52745108edb.12
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 15:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679352002;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oiivi6IizqEticXuXItUNXd9S9EexS5poDrPDbW6+Mg=;
 b=gdWzG49QRdSUZpKV3LA9fgYR6GUwebBHlWvFFW/CBFzNEowXa1m5aWxg57Fkz40jfy
 g07cx7bNfpLBSikyYIobrmdXrgqDrPEOMgCYMXMR70ttBF0yS3hVftNKzIZe7wFn67hy
 ZE1+ziPVzbe2lez7rgghvvFHAajWhErDIO8JqNNd520jgtw+zgfxuXbdimMZnxfDRoaa
 r13MB8JHdfNqkHmNIXdzzUarxlrmKzX73Bap1UYLCtnNyrLr4KCSkgirjKYYinx/Ksqv
 8xEkJ3iByXh3ocRqHI4oJbY3gURnlpu/pehX5hSes+6VGTp5HmHFQRBMcTfV7v4zvkrr
 NayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679352002;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oiivi6IizqEticXuXItUNXd9S9EexS5poDrPDbW6+Mg=;
 b=w+0HPz043fn0lVDYhycXDfSM3MI4RLcZqA6B8AJb5eV1ad+M+zqj+szeWqLIsBvFTQ
 JgJBuFcTZKBHD2nij0tv4qQRC5bUs6lddTpUMjc62YFZDddBW4fgMZ62+/qjvjRO2s9K
 H4xGbyIUNkKXh3349dKcjob+UQaNjwjL//P228nu/QvrzWpwC1+YwsnWFWcIY5RgAD6S
 OgC4l12vPmrMJuQ/q2f6UkimRVLJ4QlGn841AWwq0GLH4IzQw51mhuiXtoVxD5apiVNV
 t40f8fS4LG1xzwu0ZNhtD/l92l0UgcaTKHAGW50JGFgznPvvNlHFm4CXtWJ7z99tfgdH
 XKNA==
X-Gm-Message-State: AO0yUKXyIrL0HNPJci893a7B2zLkbnYH/YjO7ftgsDmLmT83+mGsBhhT
 AIcjIeTEuF/ZIY2zBouLow4=
X-Google-Smtp-Source: AK7set8Ke6WWG7QB2Lp3/OzI1ej7IP3PyQKo+cBgx1KpHKQL/uEy37z5rWrd+4oQX0nYVclzdqfRqA==
X-Received: by 2002:a17:907:7649:b0:92a:8067:7637 with SMTP id
 kj9-20020a170907764900b0092a80677637mr733749ejc.61.1679352002190; 
 Mon, 20 Mar 2023 15:40:02 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-011-139-095.77.11.pool.telefonica.de.
 [77.11.139.95]) by smtp.gmail.com with ESMTPSA id
 fi9-20020a170906da0900b00931faf03db0sm4664334ejb.27.2023.03.20.15.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 15:40:01 -0700 (PDT)
Date: Mon, 20 Mar 2023 22:39:53 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
CC: berrange@redhat.com,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] ui/gtk: fix cursor moved to left corner
In-Reply-To: <20230320132624.1612464-1-marcandre.lureau@redhat.com>
References: <20230320132624.1612464-1-marcandre.lureau@redhat.com>
Message-ID: <B42F2AFA-E48C-4B29-8745-B25817EC68CB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 20=2E M=C3=A4rz 2023 13:26:24 UTC schrieb marcandre=2Elureau@redhat=2Ec=
om:
>From: Marc-Andr=C3=A9 Lureau <marcandre=2Elureau@redhat=2Ecom>
>
>Do not attempt to move the pointer if the widget is not yet realized=2E
>The mouse cursor is placed to the corner of the screen, on X11 at least,
>as x_root and y_root are then miscalculated=2E (this is not reproducible
>on Wayland, because Gtk doesn't implement device warping there)
>
>This also fixes the following warning at start:
>qemu: Gdk: gdk_window_get_root_coords: assertion 'GDK_IS_WINDOW (window)'=
 failed
>
>Fixes: 6effaa16ac98 ("ui: set cursor position upon listener
>registration")

This particular issue gets fixed, so:
Tested-by: Bernhard Beschow <shentey@gmail=2Ecom>

However, when I perform a test like in https://gitlab=2Ecom/qemu-project/q=
emu/-/issues/1550 , the cursor gets placed into the QEMU window once the gr=
aphical environment is entered *in the guest*, regardless of whether QEMU h=
as the focus or not=2E This seems quite strange because an application shou=
ldn't "steal" the mouse from the active application=2E So perhaps this fix =
is just scratching the surface of a deeper underlying bug=2E=2E=2E

Best regards,
Bernhard

>Reported-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre=2Elureau@redhat=2Ecom>
>---
> ui/gtk=2Ec | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/ui/gtk=2Ec b/ui/gtk=2Ec
>index fd82e9b1ca=2E=2Ee9564f2baa 100644
>--- a/ui/gtk=2Ec
>+++ b/ui/gtk=2Ec
>@@ -450,7 +450,8 @@ static void gd_mouse_set(DisplayChangeListener *dcl,
>     GdkDisplay *dpy;
>     gint x_root, y_root;
>=20
>-    if (qemu_input_is_absolute()) {
>+    if (!gtk_widget_get_realized(vc->gfx=2Edrawing_area) ||
>+        qemu_input_is_absolute()) {
>         return;
>     }
>=20

