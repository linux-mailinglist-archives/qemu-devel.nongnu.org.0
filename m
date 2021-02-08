Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0439313D09
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:19:11 +0100 (CET)
Received: from localhost ([::1]:55426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9B7u-0003x4-VC
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oS-0003wn-4C
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:43 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l94oN-0003tQ-1r
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:34:39 -0500
Received: by mail-wm1-x334.google.com with SMTP id j21so10197577wmj.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 03:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SuGbvoGfA87QOxhejnfnAT4N6Q/MWEiUccByyN71et0=;
 b=FaSE7dv4PNMRTubg3zFNttVvqEwLIW2LUO0c10BurHGifmvQuBzKVrQAn+sE3K2cHx
 7AQc2VfNhPuekq0qY17N02QZJBEIrePYNa4BesZYnltUKkX5iFb9uSNwgdNa6pJ8yqhk
 lMZkvZlTTh4v8JCbxWOrU7faC1cVfPOhLLx6BnfrVww68lZbAvK+a3vqhIT+fVTRs5ca
 FhoOavKnbYGlG7fzUYqC5RPnpVKBehcIeWRDdeMkoLp49rRAqo3EQOZQ0lTM2CKYoCQH
 LryzVotyeqlwqclBuYlfMiVATPO7fVINKEkvzVGKZ0EuUxgdN/i1BJyZ06661OAFLt1C
 g2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SuGbvoGfA87QOxhejnfnAT4N6Q/MWEiUccByyN71et0=;
 b=Nkgexv0OgfQjYetq5wnHStAo8UDKnH3ihVmB2TE8JkB+5GiaNBPxPRlR2K6wqho+jb
 DzecpBZuDKkrVczi8/osKw0Yrbz1Y1z/n6uAP66Owsq2aDd7GR7qmJUvQBjI1KXnoBMx
 EStuOtur2GjIvly7YxPiLNgaaMMLkE+RRnQp1gsbxnWFMWOsDj3ucjcXbbaeCknx3vIq
 V9QAXSHr1cH08m1TwyO393US6uhEdx2SctIVZCP/KaSoU3v0Upw3wxRX9++xJ+8Swrhq
 FQqD+UmIL72KToY1lqPcja8ZHG+/cVS1S7+y20IJC7jaRAZT1T+SJ07VlP8jmFqNSexH
 onlg==
X-Gm-Message-State: AOAM5334a2yJ2LZnf9/2yfolsvhkSLGyEzvES9bGy37ZPSo3qN3vmtIn
 aRbvjVJQsJU0Cg/CkSCuwVd8UTKzHjrRvw==
X-Google-Smtp-Source: ABdhPJzdNPB8CntcAhYWBohqosUDx/y+MJDBo/pUe3hDy/hId7tNdwT0DqqvU9GGzHw6zbZmztbNZg==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr8154597wmo.16.1612784073777; 
 Mon, 08 Feb 2021 03:34:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a21sm16818134wmb.5.2021.02.08.03.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 03:34:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/m68k: Drop use of gdb_get_float64() and ldfq_p()
Date: Mon,  8 Feb 2021 11:34:25 +0000
Message-Id: <20210208113428.7181-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208113428.7181-1-peter.maydell@linaro.org>
References: <20210208113428.7181-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We used to make a distinction between 'float64'/'float32' types and
the 'uint64_t'/'uint32_t' types, requiring special conversion
operations to go between them.  We've now dropped this distinction as
unnecessary, and the 'float*' types remain primarily for
documentation purposes when used in places like the function
prototypes of TCG helper functions.

This means that there's no need for a special gdb_get_float64()
function to write a float64 value to the GDB protocol buffer; we can
just use gdb_get_reg64().

Similarly, for reading a value out of the GDB buffer into a float64
we can use ldq_p() and need not use ldfq_p().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/m68k/helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 3ff57657958..09f0391d508 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -72,8 +72,7 @@ static int cf_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
 {
     if (n < 8) {
         float_status s;
-        return gdb_get_float64(mem_buf,
-                               floatx80_to_float64(env->fregs[n].d, &s));
+        return gdb_get_reg64(mem_buf, floatx80_to_float64(env->fregs[n].d, &s));
     }
     switch (n) {
     case 8: /* fpcontrol */
@@ -90,7 +89,7 @@ static int cf_fpu_gdb_set_reg(CPUM68KState *env, uint8_t *mem_buf, int n)
 {
     if (n < 8) {
         float_status s;
-        env->fregs[n].d = float64_to_floatx80(ldfq_p(mem_buf), &s);
+        env->fregs[n].d = float64_to_floatx80(ldq_p(mem_buf), &s);
         return 8;
     }
     switch (n) {
-- 
2.20.1


