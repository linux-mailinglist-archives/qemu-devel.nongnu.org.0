Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174103B3539
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:07:46 +0200 (CEST)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTlR-0003W2-2a
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiJ-0007zy-Ma; Thu, 24 Jun 2021 14:04:32 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiH-0001Rs-JW; Thu, 24 Jun 2021 14:04:31 -0400
Received: by mail-ej1-x636.google.com with SMTP id nb6so10866569ejc.10;
 Thu, 24 Jun 2021 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GNN3PKGCrmEv1egmkbcKJ78YTkUsB3DLKlu9c2s2Q9Y=;
 b=rQr1/65fvgMg3N7umnZVx4q6lGayemE4gwQJixH/v3azO3wW79ORgDpxePEkjnRVyC
 8IW6kBURiSPL+RCd7Ti/0+9Eu9+m3/780GF7EdtwIZZe4cJtZZ4hHS6sktrvH5wPttbN
 7bPUgR8hPPh62OCj0+d9BGT6ykhFngG2iVYuGabeLco+QNGc3GL2TEZtsh7eVFlK9xSK
 EtxcaB/Ub9H5HmTGWjb4hSF2J8E9ZGXEixONZbHjGlNBjZ7gjHPZZkVaFIenMMY4hMBM
 AJkXJiCBK+yrF/0XJcz0yODMZQZJN7oG8MtBvIXubgSfskat+K17dIPWlP+crA/vkfC+
 +8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GNN3PKGCrmEv1egmkbcKJ78YTkUsB3DLKlu9c2s2Q9Y=;
 b=kOrFq5kg1bQhypFFf0EzhcqhUzONdSlbU2bPKkcX1XHSaY7+Y7S6ulB2CSNeJnwC5R
 6Tqk4tYoFLWhHxX3rWWnHf7Yjkkthhz4sBQGI3/5JU4CBmTnL2T98uIS29ZNBO+njfch
 4bb09vyL0t92dC9LySZ4jsJFoJl/O0Jyj/Vf0lg5lt+WmnajmkudyJTXbwsWWmNJd+em
 Kwk9UY/uEXXppmG//LiLhXMTC+0KFH5BsAKSiCjbg1sQHzth211RFVHA4XdXC94D5RhG
 LHJAybzr0GE5A9tYHo7SRIc1p52SgJtbT41vMqiWCWSvnrhL2E6EmDdB7ACNj08h6ISx
 RpFw==
X-Gm-Message-State: AOAM530S3lrfXew22T4jhWW+FFvEJblTmhnjCIBk0mH2tIYj6hz3lMmJ
 pPe6DyOOr0dQ4itEtvWPtd6KgTSLLX4=
X-Google-Smtp-Source: ABdhPJy5UK5J8q2DdB0e4+36XSq7XWVY4Rlenvxm8oZP3azkS39emm1H+kNHYFyPg+UIx1nm57gP5g==
X-Received: by 2002:a17:906:c241:: with SMTP id
 bl1mr6453850ejb.536.1624557867971; 
 Thu, 24 Jun 2021 11:04:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm2436466edt.16.2021.06.24.11.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 11:04:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] osdep: provide ROUND_DOWN macro
Date: Thu, 24 Jun 2021 20:04:15 +0200
Message-Id: <20210624180423.1322165-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624180423.1322165-1-pbonzini@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: mreitz@redhat.com, qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

osdep.h provides a ROUND_UP macro to hide bitwise operations for the
purpose of rounding a number up to a power of two; add a ROUND_DOWN
macro that does the same with truncation towards zero.

While at it, change the formatting of some comments.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/osdep.h | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 0a54bf7be8..c3656b755a 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -319,11 +319,16 @@ extern "C" {
     })
 #endif
 
-/* Round number down to multiple */
+/*
+ * Round number down to multiple. Safe when m is not a power of 2 (see
+ * ROUND_DOWN for a faster version when a power of 2 is guaranteed).
+ */
 #define QEMU_ALIGN_DOWN(n, m) ((n) / (m) * (m))
 
-/* Round number up to multiple. Safe when m is not a power of 2 (see
- * ROUND_UP for a faster version when a power of 2 is guaranteed) */
+/*
+ * Round number up to multiple. Safe when m is not a power of 2 (see
+ * ROUND_UP for a faster version when a power of 2 is guaranteed).
+ */
 #define QEMU_ALIGN_UP(n, m) QEMU_ALIGN_DOWN((n) + (m) - 1, (m))
 
 /* Check if n is a multiple of m */
@@ -340,11 +345,22 @@ extern "C" {
 /* Check if pointer p is n-bytes aligned */
 #define QEMU_PTR_IS_ALIGNED(p, n) QEMU_IS_ALIGNED((uintptr_t)(p), (n))
 
-/* Round number up to multiple. Requires that d be a power of 2 (see
+/*
+ * Round number down to multiple. Requires that d be a power of 2 (see
  * QEMU_ALIGN_UP for a safer but slower version on arbitrary
- * numbers); works even if d is a smaller type than n.  */
+ * numbers); works even if d is a smaller type than n.
+ */
+#ifndef ROUND_DOWN
+#define ROUND_DOWN(n, d) ((n) & -(0 ? (n) : (d)))
+#endif
+
+/*
+ * Round number up to multiple. Requires that d be a power of 2 (see
+ * QEMU_ALIGN_UP for a safer but slower version on arbitrary
+ * numbers); works even if d is a smaller type than n.
+ */
 #ifndef ROUND_UP
-#define ROUND_UP(n, d) (((n) + (d) - 1) & -(0 ? (n) : (d)))
+#define ROUND_UP(n, d) ROUND_DOWN((n) + (d) - 1, (d))
 #endif
 
 #ifndef DIV_ROUND_UP
-- 
2.31.1



