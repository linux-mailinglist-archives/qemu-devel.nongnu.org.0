Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042E647BFC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:07:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Sls-0005x2-8A; Thu, 08 Dec 2022 21:05:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slm-0005w8-A3
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:46 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slk-0001vq-PO
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:46 -0500
Received: by mail-oi1-x234.google.com with SMTP id l127so3259646oia.8
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/3AO0EWlMT0lILOrDJMjNk2wMlVf+vs0sOwevFdt0Qk=;
 b=JTY/iGJ9C5Mr36xPA84a7WAqdtyZMxSRgvmPxpL/EEwLe0arnbuOrhzUT/4D1j0nV3
 sD3r/e/PgH456CzMlL3gmmZHMuq+/RNeQgCuMGoeemjkjjiqKY45FatuFA2bTvTk6UrS
 B2ZoovvhvPX6NQ/tqufF9ag4Q6WjLzlgQdFRyGeE8nDI3rWBhdABpWE+/R2pJFli1yIl
 KPJLsO8B8VaMjPHCravd45nbQLjckPFVN8vXh0l5A4GRuAsrofoXd0FTcjXHWz3o/mGV
 hRWURbVH+huTbvbsiVcJo4jVpO3UnLZpQNEx7JMCh7mg0NiRlz6DeA7Ob8qmerVB8/08
 GEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/3AO0EWlMT0lILOrDJMjNk2wMlVf+vs0sOwevFdt0Qk=;
 b=dRJGd+veUpzh4COw+nlUrGjEwJZJbPVXObu+aOeRBDQZvKSQLQmBk49ufCSsKwPhNU
 I4MK4Xe7uy60OWmwAmzJz1s4UE4WDDrwLf9en3WcJq5V/BqrBeWOmydLqfKJ+uW/uFCZ
 g60CVWcuP3Qd8mSPUXtCzOnrsBgADs3tIby2KXIK3wO7IbvWQALxhb72suOVY32Z7LpZ
 oysVOejH9lUSQPDNYxGXVSlVVCvA0PUVFCckKNgI45gmsfjzOtk7uANC0EgbWzJDN/+K
 j4k0zgRi2tt5y7T99KbpqhjiWW+KPCWUK/jnvuy1zYjOXcG83TxF8OyEff1/nfnAlHV8
 KNpg==
X-Gm-Message-State: ANoB5pncfHarCSQgAq7cFIz8IkSCim36VHJZUPAeQdZlKJ6Fimt8vmg9
 1zH6mtWfU9/lOK91gfoU81+/WMbWKjyqH6m94s4=
X-Google-Smtp-Source: AA0mqf7BSj0uwH9jJJ0y9+Ch2+uxlsnYq0Q+bR7b2WwTjR9iPd3X+qe8DMFwgCt6Zq9UqWkVOR1wwg==
X-Received: by 2002:a54:4503:0:b0:35b:822:8d71 with SMTP id
 l3-20020a544503000000b0035b08228d71mr1542981oil.9.1670551543460; 
 Thu, 08 Dec 2022 18:05:43 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 09/27] tcg/s390x: Remove FAST_BCR_SER facility check
Date: Thu,  8 Dec 2022 20:05:12 -0600
Message-Id: <20221209020530.396391-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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

The fast-bcr-serialization facility is bundled into facility 45,
along with load-on-condition.  We are checking this at startup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     | 1 -
 tcg/s390x/tcg-target.c.inc | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 31d5510d2d..fc9ae82700 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -62,7 +62,6 @@ typedef enum TCGReg {
 
 /* Facilities that are checked at runtime. */
 
-#define FACILITY_FAST_BCR_SER         45
 #define FACILITY_DISTINCT_OPS         45
 #define FACILITY_LOAD_ON_COND2        53
 #define FACILITY_VECTOR               129
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 29a64ad0fe..dd58f0cdb5 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2431,7 +2431,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         /* The host memory model is quite strong, we simply need to
            serialize the instruction stream.  */
         if (args[0] & TCG_MO_ST_LD) {
-            tcg_out_insn(s, RR, BCR, HAVE_FACILITY(FAST_BCR_SER) ? 14 : 15, 0);
+            /* fast-bcr-serialization facility (45) is present */
+            tcg_out_insn(s, RR, BCR, 14, 0);
         }
         break;
 
-- 
2.34.1


