Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C24CEBA4
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:11:05 +0100 (CET)
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqfA-0006ek-LV
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:11:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqV4-0000QV-V7
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:38 -0500
Received: from [2a00:1450:4864:20::42b] (port=38577
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqV2-0003tW-FR
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:00:38 -0500
Received: by mail-wr1-x42b.google.com with SMTP id t11so19338351wrm.5
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S6HlarxzsTLCc3ubXw/AD8M09tXZtyjlcvU7wFuvrho=;
 b=AldCzovWjAGUQ3aLAzklQfNza32SG0hcLAeYdRmtCUOXinboSnXzpCRnVmckVYuAUg
 oNomLNrdbHd866ZAXLpaG3RAx3R+WR14kor/73KSupnsLd77p3NSlycuEP244goR+uKf
 //edvdNepgaSKATSqs+NSOWhegyYoES9p5kiQgQ8LSDOybW+kSaT5R80XxuoafMUAL6M
 hroilMOK9uRccmpiMBJDOO/2LaissfZZwjC7jbX0wovGCxlG5SvVIA9F6V7CTNX/9XKX
 gIHJ4VfPde7QXDLBYh26c/zRJgmP19Oaam+Gg18x1r/kP16px2+sMiBlGKH+EF2IgJ2j
 29CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S6HlarxzsTLCc3ubXw/AD8M09tXZtyjlcvU7wFuvrho=;
 b=CNbIMfllPoCxSTT904jUrB9aJYKwvUo5oy+XwOk73rsIx6ldAIpSxbIdYkhz32A+1b
 I41jMOD+p6XH0eDKRXt8vcTYeLyiaalbn6OahLHisxOICvWzVcJdaWF41o9NuvpgaMgB
 3BNrdjQaXMAN2kLiAvWwVjPJRox7VKwqdH950uyGlxTGkahbgAreSJ9S5+5+kB01an/w
 dgfZA1KP2NnCu6+E8+3fEmvrbTENDyL/HCbzQwjc9lBRMJJwru1AmJ6jIEHcQEiByDUy
 xHWrtrtX+2TP0iCcZRjotttOLX+7SJdBuYL8wI2Kp8Y5CCVM2g3fKjk/1KVUg0ZUgZd5
 Wc6g==
X-Gm-Message-State: AOAM531kxLiqqQ4rMk73vvnSUPyxVNmFANg55zPRVj0dFJO20fDkFL+N
 ikBCgsmesdMr94oJwKP/KuF8wueSK0Y=
X-Google-Smtp-Source: ABdhPJzJ6MQD56v4J4Lnc+esWIiR4SA42lLEfWCiomxPtRvGmyFlGtbelyKU/mQxF0naI7dLRcmZFA==
X-Received: by 2002:a05:6000:1e07:b0:1f1:d782:2863 with SMTP id
 bj7-20020a0560001e0700b001f1d7822863mr5305025wrb.406.1646571635048; 
 Sun, 06 Mar 2022 05:00:35 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 q124-20020a1ca782000000b00382b3260778sm15368386wme.3.2022.03.06.05.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:00:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/33] sysemu/kvm: Make kvm_on_sigbus() / kvm_on_sigbus_vcpu()
 target agnostic
Date: Sun,  6 Mar 2022 13:59:33 +0100
Message-Id: <20220306130000.8104-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

kvm_on_sigbus() and kvm_on_sigbus_vcpu() prototypes don't have
to be target specific. Remove this limitation to be able to build
softmmu/cpus.c once for all targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-7-f4bug@amsat.org>
---
 include/sysemu/kvm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 6eb39a088b2..a5bec96fb01 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -249,6 +249,9 @@ int kvm_has_intx_set_mask(void);
 bool kvm_arm_supports_user_irq(void);
 
 
+int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
+int kvm_on_sigbus(int code, void *addr);
+
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
@@ -261,9 +264,6 @@ int kvm_remove_breakpoint(CPUState *cpu, target_ulong addr,
 void kvm_remove_all_breakpoints(CPUState *cpu);
 int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap);
 
-int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
-int kvm_on_sigbus(int code, void *addr);
-
 /* internal API */
 
 int kvm_ioctl(KVMState *s, int type, ...);
-- 
2.35.1


