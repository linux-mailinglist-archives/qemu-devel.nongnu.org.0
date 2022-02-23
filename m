Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F6F4C1EB2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:40:13 +0100 (CET)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0Iq-0003rc-QY
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:40:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nN0Ac-00068i-OQ; Wed, 23 Feb 2022 17:31:38 -0500
Received: from [2607:f8b0:4864:20::f2e] (port=42664
 helo=mail-qv1-xf2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nN0Aa-00016t-NX; Wed, 23 Feb 2022 17:31:38 -0500
Received: by mail-qv1-xf2e.google.com with SMTP id e22so650707qvf.9;
 Wed, 23 Feb 2022 14:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q81pLNWQOVHFoGtbO/Q6teck/eKYPfk3oHhe3VFCtAY=;
 b=XTt04oHrxOfFpShwHqyVda5o+UjYGG2g+nXWnCTfa29pj73RXWWuhABvP2vGxaqRc5
 7tcE5yuU7BP+OuvnY9TCwhAtWP9kJoSUUT5Ife8unjyLPg6SA3q+SV80Um84MBq37lAx
 BjAQGZvzOYZRqz42vqCaebq3JCZqqcQ+0KOjfAiE9ULkqIuQOB4l5xrXWdqNf6E+Pr+z
 AVfa/a52rMRYCa6m74bBjFbY9fw1EmmoTtLjUH4EN8cxRTzeJeXLflHzu3yeiCw5Saji
 gBFtan701Q9Vi9ogEzkAKYa0kHc2dlo947Q+O44/YJbtHSniR8Tbs9ZCGNRoKausBUlb
 loog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q81pLNWQOVHFoGtbO/Q6teck/eKYPfk3oHhe3VFCtAY=;
 b=P8R7hZeYszbHaxyJ2SNioMs18c0hT87JXwf7uE6d4dijC9GLhFQ5aPApIWhvUaLtZb
 tB/7WV5xzVebyVJXY6LIHkdABWniTWx8TJcF2PQzOyY4tkhF9+6/TkdV0Ok04IkLkTUe
 V2YqjsmSesU+3btDJ0KXt2HYMZ7Nggv+AOVCBe0YayyHf1PkqaRz17ffjBQntFuJf5H4
 Mq7w8rqFsgUwVzsOG3yB8YvR9EYHf7r6ICXq/Osy2iewMljJhlwP46E3La1jKBKDgqpd
 AcrMELHCki3Y+RL6HqIzuwgtHQj4D0xwnJZe6mgSkCCAH2kX0MEA6DSR9aCv1uIUV/Hh
 kUgw==
X-Gm-Message-State: AOAM532zXwNw8G7lst7TG0O+j7nj5H0AA2vM/2puxJhNcjrPMwuwiAvC
 1LzLim/sLmCAO3qV25+1IK4rvtdFQVSvKlrCTZ0=
X-Google-Smtp-Source: ABdhPJxCX1/bdNCfXLPpCO4lcY39DEp5/wkCSBvo7uBLDWYnmYHiLSGuEBEUaK36HObry69k70Kclw==
X-Received: by 2002:a05:622a:1045:b0:2de:4c9e:78c1 with SMTP id
 f5-20020a05622a104500b002de4c9e78c1mr1873533qte.163.1645655494965; 
 Wed, 23 Feb 2022 14:31:34 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 o18sm618968qtv.26.2022.02.23.14.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:34 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v7 4/4] tests/tcg/s390x: changed to using .insn for tests
 requiring z15
Date: Wed, 23 Feb 2022 17:31:17 -0500
Message-Id: <20220223223117.66660-5-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220223223117.66660-1-dmiller423@gmail.com>
References: <20220223223117.66660-1-dmiller423@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Miller <dmiller423@gmail.com>
---
 tests/tcg/s390x/mie3-compl.c | 21 +++++++++++----------
 tests/tcg/s390x/mie3-mvcrl.c |  2 +-
 tests/tcg/s390x/mie3-sel.c   |  6 +++---
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
index 98281ee683..31820e4a2a 100644
--- a/tests/tcg/s390x/mie3-compl.c
+++ b/tests/tcg/s390x/mie3-compl.c
@@ -14,25 +14,26 @@
 #define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
 { uint64_t res = 0; F_PRO; ASM; return res; }
 
