Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E70314261
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:56:21 +0100 (CET)
Received: from localhost ([::1]:49980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9EW4-000201-E7
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCL-0002wE-2W
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCJ-00064e-Ge
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id i5so55555wmq.2
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2ZrhSGZHZsewA1YLv+O2cscVrZTHkKVYgMwlTBRd5Qk=;
 b=NoY5jSyR8XDupV+I6XhCuhN6z2Np0YxzPlq0drZwb1Npfz79I3DJ6b1wRrxden5jvT
 qh/58maVFCpSiNHRBX/oNloXsWj1agGjcIXgdNL+F4Nlihi/RBQjxXpX0vJXRyRP/XYv
 05R5gdJ3v6934AlW3X2PbVVmrYGmfvaBcv44Wqrr5HXooxAGZRf8SVZjFaj4JoqXSMVI
 RLfpUlpMTEqMseU1B0vVfdGW2SZ79wmCRjhqMoWphJzOLulVRBtACe6KEui4Q9JdXx2t
 neGZQC3go5rhnQwsYT9N42klxvYEseZCG5+bcw4tey/6P+26gr2ZEj3z92E7UOqLiL9d
 CJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2ZrhSGZHZsewA1YLv+O2cscVrZTHkKVYgMwlTBRd5Qk=;
 b=P+HCdwHrEHe/LW05PjuhMF7eJsZqbWWNPoxK2rQn12It8sg4DMA071qVfsrWfFwk3f
 uNVSmb3m1VfMaRpKLH1calDfOFoodsKyb8K13TqO8IrKyQnx0du9bkZ88VkHyCwW9iA4
 cxJzP15YyGKT+puTPcLmvgJdyXlxWoiRodWxnH6Ri4iNqS9rTlv0fRQCNGKyIOeCsxx3
 +8AvcfSckWmEePTaM7wpce+H0qPXwqGFKy9wH5VVf9OWB6YLQAuy2DJ/IF0HxTJmx3Fu
 WOTyMs9FoL5VCs4X+CWhmPnoUQ0ts8+pK9ixbSQgUFiaPogEAW5IRsimdTkhrbpmBDRV
 jmjQ==
X-Gm-Message-State: AOAM532K4TkGk3VAopbsZrl2/6sHG2c34Fywz8SSbymQ3uzeQ9u9z9G1
 KV709qPc7P/k89hgKyfTbaEMgAgwynF+jQ==
X-Google-Smtp-Source: ABdhPJx5RivjIg1G0F+pIKDtkiwQwAzveGTQi/OdYr0u9z/MFybWqcpVcBcRTs6+P1LyWEVVxxciTQ==
X-Received: by 2002:a1c:b386:: with SMTP id c128mr95451wmf.48.1612808621138;
 Mon, 08 Feb 2021 10:23:41 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/46] target/i386: do not set LM for 32-bit emulation "-cpu
 host/max"
Date: Mon,  8 Feb 2021 19:22:53 +0100
Message-Id: <20210208182331.58897-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Nathan Chancellor <natechancellor@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

32-bit targets by definition do not support long mode; therefore, the
bit must be masked in the features supported by the accelerator.

As a side effect, this avoids setting up the 0x80000008 CPUID leaf
for

   qemu-system-i386 -cpu host

which since commit 5a140b255d ("x86/cpu: Use max host physical address
if -cpu max option is applied") would have printed this error:

  qemu-system-i386: phys-bits should be between 32 and 36  (but is 48)

Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae89024d36..e775e9abb5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5073,6 +5073,11 @@ static uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
     } else {
         return ~0;
     }
+#ifndef TARGET_X86_64
+    if (w == FEAT_8000_0001_EDX) {
+        r &= ~CPUID_EXT2_LM;
+    }
+#endif
     if (migratable_only) {
         r &= x86_cpu_get_migratable_flags(w);
     }
-- 
2.29.2



