Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA8230EA73
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:52:34 +0100 (CET)
Received: from localhost ([::1]:42762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ukz-0007KU-1r
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tk5-0006OL-9V
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:33 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tjv-0004DZ-5s
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:47:33 -0500
Received: by mail-pj1-x1030.google.com with SMTP id z9so818955pjl.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6E9LDuPBslW5lnZ+lbP25axObg1A1JUNAlm8q5oVbA=;
 b=XwqoYckSabpVxvAGqV0DrFmktCk9t8RevaXgLASgoS8jTGXS56knh3iQTpNKfwZVuJ
 9ekaPazK6bKUqj36k3lHPokMw5BneHN+ueeozJ7sWxNkeVYUZdMnGHvCSFoxZ/kSBnIJ
 nAkgPB6AJfCaSAKLpwxIc0Xce6m8n2JJqEydO/M3aSy0SNNrASKd48LxOFPbgyZXny8V
 J9ZgTvTFyxfGaVRWfPcBsIwcHaGS10bIQ1R2CsGy+0POjqbdqNxdRBHz7gqAa92w2HRm
 4GMLF4n25H3KVGXJsGPZS+rjqJtjeX1tD77hrZik/qWrvBbTlU7LDfb2WGytQTWzKbKp
 Jh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6E9LDuPBslW5lnZ+lbP25axObg1A1JUNAlm8q5oVbA=;
 b=IIlTSnLLuSZZ2pwNalA/S5BuB/AKujQAYnJ9orTX7uNMwO6JT/KyZQ8LlOOJ4qCJ6a
 CjcOrZc/nFO9CUMFnVg+PySzUgKRfxDuuGKbqp9Yzo7br97qaftke12mVDAhmr2HJiLf
 nGPKi/wkT22ud3zU91UOstquc9nBD3lE4Mil5D43jRyl7bW9kzInkALk9mikC/xyi0HR
 uaWJj0p3KzbJXCbFeso4R4aadbHOB9M+Moxv4rdQKgWmsKPVputHJDLQdsdQjykF60yP
 tn/8pad6dySXLAO5Nr9a4l/GKy0nGTwC/nndhSFMmkmwsT6rmA0/GIgzrj5HZ238Thbz
 Blpw==
X-Gm-Message-State: AOAM5337RL8bT4/kaBSPH8T0c2rS3mToAHyTNgYV4axG374kh7tv1sxm
 8KlzlwjzAETehIEW7d2OW/VTCqeUa4wM9U+G
X-Google-Smtp-Source: ABdhPJzTi8wpf3j2Z83Go5bRPNUfCr1hQ+a+m7Ktqa3mpWALiUF2A1ML6GIKsyNhfsjQNJK5M4ixjA==
X-Received: by 2002:a17:90b:4d0a:: with SMTP id
 mw10mr5870235pjb.217.1612403240965; 
 Wed, 03 Feb 2021 17:47:20 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:47:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 75/93] tcg/tci: Split out tcg_out_op_rrcl
Date: Wed,  3 Feb 2021 15:44:51 -1000
Message-Id: <20210204014509.882821-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 6c743a8fbd..8cc63124d4 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -341,6 +341,20 @@ static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrcl(TCGContext *s, TCGOpcode op,
+                            TCGReg r0, TCGReg r1, TCGCond c2, TCGLabel *l3)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out8(s, c2);
+    tci_out_label(s, l3);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrc(TCGContext *s, TCGOpcode op,
                             TCGReg r0, TCGReg r1, TCGReg r2, TCGCond c3)
 {
@@ -565,12 +579,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     CASE_32_64(brcond)
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out8(s, args[2]);           /* condition */
-        tci_out_label(s, arg_label(args[3]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrcl(s, opc, args[0], args[1], args[2], arg_label(args[3]));
         break;
 
     CASE_32_64(neg)      /* Optional (TCG_TARGET_HAS_neg_*). */
-- 
2.25.1


