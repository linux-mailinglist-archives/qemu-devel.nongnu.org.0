Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34AF4A8B6A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:19:55 +0100 (CET)
Received: from localhost ([::1]:49072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgi2-0001l3-OW
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:19:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0T-0005K1-DW
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:53 -0500
Received: from [2a00:1450:4864:20::62e] (port=41882
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0L-0008Ib-8m
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:53 -0500
Received: by mail-ej1-x62e.google.com with SMTP id a8so10956746ejc.8
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZmzsaS4MF7Bno5gfofYW64lEALcI4kQMPduFZQmOhw=;
 b=F4Zmbpg+7CEaKpcEYYDXhlHx8vw9CoRAWfsSx1Q1c23LPIPPvDk6SAY0IA1W0xL2J+
 gqs0rVgANi+qL+eLzJT8Q1mq/8+QdKfnw8Rx1yUjfIQkf7/Vkk1aOOcRgSwwTjeGkSiu
 EcT7iXr8c1x+At4ehCCaXo1iYpNSzTEAKmGCAC8BRdZaO0DFrYoK4jAinqIN1D9mhJeV
 jO9CMaGPfySy/sfs1BdI0SOJkR5deKpIsHlCaooPbm7do+xFrWIFODf56xtzxp2KKYki
 WxHjuQRmxOmEyBxK4Bo1wluv9eqSiENGpRb9p2HipCDhlAA6zJ1Oo5PNt39nYtpdz2Cf
 QE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mZmzsaS4MF7Bno5gfofYW64lEALcI4kQMPduFZQmOhw=;
 b=KjgDNHEzt7KpqIvMLdb0eekU5xafuALaRU3m2Xxn2T6UD34VhjjI1laVRcnFbmUo3W
 l6RaAyYslydfFkzy49q7RGul6oOeicjF32p7iCzr60QPPgUaKiXMy7twdBWsqhe8rCj8
 1v1V3VS1DSfvcgJpnwQc1vl1e0jDThqyNABj8l+740rbXm+MrHOXUJ0JSKTmupMR4SH0
 Ww87ZdXGQWxw0TV+nsWKQJ8VFR+Ep2FHeiez220dGEBHIROtCpKDVxksM5LWVY+aDcfg
 ctXvWn/iDnAbY5KH/cpV2jHWOyG74dmMQoEOVoJ1LEnxyPqHmOs5aOCHFBVliYDCSxhN
 HoYA==
X-Gm-Message-State: AOAM532YlFMX0Jq9A+Aml5PUfNqb6k6RI/3Ago/wXIDNBmbALh1pG9uQ
 ivm4vhqul+vY6S72ep+B1tf3+/ODSFs=
X-Google-Smtp-Source: ABdhPJx8+EUJvlKpXgykVvpxygzQoFnz2k/60U6ZAM2qi9lWt7bo6aKxUvEP2KfUaYyYNUMwfNvTAA==
X-Received: by 2002:a17:906:3b84:: with SMTP id
 u4mr30124942ejf.689.1643909653328; 
 Thu, 03 Feb 2022 09:34:13 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/27] meson: refine check for whether to look for
 virglrenderer
Date: Thu,  3 Feb 2022 18:33:48 +0100
Message-Id: <20220203173359.292068-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check should be performed even if !have_system, as long as there is some hope that
vhost-user-gpu will be built.  Store into have_vhost_user_gpu whether vhost-user-gpu
will be built; we will also use the variable to decide whether to look for libepoxy.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 contrib/vhost-user-gpu/meson.build | 3 +--
 meson.build                        | 5 ++++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
index b4e26045da..c8883c2d8e 100644
--- a/contrib/vhost-user-gpu/meson.build
+++ b/contrib/vhost-user-gpu/meson.build
@@ -1,5 +1,4 @@
-if have_tools and virgl.found() and gbm.found() \
-    and 'CONFIG_LINUX' in config_host and pixman.found()
+if have_vhost_user_gpu
   executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c'),
              dependencies: [qemuutil, pixman, gbm, virgl, vhost_user, opengl],
              install: true,
diff --git a/meson.build b/meson.build
index ae7a21c841..894b9bd6ed 100644
--- a/meson.build
+++ b/meson.build
@@ -621,7 +621,9 @@ if not get_option('zstd').auto() or have_block
                     method: 'pkg-config', kwargs: static_kwargs)
 endif
 virgl = not_found
-if not get_option('virglrenderer').auto() or have_system
+
+have_vhost_user_gpu = have_tools and targetos == 'linux' and pixman.found()
+if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
   virgl = dependency('virglrenderer',
                      method: 'pkg-config',
                      required: get_option('virglrenderer'),
@@ -1000,6 +1002,7 @@ if (have_system or have_tools) and (virgl.found() or opengl.found())
   gbm = dependency('gbm', method: 'pkg-config', required: false,
                    kwargs: static_kwargs)
 endif
+have_vhost_user_gpu = have_vhost_user_gpu and virgl.found() and gbm.found()
 
 gnutls = not_found
 gnutls_crypto = not_found
-- 
2.34.1



