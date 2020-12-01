Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD4C2C9F58
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 11:35:09 +0100 (CET)
Received: from localhost ([::1]:43382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk300-0001UO-4Y
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 05:35:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk2z4-00011k-HG
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:34:10 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kk2z2-0003SZ-TI
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 05:34:10 -0500
Received: by mail-wr1-x443.google.com with SMTP id e7so1854712wrv.6
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 02:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=scuISfeqiwhT+y7+PPJSkMhz1Vjs0h20UQymCtErqXQ=;
 b=M3B+IVKogSGalBk/4owgSxBOGwIS8ouB0y38XvwLZfDgU99uMQ70F1CQyFwBkafkTN
 MMM7xuC2KtLPjMYVBz2t2aXSL19uyUf7kahr6YO/mwiUZZb5GG+BnYBjx4UNwRt6Wbvc
 Ivhp8mLJ7fomajJ1pNdOQdYOShQucIzoPsz4jxqVa21uBzRBCwcDsJ6qPfcZQxBrMSbw
 euewc9K4P6/VaJNTZBklPm99hTxF80yFSWxZXg/hf7qdpCu4hzY6UoBbgtIapHth6Gwf
 nXeoP7Z7ICqkMW8WYrAfcHjnlTwvN/QWS2Mfjn/o+hLSPDrTSwDNAW6TxYfoQmGJgixX
 jcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=scuISfeqiwhT+y7+PPJSkMhz1Vjs0h20UQymCtErqXQ=;
 b=KSSkknurgcbn2fsDnu/+e6IWRlNB5YwbVUEfMCEvzC1Du2I2RUEYGUwho/DK69nU9c
 weERtwABoaVUBUP9+e8qHwFF8bGVsduCWspecXMpirqVncT+1Jb4gQ5hY4WGwRLW8MMv
 NdRjK2HUGrYtN5qS20UAkXXBuhx0463vbE5R3SHoRGgrhG1yYSf2k0q7bqf+mVU17ZGb
 I9U0GKzAif3U5QZbfSnaIvrd3+0A+qN6WvhhHV+870Z5LRr/QaIsUKdwwNI+9941FjjA
 Tuf9Gxg49ipVHHiCaVd4sRXpCYVC58ixc/Id3tRZHwrTUZSOegq8hPPuR0yNNfYaPE0y
 cHGw==
X-Gm-Message-State: AOAM532C532UXIETByERdOcHLtj7p7Y/TMpcxosTWDwocrnlevCUW3yN
 LiWBqyDKnrhbcevylu1emSwFNJ93d4E=
X-Google-Smtp-Source: ABdhPJxkIgAWYhizCNji3mL+nqtkDbk2nSBxFN2aN3oK2DYC1GJysi/mKE6MmGW2kaeG6KJrg/jtog==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr2984481wrl.406.1606818846604; 
 Tue, 01 Dec 2020 02:34:06 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id g11sm2420545wrq.7.2020.12.01.02.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 02:34:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] decodetree: Allow use of hex/bin format for argument field
 values
Date: Tue,  1 Dec 2020 11:34:04 +0100
Message-Id: <20201201103404.2795455-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
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

To add support for bin/hex constants in argument field token,
extend the re_num_ident regexp and use '0' as radix base when
parsing the integer (to interpret it as a code literal).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Fix regexp (Richard)
---
 scripts/decodetree.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 47aa9caf6d1..c8136073535 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -50,6 +50,7 @@
 re_fld_ident = '%[a-zA-Z0-9_]*'
 re_fmt_ident = '@[a-zA-Z0-9_]*'
 re_pat_ident = '[a-zA-Z0-9_]*'
+re_num_ident = '[+-]?([0-9]+|0x[0-9a-fA-F]+|0b[01]+)'
 
 def error_with_file(file, lineno, *args):
     """Print an error message from file:line and args and exit."""
@@ -849,9 +850,9 @@ def parse_generic(lineno, parent_pat, name, toks):
             continue
 
         # 'Foo=number' sets an argument field to a constant value
-        if re.fullmatch(re_C_ident + '=[+-]?[0-9]+', t):
+        if re.fullmatch(re_C_ident + '=' + re_num_ident, t):
             (fname, value) = t.split('=')
-            value = int(value)
+            value = int(value, 0)
             flds = add_field(lineno, flds, fname, ConstField(value))
             continue
 
-- 
2.26.2


