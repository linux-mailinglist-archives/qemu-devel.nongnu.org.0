Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FD82B7B22
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 11:24:03 +0100 (CET)
Received: from localhost ([::1]:37218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKd8-0005HB-2d
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 05:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ5-00008j-A6
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:51 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kfKZ3-0003fO-Js
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 05:19:50 -0500
Received: by mail-ed1-x534.google.com with SMTP id d18so1399062edt.7
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 02:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rJC+t5jNQH+UoJIDaWfC2vUnw9SNYRVaW7Ew+YrAB9c=;
 b=A8ZU/kF514yUn+WY/HQJlgQ3LDLY1H7taSzjW+3o1d8/INOdeYGX58GT0iHlbtV0QA
 XWWGxNUrFi09c7iGTozZijTSq0gdc1eH1mr+xO4+M38KabK7SfmJDO/oXu/Aa6FNtlBR
 DC7AzRNXxxqyFSkA+9vtUCrWmbsl9SxXu2oyupu9/Owhl/ON0yva78CWa9ZM6cNuwbdN
 gnP6SzP+4Hmiw5lTwEYigiC8Fr0GWYIxmE5BpNyrUC7zSM2fYMlPSgASk/YtDU/1+ZK7
 Zl59pnp+KPgP8MQGdTAPXGxcC4naZTW2Qxln970dYjearB6VP6mLExivR7b5cbsBZZXU
 u+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rJC+t5jNQH+UoJIDaWfC2vUnw9SNYRVaW7Ew+YrAB9c=;
 b=KRoBNsJpZ85UeYNLZBWwNCJxAlbngcdjvRKqe/deVY8KoDz+yUSmDcDQFdhCvX9GX0
 onKrYy1hVGNphNkNRj/b2DwiPI3n2uFuwwuZOBCPEyGAMs2b+5Ev4ZXuxLxex2P7mm90
 qn8WZ/wYAxjwXDF//+wRu4FfeSf/X857xbChtkzQ17VPRNeBjrh++ZTc6WjCaIOSmKOC
 sFniIRyBG8eGcSdv3eEoh+esDbKWd9pS+Jl6TN8N7OBku90Fp0/EIZq20wPSPJVC+VEK
 MnzEO/l8Dstu14fUS+j9Au5cRjjUajEE9hD0KT4KQIydZjP3Lzmk7DwRAh80LWEujlRJ
 J4rA==
X-Gm-Message-State: AOAM533hi8PfHiLQ2EzznmyoLVOZtrnnCQH1Jgj+skf6ihYFwewrJfNG
 TIhsPiGbk+BwtqeyYw4B+bcPvnsCBso=
X-Google-Smtp-Source: ABdhPJxwQMXqrmbs9vMngweBkaSNF9YBEpudkjYW71JvJXYqMpR5pWSxj+pxbQ07qkrH5OM9pw7b5g==
X-Received: by 2002:a05:6402:2206:: with SMTP id
 cq6mr8042597edb.163.1605694788022; 
 Wed, 18 Nov 2020 02:19:48 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f24sm13230052edx.90.2020.11.18.02.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 02:19:47 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] hvf: Gate RDTSCP on CPU_BASED2_RDTSCP,
 not just CPU_BASED_TSC_OFFSET
Date: Wed, 18 Nov 2020 11:19:38 +0100
Message-Id: <20201118101940.132594-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201118101940.132594-1-pbonzini@redhat.com>
References: <20201118101940.132594-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Jessica Clarke <jrtc27@jrtc27.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jessica Clarke <jrtc27@jrtc27.com>

Buglink: https://bugs.launchpad.net/qemu/+bug/1894836
Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
Message-Id: <20201116200319.28138-1-jrtc27@jrtc27.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/hvf/x86_cpuid.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index ac731c2b85..a6842912f5 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -122,6 +122,10 @@ uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
                 CPUID_PAT | CPUID_PSE36 | CPUID_EXT2_MMXEXT | CPUID_MMX |
                 CPUID_FXSR | CPUID_EXT2_FXSR | CPUID_EXT2_PDPE1GB | CPUID_EXT2_3DNOWEXT |
                 CPUID_EXT2_3DNOW | CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_NX;
+        hv_vmx_read_capability(HV_VMX_CAP_PROCBASED2, &cap);
+        if (!(cap & CPU_BASED2_RDTSCP)) {
+            edx &= ~CPUID_EXT2_RDTSCP;
+        }
         hv_vmx_read_capability(HV_VMX_CAP_PROCBASED, &cap);
         if (!(cap & CPU_BASED_TSC_OFFSET)) {
             edx &= ~CPUID_EXT2_RDTSCP;
-- 
2.28.0



