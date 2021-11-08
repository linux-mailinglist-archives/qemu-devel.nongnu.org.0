Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659A447BDE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:33:21 +0100 (CET)
Received: from localhost ([::1]:34750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk05g-0006j6-Az
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:33:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mk04B-0005bM-Pg
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:31:49 -0500
Received: from [2a00:1450:4864:20::42d] (port=37574
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mk03x-0005MK-DQ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:31:47 -0500
Received: by mail-wr1-x42d.google.com with SMTP id b12so25402637wrh.4
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sVRl8eJfBgu2KpusNHyAFUhF3t/IMcSCXpyMy3NrXtE=;
 b=ZXL3xQx0X9zvZbnsanLctSWcM8SnGPUWRDVRMkucmEv10PAwtqabU2HAb+UFJQNQ71
 TsZaUpC2OcNP3ftE/KW53A4bB8+2ci4u853GpSKiA9+3uqtKZiv11STn/wn0Mx+1d5MV
 7tMswnTZ9tMsbLOHYDXqr0+nabA/V012zMszwJD65zWobHHPgxdb7Q0RddMqhRiO0hom
 IASTOrCPOg8HcJsyU4WyGngDxI43YGOowx9C7bzt7AK8oCUdAAr1PyeQbsd6qIMIRq5q
 waYqXPn3XuKFzBp35zt/yj85THc/IM6K62iOskW/kgK+CTJSChDq0mjWs+23mQIUW3gp
 CJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sVRl8eJfBgu2KpusNHyAFUhF3t/IMcSCXpyMy3NrXtE=;
 b=ntLPjX8dHiU9Q812jW3TD/LCafLCqkh8sdi9WLfgZCe41J6G/ulmHuRB5cTHwRbxH1
 KG8anOweQXuGDfiIORe/5kkNDYVTvMDJ6TKJKsxyTS6tc8Hi4EoqUgMWH6OOvrvadSpi
 S4SwQ2R7gGQhEauS4KnSzpnl2ni1QEBM3zpxyf5ah7DyCrSJ66g8/5ssH8YJt3XdQc5d
 PK8smjV9X95I1ql9EC81huSDXJEufqIwE/8+71/RmgGyL4NWxBvsnsEwACangPkB4mjq
 uK6BtxrW4BKEjhlSEqI6YWbxS/96aCjJxIjH14YxtQPpa/5Z/E1AA+a+jlTI1YSwI2Kv
 3b7w==
X-Gm-Message-State: AOAM531CouEYXcGrkHULiPQwQMAIPIHu5hl5Wlsc+hCNFK8FTwyL8w5U
 YpdP+bvunKn3yRrlSlJAMnzT6QfSCjs=
X-Google-Smtp-Source: ABdhPJxw5HhOL6tbWM2DlJvbTRWK0zqJ7rEVfnJKLpTo77MZSAWYiBmy+mE0O15nSKh8cJ8v8TDBpQ==
X-Received: by 2002:a5d:64ed:: with SMTP id g13mr71448040wri.222.1636360291728; 
 Mon, 08 Nov 2021 00:31:31 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u20sm15888786wmq.6.2021.11.08.00.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 00:31:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.2] ui/gtk-egl: Fix build failure when libgbm is not
 available
Date: Mon,  8 Nov 2021 09:31:29 +0100
Message-Id: <20211108083129.1262040-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 4872a023a59 ("ui/gtk-egl: guest fb texture needs
to be regenerated when reinitializing egl") we get on Ubuntu
18.04.4 LTS and Debian Buster (oldstable):

  $ ../configure --enable-virglrenderer
  [...]
  ui/gtk-egl.c: In function 'gd_egl_refresh':
  ui/gtk-egl.c:159:13: error: implicit declaration of function 'egl_dmabuf_release_texture' [-Werror=implicit-function-declaration]
    159 |             egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
        |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
  ui/gtk-egl.c:159:13: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
  ui/gtk-egl.c:159:13: error: nested extern declaration of 'egl_dmabuf_release_texture' [-Werror=nested-externs]

Fix by restricting the egl_dmabuf_release_texture() call to the
availability of the generic buffer management library (libgbm).

Fixes: 4872a023a593e6519b272a
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Reported-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/gtk-egl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index f2026e4b5c9..45cb67712df 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -155,10 +155,12 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
             surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
             surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
         }
+#ifdef CONFIG_GBM
         if (vc->gfx.guest_fb.dmabuf) {
             egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
             gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
         }
+#endif
     }
 
     graphic_hw_update(dcl->con);
-- 
2.31.1


