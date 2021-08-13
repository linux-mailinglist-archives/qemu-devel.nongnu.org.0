Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33D13EB61E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:38:35 +0200 (CEST)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEXOM-0003F5-OQ
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mEXNE-0001V0-Cn
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:37:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:42734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mEXNB-0002eO-N8
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:37:24 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 w21-20020a7bc1150000b02902e69ba66ce6so6947729wmi.1
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pz8E3tBHBEc3d4oLN+SxPWKL9wotay9tz0md2XGiUlA=;
 b=BKpJ6+aQmpdkcEsCBxXri+/o5r3nNs6ML2w0mlEQyk1MMvx1OslSdroo1SE9NEM9OJ
 IKwTyaVf1wSwZ8DKsZXvoopL8l52q4GwNGnQcZeYuOkEvuNWe+TmHov0S4o1lBKfWxSj
 wvuQ8NAvSU3vcFqMjlbYgTyP8b/kEzXpGkv9PNRol+UE+D9g2TdUaJukQiR2AgjXLHlF
 sSf9ai3zl7XOMkPByCJpF5XgUZIslJJiD92fa7M777uIttk6KAeFy3uhGVWifZRyydG/
 W/VmCmcO0eW5fSyrs2NI4SBU9CdhaDStPbiugEKjwBdLaSaCxu5V8tDOBpo5uJ9CVVWE
 HWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pz8E3tBHBEc3d4oLN+SxPWKL9wotay9tz0md2XGiUlA=;
 b=muSlY2TNdvqFALZssDKo1xGXut8m+iVWQtpAbpV7AQtMG8IzVMZIdVnwSv89EK/RjW
 rpPgshyRRkxNgifR9MGHEOZmuliMaJBQOXDHWO2QFZb6yNnOzNUYFXe8MHZyr6ewIWjE
 QgZRrIvfefzyO3JrXnFI8HWVdd08NWnrSiRoERekxD7q/gG9qgGammpqbBK9BC5XD5E1
 LhdJK6mMHQ7KwU8LhSCEYwVqafxn26JSbHvP3nSGyiebtYcaUfbNvs7ICZk5clFIgmEM
 n238VM1R0cVNe6kDC+E3DgpardAO3V+xTkNihTn9VOWLdVjDaAIXHD/ADnG3pfvDYH/J
 Kw5A==
X-Gm-Message-State: AOAM531OJoql+Ou9zEBFzr41bpo71O65TaURkHABJOGoNZrwFa8Uj683
 kbtwOtJHnqygki96ZQgBtx/3v7RdTP+LMA==
X-Google-Smtp-Source: ABdhPJx1nkEpggx8EDK1rwJ4vujCFQtIRKpk293KQOEWSSSNGyP1hOCaJrfaU3Ao4hUQ6eecjQs4jg==
X-Received: by 2002:a05:600c:4fd3:: with SMTP id
 o19mr2781550wmq.34.1628861839381; 
 Fri, 13 Aug 2021 06:37:19 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm1413671wmc.19.2021.08.13.06.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:37:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] target/i386: Fixed size of constant for Windows
Date: Fri, 13 Aug 2021 15:37:14 +0200
Message-Id: <20210813133716.289058-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813133716.289058-1-pbonzini@redhat.com>
References: <20210813133716.289058-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Lara Lazier <laramglazier@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

~0UL has 64 bits on Linux and 32 bits on Windows.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/512
Reported-by: Volker Rümelin <vr_qemu@t-online.de>
Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210812111056.26926-1-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/misc_helper.c | 2 +-
 target/i386/tcg/sysemu/svm_helper.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index d347af2a99..e7a2ebde81 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -97,7 +97,7 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
         break;
     case 3:
         if ((env->efer & MSR_EFER_LMA) &&
-                (t0 & ((~0UL) << env_archcpu(env)->phys_bits))) {
+                (t0 & ((~0ULL) << env_archcpu(env)->phys_bits))) {
             cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
         }
         if (!(env->efer & MSR_EFER_LMA)) {
diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index e151104b4e..0d549b3d6c 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -264,7 +264,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     }
     new_cr3 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr3));
     if ((env->efer & MSR_EFER_LMA) &&
-            (new_cr3 & ((~0UL) << cpu->phys_bits))) {
+            (new_cr3 & ((~0ULL) << cpu->phys_bits))) {
         cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
     }
     new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
-- 
2.31.1



