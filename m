Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D47230890A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:23:44 +0100 (CET)
Received: from localhost ([::1]:60864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SoR-0006JG-9t
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rnd-0004yg-7V
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:49 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rnb-00068d-Ni
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:49 -0500
Received: by mail-ed1-x534.google.com with SMTP id b21so10124071edy.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=stTF2/sCknD1Xyj0AFo0/kkV2ifJBYAMHO0Rp0GyT2E=;
 b=DGjwM2ZeNXjyXudCjiXy+vSjCT3vHGSiyFSGNXqj2A64FWQFuVJjzEolYZV3Fthl6n
 7sf04I/M7ux+8To4eMaFOCU32Et2aWkIENVQX9RQd54bWHvitQGDgkOFgMmBnrLMUXZ+
 kXEScn2INn9IYxyu7enwBFl9BSYm1m/MEobScfuA3qqtCdWggFXS4ogNn9wwlsdXdNQQ
 824w8R6Cka0Uqnuu4EfmNvvFuFsllKQSu4Ds+MBhtzve8rJNjR6bBS1mizihUxJZd7uH
 e1o8vWhbNPtD1pKg4UVTUetRnGkWlGOfxWlLfP3Tr556KB1WWSLXa0zCxnZoy8qLneZI
 NkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=stTF2/sCknD1Xyj0AFo0/kkV2ifJBYAMHO0Rp0GyT2E=;
 b=mYpapusN2mOFmFK2x+EigBdrHCWAXyVPR/bu351JAu63Ldz/TdHvCdj2GYdut+Ii5C
 tImo7E42gCuedhUfO/u3B1u4KTl5ic9CsHAxOWaf1KISipMYhflnX/FIVYFOEgrFEGzf
 91LE0s8lUiEcRrVxXHCNBbAA7MFoMVS+SuyblZsPpfwCzA0QR+pLvk3SY135mvcJ8AoB
 N3jgVb0dus6EOEN6J0TSoTjvI8VD0DAw6LrWGrwPC8d2uJPZQsHeiCTEJxqjfTF++sif
 d0eulPiYcNN/mdkq63Q+VLEkxcsVpkUJNY8I052KOTRCN3qe7j8eMw3664RqV06Dw+E3
 Ddkg==
X-Gm-Message-State: AOAM531G9KdfiDPTpAbUII6oxrRCnn6YgjWRJhHjuq9ZY3R2DNmvF0Rt
 UQbKsKAjjO9J4zFmheDXdqNtEgUByj5f4w==
X-Google-Smtp-Source: ABdhPJy6uLyPSgt5be3arB3bxQM0HWUfHwVb/q9U+zVYzUQRisv05mjkdLhl/AbCX/Xlxsjwh0nh2w==
X-Received: by 2002:a05:6402:11c7:: with SMTP id
 j7mr4435127edw.290.1611919126276; 
 Fri, 29 Jan 2021 03:18:46 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/36] hvf: Fetch cr4 before evaluating CPUID(1)
Date: Fri, 29 Jan 2021 12:18:13 +0100
Message-Id: <20210129111814.566629-36-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Asad Ali <asad@osaro.com>, Alexander Graf <agraf@csgraf.de>
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
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/hvf/hvf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index ed9356565c..79970f3d58 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -734,6 +734,10 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t rcx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RCX);
             uint32_t rdx = (uint32_t)rreg(cpu->hvf_fd, HV_X86_RDX);
 
+            if (rax == 1) {
+                /* CPUID1.ecx.OSXSAVE needs to know CR4 */
+                env->cr[4] = rvmcs(cpu->hvf->fd, VMCS_GUEST_CR4);
+            }
             cpu_x86_cpuid(env, rax, rcx, &rax, &rbx, &rcx, &rdx);
 
             wreg(cpu->hvf_fd, HV_X86_RAX, rax);
-- 
2.29.2



