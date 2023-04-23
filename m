Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E506EBE88
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 12:21:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqWpS-0004F7-Ic; Sun, 23 Apr 2023 06:20:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWpF-0004D9-8z
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:13 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqWp7-0003Fe-2c
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 06:20:07 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f40b891420so3239477f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682245199; x=1684837199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DlCEezywh40CII1Ekv+/qswvYgjicRodLvgEM9MYLf0=;
 b=Esnisv4DesH3et9pVNf+Egp3PUBqD/s7rR3kva9UN5z0TuwfNh5EU1uQkhPQuAse4Z
 l06JW7WFWWHhvpW3X1K+LwJgyeEe/HcMRP/IFlTs1cZ1k88ta1t6RL9XLEblkUPiYl3M
 /iCYANmFmjghqZcpE5Q3O5j/h7vV266A6f+tfccZFqpOMG2gmhyPB8wzHkoHcUg2QIrV
 ReW4S9MZvQOzTyXMa6PqTOHZ/VmW6BLCavJEUE4wAhQ7Ms3m/bOzSqBWrMfBVlpR1qkE
 2OU+cDc8Znb/LT0KagPgR/i1MR/z5mxYqlhsVLWq8I7ycT6+iKrValyGGUqH1QNKEARv
 ViwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682245199; x=1684837199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DlCEezywh40CII1Ekv+/qswvYgjicRodLvgEM9MYLf0=;
 b=LmqxouobIbNqE4ROTUIKdV5H4mFUEcYIsohu6W0Wm9VIX1iL7LeFzBALWF4fzJVVF/
 4HfxPywfqgVwTyI1Q0CCI2hCLlvcJCsa002wjkKVv3Z+2HJDCEIukbf38HjBgVdTbqS+
 uLtlw+6i4dTnC6A3oc0XR8HU2+4F4cc1Ukc4bTsFn0nIZnuR7e8lrG+1cEsn8uPQXKXL
 zJIMBHMHNNFyPTYoZYah9SMJ+v4LKkcso+04WidU8D+X+6/G0jb+UfV3Fbz2xMrhEykQ
 oK7kYtBUeLDthPhpzTJQl6DryPntnMewH7pzsRuyjSWBoMx+vr6gWCKzfTMYjCfc+IFQ
 aqsg==
X-Gm-Message-State: AAQBX9ez29P29nuwayhdaKiM/woAK73Rnld/s+VHcDTzyrsYnyOU/ZDz
 pixBH74L+xwUbnqmMXC2+vj9TMWY3D8jBs/fnmipBA==
X-Google-Smtp-Source: AKy350aHv6YieeNawIPiht3Uqm7VE7F7FZdA0vbfoBHCnWET5/8YMzhSImtEs7YzhPeMMn8T3u/AdA==
X-Received: by 2002:a5d:4533:0:b0:2f5:3dfd:f4d2 with SMTP id
 j19-20020a5d4533000000b002f53dfdf4d2mr7625320wra.64.1682245199814; 
 Sun, 23 Apr 2023 03:19:59 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm12550541wmk.27.2023.04.23.03.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 03:19:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 14/15] tcg: Clear TCGLabelQemuLdst on allocation
Date: Sun, 23 Apr 2023 11:19:49 +0100
Message-Id: <20230423101950.817899-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230423101950.817899-1-richard.henderson@linaro.org>
References: <20230423101950.817899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-ldst.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/tcg-ldst.c.inc b/tcg/tcg-ldst.c.inc
index 6c6848d034..403cbb0f06 100644
--- a/tcg/tcg-ldst.c.inc
+++ b/tcg/tcg-ldst.c.inc
@@ -72,6 +72,7 @@ static inline TCGLabelQemuLdst *new_ldst_label(TCGContext *s)
 {
     TCGLabelQemuLdst *l = tcg_malloc(sizeof(*l));
 
+    memset(l, 0, sizeof(*l));
     QSIMPLEQ_INSERT_TAIL(&s->ldst_labels, l, next);
 
     return l;
-- 
2.34.1


