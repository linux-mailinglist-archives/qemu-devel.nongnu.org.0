Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3B2D0556
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 14:49:08 +0100 (CET)
Received: from localhost ([::1]:45412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kluPS-0005L1-Kr
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 08:49:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1kluNW-0004uP-PQ
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 08:47:06 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1kluNT-0000H8-HF
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 08:47:06 -0500
Received: by mail-wr1-x42e.google.com with SMTP id e7so10068337wrv.6
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 05:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:message-id:mime-version;
 bh=fYpDLoFK4aaG9MRhnfQIMv1zWRnPUgZ88N84Erft2Es=;
 b=qCwEuSrsorY5LntDqbTQIciz4YUDL0eipqUsxVij2yoHZfvSdmKv+DmgGPtSYNilCD
 uNZBYq+eypWb7rAfS2gANIRMXGqkRIDPy0UfUVurDU4oz/J9ymnzc8mPdHkk84CUglIP
 CjMZ17PMvxEeC6450SDm+rgQTaJJUbaVRrCL1LwJQYQAzHHgZ/Zq389x8a1ehc2sA5xB
 6uV+wXq0dKC9dCJTXv8+s4zR92QJMEE3u3eQNGU3Bt2hX3TWfFlIVjjJ48+9zOXRbmLO
 0S1Pop41hij5b5eLDXe4kvKATHWp+hiL/0ZF6f+u3cEMbBN/Vs6JV/cr8x/QodKZpL6p
 14IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:mime-version;
 bh=fYpDLoFK4aaG9MRhnfQIMv1zWRnPUgZ88N84Erft2Es=;
 b=jRl0c08g4pHIN3kStVX3i8hf+UDFoNhRuJHlGhd5r8/PXDiPATk24vYLGxcHT0uo0e
 dQwIqcROupBxNBNsxfan5GVG7fCoLaop0J88mlGLOsJfy/0E5qIeo8+Kpfsnj6QhVae7
 VqsI9Wr0kO227sfOXeOg1htKX5FX3l+US0QHgN3JiNPC6HplVFtqGni0FbLYNFzQzEPd
 ojz8CI//27p/F4gvEiLP5N6Boq3JfOrIVtMzoAFqNB2SbuQ1n1tmTAZe/d297jUfLtei
 OEbkpCeMfp8q9ubuvSNP/AMF+TsaBNKDlljyW05uBnZ2TP6nr2RmXBsPVzUiuCW+D/kL
 d5Kg==
X-Gm-Message-State: AOAM530SMAi0T4GY4sc5AzzDmjnjawBTJI1ov5l55bNgYKvBZOJJp30U
 R7kqvDxn9ZhmaWUhlHNhAMGhWdaqOiNcqw==
X-Google-Smtp-Source: ABdhPJwpEtZ4b0XKjpvf5GhickE4Z8G/df/Sq9n6TSiuGGfPh0G1Cfp+JlWoiVLBngAzA6zCbrhnTQ==
X-Received: by 2002:adf:f0c3:: with SMTP id x3mr14568725wro.327.1607262419711; 
 Sun, 06 Dec 2020 05:46:59 -0800 (PST)
Received: from [192.168.100.143] ([213.91.86.150])
 by smtp.gmail.com with ESMTPSA id z21sm9876094wmk.20.2020.12.06.05.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 05:46:59 -0800 (PST)
Date: Sun, 06 Dec 2020 14:46:51 +0100
From: Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH v2 1/1] ui/gtk: Launching GTK UI with OpenGL on causes
 =?UTF-8?Q?the=0A?= refreshrate update to not run
To: qemu-devel <qemu-devel@nongnu.org>
Message-Id: <3M7XKQ.PR753U54CKM21@gmail.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-/3ITVX/DVkyRqMU+fD6U"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Philippe =?iso-8859-1?q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-/3ITVX/DVkyRqMU+fD6U
Content-Type: text/plain; charset=us-ascii; format=flowed

As suggested before, I've instead copied the code to the appropriate 
callback function so that the refresh rate gets properly updated.

Also to avoid repeating the gd_refresh_rate_millihz function, I've 
globalized it. I hope you don't mind.

Signed-off-by: Nikola Pavlica (pavlica.nikola@gmail.com)
---
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index eaeb450f91..6025a4f030 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -88,6 +88,7 @@ extern bool gtk_use_gl_area;

 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
