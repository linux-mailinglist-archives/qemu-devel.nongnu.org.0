Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E592D02F1
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 11:46:50 +0100 (CET)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klrZ3-00078C-EH
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 05:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1klrWT-0006ZO-Gm
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 05:44:09 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1klrWP-0002Jz-66
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 05:44:09 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a12so2967629wrv.8
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 02:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:message-id:mime-version;
 bh=aZromsGPVWhgEGAbX0R3ykwKMtXKFIIMyG5jvRpj8rw=;
 b=ogYaXhPkrwK/p68gFqH9XfmZJy5ruUhLrXLh7EIqHSaZqFTUxr1mrf8vSn+863X+FY
 XKRhC0AsVJgrtRtc7aYxMI0ahtkyGmncIDDbjCUQ9mIGsEz/vOLk6jdectz07VtRdmoq
 lV3WhQ3xsu8lYlCeUQ84LV7L11lukDc3oNe3K5dEw5H1/WLEewbBGRq0ehDSp1rLutGK
 VWVOiV8PMAMRxg8v/FHuxtlqB7QuyknNTd6mNpLAPSJDFvthT8eddAqUe2pvLUskW+V1
 KT3YhdbaIt6VG+KT9mnSPizP48xtSSx/WO32m0QrVKGHuPhgflE4qUmQ3L3bQ8Z5xjVX
 CpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:mime-version;
 bh=aZromsGPVWhgEGAbX0R3ykwKMtXKFIIMyG5jvRpj8rw=;
 b=i/qWJCM0xFQe2jYCzXL9FWG6jSWZlM6ARoo7hIcWE2K10pnZqkb3RlbhcKb7VX7AhQ
 BFkjmn0Oh9f4wh129YEF0EdGHAtiL80PTgvSWBvRZEY5+6LX3W51bjZ01wexw2Y/Blj2
 Nf+wlBCLQGuhVYeuz+Ybi856+vriIG1hwx+F6fIjnadmgBjdfmbbd4nEdk0OXf2QPbAO
 KHu+VOiRYoST29Wu4U2NPRPsK8hdAut1aZv7Msi1ZFxn4dG7+Dfw0xdANchVqPiz4Mya
 i9nbppGMv4Z2HeD7V2BbRK/s7MdYXZs46Yn8A38cndbeuncLB0oP6OeRdC0nKVOr+wCB
 bszg==
X-Gm-Message-State: AOAM531HogrdhYXa2NGJpUdlxmg/TtbNRck76qgXqyp56uBXmqjng5ik
 IbCXb5UnkBkVKdFkkgWy8rqGgZibABM=
X-Google-Smtp-Source: ABdhPJwMqW8cwS9Cbqq+M+JioTjJeZUbH57wlW25n82IbMM9Ju6MSMke4I8QOu7IQju2/DtbVRgGrg==
X-Received: by 2002:a5d:638e:: with SMTP id p14mr7160356wru.358.1607251440538; 
 Sun, 06 Dec 2020 02:44:00 -0800 (PST)
Received: from [192.168.100.143] ([213.91.86.150])
 by smtp.gmail.com with ESMTPSA id b200sm10138996wmb.10.2020.12.06.02.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 02:44:00 -0800 (PST)
Date: Sun, 06 Dec 2020 11:43:52 +0100
From: Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH 1/1] ui/gtk: Launching GTK UI with OpenGL on causes the
 refreshrate update to not run
To: qemu-devel@nongnu.org
Message-Id: <55ZWKQ.X7E8ESP709H31@gmail.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-KSmno0xbOQSAOuM4iuOb"
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: kraxel@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-KSmno0xbOQSAOuM4iuOb
Content-Type: text/plain; charset=us-ascii; format=flowed

I've discussed this issue back January and September. But it still 
occurs on my machine, despite the two patches.
This time, the issue is that the UI refresh rate doesn't get updated 
when I launch QEMU with gl=on.
My fix for this issue is to move the code for updating the refresh rate 
above the code that checks for OpenGL.

Or because OpenGL is meant to be called back with the "render" 
callback, should we instead add the refresh
rate checking code there?

Anyway, regardless of method, I'm happy with any solution that just 
fixes the issue.

Signed-off-by: Nikola Pavlica (pavlica.nikola@gmail.com)
---
diff --git a/ui/gtk.c b/ui/gtk.c
index a752aa22be..74287edde8 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -776,18 +776,6 @@ static gboolean gd_draw_event(GtkWidget *widget, 
cairo_t *cr, void *opaque)
     int fbw, fbh;
     int refresh_rate_millihz;

-#if defined(CONFIG_OPENGL)
-    if (vc->gfx.gls) {
-        if (gtk_use_gl_area) {
-            /* invoke render callback please */
-            return FALSE;
-        } else {
-            gd_egl_draw(vc);
-            return TRUE;
-        }
-    }
-#endif
-
     if (!gtk_widget_get_realized(widget)) {
         return FALSE;
     }
