Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D161F40ED
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 18:31:26 +0200 (CEST)
Received: from localhost ([::1]:38108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jih9p-0008PO-BO
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 12:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jih3t-0000Du-3I
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:25:17 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jih3r-0000UM-TQ
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 12:25:16 -0400
Received: by mail-pj1-x1030.google.com with SMTP id q24so1631475pjd.1
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+utQoTLUzPPlGyk84vqSkSI1IEc8oNkKhMpAe11BE/0=;
 b=jw8PR3y9V5Xa/5bOnmXERg83JB6cjNV7kFHAJFLnzvWme9G0vNky5sZt3Fp13J7JTt
 OcOmPN9/j37LxDedFOfKeBtKzGqDAv8FLl6AG8y5KRHwI5vv6qwE54Y+kwDx4l9f2Mw7
 bk06ot5r7NywCoakswwjaygPlKi9gHGk8FUvrGfoTKSlDNCRDF8b6wbGyRtUVOoRqtnv
 GNMTVoc+zIIphz692L1n7iWhsZMxmIxdJkgTPMfv0Gi+gKgNw7XZ7xbr+NUbtZZ1Mp0G
 2OoQcLA8D+/1IXAv4ArYq6zqpE8Kw1BUzprxuT8xabjfJnR367sivimud9Hw2u+YP1jb
 8TnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+utQoTLUzPPlGyk84vqSkSI1IEc8oNkKhMpAe11BE/0=;
 b=jiclsF0aRx7JgymGaVCfCcJD09SdU2TzvOABdx7Gm0h7E3m5Wg01DqWMUe348j3J3N
 c7ueiQ0S4/hxnet9D80snuYgcixtLUbyDdxkd1cI5DxusWf0iDtnO4OI628Mje+KHQYD
 WjlAFd1IiJvYI/gmzuzzME4dNWUETD4ILHGlCkR5gBDCwHGOpXWWsje2d7s7bsGuHLs9
 gROq1/7/e+9acn9XqoCOa5/phkkb8ra9OaL90HMUoiCnfr+Y6WOiqqqN9T7NZCOCMQIK
 TQt6eHlXLNKt6KzA0ZVeII0Atarwmg1T0DzPN2DPDqrx0eEugmryu2yblmgaDkURIF3r
 QV3g==
X-Gm-Message-State: AOAM532fhzc/Ysa9sjqf67I3UU2Vbt0QNfvojHxBHssacU4ICo8BcBzT
 RoVD/FRp2JsB7+iPLcEonFaLGLUJNe0=
X-Google-Smtp-Source: ABdhPJweCWnTfVydovZvUnqI1fQE9UWElrlIlThsZr6d/oqoGyK9fSUs8QWCvnvtznDEFaRu83/yoA==
X-Received: by 2002:a17:90a:64cb:: with SMTP id
 i11mr5782251pjm.193.1591719914045; 
 Tue, 09 Jun 2020 09:25:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s188sm7580101pfb.118.2020.06.09.09.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 09:25:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] decodetree: Implement non-overlapping groups
Date: Tue,  9 Jun 2020 09:25:01 -0700
Message-Id: <20200609162504.780080-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200609162504.780080-1-richard.henderson@linaro.org>
References: <20200609162504.780080-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Intended to be nested within overlapping groups.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/decodetree.py | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 0ba01e049c..7e3b1d1399 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1021,16 +1021,20 @@ def parse_file(f, parent_pat):
         del toks[0]
 
         # End nesting?
-        if name == '}':
+        if name == '}' or name == ']':
             if len(toks) != 0:
                 error(start_lineno, 'extra tokens after close brace')
             if len(parent_pat.pats) < 2:
                 error(lineno, 'less than two patterns within braces')
 
+            # Make sure { } and [ ] nest properly.
+            if (name == '}') != isinstance(parent_pat, IncMultiPattern):
+                error(lineno, 'mismatched close brace')
+
             try:
                 parent_pat = nesting_pats.pop()
             except:
-                error(lineno, 'mismatched close brace')
+                error(lineno, 'extra close brace')
 
             nesting -= 2
             if indent != nesting:
@@ -1044,11 +1048,14 @@ def parse_file(f, parent_pat):
             error(start_lineno, 'indentation ', indent, ' != ', nesting)
 
         # Start nesting?
-        if name == '{':
+        if name == '{' or name == '[':
             if len(toks) != 0:
                 error(start_lineno, 'extra tokens after open brace')
 
-            nested_pat = IncMultiPattern(start_lineno)
+            if name == '{':
+                nested_pat = IncMultiPattern(start_lineno)
+            else:
+                nested_pat = ExcMultiPattern(start_lineno)
             parent_pat.pats.append(nested_pat)
             nesting_pats.append(parent_pat)
             parent_pat = nested_pat
@@ -1067,6 +1074,9 @@ def parse_file(f, parent_pat):
         else:
             parse_generic(start_lineno, parent_pat, name, toks)
         toks = []
+
+    if nesting != 0:
+        error(lineno, 'missing close brace')
 # end parse_file
 
 
-- 
2.25.1


