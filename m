Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED1031BA72
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:37:35 +0100 (CET)
Received: from localhost ([::1]:37100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBe4E-00076y-9k
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:37:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdk6-0005lb-MG
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:47 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdk5-0005bQ-C3
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:46 -0500
Received: by mail-ed1-x531.google.com with SMTP id y10so3131341edt.12
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mMLsMq3LdsiwYZYkAKBGxeQQfZ5vW9qSwDuSz8zkItM=;
 b=SR30BVsDLdqYXhHEc1OK45mIcM5fH3W7aj/7Ql3+ROySTmAMcqxudflR5XBqrEjgQu
 g1oCvDlCAvC1NBvWaX1Dwk8kAkD/h8Jco9GKW/HNqoRF+dizqvfGnDiVEaaHRrfr/Wwu
 UHwuLvewXMKPLZvtKaygEbn517c6SMH+Bb2pq9b1epbvR0NXKmbj/9yFvlmOHZ5+/Pq5
 xQdqVdRBc6iJp11qzuwogP+6uD+Cobw/hHdlMSThZ9Q2edkXXFYgk+rlllk9PJucfFrV
 ppC9G0E1G2kjL+znkJIwkIt0CIQKH9NH9PHVb7M4pI1d4sQjV4BiVIDHPemxXWu6RzST
 oiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mMLsMq3LdsiwYZYkAKBGxeQQfZ5vW9qSwDuSz8zkItM=;
 b=GnhvNe4vQNdxiaZsbzQ1B7v0oyT7krAPQDq4y6cskQ5aP77+UdFgfcalX/WTDKUw2s
 jL7Tq4o50ctddnLau6TPOQC7E4L0uFGnfvS/Y77L6wK2MZn38fEUbNeFRu7Tvfgu7Cb9
 W5U1zpof2ARjZoMGFkIcOSINhcj4wBDmIlQF1WgAwDGDxXyyNi2D3gCLoh7N5oZ8YQd+
 aWWJ+RiVP51RammZGuiBhH8kCquSZzkQyK11cZrho7wJCB4AyA8e75k9YIAPQZuMFYI8
 ij7io+fJHeto+rvhv2kgJX6Difcc3z9yAIN3QbLyjZjg9bwRYFvx4DzJ3rSSRFTT7z5c
 1s+w==
X-Gm-Message-State: AOAM532kFJbYHLXR5MC9+Igo0cr6WjwSuPZAMsw57ajgRALqAf3080Wz
 XR6iHYMv/y1FTMq2nl1flntYUh6qnKw=
X-Google-Smtp-Source: ABdhPJy8bMncpTLO0DZluRdd+3iAAqvmDHd5LVTpYh6ZyrYwmiEtX1Ov+wRc3n7ohiGlUJUIW0dOsA==
X-Received: by 2002:a05:6402:17aa:: with SMTP id
 j10mr15805587edy.184.1613395003931; 
 Mon, 15 Feb 2021 05:16:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/19] hvf: Fetch cr4 before evaluating CPUID(1)
Date: Mon, 15 Feb 2021 14:16:26 +0100
Message-Id: <20210215131626.65640-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: Asad Ali <asad@osaro.com>, Alexander Graf <agraf@csgraf.de>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Graf <agraf@csgraf.de>

The CPUID function 1 has a bit called OSXSAVE which tells user space the
status of the CR4.OSXSAVE bit. Our generic CPUID function injects that bit
based on the status of CR4.

With Hypervisor.framework, we do not synchronize full CPU state often enough
for this function to see the CR4 update before guest user space asks for it.

To be on the save side, let's just always synchronize it when we receive a
CPUID(1) request. That way we can set the bit with real confidence.

Reported-by: Asad Ali <asad@osaro.com>
Signed-off-by: Alexander Graf <agraf@csgraf.de>
Message-Id: <20210123004129.6364-1-agraf@csgraf.de>
[RB: resolved conflict with another CPUID change]
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 10a06c3c79..15f14ac69e 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -828,6 +828,10 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t rcx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RCX);
             uint32_t rdx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RDX);
 
+            if (rax == 1) {
+                /* CPUID1.ecx.OSXSAVE needs to know CR4 */
+                env->cr[4] = rvmcs(cpu->hvf_fd, VMCS_GUEST_CR4);
+            }
             hvf_cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
 
             wreg(cpu->hvf_fd, HV_X86_RAX, rax);
-- 
2.29.2


