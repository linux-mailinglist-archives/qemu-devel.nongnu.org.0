Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD431EC603
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 02:01:58 +0200 (CEST)
Received: from localhost ([::1]:51976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgGqz-0000xE-4Q
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 20:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgGnp-0004it-Kv
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 19:58:41 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:33460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgGno-000246-QK
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 19:58:41 -0400
Received: by mail-pf1-x42c.google.com with SMTP id b201so315399pfb.0
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 16:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fuj4+EzL4ACqWfECVnWjXkyBK0NkdZBLVsNebnwCJQ0=;
 b=Gt1n7CgBAVrMefGoro/F1bQFx5YEOzJurEF9QGIvEHfvtgEkQqrePpJ2xWFgzsjo78
 1IbscEfWU9ic1LEvFHQ88A+o/EBVwVG2AtVEKGFXveKeJgALy3JeYj/XOAI8qfz8roYi
 /eIrkrmI1x5CSta4qUL5VALtRFFIRvvWnSH2lUQrVc/kp8jFVHefLt16K83QbKNOk8iS
 MebHs6cgC6Ixv0hRS7KZbrkQHUshv1XGK7K44KPK59YuKdW1X5uM99d9dGks7l3vJ1gn
 BO1pIlf4geX1fsRszDYLP/erW+XM+GfZeQii4g6flo9kh3DKeYMCCW2VPJ3ZZr2zP2DM
 DOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fuj4+EzL4ACqWfECVnWjXkyBK0NkdZBLVsNebnwCJQ0=;
 b=bYKwC18zaVjzY1xG0C2QGrDI2LHbXfihmND/B9RE9yPRFg7vLE+rEgYd8fJH4v2C5Z
 wrdRgVsA+P3cz+D+ADveyKaZ1aXqA+tTT6r9WPuinquPJU4it4SrIEUSf+AjS0gZjq6x
 1YY9uHEbIdLMs9Geg3fNJn3jJPB+rSlLUxuo95RnGNw3RglvVPS0fAbFnBeilT71HeK2
 dr36n0ca0CmjjDDORmoYIk5xPjixPpVHZjXINKr2o43Gqf47+qONXs0mZjuazBJ+WHN1
 8A+5DdOSovqRPpI7+icc4GPaBWBHHEk4FzCjHFmXjZqbRz0ikzAFrCvG+u+srI5UFq1A
 V5Vg==
X-Gm-Message-State: AOAM532KKjKZCfuyseEUUB22bouwqsMsxd32MbIZwz/Bu0fKRHfuExVb
 /gOn6vVun0IKH136qQ8gcsbZWwp8icQ=
X-Google-Smtp-Source: ABdhPJxlcgMpJLDQciR518qwX1M+JYBsQzQoVSZXtgFxCsOZoJbkiRFbdROoGrbbPmAEBQFEfpmIng==
X-Received: by 2002:a63:1a11:: with SMTP id a17mr26556826pga.227.1591142319104; 
 Tue, 02 Jun 2020 16:58:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id k101sm182201pjb.26.2020.06.02.16.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 16:58:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] decodetree: Rename MultiPattern to IncMultiPattern
Date: Tue,  2 Jun 2020 16:58:28 -0700
Message-Id: <20200602235834.470345-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200602235834.470345-1-richard.henderson@linaro.org>
References: <20200602235834.470345-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: peter.maydell@linaro.org, philmd@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Name the current node for "inclusive" multi-pattern, in
preparation for adding a node for "exclusive" multi-pattern.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/decodetree.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index b559db3086..7af6b3056d 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -371,7 +371,7 @@ class Pattern(General):
 # end Pattern
 
 
-class MultiPattern(General):
+class IncMultiPattern(General):
     """Class representing an overlapping set of instruction patterns"""
 
     def __init__(self, lineno, pats, fixb, fixm, udfm, w):
@@ -410,7 +410,7 @@ class MultiPattern(General):
                 output(ind, '}\n')
             else:
                 p.output_code(i, extracted, p.fixedbits, p.fixedmask)
-#end MultiPattern
+#end IncMultiPattern
 
 
 def parse_field(lineno, name, toks):
@@ -751,8 +751,8 @@ def parse_generic(lineno, is_format, name, toks):
                           .format(allbits ^ insnmask))
 # end parse_general
 
-def build_multi_pattern(lineno, pats):
-    """Validate the Patterns going into a MultiPattern."""
+def build_incmulti_pattern(lineno, pats):
+    """Validate the Patterns going into a IncMultiPattern."""
     global patterns
     global insnmask
 
@@ -792,9 +792,9 @@ def build_multi_pattern(lineno, pats):
         else:
             repeat = False
 
-    mp = MultiPattern(lineno, pats, fixedbits, fixedmask, undefmask, width)
+    mp = IncMultiPattern(lineno, pats, fixedbits, fixedmask, undefmask, width)
     patterns.append(mp)
-# end build_multi_pattern
+# end build_incmulti_pattern
 
 def parse_file(f):
     """Parse all of the patterns within a file"""
@@ -860,7 +860,7 @@ def parse_file(f):
                 error(start_lineno, 'indentation ', indent, ' != ', nesting)
             pats = patterns
             patterns = saved_pats.pop()
-            build_multi_pattern(lineno, pats)
+            build_incmulti_pattern(lineno, pats)
             toks = []
             continue
 
-- 
2.25.1


