Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C8836F889
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:36:33 +0200 (CEST)
Received: from localhost ([::1]:56718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQVc-0000d4-9K
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTs-0007DV-KH
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQTq-0001A2-8X
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x5so19716015wrv.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4RgA8HjnjL0l3ff1bCKNaUeJ1xTQM5jESG7yIxF8FWg=;
 b=fw4RIwLwIHts1m6aizZO44ElucVarrwjYk4JaJXb7cRitnMKIekVGQCBbk/m5W5cib
 XfzYUGLsqahTL9/mqK9iF077/h7d34K0Ey9jglR+77nTYRFIAo9mg5LZOKwpsYRawuXb
 BsMPHEOlYOs1JIt4y8nAj7EWvflEjVqyoOLWCeC0gq1yyDlrtQ/sBPqgyZUnXvURODn4
 7e2SG56yQwafmWhzvK/mQsxjEnQkQA5+nQepyzeKG3/w+F7wSHupsuMQVOWPdn+uZ+dX
 f2hcWfoUHvDTI1g8MsztsT6ulsqTTINivvaFTEKy4lquynI6qK6bwqivHhYYuuRR03RU
 wNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RgA8HjnjL0l3ff1bCKNaUeJ1xTQM5jESG7yIxF8FWg=;
 b=DigBCuXTjplgSikLt5+YnJMxcDX0Fm5titt1whLLlTmAAo64aW9XYcPXnnKky2qxfL
 pLWOgajNmaBO+iXu5Vnm/kNbzpJlomO1wE69Q3bILeeBqineyUHeH7X4oARn7vNdDqIB
 eRYiMQ+U1AhKsd2FSARcF3lvFbLHXSL3XftN4ae8Q1WBX7hIgluVo5f6IQUW1RgrVM2e
 yhDJwk1Jx5JKj20z2rCKk4l1nyGKJAkGHzXv08RZnaCsWnZzzZTpj/4Bkc+aTaxfOExT
 ynEV4SUg8VTQvfzsWSqHaM5SHb3j5kqKXdURM6cXFkcOuQKVwCqePXS1mg93N6Tq/LOr
 re/Q==
X-Gm-Message-State: AOAM531wdCeHfWt3Sezn+CrmW4Ha4upfwmy9skSXR1RJYau+TLRtXUZX
 MEjCtFQs0vEf5r2VXH3cAGGmWRC8FX5hFhhG
X-Google-Smtp-Source: ABdhPJzn7ZaZZI0qHi0OfMPduqlcGuT01Tqcx5OhU9SsV0XWHqpHKxdCSCE9EBY5wS43mT+ra+tT3w==
X-Received: by 2002:adf:d0c1:: with SMTP id z1mr6024034wrh.404.1619778880716; 
 Fri, 30 Apr 2021 03:34:40 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/43] target/arm: Make Thumb store insns UNDEF for Rn==1111
Date: Fri, 30 Apr 2021 11:33:56 +0100
Message-Id: <20210430103437.4140-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Arm ARM specifies that for Thumb encodings of the various plain
store insns, if the Rn field is 1111 then we must UNDEF.  This is
different from the Arm encodings, where this case is either
UNPREDICTABLE or has well-defined behaviour.  The exclusive stores,
store-release and STRD do not have this UNDEF case for any encoding.

Enforce the UNDEF for this case in the Thumb plain store insns.

Fixes: https://bugs.launchpad.net/qemu/+bug/1922887
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210408162402.5822-1-peter.maydell@linaro.org
---
 target/arm/translate.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7103da2d7ab..68809e08f09 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6476,6 +6476,14 @@ static bool op_store_rr(DisasContext *s, arg_ldst_rr *a,
     ISSInfo issinfo = make_issinfo(s, a->rt, a->p, a->w) | ISSIsWrite;
     TCGv_i32 addr, tmp;
 
+    /*
+     * In Thumb encodings of stores Rn=1111 is UNDEF; for Arm it
+     * is either UNPREDICTABLE or has defined behaviour
+     */
+    if (s->thumb && a->rn == 15) {
+        return false;
+    }
+
     addr = op_addr_rr_pre(s, a);
 
     tmp = load_reg(s, a->rt);
@@ -6620,6 +6628,14 @@ static bool op_store_ri(DisasContext *s, arg_ldst_ri *a,
     ISSInfo issinfo = make_issinfo(s, a->rt, a->p, a->w) | ISSIsWrite;
     TCGv_i32 addr, tmp;
 
+    /*
+     * In Thumb encodings of stores Rn=1111 is UNDEF; for Arm it
+     * is either UNPREDICTABLE or has defined behaviour
+     */
+    if (s->thumb && a->rn == 15) {
+        return false;
+    }
+
     addr = op_addr_ri_pre(s, a);
 
     tmp = load_reg(s, a->rt);
-- 
2.20.1


