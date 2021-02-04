Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DD230FC1E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:03:05 +0100 (CET)
Received: from localhost ([::1]:53526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7juC-0007fo-9I
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7jNN-0005cw-DQ; Thu, 04 Feb 2021 13:29:09 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7jNL-000203-Q4; Thu, 04 Feb 2021 13:29:09 -0500
Received: by mail-ej1-x62b.google.com with SMTP id jj19so7124090ejc.4;
 Thu, 04 Feb 2021 10:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rnBP+G+AfTb5HZhTrwyYmkaQSKMTs0uwOtrFD3BNUBk=;
 b=n/RmAlbf6KCtcuCrDD5Yc5YlA+8ZgURoa/4LPYRc/ujaNMNc8mrt/UAD+avNou4pmg
 VQzK8aX0kEhALDOgE1MsEN13kPS9UNJPc1Sw2ykSnkV+RRtFqOkBhnAb43h43Wd0u3ZK
 gIPrS0CmCaHAM6lRZ9pDQ+PTlhCHxnFPKrJ4ayaIfWTOr1J8fAza8l337q+ci9i8b2YT
 NR+t3/PXYn4VX1QnBX/2DKgwK+NtAxDqKPE62Fdri0KbJC8i/H53ewkyE98GmQDo7JW2
 Vmldg+97AAsO3gct1KTlmQPxYNfg5ksyFXj8RJVTJFKfpQOAbLgFue1QJedUvJsv5XZY
 FxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rnBP+G+AfTb5HZhTrwyYmkaQSKMTs0uwOtrFD3BNUBk=;
 b=pxmPZDLBjUaTLcLe0ef1Lw809ZIm24CvxTe8tMoUrqlxXMYBYbf+7Wt2CYNVA/Ki5d
 xgUyNhcrYSm7WMA/dQlpW6pLMF8euonBTOgh+c8O0GcGKEII+KOa7MGWVeQE6wmE2S3u
 rLMIl7Mq8vdXD0NNh28VUS/oOOZ3Lgi7f2vA4sKMQMvNbRCsOjEC5q+Or0j8ZmXiuk56
 5xA8/Z0yB28LPuMVghE8yxHDNdVMaxTgNrhvTPQCG1aMqI1sSn/rinqZ1ka+S9UWW9dJ
 m/ErcMuquknAMMJvj3oEs40q1oYrKpbtOh4MR/OwJ7VZlLRq3279uQnLqsqDGjSbeV6Z
 TUNw==
X-Gm-Message-State: AOAM530fMTYi5kWoxFFz9c8BwbmHGd9x01mtbVAApSHN8SdFvAcXixQt
 Ip5/bYaST8k+gZR+XbsbLnhteQ7BjIw=
X-Google-Smtp-Source: ABdhPJx5EZhtCiasnPKxZVjZfGCMk8a4BIKr8A64EmjO5gdGbFNqDpwjDy1WhEOFU+ECUhkbVAL6WA==
X-Received: by 2002:a17:907:35ca:: with SMTP id
 ap10mr380183ejc.451.1612463345558; 
 Thu, 04 Feb 2021 10:29:05 -0800 (PST)
Received: from x1w.redhat.com (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id z2sm335523ejn.91.2021.02.04.10.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 10:29:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg/s390: Fix compare instruction from extended-immediate
 facility
Date: Thu,  4 Feb 2021 19:29:02 +0100
Message-Id: <20210204182902.1742826-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Richard W . M . Jones" <rjones@redhat.com>, qemu-s390x@nongnu.org,
 Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code is currently comparing c2 to the type promotion of
uint32_t and int32_t. That is, the conversion rules are as:

  (common_type) c2 == (common_type) (uint32_t)
                        (is_unsigned
                        ? (uint32_t)c2
                        : (uint32_t)(int32_t)c2)

In the signed case we lose the desired sign extensions because
of the argument promotion rules of the ternary operator.

Solve the problem by doing the round-trip parsing through the
intermediate type and back to the desired common type (all at
one expression).

Fixes: a534bb15f30 ("tcg/s390: Use constant pool for cmpi")
Reported-by: Miroslav Rezanina <mrezanin@redhat.com>
Reported-by: Richard W.M. Jones <rjones@redhat.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tcg/s390/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index b67470137c4..695d7ee6523 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1067,7 +1067,7 @@ static int tgen_cmp(TCGContext *s, TCGType type, TCGCond c, TCGReg r1,
                 op = (is_unsigned ? RIL_CLFI : RIL_CFI);
                 tcg_out_insn_RIL(s, op, r1, c2);
                 goto exit;
-            } else if (c2 == (is_unsigned ? (uint32_t)c2 : (int32_t)c2)) {
+            } else if (c2 == (is_unsigned ? (TCGArg)(uint32_t)c2 : (TCGArg)(int32_t)c2)) {
                 op = (is_unsigned ? RIL_CLGFI : RIL_CGFI);
                 tcg_out_insn_RIL(s, op, r1, c2);
                 goto exit;
-- 
2.26.2


