Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4022432D5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Aug 2020 05:33:39 +0200 (CEST)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k63zm-0007wh-I3
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 23:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k63sF-0004uM-Pg
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 23:25:51 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k63sE-00006C-4e
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 23:25:51 -0400
Received: by mail-pl1-x642.google.com with SMTP id f5so2005777plr.9
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 20:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ImTBoljSR0RaUjSJjrJWKxIahll20+RRkJQ8nrvuQtI=;
 b=VC9yvrh7WYWQ/2B/c9VNsrpO09UnQnqXEZH7UNV2tBZt/dWCND9105BX8OX5NZgxad
 fZE3FBIRocKFmtZZj42izi03vcSaF68xdglAvh/sjvTG6WbNXYXJvlJrzSBYWALBVXX6
 1q+IiDOksvjLAOgLJm94SAaS6+7aUyYeX5OhR5t24tv9qmi/DNKiWBPwNBD67qBDCn9E
 kgEj6gboCa56rjV9Q4lpmU024NsCjzkPRHZ0C1SMBRIJR/z0X3RyN42Z8l1EmXAEGIbt
 HwOHcrDH6d/HU6ZfAJef9+SjYsmAAhMS3tO/IxNtjYfWFn7mbsukGD0KOPPFSluK5uH7
 2OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ImTBoljSR0RaUjSJjrJWKxIahll20+RRkJQ8nrvuQtI=;
 b=Y8I/NKNAUBayBCjgqwaMGfKG1Ac9vZ8uyrCyFuga6s8Yvs749HrVbtAzUH8dRDFc5C
 jQ1WB1RzofZBsQErBR2G7E2N4EZ2xRxBWvJWSJvX0zv6se6Vu8IGoxwiDWwlz3JFWJ83
 agqTcNdYYRPHqrDNekcHZwAwJk0VKE2MFAGXFuJRhkl6XwCJQzXc3sKlszsrU7THOGjD
 8L31r4xEjM4smn4zYOwnOUggjAdXZy+THjA1fNJT1Tf//RUvgWUILg9M9NxWhP53/2oq
 b3+1uQiwm3SPiV78Xa/oL/Y6aHLYzjQ5tDkFoLgRJzTxL2GGj0EjCsXeQvdI0d8jpeCN
 dSow==
X-Gm-Message-State: AOAM533I9+lajnDrzzR3plQ5E/5Z/xjcJJhOyuSXJa0oXmmAm1G2GyBG
 OQxVrtSujiob7lf1pkP9qqj71EsqhMc=
X-Google-Smtp-Source: ABdhPJykdeo9DP4WlPgnDu4noFIG8lKhK1emC6N88E3ORIOa+KpDiSIiXE5+ajOYJwQVbn/Rv9HbLQ==
X-Received: by 2002:a17:90a:e60d:: with SMTP id
 j13mr3139889pjy.216.1597289148196; 
 Wed, 12 Aug 2020 20:25:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m19sm3633164pgd.21.2020.08.12.20.25.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 20:25:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/17] crypto/nettle: Fix xts_encrypt arguments
Date: Wed, 12 Aug 2020 20:25:26 -0700
Message-Id: <20200813032537.2888593-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200813032537.2888593-1-richard.henderson@linaro.org>
References: <20200813032537.2888593-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fourth argument to xts_encrypt should be the decrypt
callback; we were accidentally passing encrypt twice.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 crypto/cipher-nettle.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/cipher-nettle.inc.c b/crypto/cipher-nettle.inc.c
index 256931a823..0404cfc6da 100644
--- a/crypto/cipher-nettle.inc.c
+++ b/crypto/cipher-nettle.inc.c
@@ -632,7 +632,7 @@ qcrypto_nettle_cipher_encrypt(QCryptoCipher *cipher,
     case QCRYPTO_CIPHER_MODE_XTS:
 #ifdef CONFIG_QEMU_PRIVATE_XTS
         xts_encrypt(ctx->ctx, ctx->ctx_tweak,
-                    ctx->alg_encrypt_wrapper, ctx->alg_encrypt_wrapper,
+                    ctx->alg_encrypt_wrapper, ctx->alg_decrypt_wrapper,
                     ctx->iv, len, out, in);
 #else
         xts_encrypt_message(ctx->ctx, ctx->ctx_tweak,
-- 
2.25.1


