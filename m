Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE462C8432
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:37:20 +0100 (CET)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjiQh-0002Og-Up
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:37:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kjiGX-0000nf-OT
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:50 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:34926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kjiGV-0002XN-No
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:26:49 -0500
Received: by mail-wm1-x341.google.com with SMTP id e25so5954457wme.0
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 04:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VA7NaFf2Q2lCqaq14OKvgdpQy3QN9t5ZRZL0R3j554M=;
 b=H8O4moXlrZ9kjAyrDN5KyH8VOnD5lgzIOU8sjSgS86YkfwS0Bl2fVoG513JXLYrsnq
 mpCksJZr1WZKuH9pCn2jGbFWFxdvF/NiYZqCRfWsuhg46dOO91eGlauk98krLj7zzEYw
 aOmfW6PSfdciLnlCCqAQeT7HobbOWyhrbfRHH5W8Lu6qij8XTrpBtaeU9IHGDaKNOkPl
 VE+S7W/ELyoNY4x/EWCiXfQvFZ7w/mYytXDg2qGNkf6ZZRrIgip4NnbwcdtIDJjEsWsD
 FEwy3ad9gwHPvNttBFiAXZ2d4wCpVEt2tRWPcAfCurVpqVXmfp44gjBDJkmKD6nqaBrB
 tSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VA7NaFf2Q2lCqaq14OKvgdpQy3QN9t5ZRZL0R3j554M=;
 b=t83yxDdhNxo8+CqrXgB3Msqmeero5dyK5Y1JcYAYRWG+xe9yWoUZrvuafTCFCDdAwO
 8Z5wh4QYSxSzU+tJYmuC1b8Yreq5Q4VZ4V0oNAIW6AMT2CPKIqpw9P9prfRyHjYRu+N7
 tovG0QhYIAGyB48xf8jEVDOVavFv8c6PlNzZcdon04Al93CmGelMOg4ptU0wWZNcc89+
 xpnVW06zR6p6CDbQuOhfu99HXE04KGR4QHnChxv3KSk82+ecai8mA77PKuXIA+QrWm1Q
 DCGP5HFge5Seb11aAFjzAJE4Ne42ldu/LbRvQsyNs7ghrmUXrMDGQ7Q1cx18QafgUZUa
 Yrww==
X-Gm-Message-State: AOAM5324ILRoOpP/9AvEloDQA8eJryDJmHREpNnNTLDg9+azbgnL09Tq
 12l+WohL1dsJkIhNKYkT/uRYIZHxMmE=
X-Google-Smtp-Source: ABdhPJzyf6uzSMIXLNlVMMIB+VodbgrlRX0DK/fU07d5jfTymasH5yGwvsQ9Cyto1il1bKD62ivDow==
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr1263205wme.184.1606739202209; 
 Mon, 30 Nov 2020 04:26:42 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id r1sm26983621wra.97.2020.11.30.04.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 04:26:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] decodetree: Allow use of hex/bin format for argument field
 values
Date: Mon, 30 Nov 2020 13:26:39 +0100
Message-Id: <20201130122639.2431070-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA datasheets often use binary or hexadecimal constant values.
By doing base conversion, we might introduce bugs. Safer is to
copy/paste the datasheet value.
Add support for bin/hex constants in argument field token.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Is there a more pythonic way to write this if/elif/else
loop without re.fullmatch?
---
 scripts/decodetree.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 47aa9caf6d1..d2ecc61813f 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -849,9 +849,15 @@ def parse_generic(lineno, parent_pat, name, toks):
             continue
 
         # 'Foo=number' sets an argument field to a constant value
-        if re.fullmatch(re_C_ident + '=[+-]?[0-9]+', t):
+        if re.fullmatch(re_C_ident + '=[+-]?(0[bx])?[0-9]+', t):
             (fname, value) = t.split('=')
-            value = int(value)
+            if re.fullmatch('[+-]?0b[0-9]+', value):
+                base = 2
+            elif re.fullmatch('[+-]?0x[0-9]+', value):
+                base = 16
+            else:
+                base = 10
+            value = int(value, base)
             flds = add_field(lineno, flds, fname, ConstField(value))
             continue
 
-- 
2.26.2