+
 /* AND WITH COMPLEMENT */
-FbinOp(_ncrk,  asm("ncrk  %%r0, %%r3, %%r2\n" F_EPI))
-FbinOp(_ncgrk, asm("ncgrk %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_ncrk,  asm(".insn rrf, 0xB9F50000, %%r0, %%r3, %%r2, 0\n" F_EPI))
+FbinOp(_ncgrk, asm(".insn rrf, 0xB9E50000, %%r0, %%r3, %%r2, 0\n" F_EPI))
 
 /* NAND */
-FbinOp(_nnrk,  asm("nnrk  %%r0, %%r3, %%r2\n" F_EPI))
-FbinOp(_nngrk, asm("nngrk %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_nnrk,  asm(".insn rrf, 0xB9740000, %%r0, %%r3, %%r2, 0\n" F_EPI))
+FbinOp(_nngrk, asm(".insn rrf, 0xB9640000, %%r0, %%r3, %%r2, 0\n" F_EPI))
 
 /* NOT XOR */
-FbinOp(_nxrk,  asm("nxrk  %%r0, %%r3, %%r2\n" F_EPI))
-FbinOp(_nxgrk, asm("nxgrk %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_nxrk,  asm(".insn rrf, 0xB9770000, %%r0, %%r3, %%r2, 0\n" F_EPI))
+FbinOp(_nxgrk, asm(".insn rrf, 0xB9670000, %%r0, %%r3, %%r2, 0\n" F_EPI))
 
 /* NOR */
-FbinOp(_nork,  asm("nork  %%r0, %%r3, %%r2\n" F_EPI))
-FbinOp(_nogrk, asm("nogrk %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_nork,  asm(".insn rrf, 0xB9760000, %%r0, %%r3, %%r2, 0\n" F_EPI))
+FbinOp(_nogrk, asm(".insn rrf, 0xB9660000, %%r0, %%r3, %%r2, 0\n" F_EPI))
 
 /* OR WITH COMPLEMENT */
-FbinOp(_ocrk,  asm("ocrk  %%r0, %%r3, %%r2\n" F_EPI))
-FbinOp(_ocgrk, asm("ocgrk %%r0, %%r3, %%r2\n" F_EPI))
+FbinOp(_ocrk,  asm(".insn rrf, 0xB9750000, %%r0, %%r3, %%r2, 0\n" F_EPI))
+FbinOp(_ocgrk, asm(".insn rrf, 0xB9650000, %%r0, %%r3, %%r2, 0\n" F_EPI))
 
 
 int main(int argc, char *argv[])
diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c
index 81cf3ad702..f0be83b197 100644
--- a/tests/tcg/s390x/mie3-mvcrl.c
+++ b/tests/tcg/s390x/mie3-mvcrl.c
@@ -6,7 +6,7 @@ static inline void mvcrl_8(const char *dst, const char *src)
 {
     asm volatile (
     "llill %%r0, 8\n"
-    "mvcrl 0(%[dst]), 0(%[src])\n"
+    ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
     : : [dst] "d" (dst), [src] "d" (src)
     : "memory");
 }
diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c
index 2e99e00b47..ee619a763d 100644
--- a/tests/tcg/s390x/mie3-sel.c
+++ b/tests/tcg/s390x/mie3-sel.c
@@ -22,9 +22,9 @@ asm (                   \
 }
 
 
-Fi3 (_selre,    "selre    %%r0, %%r3, %%r2\n")
-Fi3 (_selgrz,   "selgrz   %%r0, %%r3, %%r2\n")
-Fi3 (_selfhrnz, "selfhrnz %%r0, %%r3, %%r2\n")
+Fi3 (_selre,     ".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n")
+Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n")
+Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n")
 
 
 int main(int argc, char *argv[])
-- 
2.32.0


