Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88E76FCB62
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:35:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQHO-0004gj-Tv; Tue, 09 May 2023 12:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQHM-0004g6-He
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:33:32 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQHJ-0007W4-UD
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:33:32 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3062b101ae1so3922549f8f.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 09:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683650008; x=1686242008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tk/Olu2Bf85J93sQfImDeFqS8c5LlV3FpMEjcgGhhmo=;
 b=eGCKOfeiqbtPsifTphZYfQauUGLIJZYYRwJbi4KDonDeSbGSz+g0XdLaYQPGcZFqSC
 jbloXOO9BmEl01/gd1yl63TCQzRVQfKoGvRMlokGvsFPJqM2g0kgYXEaLFk8oEzoS7zb
 Gm5cIidv+QJNFhZenOmeB+DxdDJpOaNjFMF/blWqVBNQCqNrh8I9cSlbvBdDaMMvP8o6
 AzcuFwsTtpMNXP5J1dSgEqMweDQdwQdidjDECqfpHGIbxR7IN7udkAOLxSAJOt5vKIni
 zJNdAL9eJCMVkTW78RgofXPYY/7T1gSzpP2t13DgZepYjjOB5FsvpKAR+Jswgog1whdA
 PG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683650008; x=1686242008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tk/Olu2Bf85J93sQfImDeFqS8c5LlV3FpMEjcgGhhmo=;
 b=WV3LStnObpqdf6qlT66pcG9ZNT+LmNvdSLQ3zYjC5XXhQXf14MrznUF/Q1nY8gOf/f
 0m6rv836IlWnFuXzzq+Ru+24ew2XyLBox2hS8NbXa1g2jGDmG7nOq3qa0dQJV/kUSUZ/
 x4KFsJ4Fvs7MZez5QAn6aPBJCP0nkrZGNpZ8G+MvjbR2N4v+ET45vOIcQ1GN0n4gkwrD
 bYttrqErq1ONSUzl3YQCAGV+zJoWmlct1ehxy2W701PsSCakteVKC9USXLi8VUMZy6W4
 zP8cH0xfd2UwjszhjPn8SjMRXFsxx+dO1GQh4cRhSNGeQcdFCr+uaXr1YnoYyKEpFSIB
 7mGA==
X-Gm-Message-State: AC+VfDxKA4tdrpllJyC50+dSqyU3nf9bymsPo1Mlq4uHYiXIBMcgJLxs
 7tEhKVAtORht3oIw829SaA05sJX1gvcb6mIHISvuKQ==
X-Google-Smtp-Source: ACHHUZ7AImXL/d+ISao7ILFDt3aDEFwAV2kNJ1dHcKUORAPYBKLxptlgZaUspUFUe5PJ5WMcrnhibQ==
X-Received: by 2002:a05:6000:1148:b0:306:36e7:db27 with SMTP id
 d8-20020a056000114800b0030636e7db27mr10225513wrx.16.1683650008443; 
 Tue, 09 May 2023 09:33:28 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b0030795249ffasm7393298wrj.92.2023.05.09.09.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:33:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng,
	philmd@linaro.org,
	thuth@redhat.com
Subject: [PATCH v2 1/5] disas: Move disas.c to disas/
Date: Tue,  9 May 2023 17:33:22 +0100
Message-Id: <20230509163326.121090-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509163326.121090-1-richard.henderson@linaro.org>
References: <20230509163326.121090-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230503072331.1747057-80-richard.henderson@linaro.org>
---
 meson.build              | 3 ---
 disas.c => disas/disas.c | 0
 disas/meson.build        | 4 +++-
 3 files changed, 3 insertions(+), 4 deletions(-)
 rename disas.c => disas/disas.c (100%)

diff --git a/meson.build b/meson.build
index 229eb585f7..d56358b65f 100644
--- a/meson.build
+++ b/meson.build
@@ -3152,9 +3152,6 @@ specific_ss.add(files('cpu.c'))
 
 subdir('softmmu')
 
-common_ss.add(capstone)
-specific_ss.add(files('disas.c'), capstone)
-
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
 #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99696
diff --git a/disas.c b/disas/disas.c
similarity index 100%
rename from disas.c
rename to disas/disas.c
diff --git a/disas/meson.build b/disas/meson.build
index c865bdd882..cbf6315f25 100644
--- a/disas/meson.build
+++ b/disas/meson.build
@@ -10,4 +10,6 @@ common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
 common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
 common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
 common_ss.add(when: 'CONFIG_XTENSA_DIS', if_true: files('xtensa.c'))
-common_ss.add(when: capstone, if_true: files('capstone.c'))
+common_ss.add(when: capstone, if_true: [files('capstone.c'), capstone])
+
+specific_ss.add(files('disas.c'), capstone)
-- 
2.34.1


