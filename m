Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A8325ECA
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:20:01 +0100 (CET)
Received: from localhost ([::1]:33180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYLw-00079P-HB
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY8E-0001yR-9e
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:50 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY8C-0004Ee-1l
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:50 -0500
Received: by mail-wm1-x334.google.com with SMTP id u11so794079wmq.5
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXNkYFS5l7kUXq9kRDwi/4xS2o8Je0/mCuHM1El/ua4=;
 b=LKI5PMZ4Pc2Oa/wQqDLgWbxVDAe0Bw7KRVJgcYnkkMDc1SHpKmwmvg0o+pncY2vs9S
 3PS/GpqboSHsQWVs/tCqYs7KT9ysLgMvDnzSaW5Km8JtOqa5UhoOgQdQkmSHuCcEhJZT
 /wIIB8Fvkbc2OxjveQWEpe8C3m9zf5oe5e+nePNVUuiOYpLz7R1m5D8uCtXsqLtujzZm
 XUP5Ry3Jsa/SqpX8Gny8Nf+wNvaNs/XePpp/VGf6RNOTzHgHrzn6ox8C0hhWadLpuc3x
 vE4qiTdEWYp+PgLSpUGXqSLq+wk032EsH2TsOZGY5EpaVsGESGw3KtebBSGFdbRWg4kx
 JQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LXNkYFS5l7kUXq9kRDwi/4xS2o8Je0/mCuHM1El/ua4=;
 b=UMpdYaYRnUPetiQlILmItw03ZKV8ETw/xi7fGJKoTGK+LW0ZNs1nvpcJLZx7cTluFg
 dPR8k1AtA7whIpZi+/Ls6XAX1yw0jUQ3L/b3iziE96FAEC5fyspLuLKjQrBrOf0oAkkm
 aGu18yCrhyQaHZh8t/sMJgzfSHWatCAVSN/6r7IE9OZSMB8EM3XZcScu/VvtZeMJareh
 Sq3N0+Wsiql/xr8osjRPDStbbtsTuuHp8rHyyIfX5TYTqFP9ipIVnnbfxsWLIocRNu8S
 Irsl6v38YB8/PbiUrqZlYbky6epnsl988JNSGBj6Ap363bDXpIrFzQPzohdxAlmuLT75
 CEAA==
X-Gm-Message-State: AOAM533JjF8ERlfsmZY4P6JHcWr5f9tAUsB2+nfa2U5/+rUQNO4BHSqd
 St5juu06x4hhsZuE8pi2scKdIkwaUyE=
X-Google-Smtp-Source: ABdhPJwnR/d1q5II2L5dZNRNd2teNKu3fPiaKE4gWNSE6vwWYiY7OS7kQkia0fY7J/XzXompKZhV6Q==
X-Received: by 2002:a05:600c:4f91:: with SMTP id
 n17mr1586279wmq.48.1614326746587; 
 Fri, 26 Feb 2021 00:05:46 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:46 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/29] tcg/i386: rdpmc: fix the the condtions
Date: Fri, 26 Feb 2021 09:05:26 +0100
Message-Id: <20210226080526.651705-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Zheng Zhan Liang <linuxmaker@163.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zheng Zhan Liang <linuxmaker@163.com>

Signed-off-by: Zheng Zhan Liang <linuxmaker@163.com>
Message-Id: <20210225054756.35962-1-linuxmaker@163.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/misc_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index f02e4fd400..90b87fdef0 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -222,7 +222,8 @@ void helper_rdtscp(CPUX86State *env)
 
 void helper_rdpmc(CPUX86State *env)
 {
-    if ((env->cr[4] & CR4_PCE_MASK) && ((env->hflags & HF_CPL_MASK) != 0)) {
+    if (((env->cr[4] & CR4_PCE_MASK) == 0 ) &&
+        ((env->hflags & HF_CPL_MASK) != 0)) {
         raise_exception_ra(env, EXCP0D_GPF, GETPC());
     }
     cpu_svm_check_intercept_param(env, SVM_EXIT_RDPMC, 0, GETPC());
-- 
2.29.2


