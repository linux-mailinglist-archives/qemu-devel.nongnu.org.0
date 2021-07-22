Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F973D26F5
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:42:49 +0200 (CEST)
Received: from localhost ([::1]:40870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6aqW-0006sL-DJ
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akJ-0000ae-Sh
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:23 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:38781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6akH-0002ja-6r
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:36:23 -0400
Received: by mail-ed1-x529.google.com with SMTP id ee25so7314277edb.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0CUu59jU+QrLXiW2oOeunVguInuponinPtlaQBzYVEQ=;
 b=EdepfyFi3KBEG3DusUCfa0bc3FKECXEu+eaK6AXJAhnl6Xba5XLfgKQswY3r2mLgs4
 slXZkfOm3YqfXIjyYTch/OvP7KdvApDvsBBt74a6sqVHv4jqY4BpbfzXztr4M0PSbYDC
 t+X9IXM1/KFhaPgLeK2nAsM3MWuTca2KD6rPu6yeqm73Pvh2kI5BDs2fHDEYPH8YOgfz
 2Jl6+Ot2sDfyNv8qtASNk8wjyFFF83K2PZsosgafm9V63QaVAOuaiqveVZDlewliQcxX
 F6te4T/2QWKj9uvsSI2Kfqd5D5zZWyMQ3TD7lyYBO5tujJTeYjQUz4vJAsM0l1udLOv0
 r0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0CUu59jU+QrLXiW2oOeunVguInuponinPtlaQBzYVEQ=;
 b=V3ckWJBHAoBSbATz+qYi1AkvH11J0Kubb/mBOFzRfKKahEoEnInJT1HF0w2jXYrm5A
 esg0e7AEJAzpg29P9QoPoT7wBeXRp1OqaHA/l3+hB40GEeN4pLlWnZ229yx8F+P7oS/q
 ek7EI6L3RCSXPvvzwyFNLSDNoVrHbeGTO+uCaxcHIlJKhheKB8nyyRSXKPnoRi0MSJmc
 ocAwbIUF7cJveXN5kHZPez6KtFZ8RHsyxyxrgREgcIF1trmIo0wMt6801HZ75KfPlkd2
 76v9GtdOcR/TBNSquPcHYsVPJ/TN/Yiekus5mhP4+B739agK35fERR9fqg+ITpvupPZS
 1V2A==
X-Gm-Message-State: AOAM532ODb+59W6vhonOAc4aZbjW2hx98sMJBAqft2yCxcDt0BDRJkEB
 ADYjTAFXSjjNkXlstLKaXakdKVrp3zHpCA==
X-Google-Smtp-Source: ABdhPJwlgXzrNDF2iXlEjQJX0yj4klOckEjq1TB7ZyWET9NhuLkn14Uge4pZp/LQjWgrdHfyvQtNeQ==
X-Received: by 2002:aa7:de92:: with SMTP id j18mr235793edv.141.1626968178961; 
 Thu, 22 Jul 2021 08:36:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id qo6sm9638628ejb.122.2021.07.22.08.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 08:36:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/15] target/i386: Added V_INTR_PRIO check to virtual
 interrupts
Date: Thu, 22 Jul 2021 17:36:04 +0200
Message-Id: <20210722153612.955537-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722153612.955537-1-pbonzini@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

The APM2 states that The processor takes a virtual INTR interrupt
if V_IRQ and V_INTR_PRIO indicate that there is a virtual interrupt pending
whose priority is greater than the value in V_TPR.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Message-Id: <20210721152651.14683-1-laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 00618cff23..72b03a345d 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -65,6 +65,16 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
                            sc->base, sc->limit, sc->flags);
 }
 
+static inline bool ctl_has_irq(uint32_t int_ctl)
+{
+    uint32_t int_prio;
+    uint32_t tpr;
+
+    int_prio = (int_ctl & V_INTR_PRIO_MASK) >> V_INTR_MASKING_SHIFT;
+    tpr = int_ctl & V_TPR_MASK;
+    return (int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
+}
+
 void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 {
     CPUState *cs = env_cpu(env);
@@ -290,7 +300,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
 
     env->hflags2 |= HF2_GIF_MASK;
 
-    if (int_ctl & V_IRQ_MASK) {
+    if (ctl_has_irq(int_ctl)) {
         CPUState *cs = env_cpu(env);
 
         cs->interrupt_request |= CPU_INTERRUPT_VIRQ;
-- 
2.31.1



