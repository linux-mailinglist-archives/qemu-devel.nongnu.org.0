Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF576CCDC6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 00:59:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phIGd-0006rS-UX; Tue, 28 Mar 2023 18:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGb-0006qn-GC
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:13 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phIGZ-000739-S7
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 18:58:13 -0400
Received: by mail-pl1-x62c.google.com with SMTP id ja10so13168899plb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 15:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680044290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d+avOkff6EBvJ8K9x1TsSkw5p9567zBA1o+YX6GdDwE=;
 b=OUXdSWbGXG/mQCkfiX0uRMcLk9Wxl/oBVOg730ASbLbwNzV23abyIvdYitIUlFr5+/
 BpZ1uKdlJfWsb6jIBjGr2oTt7DlfkBLyVsvh1ZT+n2HiZLk3FZCgs+9G638TWT89xXW8
 ndPYo23Iqfbiwy7L12+LF+vMUdCtcl6k833N9m2B9M0bfu3WmtS/ThHb2mf+Kd0pqHt2
 9PcRW1CTMsNcuyBo2V69OgiqzUV/ltXQV+ftV0Vs87JMM69PZQyojm+do67NUfi7JOSD
 aknR0V31PozHNA2jGC7InyjaWF09L11DDsJd8RWuYDkUSTGiM2x703LhJ5dbsNXGw19T
 JwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680044290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d+avOkff6EBvJ8K9x1TsSkw5p9567zBA1o+YX6GdDwE=;
 b=mMoIwsmnKyqxDLDBL1/kZjQJCeX4ki1kF6F1aepAaE71w/iTXVUriNWaMOatdtxYku
 bu1yU2tvh5ihAUD0EfeqfRlxbIqTuc6SyIQPm5B2YMAynOWUUcQtdyFnu09bXsVqRO6k
 uYpNW3BVv57yBSWKpeXhJGD0T/Y8c+upmWyHK9ibF4uP1dL66CycQWNuXnAMaTC4951X
 BM0h0PKfrIfdFXD1LEAgbgSBuDvLMs2bJIGJIERoah3hke8TJz5vuIk3ECbQSsdwD4zG
 pz3R68GsSZidUIqf0rxyI7LVzGpH5AMclJ29Oam1QYtPB7A4kBZc+p6KfkgP/FP/nGey
 nc1Q==
X-Gm-Message-State: AAQBX9e2or7a+wcckz/j4rEZg0Ja2pwUwnkR3T0dl+K9x8AYBB2WdFk6
 jTJNqJH5m16v+25id5f4PtWRR5JQ7gWr5/hTgyo=
X-Google-Smtp-Source: AKy350Y3vn71tgM7aMesEY/mx3phXw+biPcLkpTwINV3C35MjRFLXGQPYfLArdVQjn88+R6vgF68Zg==
X-Received: by 2002:a17:903:70b:b0:1a1:ab92:5c6b with SMTP id
 kk11-20020a170903070b00b001a1ab925c6bmr13094978plb.57.1680044290541; 
 Tue, 28 Mar 2023 15:58:10 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:c23d:b6:6be1:f147])
 by smtp.gmail.com with ESMTPSA id
 jw1-20020a170903278100b0019cd1ee1523sm21670633plb.30.2023.03.28.15.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 15:58:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/15] linux-user: Diagnose misaligned -R size
Date: Tue, 28 Mar 2023 15:57:54 -0700
Message-Id: <20230328225806.2278728-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328225806.2278728-1-richard.henderson@linaro.org>
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

We have been enforcing host page alignment for the non-R
fallback of MAX_RESERVED_VA, but failing to enforce for -R.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index 4b18461969..39d9bd4d7a 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -793,6 +793,12 @@ int main(int argc, char **argv, char **envp)
      */
     max_reserved_va = MAX_RESERVED_VA(cpu);
     if (reserved_va != 0) {
+        if (reserved_va % qemu_host_page_size) {
+            char *s = size_to_str(qemu_host_page_size);
+            fprintf(stderr, "Reserved virtual address not aligned mod %s\n", s);
+            g_free(s);
+            exit(EXIT_FAILURE);
+        }
         if (max_reserved_va && reserved_va > max_reserved_va) {
             fprintf(stderr, "Reserved virtual address too big\n");
             exit(EXIT_FAILURE);
-- 
2.34.1


