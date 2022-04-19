Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4202650641F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:02:57 +0200 (CEST)
Received: from localhost ([::1]:43584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nggws-0001lt-Uj
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:02:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglm-00015u-4j
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglk-0004Ng-Lc
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id bv16so3773308wrb.9
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EXWN0NPJeSTfBvuDOtzTDGQVHiiTkyUdgw6vbV3xhLg=;
 b=OGC6pqsT6ils2/M+32ODqHBWblLeHBe5J4vfClzTM1nikGc2kLJ3HUErJp3Xr/8IVT
 2txzRkBIosVf4S7WTUepXlgQ6U06cEEVv5mAVTbC6lJ7XUkaD7uxLfTLGD+bxYgZRN7m
 4xK/zcvNQMi7IWcUQyWkVUhhRj6pugl4ZSndu31f0+RWf+a9QuAzMRV19eDc8FdcycSq
 vNnVf/AtFaU7VBJpTHeBv2MjHRHRYwZq2M2Z7AD0lmw3KEK6DJG5s7XRqaIzEs2ySUAR
 e4/ZyLupKLro1cTeReZZHWhBMPXxCkzlcoWb74R7bAVuCPFQYHUBgl0Cnh1AxX9E4ltM
 K18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EXWN0NPJeSTfBvuDOtzTDGQVHiiTkyUdgw6vbV3xhLg=;
 b=dYIpAFEI8v5U9RJsB+4r8EykHvdZelfVArfOxM/0XPMvU9LSYzcpLbAO0PEljY/FV7
 CgejGiYLzQhlLclfGGeReslBGVjblkCzgPTOC3+3VAgs9dRRliwcGDcYXUyWD7IHmbqE
 eThKnLOgJ44cJIvx6UG7wvpVFmbcPkbU+spGRjeEnp8smYDDGxolOV/65uAC6ZaRe0JH
 7M0Ch0xbKEsxgMmcQ6QFuqS0WrDW4K9/zmbKzrOwo1ftGTIDUHmLaLZj1HGWMa/CR8z2
 G0nl+NlabdT9Yg23UbfFeXabbBubcKu3zaO4zY1H1X9+nXiG/5ZPTg5571XJ5wWH+Pgx
 39+Q==
X-Gm-Message-State: AOAM531G4APBr+iEkiNG5+FfdP2lL6IWCqUjLFGfTkSdtWwGUfQEYEdr
 FxrnExUInWB5NUDuThqIyLzJMDSLx0+T3Q==
X-Google-Smtp-Source: ABdhPJzDYHDUDoGNaJTGg1KF7DxeV3z2boJlLDf6eo8oRCL+kVL5zYcmV0kdkB4wQUDk90HfqVyPzw==
X-Received: by 2002:adf:e194:0:b0:207:b4c9:31c6 with SMTP id
 az20-20020adfe194000000b00207b4c931c6mr10302227wrb.102.1650347476134; 
 Mon, 18 Apr 2022 22:51:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/53] meson: use chardev_ss dependencies
Date: Tue, 19 Apr 2022 07:50:22 +0200
Message-Id: <20220419055109.142788-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

chardev subsystem/library doesn't use gnutls. Use the dedicated
chardev_ss.dependencies() instead.

Looking at history, it was added in commit 3eacf70bb5a83e ("meson:
Propagate gnutls dependency") because crypto/tlscreds.h included
GnuTLS. This was cleaned-up later by commit 678bcc3c2cf222 ("crypto:
Make QCryptoTLSCreds* structures private").

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220323155743.1585078-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 861de93c4f..6e4a3d6326 100644
--- a/meson.build
+++ b/meson.build
@@ -3091,7 +3091,7 @@ qmp = declare_dependency(link_whole: [libqmp])
 
 libchardev = static_library('chardev', chardev_ss.sources() + genh,
                             name_suffix: 'fa',
-                            dependencies: [gnutls],
+                            dependencies: chardev_ss.dependencies(),
                             build_by_default: false)
 
 chardev = declare_dependency(link_whole: libchardev)
-- 
2.35.1



