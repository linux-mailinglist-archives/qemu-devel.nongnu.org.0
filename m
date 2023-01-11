Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBB366608B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:32:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFe1G-0001Fx-0G; Wed, 11 Jan 2023 11:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe1D-0001Fn-BG
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:32:03 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe1B-0006By-Od
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:32:03 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w1so15631621wrt.8
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uVJHo1RDCZd+0bip3XyoLTSOXBE2Nvo0/rlUOGzHDIg=;
 b=Pvv21SUVaC83jCf0kh9CsUdXyavqI2tFaJM+ryj2mTV8yicuXA1+wXlwerBFxpyc3x
 4IKuKo2/JNsR4DMn/AQYp4L7DDCDpwz82OBmJ6Wap0JV3BAqj5hk93BaTAWRQxrr8uH9
 OAO2Qz0lmw58QW+QGvuCyHJUn+paEg+cPXyyyQrOcY9GdgUo+qM2rv6zBFEnz20pAdZ8
 WNFsQ4opMJTNLwNoslrxR0VBR77EGcCqmUW7ImyqDQhVMsnbMzD3fqXKmTKZAwN4YaHN
 6YW+rG+ShSsych9GzZtK9HKvsKCcoZkWuz7aFEMlYo4iaHMZO2iuIbPPu+76zQKhgAJl
 RhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uVJHo1RDCZd+0bip3XyoLTSOXBE2Nvo0/rlUOGzHDIg=;
 b=Rn8wvpgJVhv4O3JZnMuPh6GpIy+sxAjglIOUJeB9gliiIFpSMyFvuyExZVaFHQZF2N
 nCb3K/I/LfYhKULJUC97hgvp9RcFnjqlzAD3gvSgZmQVXnmSFFv06s5y1ieQ5iM5bPUZ
 gb+pRhq59iV62koG6WA1x0GOUh8aANzuSFo79nikQDUM5/d5iPAIv+dGzq9rGftOKr+e
 WE9I75Sagd5nRgQfxIk/72HA81/a8fsKQfIOl5CJDHWyAyFRrKOt909NUFARMzoi+AM7
 4vqXGUq5HJxkUqMX4MaQgUTOopNunnEKJ6P0AGL1+4zpJHSDcYlhbRBvThm94wyh2wh6
 1LiQ==
X-Gm-Message-State: AFqh2kpvp2Sx14JLTW+dEMdUuGfTyB3YgfLvYrl90VwvOO2ZLC9CsH6Y
 XPLjYwAdihM7DrLvG7Ovr4lv9gAOVW4764C6
X-Google-Smtp-Source: AMrXdXvan/pzK9oYRt+r+g+7dqvl8XS8FAtZ3Aim81HeM8GuiewSN0YGmSUy4Qew5pHJGumor8hy5w==
X-Received: by 2002:a5d:468f:0:b0:2bb:e868:6a45 with SMTP id
 u15-20020a5d468f000000b002bbe8686a45mr8408715wrq.56.1673454720251; 
 Wed, 11 Jan 2023 08:32:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bo30-20020a056000069e00b0027a57c1a6fbsm14373946wrb.22.2023.01.11.08.31.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 08:31:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 2/6] qemu/bswap: Replace bswapXXs() by compiler
 __builtin_bswap()
Date: Wed, 11 Jan 2023 17:31:43 +0100
Message-Id: <20230111163147.71761-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111163147.71761-1-philmd@linaro.org>
References: <20230111163147.71761-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bswap.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index ca2b4c3f15..d2dafdc54c 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -50,29 +50,31 @@ static inline uint64_t bswap64(uint64_t x)
 
 static inline void bswap16s(uint16_t *s)
 {
-    *s = bswap16(*s);
+    *s = __builtin_bswap16(*s);
 }
 
 static inline void bswap32s(uint32_t *s)
 {
-    *s = bswap32(*s);
+    *s = __builtin_bswap32(*s);
 }
 
 static inline void bswap64s(uint64_t *s)
 {
-    *s = bswap64(*s);
+    *s = __builtin_bswap64(*s);
 }
 
 #if HOST_BIG_ENDIAN
 #define be_bswap(v, size) (v)
-#define le_bswap(v, size) glue(bswap, size)(v)
+#define le_bswap(v, size) glue(__builtin_bswap, size)(v)
 #define be_bswaps(v, size)
-#define le_bswaps(p, size) do { *p = glue(bswap, size)(*p); } while(0)
+#define le_bswaps(p, size) \
+            do { *p = glue(__builtin_bswap, size)(*p); } while (0)
 #else
 #define le_bswap(v, size) (v)
-#define be_bswap(v, size) glue(bswap, size)(v)
+#define be_bswap(v, size) glue(__builtin_bswap, size)(v)
 #define le_bswaps(v, size)
-#define be_bswaps(p, size) do { *p = glue(bswap, size)(*p); } while(0)
+#define be_bswaps(p, size) \
+            do { *p = glue(__builtin_bswap, size)(*p); } while (0)
 #endif
 
 /**
-- 
2.38.1


