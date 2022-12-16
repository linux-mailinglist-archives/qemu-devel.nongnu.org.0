Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1464F40F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:25:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Ip9-0007hr-E1; Fri, 16 Dec 2022 17:04:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iom-0007fg-2M
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:37 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iok-0005Bt-0G
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:35 -0500
Received: by mail-ed1-x532.google.com with SMTP id i9so5511578edj.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eLBFoNDM1Z35hmIAgQprz2tI86WbCCpPFsa3peLy1EM=;
 b=XGo4b7JBCogNCEAhigxMHOfTKfQN2L+sg+8R9B+w86byt19bl/87m9C0Jbv67cYesl
 jz8JlkzkKLvK8KtEaky89sYrkmzSiekvvfnJL9WuI1lEMJactDo+wmoN0D8MT6zWEQAO
 o1rf+sca3RD8LmGpgrrSNnqRrOkM/NuoBzLW7yx9GKYT/5HZupc9L8prpoakrWwMprHc
 L/lNX0hM6iEOi8f7n1XznOAy9SL+Ghst5W9TBa9eN7JygLpeX7rMNF2K3dUoWZtUJZpz
 Dp3pr3issqRsrcjsLJ5M9ZHnNEW2ombpJIo0eJ4BodHaA5GxT7ShkWPr4GkVdCc3T/7N
 cZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eLBFoNDM1Z35hmIAgQprz2tI86WbCCpPFsa3peLy1EM=;
 b=CSk5ILYsqtWFARtMo2eETohcTdi62Q5vLkEpbvHdBqQAFOXOhCoOuufF2pTLt5fAwN
 uNI+4wOyrFquwTKXw/evPtXWytxqGfqFDS/Ex1/dUibdtZqe19hd78AzTojGAOs8BHOQ
 ovc/JIaLDOQlrHrCHIdkyq4Fsp3SQXRtzx8MJUJ3kNoQ1vNw9I1LIVq5bxXBs/N940+P
 gfkZ23M8DTyJmppBttPezam/4a5TKINdWGeTSsjPhHNCq4M2MtqhU1aY7wRBmEZFJv7y
 bmImhQ7lAK+vBFjgjfFnCCwBIDOxjTqNQeG6/os7aFKwQEfIath70BFyY7ZNN4qFBgti
 2aCw==
X-Gm-Message-State: ANoB5pnVXNtr1ywkkyfUuWfRwx466eOsEqvkq4jwXITR0vJVnrT/Ur1u
 iCFFxFnX6Z6KVewWmzil6H+zh80/oFO3s+BRegY=
X-Google-Smtp-Source: AA0mqf4eDU2tx+oMsbw8kSiXf58LNIY3HkLotQiP4btYdYjoFIu1/+iua36H0EUalFQfQZdZcfWoJQ==
X-Received: by 2002:a05:6402:f24:b0:46d:ca42:2e59 with SMTP id
 i36-20020a0564020f2400b0046dca422e59mr33897754eda.11.1671228272238; 
 Fri, 16 Dec 2022 14:04:32 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b4-20020aa7d484000000b0046267f8150csm1312805edr.19.2022.12.16.14.04.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:04:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 3/5] hw/s390x/pv: Simplify s390_is_pv() for user emulation
Date: Fri, 16 Dec 2022 23:04:09 +0100
Message-Id: <20221216220411.6779-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220411.6779-1-philmd@linaro.org>
References: <20221216220411.6779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Protected Virtualization is irrelevant in user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/s390x/pv.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/hw/s390x/pv.h b/include/hw/s390x/pv.h
index 5bca5bcaf1..a4814ce303 100644
--- a/include/hw/s390x/pv.h
+++ b/include/hw/s390x/pv.h
@@ -12,6 +12,12 @@
 #ifndef HW_S390_PV_H
 #define HW_S390_PV_H
 
+#ifdef CONFIG_USER_ONLY
+
+static inline bool s390_is_pv(void) { return false; }
+
+#else /* !CONFIG_USER_ONLY */
+
 #include "sysemu/kvm.h"
 
 #ifdef CONFIG_KVM
@@ -79,4 +85,6 @@ static inline int kvm_s390_dump_completion_data(void *buff) { return 0; }
 int s390_pv_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
 int s390_pv_init(ConfidentialGuestSupport *cgs, Error **errp);
 
+#endif /* CONFIG_USER_ONLY */
+
 #endif /* HW_S390_PV_H */
-- 
2.38.1


