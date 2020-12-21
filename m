Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B52DFD4D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:13:33 +0100 (CET)
Received: from localhost ([::1]:59406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMsO-0004as-9O
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRD-0004rU-Aw
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:31 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMR9-0007kF-SV
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:26 -0500
Received: by mail-wm1-x32e.google.com with SMTP id 3so11167696wmg.4
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k2+lnQdbYW5o2TDgNfADkbUQIgRgyS2w63tb0hudqTs=;
 b=rcskzjasiVDtwegj4Q69kAvZaojyi9ah0xtSuf66ndPqt+LFcLRZ5D5InM9AoI8WYD
 +Zr4lnViNQ1ZoAEP9LqfxOXWDCtJsfpLuBKiZkecvWTMrz2R9KoMtY6AuwPO4pATRq9u
 ZlMwzgwccdTKrJgXyXxAZonYBUfPWmyVxafjXLBTdmjnp7D1//4lXV4+sg1jlwPrJdlr
 ZPlu4l6yHkaPvwohSUhVFFvxWMk8mUIbc1Igo2I7yeX+2TTCOVFANnVEMNHDqIO68pR7
 DytPV4t/06VfyQujGZ9S42DVp9MMzzdjJD6Mj48wL9UicscteGUWLCecLAm3FXlEFmM4
 tRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=k2+lnQdbYW5o2TDgNfADkbUQIgRgyS2w63tb0hudqTs=;
 b=AoAwgN/KFAhpfVHMTwIt3HJctffUWV333GY7DexWxtj+FjJmb0Ad9jZs4+lLep1bXC
 ZPJ1lWCTTYb6qDh4coPXUSPie1UYWTgSwxoTwyWPOh9iyvBhrPug4gSY4eF0fcE90vQS
 e/8PHhGv9IrHmNxP3iqNntMM40TAcZF4Bk1qdJY2MZVbtBm6yiAXkSd1edySw/bWP3tV
 I7f6hZgkjT1GGPN7mQI1PQ5dOTMc/A25Ey2EIjX3kDsJRQp94IKwALf7tho0BJ8F0rEr
 Cy1nZj29/vDqx0wOedPReRh0PcSx2mA8AgSaKP9cXxCwk6bIo315rKUmBEp8AV455UuC
 oVbw==
X-Gm-Message-State: AOAM532D6kSVPVoYlTLQyMUf0HCzHwKMgzB0DL5Dluoa0dFIlpdCYlqj
 IubkXSm01NYVxn6W++LdPn6FnhHkOy4=
X-Google-Smtp-Source: ABdhPJz295R5Vz144aGh888m7q722pSsKtLsfen5VnA3TlaBWK7J1mc8T0UCecvP3n+eg88YZzYUAQ==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr16672408wma.93.1608561907952; 
 Mon, 21 Dec 2020 06:45:07 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:07 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/55] build-sys: fix -static linking of libvhost-user
Date: Mon, 21 Dec 2020 15:44:13 +0100
Message-Id: <20201221144447.26161-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fix linking vhost-user binaries with with ./configure -static, by
overriding glib-2.0 dependency with configure results.

Fixes: 0df750e9d3a5fea5e1 ("libvhost-user: make it a meson subproject")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201215080319.136228-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 94ef023ad1..ada35d56e1 100644
--- a/meson.build
+++ b/meson.build
@@ -268,7 +268,11 @@ endif
 # grandfathered in from the QEMU Makefiles.
 add_project_arguments(config_host['GLIB_CFLAGS'].split(),
                       native: false, language: ['c', 'cpp', 'objc'])
-glib = declare_dependency(link_args: config_host['GLIB_LIBS'].split())
+glib = declare_dependency(compile_args: config_host['GLIB_CFLAGS'].split(),
+                          link_args: config_host['GLIB_LIBS'].split())
+# override glib dep with the configure results (for subprojects)
+meson.override_dependency('glib-2.0', glib)
+
 gio = not_found
 if 'CONFIG_GIO' in config_host
   gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
-- 
2.29.2



