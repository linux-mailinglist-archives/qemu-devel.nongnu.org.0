Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60A369D334
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:50:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8A-00063g-PQ; Mon, 20 Feb 2023 13:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6Y-0004YM-90
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:41 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6M-00045g-Vp
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:35 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v3-20020a17090a6b0300b002341a2656e5so2184329pjj.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rn1m+vC0SMptr9Ye7HM4jY557ksKPtQ1MF37cY48/F0=;
 b=vr2E5ZjmJeGngIBKrn5cSUqhFPBOxGmp3ccUB6mdYRQvhJ+qSEJkocGkN5CNz0DqlE
 U+VBJ87aQWV6xB7ZLixVABC7pPu443K9IwiGuDEmaHiaqZOacW9CPHZD6VlwrbXzGo2k
 MlqBW6omWE1KQcNfsASv/R+jSHKvPNCkHo9A3Ot+C1uMJiSyoROPpxlPZzO4/1xadfdt
 Pu3plsIPj353k6d1n6peib8igUzfEv2cxdCn5rOowLc4OM7JeRg7mscYFW9IBKpYErOs
 ynO5F9BSp7UD/miASbSSLDzDttOIHyPklQXrYPUCE0tHtR5L90xMYX6S6krb4Rzb7c7F
 n1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rn1m+vC0SMptr9Ye7HM4jY557ksKPtQ1MF37cY48/F0=;
 b=Q8dwcK2+Pq84XwVNEJIYA5WEXDtJ/4Sp4T1J+jy0OJshmMrIZpjlbFmsWs/8NsWk42
 HU61slNo0/JfHH9LdtP0Uop0ebd7uBwJAWzVjuFDleQGf9qIUFOaeoFsD/itQ5esevcZ
 cABx39ZQuyC5PgLP7/TCycSpUTiqh3rAIaIzcHM94Z5FdfWLAPcRCi7PwRvvksxmsHuH
 E4xqKzixNSN9OYhSOt6QpzrfbFS7K/BvkHjq8zFEnw4ewgyWbfOM+aOL4YTuCGERHbyp
 SfaMCbsM04yw6lBn6deZkpvihJAuAKquO6B28vcR4GEpzFpvZsSXXc39KrbzzOAcg+J3
 m2BQ==
X-Gm-Message-State: AO0yUKV6TVZQbJQ0ZO+YOURBTvYWmQvuSalBcYk3kRptvVmK9bXQZtmY
 +bOflbLiE85TzDTSkRRfCaTNjJOMA4h3ALGjgGU=
X-Google-Smtp-Source: AK7set8mIOnTJu/ZXhmG3nirrt1GxZKXmX1b7Lqy7A4pBxdgoJgIpLrkwVsx9A/NyVfchD7PRaVP1g==
X-Received: by 2002:a17:903:22c8:b0:199:12d5:5b97 with SMTP id
 y8-20020a17090322c800b0019912d55b97mr3704608plg.12.1676918466071; 
 Mon, 20 Feb 2023 10:41:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 05/27] tests/tcg/s390x: Add bal.S
Date: Mon, 20 Feb 2023 08:40:30 -1000
Message-Id: <20230220184052.163465-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Add a small test to prevent regressions.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221103130011.2670186-1-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/s390x/Makefile.softmmu-target |  1 +
 tests/tcg/s390x/bal.S                   | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 tests/tcg/s390x/bal.S

diff --git a/tests/tcg/s390x/Makefile.softmmu-target b/tests/tcg/s390x/Makefile.softmmu-target
index 50c1b88065..bcbe9367ef 100644
--- a/tests/tcg/s390x/Makefile.softmmu-target
+++ b/tests/tcg/s390x/Makefile.softmmu-target
@@ -7,3 +7,4 @@ QEMU_OPTS=-action panic=exit-failure -kernel
 		-Wl,--build-id=none $< -o $@
 
 TESTS += unaligned-lowcore
+TESTS += bal
diff --git a/tests/tcg/s390x/bal.S b/tests/tcg/s390x/bal.S
new file mode 100644
index 0000000000..e54d8874ff
--- /dev/null
+++ b/tests/tcg/s390x/bal.S
@@ -0,0 +1,24 @@
+    .org 0x200                         /* lowcore padding */
+    .globl _start
+_start:
+    lpswe start24_psw
+_start24:
+    lgrl %r0,initial_r0
+    lgrl %r1,expected_r0
+    bal %r0,0f
+0:
+    cgrjne %r0,%r1,1f
+    lpswe success_psw
+1:
+    lpswe failure_psw
+    .align 8
+start24_psw:
+    .quad 0x160000000000,_start24      /* 24-bit mode, cc = 1, pm = 6 */
+initial_r0:
+    .quad 0x1234567887654321
+expected_r0:
+    .quad 0x1234567896000000 + 0b      /* ilc = 2, cc = 1, pm = 6 */
+success_psw:
+    .quad 0x2000000000000,0xfff        /* see is_special_wait_psw() */
+failure_psw:
+    .quad 0x2000000000000,0            /* disabled wait */
-- 
2.34.1


