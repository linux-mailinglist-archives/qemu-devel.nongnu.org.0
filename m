Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D34469D32B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:49:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB8e-0008AT-Aq; Mon, 20 Feb 2023 13:43:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6h-0004fs-Hg
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:49 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6f-00045g-1W
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:47 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v3-20020a17090a6b0300b002341a2656e5so2185771pjj.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXucR7EhGSIkydzJkgAPzsrJnH+F7Rth0vxWHmdJQnQ=;
 b=bDSr6QIzXMYj043tHO5s67GZFOqATw1crtbpC1JPqXHxNpPvvmLCKZASbvkrMcRUhW
 P3yGLiMObTSAxTZvcyZIwQc7+cXp5BJEbmeuyhUnW6VaOj5ugP0wYzOePiZhGjDJDqTm
 MznwTOySea9C64uDUSM9uTaBVWp4kbOyL1jqAQdA1d8zA4/6/VF97y8yMQlSiFs5zWO2
 PINT94RWEZwwT0T2m24dbOtIPOruywBHn3dUEylNsLVemqC+1z90eNCHtlFyWMjwqWOx
 6t0WiStzVTztOhTiCcHqrKJiw9suDsa7NZ7cPzYKtyjpYmNuy5B+KFlUexOw/c2I53Bw
 nOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zXucR7EhGSIkydzJkgAPzsrJnH+F7Rth0vxWHmdJQnQ=;
 b=Q9ENZmwH14/xfq//X/cwA9CkzD/SW82VHkdTEid7rMfxKWudGMX/nQ+IWaLPoHbDY0
 mQS3fNPqzjYsNnXjyAeBuuOPsrhNHAtB5XPVOkhqxe2+F20G0ZCwJ4OXVG2RwmQ6sGLr
 mkGyJTn+kMVPtHJw4+jxE/8zmvCkIH3CWj/+hvXHwihyFRq3o2DLAXd3gmb0H8rSwQ5n
 7gURPLn3qO9Y2avQb/I9OSWqSwWjEr6fBya/J0ZcSjcgZs6Q7A5GkU8XUBYdwH22IWry
 HkfQjW9h+aKRsJ/b7lvGzzpNkPYgFuKJB7NQjDTvuOhy4bA/qz02vI5LKMWbZgVL1awG
 sxwA==
X-Gm-Message-State: AO0yUKVikc2IfUUD9J+6EB4mE3OWbQzwZKGGij8BjchAsQ9OCJvf049O
 Lzvs3S2xFUqrN1agFuMM4KLJ5Ua/79yJc7iM9CM=
X-Google-Smtp-Source: AK7set8pmNDRep2y0jcsL6Jl22XVsFXhpHHT+yNNNcQcVQuq9s3/oCoqEwKs+WPk8x3Qwu88DADxYA==
X-Received: by 2002:a17:902:e945:b0:19a:9a66:9030 with SMTP id
 b5-20020a170902e94500b0019a9a669030mr970200pll.4.1676918503242; 
 Mon, 20 Feb 2023 10:41:43 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 26/27] target/s390x: Pass original r2 register to BCR
Date: Mon, 20 Feb 2023 08:40:51 -1000
Message-Id: <20230220184052.163465-27-richard.henderson@linaro.org>
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

We do not modify any general-purpose registers in BCR,
which means that we may be able to avoid saving the
value across a branch.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/insn-data.h.inc |  2 +-
 target/s390x/tcg/translate.c     | 10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
index 9d2d35f084..bdfc09db3e 100644
--- a/target/s390x/tcg/insn-data.h.inc
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -121,7 +121,7 @@
 /* BRANCH INDIRECT ON CONDITION */
     C(0xe347, BIC,     RXY_b, MIE2,0, m2_64w, 0, 0, bc, 0)
 /* BRANCH ON CONDITION */
-    C(0x0700, BCR,     RR_b,  Z,   0, r2_nz, 0, 0, bc, 0)
+    C(0x0700, BCR,     RR_b,  Z,   0, r2_o_nz, 0, 0, bc, 0)
     C(0x4700, BC,      RX_b,  Z,   0, a2, 0, 0, bc, 0)
 /* BRANCH RELATIVE ON CONDITION */
     C(0xa704, BRC,     RI_c,  Z,   0, 0, 0, 0, bc, 0)
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 24d8d84727..e4db5f1c02 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -5754,6 +5754,16 @@ static void in2_r2_nz(DisasContext *s, DisasOps *o)
 }
 #define SPEC_in2_r2_nz 0
 
+static void in2_r2_o_nz(DisasContext *s, DisasOps *o)
+{
+    int r2 = get_field(s, r2);
+    if (r2 != 0) {
+        o->in2 = regs[r2];
+        o->g_in2 = true;
+    }
+}
+#define SPEC_in2_r2_o_nz 0
+
 static void in2_r2_8s(DisasContext *s, DisasOps *o)
 {
     o->in2 = tcg_temp_new_i64();
-- 
2.34.1


