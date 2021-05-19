Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC093895AF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:43:00 +0200 (CEST)
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljR9n-0000UI-Be
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyZ-0003ux-Np
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:23 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:35666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyS-0005jf-4H
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:23 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so12616337otg.2
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1q+mpwSa9G9Zc5+8vLZr7OPXyD4MHPxLRrUGJAX/p0=;
 b=cwbra9EE0ahqxbcpgSwskeZncyAuIlhmrOzl/MTrw1O/+MDEWkZzV0FSyuF1TTdSnA
 oWCSn84PK/kfcMcyFiPg+v5jxZm8erjcIfnFRTycU06vRciZTbACzBfDz8MpBQi7JV0p
 O2JcdkVxmcFSxzQXSggx6XMPkomZMtpiUWcRGg0+/NPRZUB9Gy0OCzu3mlpyv3Dpq3ub
 2OE/axJB7S5EvUV9hGcqDWAHVSUjL83YbxE7gLvA8OnurSSi8pcHGhjURoWB6du6KWNU
 bD0YOnphSzCFHF9rABjv/2V2DkSX5S72pC6/mmoKU7gO5OfocAj1N/tmNLISEQQtF2tf
 HzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L1q+mpwSa9G9Zc5+8vLZr7OPXyD4MHPxLRrUGJAX/p0=;
 b=o+UhvcVD5jLlImLhanxI56efr9BRmDxTB5Tdzwomki55DpXiLb/UrgD8+ws0JB0jNm
 bFpDn+eevwrpNbMEv+PQrpTJg4lLwFUpnCHw24hGMtmyOusOzZM2LKN+lGC/XBp7LZH3
 maF8MRAWe96HyuoHP1mAcmFjTJ7SJiGfHHbnCGN1zIa6nd+js7txmB9QgaUZK140XTC+
 tJh9Btvg6IHo4RkymwXHHFyVelob5Gz4/zTgyhuoFBqjew78bL4pyXchRf254jOB7YNt
 bpzlrSiMOTJlXkdpgo1xY6HDI2xZwrHgOxUTfXx6Jx5o1jhCPUQuC56miEv43XjYFdBZ
 yluw==
X-Gm-Message-State: AOAM5316tqlxIwyvmIdGpdNPwwUjqtikSRR5glPKMN/hl2Brbn4u5TeB
 kNPTz24AbXMfdYDOYF4gd5j7/vEu9XaCcFy6
X-Google-Smtp-Source: ABdhPJz76A7vb4LwopZW+ZtQ4j/zpx8n0R5gfWUHgu7s97CyftXq4OzQuR/fpP9tBBQAbMxc792NIg==
X-Received: by 2002:a9d:c64:: with SMTP id 91mr669039otr.130.1621449074246;
 Wed, 19 May 2021 11:31:14 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/50] target/i386: Reduce DisasContext.prefix to uint8_t
Date: Wed, 19 May 2021 13:30:22 -0500
Message-Id: <20210519183050.875453-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The highest bit in this set is 0x40 (PREFIX_REX).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-23-richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 44a28858aa..61c0573c2f 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -78,7 +78,7 @@ typedef struct DisasContext {
 
     /* current insn context */
     int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
-    int prefix;
+    uint8_t prefix;
     MemOp aflag;
     MemOp dflag;
     target_ulong pc_start;
-- 
2.25.1


