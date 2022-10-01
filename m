Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F45F1DD8
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:47:50 +0200 (CEST)
Received: from localhost ([::1]:50302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefeX-0000kl-50
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIL-0000Wj-CW
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:53 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:35599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIJ-0006SC-TL
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:53 -0400
Received: by mail-qk1-x736.google.com with SMTP id u28so4542752qku.2
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uo3G0jvzPeglF/SX1GKlp5DbZMlHCpPo+axikVVXW7s=;
 b=qoFTjBbC9GjlmIYa974l+7+tbswJ7QCI5slHd3RCcNI7XtqZzXonvsiDtIFiR5Pl+b
 ktaAm5xnum9PaFWw5mu9U0zV7bKzTuOdS2LfnQxtbGh/Sl7GnWc6JBzYlvO9uipOCPds
 Hu3O515zeWsKfEn2Yijgv+omBzElzolnrg8GwkvjU+HpxWOxV3vl13riuSS1lHK705aB
 R16cc0eR4XIGToBLXWBvztmM2tisC7skPU23iuFwyWRrSEEj6DDZ2Ic1c+m55SB4sLbw
 Z3VH1i9ppf33Ym7j27TgSl0Ws2vTGLyapCnzBDa65t67gL85hBSnfeBCLKZIUl6wvors
 ukxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uo3G0jvzPeglF/SX1GKlp5DbZMlHCpPo+axikVVXW7s=;
 b=4/n8gKK8WxgKGWcLbE+XSZnOkpG6Gd74nT24adYahqB5fj0VZyY2QuEyaxaqny22TG
 6+ToaSJwylAdY8YUhR38TyLanVHB7an7xkQ/VP4pdA8bOidWWKBDiFraNtmzZeuFZsL7
 v4PDrxpp163V9XFLr2c53l2gOvY9/fjHQmHX5o32gkbZAI7YjMMiC+FoMFbYIr5iqdFU
 6xUtU8Ws2svL712jfuDA3XPyAEfXN9knV1g2s423uS+T7QvZRsRouDTDgaRz2W2Bj080
 siPCwr/ibKH/tTHcYrpDaFmfZXSeIqMz45oevlEs5fRIyekUiu9Pxzq1ScS/CdBOp3ss
 fBYA==
X-Gm-Message-State: ACrzQf3XCjdK0b+hcMw8mo4Kc1P/VjKgdbWpoH/6iF8DMDjtG6K5Jc8E
 3jvc0BOHcreneOOW3UlJ5JljvTmXVuNNyA==
X-Google-Smtp-Source: AMsMyM5sjiMwyk60zWGkxtMzIkfuDgQORpe84I4oKeuRBe5Uf+6/OTAaEpIevXqAdl2yAz7LKQl9Fg==
X-Received: by 2002:a05:620a:271b:b0:6cd:fd1f:7472 with SMTP id
 b27-20020a05620a271b00b006cdfd1f7472mr9654125qkp.142.1664641490011; 
 Sat, 01 Oct 2022 09:24:50 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 36/42] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Sat,  1 Oct 2022 09:23:12 -0700
Message-Id: <20221001162318.153420-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index e95b6b1b8f..4a2b1ec31c 100644
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
2.34.1


