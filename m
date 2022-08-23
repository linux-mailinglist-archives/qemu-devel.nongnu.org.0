Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E1C59EED7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 00:14:16 +0200 (CEST)
Received: from localhost ([::1]:47112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQcA3-0008JB-Ot
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 18:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc20-0008PL-Nq
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:56 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQc1z-0001Qa-5L
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 18:05:56 -0400
Received: by mail-pg1-x529.google.com with SMTP id w13so8330558pgq.7
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 15:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=OsbFR6exiIugNlN/OA1NiX9KQk6dg8u5+nqhU943Djk=;
 b=yGIKUWsKPQ3TTiar5jk9exsCX38lMJBYtzHYv9TLHMcvTR92YDmxRrGf7Zu26j/tQP
 bfHmR1bs3MccPRow5DXJikZhqSykOZVZanJEyPpXANINrh37xyV96n0+QLow5m8G5pJe
 mloWsq+YIIxqnfVfzUVxCk23coNwk4YYUrJT2CCNRgx1HzVAh0CLsrq7MN+gs9FiCaMh
 hKuJ7GOLb5w5fi/yVph6AKjE0hL1MmXA+kNizcpTcYXvVkJwEZtpaQYcAqsPeIgKvk/K
 1KjdObiGaYyinHcO/8P3GmTFO2kf2Dfv0u0qPn4OYfifD6RZm0MKLMkBvQzL2+L9ne80
 NQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=OsbFR6exiIugNlN/OA1NiX9KQk6dg8u5+nqhU943Djk=;
 b=wP5YZykq80P5i1eInbRWpW4TTbvQMPvijpPG7YDo4zg9unf9J+IAygZlmMzsfDAtHD
 5giIEF/3iqsb0YijKxfNTNlyyaaVaasNUOKvF46/+uXs/gcpYf3LPE6rni6Jd7O16YZk
 +FtN8D6Lw/eq7oLNWIGOef7XFg/b19g5nItRkzoGHphR1LTTyiEaQmMf3kBX803y7eu2
 81f2vUeUSR3Y7WmeUU+deC2kqpiJjKTqr1RFBRx70WJAGl78LC0huMNyON+lk06CajQX
 qQ/YtGhSWCvjPfYpFimNTGKAjHhWckOjhweh4rpJ97d8C436222HlZqaftzJipN32ZPO
 ajJA==
X-Gm-Message-State: ACgBeo1eQ+XRT+1yYUJUfD6SAXX2c7qZMUSC/5vz9Ks0sInXjayQCtr9
 fag2FqYd56UmEGgHGgDvs3WUeWnwUcJ1VQ==
X-Google-Smtp-Source: AA6agR5U96VV5dWRduNoLhSJ5pVi9YnB5slyqfay/zs6qpsxZY0rjdhIn7uDT1hHLuk5+FBLInOpIw==
X-Received: by 2002:a05:6a00:1947:b0:536:6730:7d33 with SMTP id
 s7-20020a056a00194700b0053667307d33mr15358415pfk.10.1661292352824; 
 Tue, 23 Aug 2022 15:05:52 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170902f60c00b0017292073839sm11020974plg.178.2022.08.23.15.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 15:05:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: iii@linux.ibm.com, laurent@vivier.eu, alex.bennee@linaro.org,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 07/20] accel/tcg: Introduce is_same_page()
Date: Tue, 23 Aug 2022 15:05:29 -0700
Message-Id: <20220823220542.1993395-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823220542.1993395-1-richard.henderson@linaro.org>
References: <20220823220542.1993395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Introduce a function that checks whether a given address is on the same
page as where disassembly started. Having it improves readability of
the following patches.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220811095534.241224-3-iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[rth: Make the DisasContextBase parameter const.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/translator.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/exec/translator.h b/include/exec/translator.h
index 7db6845535..0d0bf3a31e 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -187,4 +187,14 @@ FOR_EACH_TRANSLATOR_LD(GEN_TRANSLATOR_LD)
 
 #undef GEN_TRANSLATOR_LD
 
+/*
+ * Return whether addr is on the same page as where disassembly started.
+ * Translators can use this to enforce the rule that only single-insn
+ * translation blocks are allowed to cross page boundaries.
+ */
+static inline bool is_same_page(const DisasContextBase *db, target_ulong addr)
+{
+    return ((addr ^ db->pc_first) & TARGET_PAGE_MASK) == 0;
+}
+
 #endif /* EXEC__TRANSLATOR_H */
-- 
2.34.1


