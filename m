Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3E5397FBF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:56:28 +0200 (CEST)
Received: from localhost ([::1]:41364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHzX-00008I-FI
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loHyO-0007oM-69
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:55:16 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loHyM-0003nQ-Ew
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:55:15 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so2653905pjp.4
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 20:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vISSr+d3sfwO5a5EKK8L+QkM1LYNXo8279tUGYxXHew=;
 b=WfOxs4dqoOBsqNkNtU5X50/QxztoLWiAxk0C5eJ5sIXyc8yl0glubE4EYt/ICc0cqr
 F4nLutyjYK5BSXu2qSc1avmfQEQ8dd7I0A38BLNp6tVk/P4BvJ9vmx9QhuCQaneYphkP
 H4ZbxunLKnbWOoz/3ObzFUQC9GkCl8wFlig6wIOc3WJR7yoySp/6zCVfWKnpNE1FbFle
 3ojznkZ4Tjp9+hMZ1WrLpL/wAy8UJDIzoOHGz42/e6tlgQu5Us1Q5cIs+W6m3bX4CrZy
 cqM0ZOlkbqoU8oCfBN10qxQcpfNbMnHtesYDU5Wx4c3kw+EtYf23Uf/klZ2If0HHBJM/
 dmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vISSr+d3sfwO5a5EKK8L+QkM1LYNXo8279tUGYxXHew=;
 b=S6jIXwZP02E5nnGBKvMnHae4t1eWGh1LHTwoo4x0EQMsMQDatolqpcVylCbsModjDa
 oaQ37sF1zR4MkXlkWgpmzkg8g+rrHl8S05elzwd+T7gfu1+XekFAsQBcyyofQ5w4PE1H
 8dMbWPqmD1xKc3h66oXuaJY0SSTZqhAdmOFA1WkEs+k8jK7a62W6gE/PZOuOoaETp5ns
 umLffIeXJwSkpOFQGGRrsgqFfy6OXLsS1qAQQnXofd+mKmwW3OdvtVHEEu3gXfDbBNny
 ZuOMibcJr7MbfMV+lzT5LnM7q4VpZkV9exfvft41dyCdUk67JPSS1jKpEqdmcFbxYEqQ
 pBIQ==
X-Gm-Message-State: AOAM5328r62kBhj/tG3vJVUWfqgh/es9gCGsjTSyMn46z2b67jG85wFn
 K0EW6GvDvs4g548oqxHYDOUGpXFMGvxIvQ==
X-Google-Smtp-Source: ABdhPJx8fBQUqUC3y3k0UtlhaTey4FCy8Su1PKbMvDpdJ4EpXFlcorZ89VJPHhpmCwYWI1B7oO7HTA==
X-Received: by 2002:a17:902:6b04:b029:10b:cf5c:3739 with SMTP id
 o4-20020a1709026b04b029010bcf5c3739mr446591plk.76.1622606112359; 
 Tue, 01 Jun 2021 20:55:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id w26sm16121223pgl.50.2021.06.01.20.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 20:55:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Fix decode of cr8
Date: Tue,  1 Jun 2021 20:55:11 -0700
Message-Id: <20210602035511.96834-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A recent cleanup did not recognize that there are two ways
to encode cr8: one via the LOCK and the other via REX.

Fixes: 7eff2e7c
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/380
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 834186bcae..a7f5c0c8f2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8091,6 +8091,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
         case 2:
         case 3:
         case 4:
+        case 8:
             break;
         default:
             goto unknown_op;
-- 
2.25.1


