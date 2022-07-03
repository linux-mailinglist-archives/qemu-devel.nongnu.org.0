Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4655645D6
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 10:34:51 +0200 (CEST)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7v46-0006Yc-Oi
	for lists+qemu-devel@lfdr.de; Sun, 03 Jul 2022 04:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuP-0006fm-C9
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:49 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uuN-0005qe-Tq
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:24:49 -0400
Received: by mail-pg1-x534.google.com with SMTP id 68so6236130pgb.10
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mlHd+wwiv8pBaZCez3yDRMnKt1mN27booBhwkoA66eA=;
 b=Y0WctPXqAx1Q/3ThobA6XG7UJZXzaAX9zjC/GsBIPpO/WSnU7wDNmUVJYgD/FuPew6
 t+wsfuuwwZoUqp8qY2zvhR41Q6/GesiES7flqc5QuixYWfIRgzHhqO7UP+zwVmkbDjhU
 2tIh3SHgL34I6HXnixVTinT2jD9L+HaIpkoB5RK+0j9zLtfMQA+Pm6t1PjLzflvScrPA
 rY9HSs46AYMlFGACj7RLLWLWIZx/3pGG74P2sOj4F9mwP86uWlW4EZmdwTNugnyUVU5y
 +ssvJ+k2e1J+sMWsy0uTHhJzuc2xASIi0qUs5NScyZ91hwuHNM+q0asRbFYcvNqDP6/E
 fTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mlHd+wwiv8pBaZCez3yDRMnKt1mN27booBhwkoA66eA=;
 b=SOjwh0CAPTpCF5o+2uXgBbrZoz4FpvLmuzwgzh79+BKil5wx8AlZYtQc00sgaefq65
 pYb/kv9snM85FWSO1t39JMFYXojuOsl7HJz/fRJ16fSDRpqgNHTvz3829ciwGUUIAgMt
 U/mHWRedugjqVY6KfkiuETaPXD2bwAXdW+KrWzMoU2mCW95WiJvxncoUZNH6bcS4Mp86
 k7UxwMgMe9UIjoPtEqNanxYqhrY6+tKIIqrkrp9y5VIqDysyUqdU+ghwu1zdfbpR3C3t
 t2VEf7GnfYAN9VttOE6QVkuPiH29CdLeWMj75LKKMS0yZh2kvSTGNznd/MB6uSgiK831
 o9Tg==
X-Gm-Message-State: AJIora/jE12JwVegZI+fZMOORP5TVNhg+DqrSDv4OWCWCKS8paBQS0s7
 qAmKu4xJMX7/BlmNS4apjujBDaMSz0wLgMVU
X-Google-Smtp-Source: AGRyM1tL8HXfuu2WndDJ8suASnBTpkc6c/1FWQoPyXfkAZT30AN7YpSrTWz7UPtyU5YvBha8h7zLJw==
X-Received: by 2002:a63:1b62:0:b0:411:4722:e712 with SMTP id
 b34-20020a631b62000000b004114722e712mr20076822pgm.87.1656836686640; 
 Sun, 03 Jul 2022 01:24:46 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:24:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/62] include/exec: Remove target_tlb_bitN from MemTxAttrs
Date: Sun,  3 Jul 2022 13:53:24 +0530
Message-Id: <20220703082419.770989-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We have now moved all uses to PageEntryExtra.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..1bd7b6c5ca 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -47,16 +47,6 @@ typedef struct MemTxAttrs {
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
-    /*
-     * The following are target-specific page-table bits.  These are not
-     * related to actual memory transactions at all.  However, this structure
-     * is part of the tlb_fill interface, cached in the cputlb structure,
-     * and has unused bits.  These fields will be read by target-specific
-     * helpers using env->iotlb[mmu_idx][tlb_index()].attrs.target_tlb_bitN.
-     */
-    unsigned int target_tlb_bit0 : 1;
-    unsigned int target_tlb_bit1 : 1;
-    unsigned int target_tlb_bit2 : 1;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.34.1


