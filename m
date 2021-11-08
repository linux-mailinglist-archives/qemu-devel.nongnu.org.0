Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689054481FF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:42:29 +0100 (CET)
Received: from localhost ([::1]:43074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5qu-00024S-JO
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:42:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5lB-0008Ct-Qf
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:35 -0500
Received: from [2a00:1450:4864:20::532] (port=41750
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l6-00075v-Tp
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:33 -0500
Received: by mail-ed1-x532.google.com with SMTP id ee33so63597353edb.8
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kBbFzC2aKvFfUuOXw3oGZT6SMhzaT5V8dCwIlVesZxk=;
 b=gjbwb2o/088tCHGlGGqmdLKDBpIYmt76kNHbg30YGPpejp8xunPSxOWhAqUtKV5GTy
 88Fo+pdHs8wskbXB6L0cCkAcdnqhE0XU8VSrtsmjlz2bnlXMm/Sccx8vmDUPFnlMCwyB
 el1Q5/czdj5VPH+rigS6EUeIFbvZA25p29ek8aXCMJ3iu9ioLkXIqKV2v3gJiwqa5Gqb
 01Z36MVntfliaar2nbw5lzyCuEMFi19c2pDsXbblRe5QcliMaZyg5jWUhpT6nu4xYcWn
 s0dTOvGCBMs5NDLx+3zIdIkR1wBa0F5EXv1TSwWlLkzoSULAqyPIi+hh/XuxkAvrwPCK
 cCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kBbFzC2aKvFfUuOXw3oGZT6SMhzaT5V8dCwIlVesZxk=;
 b=jRW+k7GBQVELl3qnWg8L8iC/9A5eAlQrS58pYR1WUYMoG2dT1mPITCsuKsmNXLZT8R
 AOZOHTdm3OlrCmg2h25snTBquhW5FL2qVfzLg5FwiV5uQu8+089/oPXM0m8UeeWnQ0R3
 KhXZg8M8N7m0YsjZrCJY7ziONwCKyA2RHUSsYEO7JMpuVdy+FFsW7t0+J61GfFLQ9II4
 bsglSTIupFrsMa0Wmy3zeSSM+YJ3UJqSKBQiYvswzFPlw+Ea3bJVvYmcH/4AIptJ8mDI
 hUNuve3cQEcUXE4mdsRJvFSiB9A0pYm2Jk/Lvsf/myp0ZHuvRukng3fG3tLsrT7/m1Nf
 Pqdg==
X-Gm-Message-State: AOAM530DN9lXAk7+TUs3LLeDGkRd+LwUhI8DpLdHaEgaiO1pUPwX/h7y
 xsmqXw2l5bBb1F7M+sFX0Bfu16/wBPc=
X-Google-Smtp-Source: ABdhPJzvJaRTpPN2Lvlf1fOgZYeCHXnJuZRpnXUeLKI3m0Dnbjnz4CjFotWp0TjnFGFJfDULlAZxFQ==
X-Received: by 2002:a17:907:1deb:: with SMTP id
 og43mr331685ejc.189.1636382185513; 
 Mon, 08 Nov 2021 06:36:25 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp3sm8366662ejc.61.2021.11.08.06.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:36:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/10] ui/gtk-egl: Fix build failure when libgbm is not
 available
Date: Mon,  8 Nov 2021 15:36:16 +0100
Message-Id: <20211108143616.660340-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108143616.660340-1-pbonzini@redhat.com>
References: <20211108143616.660340-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211108083129.1262040-1-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ui/gtk-egl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index f2026e4b5c..45cb67712d 100644
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
2.33.1


