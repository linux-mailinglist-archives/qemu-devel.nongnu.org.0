Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47E36FE1E9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:53:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwm7I-00031g-Vo; Wed, 10 May 2023 11:52:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwm7H-000303-AT
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:35 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwm7F-0004Um-Ne
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:35 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f42711865eso24839265e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683733950; x=1686325950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s3KN+seF7jjUQ0aZUOoQd455lccivu+NPR8pleIjoaE=;
 b=RH3M9dg3HECxPDlQVK0HjX64IZREphg4UkGZZxBb+40mav5c+YNDlUDn/RNehXNp1b
 rwaRI3Uch+B4QRol22wzqpVe6Pv1KTmlaXSHCOLN8BEPGP6Rz75oWbEDzIvN8zAdpUB8
 eJM1hQY26E31KZUjvtR73rCJlRaHPF8dW0olnxwB8r/8OuNUZjQSWYI4bT4dAZ8hUt9J
 2ncBaN0O6vkA3sERG9tex9VEVqAL2+A6i63pFHGWmQwH3LfO3fRLzbf2hbIYVY3oexZb
 yop+T8mSzQ3bBkQ0QEWsgXEpKgh/foIZLPbM+AoWaCkU4Pxr1uNnrDzDqMNtEoHI+Duv
 D3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683733950; x=1686325950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3KN+seF7jjUQ0aZUOoQd455lccivu+NPR8pleIjoaE=;
 b=lKaxOb1bUbl/A9J1LEjuKLBHXhhdhFbavhYUae44oSO+oSzAv8ZCjmJ7KpzkTjL2RY
 GeD2+d8NIcQf354XB7LwRDLAb8qzjfb+nOpvetpMVUn+bykIHG1yA6LjTwoa2sAHFz1q
 bsxwdIkiG3Zk42ZGyC/yySIesaIfYVEEtoMO/VWTsUApEvbC56O3cvlA915YFTF5/o+D
 T5aMS+Z4pIVNO5vih12A1eY9yuObs6b5pYfKx6aWpVVmNq9Kq2MDYiv+twJNiLnZQ/2C
 iXQnvnuSVy3tpyCwArss1OQ6/z1pL2c1agafxwj8o33XFwp3Qq+xAqpMHYwrzt3ssXb7
 gTOA==
X-Gm-Message-State: AC+VfDzh4yjcI7lDBluWGzBFA2AiovWcZdi8Tnf2epSpG/IEyKBi4shJ
 vFXk2VDHojpm/b1vDC1PJrj055w0uXqRTJf+qkbzhQ==
X-Google-Smtp-Source: ACHHUZ4mjnKa9ZwnO8BItaKP7AjGsXgr4i71ChksDmQ/ox1sw3MPBK/WZM3isePv5sBVNgpdPAQyXA==
X-Received: by 2002:a05:600c:b4b:b0:3f4:2897:4eb7 with SMTP id
 k11-20020a05600c0b4b00b003f428974eb7mr6060581wmr.38.1683733950113; 
 Wed, 10 May 2023 08:52:30 -0700 (PDT)
Received: from stoup.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003ee74c25f12sm23157946wmk.35.2023.05.10.08.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:52:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 5/5] disas: Move disas.c into the target-independent source
 set
Date: Wed, 10 May 2023 16:52:26 +0100
Message-Id: <20230510155226.647756-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510155226.647756-1-richard.henderson@linaro.org>
References: <20230510155226.647756-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

By using target_words_bigendian() instead of an ifdef,
we can build this code once.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230508133745.109463-3-thuth@redhat.com>
[rth: Type change done in a separate patch]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 disas/disas.c     | 10 +++++-----
 disas/meson.build |  3 ++-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/disas/disas.c b/disas/disas.c
index 5e7401bb6f..954b385a82 100644
--- a/disas/disas.c
+++ b/disas/disas.c
@@ -122,11 +122,11 @@ void disas_initialize_debug_target(CPUDebug *s, CPUState *cpu)
     s->cpu = cpu;
     s->info.read_memory_func = target_read_memory;
     s->info.print_address_func = print_address;
-#if TARGET_BIG_ENDIAN
-    s->info.endian = BFD_ENDIAN_BIG;
-#else
-    s->info.endian = BFD_ENDIAN_LITTLE;
-#endif
+    if (target_words_bigendian()) {
+        s->info.endian = BFD_ENDIAN_BIG;
+    } else {
+        s->info.endian =  BFD_ENDIAN_LITTLE;
+    }
 
     CPUClass *cc = CPU_GET_CLASS(cpu);
     if (cc->disas_set_info) {
diff --git a/disas/meson.build b/disas/meson.build
index f40230c58f..832727e4b3 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -11,6 +11,7 @@ common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
 common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
+common_ss.add(files('disas.c'))
 
 softmmu_ss.add(files('disas-mon.c'))
-specific_ss.add(files('disas.c'), capstone)
+specific_ss.add(capstone)
-- 
2.34.1


