Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9F960D234
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 19:03:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onMyt-0006YO-5j; Tue, 25 Oct 2022 12:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyg-0006Cj-1J
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onMyJ-0001bf-0o
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:40:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k8so13425587wrh.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kcdTz5KtC6+lO1M7/1rmzl3kAUHeqqkP0AgtZ5C0qI8=;
 b=dXAXV4oui3BMXBtjxVepXyrwSfz6iMXOuu2S6CY0VW15Nt8Fvh0kvhL/9sjcrJJpyq
 ox3S6X/VvXOvscgHaHgqa795G23gKMNu3b2Z4x7zfCMRAMVmP93UURZzUbdaBmTaVlpW
 7VfZ+rvozN33xBbOJyEAw10f2yqYzPhffmMj3DRle15fskTsN8r7EupLOAq0etSvuvOs
 bkskWhNESNVU1ita6FLnwupBUJgUXHkKt5KQz/DcGPC2tvg6dSeSaXIRu6E5XTH7lONo
 ncGGvl9PRmkNK5DBZN0NOtopp29A2W/515+8NF28EM3jyA44N1BzU/DqWYosiqBIMFmq
 nCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kcdTz5KtC6+lO1M7/1rmzl3kAUHeqqkP0AgtZ5C0qI8=;
 b=oMyveT+lA0RDcvALhmrmMKT8EHQD899oeY6UQqlBlEWgu67ThOzeklYGXUTCtBghv6
 /ZMuhz7amQI0YoA1/qmFoMUjdqfHPaMxrEd95mlHyRgqoII0/H3r4Nrjw/UY6WKN4lY8
 VZ/UjNHRN48Mu3VIRSZgYmkgMCNkglyC9xEUJMcT8k8xmVYCu/aJzu54N0egf2pBmmLQ
 ARYr9x4ooXDQ4dZ7ziNs5bkbK3Gm126FAG0Q1k3akgHnm1Ta8whNO5wA1JIeHMECqOWO
 ifMh9k2bHpFiDjSNHbp/jnttWTAv77+RNF3fd0knkvKQX92M/XAJyZJ20lP8AaiVbK/X
 qhsg==
X-Gm-Message-State: ACrzQf3YM2DnT5Anbku6iWZUGIxQ8rZ0ltc52mEHJM/qbaTe/wx+Hks2
 FRbFndkUVCt+5EBb85v7S2ZSQ0avzzK4bg==
X-Google-Smtp-Source: AMsMyM6XykZWmik8gfB2tJIoGAS6EIMKbZX2viU+Hzh0vz5gxJtFLZaSSMsPCu8S5xRcLPTZdYrWWQ==
X-Received: by 2002:a05:6000:156e:b0:22e:6bf3:79d0 with SMTP id
 14-20020a056000156e00b0022e6bf379d0mr26620589wrz.456.1666716009693; 
 Tue, 25 Oct 2022 09:40:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b003cd9c26a0basm2971084wml.40.2022.10.25.09.40.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 09:40:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/30] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Tue, 25 Oct 2022 17:39:34 +0100
Message-Id: <20221025163952.4131046-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20221024051851.3074715-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 32ed37a05b6..87d33e7b774 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -338,6 +338,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -524,6 +525,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.25.1