+int gd_refresh_rate_millihz(GtkWidget *window);

 /* ui/gtk-egl.c */
 void gd_egl_init(VirtualConsole *vc);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 99231a3597..a9131783f0 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -112,6 +112,14 @@ void gd_egl_update(DisplayChangeListener *dcl,
 void gd_egl_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+    int refresh_rate_millihz;
+
+    refresh_rate_millihz = gd_refresh_rate_millihz(vc->window ? 
vc->window :
+                                                   
vc->gfx.drawing_area);
+    if (refresh_rate_millihz) {
+        vc->gfx.dcl.update_interval = MILLISEC_PER_SEC / 
refresh_rate_millihz;
+    }
+

     if (!vc->gfx.esurface) {
         gd_egl_init(vc);
diff --git a/ui/gtk.c b/ui/gtk.c
index a752aa22be..3b8755b746 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -752,7 +752,7 @@ static void gd_resize_event(GtkGLArea *area,
  * If available, return the refresh rate of the display in milli-Hertz,
  * else return 0.
  */
-static int gd_refresh_rate_millihz(GtkWidget *window)
+int gd_refresh_rate_millihz(GtkWidget *window)
 {
 #ifdef GDK_VERSION_3_22
     GdkWindow *win = gtk_widget_get_window(window);
-- 
2.21.1


--=-/3ITVX/DVkyRqMU+fD6U
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><span style=3D"white-space: pre-wr=
ap;">As suggested before, I've instead copied the code to the appropriate c=
allback function so that the refresh rate gets properly updated.</span></di=
v><div><span style=3D"white-space: pre-wrap;"><br></span></div><div><span s=
tyle=3D"white-space: pre-wrap;">Also to avoid repeating the gd_refresh_rate=
_millihz function, I've globalized it. I hope you don't mind.</span></div><=
div><span style=3D"white-space: pre-wrap;">
Signed-off-by: Nikola Pavlica (pavlica.nikola@gmail.com)</span><span style=
=3D"white-space: pre-wrap;">
</span>---</div><div><div>diff --git a/include/ui/gtk.h b/include/ui/gtk.h<=
/div><div>index eaeb450f91..6025a4f030 100644</div><div>--- a/include/ui/gt=
k.h</div><div>+++ b/include/ui/gtk.h</div><div>@@ -88,6 +88,7 @@ extern boo=
l gtk_use_gl_area;</div><div>&nbsp;</div><div>&nbsp;/* ui/gtk.c */</div><di=
v>&nbsp;void gd_update_windowsize(VirtualConsole *vc);</div><div>+int gd_re=
fresh_rate_millihz(GtkWidget *window);</div><div>&nbsp;</div><div>&nbsp;/* =
ui/gtk-egl.c */</div><div>&nbsp;void gd_egl_init(VirtualConsole *vc);</div>=
<div>diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c</div><div>index 99231a3597..a=
9131783f0 100644</div><div>--- a/ui/gtk-egl.c</div><div>+++ b/ui/gtk-egl.c<=
/div><div>@@ -112,6 +112,14 @@ void gd_egl_update(DisplayChangeListener *dc=
l,</div><div>&nbsp;void gd_egl_refresh(DisplayChangeListener *dcl)</div><di=
v>&nbsp;{</div><div>&nbsp; &nbsp; &nbsp;VirtualConsole *vc =3D container_of=
(dcl, VirtualConsole, gfx.dcl);</div><div>+ &nbsp; &nbsp;int refresh_rate_m=
illihz;</div><div>+</div><div>+ &nbsp; &nbsp;refresh_rate_millihz =3D gd_re=
fresh_rate_millihz(vc-&gt;window ? vc-&gt;window :</div><div>+ &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; vc-&gt;gfx.drawing_area);</div><div>+ &nbsp; &nbsp;if (refresh=
_rate_millihz) {</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp;vc-&gt;gfx.dcl.upda=
te_interval =3D MILLISEC_PER_SEC / refresh_rate_millihz;</div><div>+ &nbsp;=
 &nbsp;}</div><div>+</div><div>&nbsp;</div><div>&nbsp; &nbsp; &nbsp;if (!vc=
-&gt;gfx.esurface) {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;gd_egl_ini=
t(vc);</div><div>diff --git a/ui/gtk.c b/ui/gtk.c</div><div>index a752aa22b=
e..3b8755b746 100644</div><div>--- a/ui/gtk.c</div><div>+++ b/ui/gtk.c</div=
><div>@@ -752,7 +752,7 @@ static void gd_resize_event(GtkGLArea *area,</div=
><div>&nbsp; * If available, return the refresh rate of the display in mill=
i-Hertz,</div><div>&nbsp; * else return 0.</div><div>&nbsp; */</div><div>-s=
tatic int gd_refresh_rate_millihz(GtkWidget *window)</div><div>+int gd_refr=
esh_rate_millihz(GtkWidget *window)</div><div>&nbsp;{</div><div>&nbsp;#ifde=
f GDK_VERSION_3_22</div><div>&nbsp; &nbsp; &nbsp;GdkWindow *win =3D gtk_wid=
get_get_window(window);</div></div><div><div class=3D"geary-signature"><div=
 style=3D"caret-color: rgb(119, 119, 119); color: rgb(119, 119, 119); white=
-space: pre-wrap;">--=20
</div><span style=3D"caret-color: rgb(119, 119, 119); color: rgb(119, 119, =
119); white-space: pre-wrap;">2.21.1</span></div></div></div>
--=-/3ITVX/DVkyRqMU+fD6U--


