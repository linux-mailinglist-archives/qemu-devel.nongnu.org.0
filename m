Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CF34A8CCB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:56:44 +0100 (CET)
Received: from localhost ([::1]:55050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiDj-00010Q-Lm
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:56:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdn-0002mi-0n
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:39 -0500
Received: from [2607:f8b0:4864:20::1030] (port=39867
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhdc-0002Ij-9k
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:31 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so10927270pjj.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z6e7j9kocYjBLI6/AQ6OQvrdS8sBKMYiEoeoj10G7EU=;
 b=SZ3h1HkyvjIdgZQwN0feMbHhdyrQ4naVFetVXliqqiTQwnZdbnqC49PK0jqq4BhoaE
 xbOwIBjmficHf6ZTuwT17vn5wKFNjc+0fKmx+H7J6QePKnSwQYsUomEwYwGoBcitfHqe
 3fRTsOCo7GAlpo7IfPWEVfKiNopRYZZAIxmw2U/K2f+/2OgGa5Q0URoA8cZhEo/qPl9M
 yvgVDmufgLjke9YCnCvejRWun3w4CbBbXVwu0+zMNr38ZI7Xy3eFxeGPlxkSSFsS3gVi
 cRftprmKyCtSNNWyI/62eOvEQwvODrZ93r07t3WNd7mkRU2/8ajEnWX2ee8cqJggqiS9
 jPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Z6e7j9kocYjBLI6/AQ6OQvrdS8sBKMYiEoeoj10G7EU=;
 b=p1Xa9xmS117qiCPWLnqn4wWHESAPU9NO1AXcNA5gGbthXgrK+m8OJR4v/FqemQCdS1
 i+nwOVmndrmVHeqOaHF7Fri2c98ZFE0epNrI6OhXW7EixIy0hUlEQNlFjO93T/U7vChM
 tTLK85Zub1LSUTIyjFzZFJHxfQgjPp+jGZF75rGUMJHB5IXXSywHXvX00MQQpOvLXgL4
 QzAEAwMXjbuVpuFMHgs/OBY39CzjN2BV45XO68VVa3sbr8VVNc1lgMjTxK4VAZINngqX
 MFelIlaRan+F5rp7CjpOrx0twV4WCME1AC78MzDG3HNSiYP0x8FQ456UOKj7nCbVdNH7
 kKQQ==
X-Gm-Message-State: AOAM530zfvkZiIqna/tbi+zqjRh1+rNHP6eZss0c5F3uXFawyBb/63nY
 2zZcnBgmJrBUS8JUxDd2zhlMXCPSaPE=
X-Google-Smtp-Source: ABdhPJy1s6nr/rHDzuoSsUKx07qTdsQ7senKxo6zp8ktTGvRThwkUxJCoCokM3ShGmIJkIbjAS75aw==
X-Received: by 2002:a17:90b:1c8d:: with SMTP id
 oo13mr602473pjb.244.1643915948582; 
 Thu, 03 Feb 2022 11:19:08 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id nk11sm10777880pjb.55.2022.02.03.11.19.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:19:08 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 06/21] sysemu/kvm: Make kvm_on_sigbus() /
 kvm_on_sigbus_vcpu() target agnostic
Date: Thu,  3 Feb 2022 20:17:59 +0100
Message-Id: <20220203191814.45023-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

kvm_on_sigbus() and kvm_on_sigbus_vcpu() prototypes don't have
to be target specific. Remove this limitation to be able to build
softmmu/cpus.c once for all targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/kvm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 6eb39a088b..a5bec96fb0 100644
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
2.34.1