@@ -801,6 +789,18 @@ static gboolean gd_draw_event(GtkWidget *widget, 
cairo_t *cr, void *opaque)
         vc->gfx.dcl.update_interval = MILLISEC_PER_SEC / 
refresh_rate_millihz;
     }

+#if defined(CONFIG_OPENGL)
+    if (vc->gfx.gls) {
+        if (gtk_use_gl_area) {
+            /* invoke render callback please */
+            return FALSE;
+        } else {
+            gd_egl_draw(vc);
+            return TRUE;
+        }
+    }
+#endif
+
     fbw = surface_width(vc->gfx.ds);
     fbh = surface_height(vc->gfx.ds);
-- 
2.21.1


--=-KSmno0xbOQSAOuM4iuOb
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><span style=3D"white-space: pre-wr=
ap;">I've discussed this issue back January and September. But it still occ=
urs on my machine, despite the two patches.
This time, the issue is that the UI refresh rate doesn't get updated when I=
 launch QEMU with gl=3Don.
My fix for this issue is to move the code for updating the refresh rate abo=
ve the code that checks for OpenGL.</span></div><div><br></div><div><span s=
tyle=3D"white-space: pre-wrap;">Or because OpenGL is meant to be called bac=
k with the "render" callback, should we instead add the refresh&nbsp;</span=
></div><div><span style=3D"white-space: pre-wrap;">rate checking code there=
?</span></div><div><span style=3D"white-space: pre-wrap;"><br></span></div>=
<div><span style=3D"white-space: pre-wrap;">Anyway, regardless of method, I=
'm happy with any solution that just fixes the issue.</span></div><div><spa=
n style=3D"white-space: pre-wrap;">
Signed-off-by: Nikola Pavlica (pavlica.nikola@gmail.com)</span><span style=
=3D"white-space: pre-wrap;">
</span>---</div><div>diff --git a/ui/gtk.c b/ui/gtk.c</div><div>index a752a=
a22be..74287edde8 100644</div><div>--- a/ui/gtk.c</div><div>+++ b/ui/gtk.c<=
/div><div>@@ -776,18 +776,6 @@ static gboolean gd_draw_event(GtkWidget *wid=
get, cairo_t *cr, void *opaque)</div><div>&nbsp; &nbsp; &nbsp;int fbw, fbh;=
</div><div>&nbsp; &nbsp; &nbsp;int refresh_rate_millihz;</div><div>&nbsp;</=
div><div>-#if defined(CONFIG_OPENGL)</div><div>- &nbsp; &nbsp;if (vc-&gt;gf=
x.gls) {</div><div>- &nbsp; &nbsp; &nbsp; &nbsp;if (gtk_use_gl_area) {</div=
><div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* invoke render callback =
please */</div><div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return FALSE=
;</div><div>- &nbsp; &nbsp; &nbsp; &nbsp;} else {</div><div>- &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;gd_egl_draw(vc);</div><div>- &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;return TRUE;</div><div>- &nbsp; &nbsp; &nbsp; &nbsp;=
}</div><div>- &nbsp; &nbsp;}</div><div>-#endif</div><div>-</div><div>&nbsp;=
 &nbsp; &nbsp;if (!gtk_widget_get_realized(widget)) {</div><div>&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;return FALSE;</div><div>&nbsp; &nbsp; &nbsp;}</div><=
div>@@ -801,6 +789,18 @@ static gboolean gd_draw_event(GtkWidget *widget, c=
airo_t *cr, void *opaque)</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vc-&g=
t;gfx.dcl.update_interval =3D MILLISEC_PER_SEC / refresh_rate_millihz;</div=
><div>&nbsp; &nbsp; &nbsp;}</div><div>&nbsp;</div><div>+#if defined(CONFIG_=
OPENGL)</div><div>+ &nbsp; &nbsp;if (vc-&gt;gfx.gls) {</div><div>+ &nbsp; &=
nbsp; &nbsp; &nbsp;if (gtk_use_gl_area) {</div><div>+ &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;/* invoke render callback please */</div><div>+ &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return FALSE;</div><div>+ &nbsp; &nbsp; &=
nbsp; &nbsp;} else {</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;g=
d_egl_draw(vc);</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return=
 TRUE;</div><div>+ &nbsp; &nbsp; &nbsp; &nbsp;}</div><div>+ &nbsp; &nbsp;}<=
/div><div>+#endif</div><div>+</div><div>&nbsp; &nbsp; &nbsp;fbw =3D surface=
_width(vc-&gt;gfx.ds);</div><div>&nbsp; &nbsp; &nbsp;fbh =3D surface_height=
(vc-&gt;gfx.ds);</div><div><div style=3D"caret-color: rgb(119, 119, 119); c=
olor: rgb(119, 119, 119); white-space: pre-wrap;">--=20
</div><span style=3D"caret-color: rgb(119, 119, 119); color: rgb(119, 119, =
119); white-space: pre-wrap;">2.21.1</span></div></div>
--=-KSmno0xbOQSAOuM4iuOb--


