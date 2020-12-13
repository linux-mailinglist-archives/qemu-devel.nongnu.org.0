Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E812D9074
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:24:18 +0100 (CET)
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXuj-00070w-3u
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqq-000154-Hv
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:16 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqb-00053F-8K
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:16 -0500
Received: by mail-wm1-x32e.google.com with SMTP id d3so11950575wmb.4
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=39WDzgrzKw1HI9cbUqd/4nglotTqMx2ozVZiEV9EMeo=;
 b=HNeZlXVtc7YfjiBul+Rccx5JKDxdpjacjieOOVNOFISfGRL06tM3qvroTYE1jrNqfZ
 QcQZ6KXhyY8ucZpcziHxytnf1cM0TZk40qOl4gCcD0ZGmVx58ssLywumZ+c9fOCHu7m/
 PtVXnTWWnDmZapEKqWpEOAguvf/tkTkTOMpwnZ1vEYZpOk7KOwKwkrlIjfkj9yeg02XR
 49rsclJmeSCajmC5NXGljEy7aevH63eryJL068edfTaKTGUOTDnQvoa1lBKogaNAcPjv
 ZoOTWDi0x/6iJHEro0xLrcAF7PruNCGo9iVGZ9vqukZaNKkNUCuThrGHNzuoYEjeGC7d
 vq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=39WDzgrzKw1HI9cbUqd/4nglotTqMx2ozVZiEV9EMeo=;
 b=Q46ctknyYwXGxY7T6bp9BwVnbSr/se4IuEkRbGnuangrq+AuMmjBLR3jUwW6iL2Z9W
 G1ph1i0ADei2OxlJmqWLNcZQfoe/phlfqcCQ8rMhhMNSFCZ9VY+uVPvHkYQMrIUWcgRj
 dLvQguDAJ+KadvOUJ+V0x3aS0xGeburRWRIbf99FAO/BKwgV/WCIWWH0c1/esGSvdQAd
 HkqoczcverqkEfxQ1BiQvPvcy0ZwUiwcMHeHkIcsiUjBw13xt90KBCoFEZ8Gqp98nSw+
 e6Wif1hcbD0mYlSudMBUYVSKCZrVZqoDRmDEqX9UXKUdYN5Ow2tfs8EL9zfujCoaRDMa
 FAzQ==
X-Gm-Message-State: AOAM532K8kcTqQUcc7e2ZVvnJdyv+kS3EXdFPx0IJsB/kOlFpw/36VYo
 9McQVqeTypCvsFkeC7p4+hHl/TAexh4=
X-Google-Smtp-Source: ABdhPJwOC+VH1ItUocY5MR5+0dEvvtca8Eo/rZUkwGTsvktz0B4ZV7qWU/u1sqZ4Y1ulDcTps9maWw==
X-Received: by 2002:a05:600c:224b:: with SMTP id
 a11mr24308206wmm.97.1607890798961; 
 Sun, 13 Dec 2020 12:19:58 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h13sm28766022wrm.28.2020.12.13.12.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:19:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/26] target/mips/kvm: Assert unreachable code is not used
Date: Sun, 13 Dec 2020 21:19:22 +0100
Message-Id: <20201213201946.236123-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This code must not be used outside of KVM. Abort if it is.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhc@lemote.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200429082916.10669-3-f4bug@amsat.org>
---
 target/mips/kvm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 72637a1e021..cbd0cb8faa4 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -198,9 +198,7 @@ int kvm_mips_set_interrupt(MIPSCPU *cpu, int irq, int level)
     CPUState *cs = CPU(cpu);
     struct kvm_mips_interrupt intr;
 
-    if (!kvm_enabled()) {
-        return 0;
-    }
+    assert(kvm_enabled());
 
     intr.cpu = -1;
 
@@ -221,9 +219,7 @@ int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int irq, int level)
     CPUState *dest_cs = CPU(cpu);
     struct kvm_mips_interrupt intr;
 
-    if (!kvm_enabled()) {
-        return 0;
-    }
+    assert(kvm_enabled());
 
     intr.cpu = dest_cs->cpu_index;
 
-- 
2.26.2


