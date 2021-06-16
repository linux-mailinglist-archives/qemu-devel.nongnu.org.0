Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E70E3A9AA4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:41:54 +0200 (CEST)
Received: from localhost ([::1]:40634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUrh-0005sJ-4y
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1ltUpB-0003gm-Pr
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:39:17 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1ltUp7-00069W-9z
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:39:17 -0400
Received: by mail-wr1-x429.google.com with SMTP id m18so2533250wrv.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8QeHA3fK/tK5jYHp8SBl5piD8FuF+9/wRu8LweRdjgk=;
 b=pFvr/YDysdOk0R8s1mfEitgfx38oxbBo46KnWIMehkO51z/TS0M6Y4G91Jl1d8MT+k
 zNsoKBP3NcvAaZA2J5DhdGYti2ofg4SqeTuCiiUShybkjUfnHS86NvTn8HD1bOo8VsPR
 LjXoigvoa9ZRc8/wK12blVr5WuE3Gk9/uzbgrnMQJd0eJ4JuDSKQfPlb04Q6oP3CYL9a
 bmPQ+SDV6a8mAtQOp8GUHdXHyue3stMQhZ7+z4EGiJ0stZNmSFfJRb+3pBnJ1CM/4x6T
 XQZFfNHvWjjndwo6edGcnrstKdHyjouSEcAUsOcklIt41tCqJ+8pDiBydwiwASJ71GKJ
 TTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8QeHA3fK/tK5jYHp8SBl5piD8FuF+9/wRu8LweRdjgk=;
 b=C5h9aBSyorwl+VsnouFdbHgDlMPQJOiIdvxvRZsEzyZymDkAp7MbDXn3mxfXgk/9G6
 fhnspiRPD3ztR46eAzsvsIR8if1/51HR/kKOEDjV4LQEeZogHvzLQQgfws+xnqwrtrsV
 INFhuDAQ22tMJ2ix7ZeUXBh7gDswaMPBkl8GQv6cjY5B2V01J9iq+vAnnl9kN/uxwNLq
 yTpLlyQCXB501zOoDsfypurU32CvrbRuXRWB/4/DM3Abp1bGATlzl90Q9MR6Q6ptZHx+
 fg53ea20t+B+3Z/n7hy+EoVWqm0h4GwNlQTDxNo2SKwdrxsZ5p85OVLFDasWARV3KsMg
 I82g==
X-Gm-Message-State: AOAM533SSLkj/UuKHZDP5VjeTTXqPsx+GDsFNEQk/Z3GFId32LLlT7P/
 DAbHIQyY7ThJjmIxVc+/NWzGb6WQFFSbPg==
X-Google-Smtp-Source: ABdhPJyiwi0TujOO9rTK1QjvJKBmFiNZyFky/oT50JIGCBxxLvVnbuaX/B6nuiXoN5pDfAO12ekTtA==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr3223554wrr.162.1623847152054; 
 Wed, 16 Jun 2021 05:39:12 -0700 (PDT)
Received: from localhost.localdomain ([82.197.173.73])
 by smtp.gmail.com with ESMTPSA id c12sm2330273wrr.90.2021.06.16.05.39.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 05:39:11 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] target/i386: Added Intercept CR0 writes check
Date: Wed, 16 Jun 2021 14:39:07 +0200
Message-Id: <20210616123907.17765-5-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616123907.17765-1-laramglazier@gmail.com>
References: <20210616123907.17765-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=laramglazier@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the selective CR0 write intercept is set, all writes to bits in
CR0 other than CR0.TS or CR0.MP cause a VMEXIT.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/tcg/sysemu/misc_helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 0cef2f1a4c..db0d8a9d79 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -84,6 +84,15 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
 {
     switch (reg) {
     case 0:
+        /*
+        * If we reach this point, the CR0 write intercept is disabled.
+        * But we could still exit if the hypervisor has requested the selective
+        * intercept for bits other than TS and MP
+        */
+        if (cpu_svm_has_intercept(env, SVM_EXIT_CR0_SEL_WRITE) &&
+            ((env->cr[0] ^ t0) & ~(CR0_TS_MASK | CR0_MP_MASK))) {
+            cpu_vmexit(env, SVM_EXIT_CR0_SEL_WRITE, 0, GETPC());
+        }
         cpu_x86_update_cr0(env, t0);
         break;
     case 3:
-- 
2.25.1


