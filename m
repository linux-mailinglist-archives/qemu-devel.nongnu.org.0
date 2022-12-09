Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0D647C17
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:16:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slj-0005uH-DR; Thu, 08 Dec 2022 21:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slh-0005te-2c
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:41 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Sle-0001uN-Vr
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:40 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 t19-20020a9d7753000000b0066d77a3d474so1974054otl.10
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N4yQZvLrLzDnvwFEth2EWeDyowrOx4C5jmZrW9T8lUY=;
 b=gWbrq6DZrKrkLOawEIUIEv4Nct0ve73wXBdxn0/7M9oPwJbOLdXZZ0PW5yXis0cnKn
 NFDry45k8fG/8bu9MndBD0Pwat7uejJQR1W15w3+iyAG5dwyk2CMoPweTB0n/Jc9IeIB
 te7uhEA51zNwWLcnJLgLfiFK0vxcGtiMPbUv4L1RkQYDT93VvAXs4dJjPnbaV9qFSAGr
 NloflS5dduVtfv3T98wqq4hfTbcaSVy2ZwlltZS5t0YfEuVgOmZpWt1KAnWLh/y9Amg5
 yJys8/g+yshAd/N2HF6I0xcJIDDYBAMyRzbtBi4UKDjvQNvMgJQXf1D2hWQa98zo0go0
 Z5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N4yQZvLrLzDnvwFEth2EWeDyowrOx4C5jmZrW9T8lUY=;
 b=ERC4PLE/W4AVJvyaLtKY1WeKYOcLSpjuFgaxGVbpRMu9aALseYWcXKLpq5yqkQMCgB
 qGQ2HBHqEQQm1uLhBx3Ca8VKnWs7DsbuvkBz560S49hByG02UJtTecbz4jt7mq7z0g+e
 iyCcYqBvYUn93VQgrwhItWyherhfEGKnSFdv8NWEBwJqJrPDunad8HaHg+fCdTtQvqgK
 6mi6y6OTfCTlw0dxMuUE5TjG62Vdt0bkh6AA9EB6oPfPMEGBVL+OeyBS5sovu5JI7YLv
 wREG1mPvLgH4wWXtMBFf15yAxfLUxM1+jD3dvHNI4ZrYMXMmWEnlKb7VZmobwu9K5fZU
 LnuQ==
X-Gm-Message-State: ANoB5pkDeGvFwH3pdjkoDR/h6psydS4RwzbeSMiveTbxWBdzDEpAh9cW
 RmVEAtRv3HO1LVRqPPxKkHEAwcd0AH5rk+Fs83Q=
X-Google-Smtp-Source: AA0mqf7bySXefhWEnNqQ/WfHaXIJJRpvB4osE510bSeaBLjQ5zAqkpvoTz3oi0BtuN5QjK8wWUsO5g==
X-Received: by 2002:a05:6830:1081:b0:670:6419:c3ee with SMTP id
 y1-20020a056830108100b006706419c3eemr1730385oto.16.1670551537868; 
 Thu, 08 Dec 2022 18:05:37 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 04/27] tcg/s390x: Remove USE_LONG_BRANCHES
Date: Thu,  8 Dec 2022 20:05:07 -0600
Message-Id: <20221209020530.396391-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The size of a compiled TB is limited by the uint16_t used by
gen_insn_end_off[] -- there is no need for a 32-bit branch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 2cdd0d7a92..dea889ffa1 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -33,11 +33,6 @@
 #include "../tcg-pool.c.inc"
 #include "elf.h"
 
-/* ??? The translation blocks produced by TCG are generally small enough to
-   be entirely reachable with a 16-bit displacement.  Leaving the option for
-   a 32-bit displacement here Just In Case.  */
-#define USE_LONG_BRANCHES 0
-
 #define TCG_CT_CONST_S16   0x100
 #define TCG_CT_CONST_S32   0x200
 #define TCG_CT_CONST_S33   0x400
@@ -1525,10 +1520,6 @@ static void tgen_branch(TCGContext *s, int cc, TCGLabel *l)
 {
     if (l->has_value) {
         tgen_gotoi(s, cc, l->u.value_ptr);
-    } else if (USE_LONG_BRANCHES) {
-        tcg_out16(s, RIL_BRCL | (cc << 4));
-        tcg_out_reloc(s, s->code_ptr, R_390_PC32DBL, l, 2);
-        s->code_ptr += 2;
     } else {
         tcg_out16(s, RI_BRC | (cc << 4));
         tcg_out_reloc(s, s->code_ptr, R_390_PC16DBL, l, 2);
-- 
2.34.1


