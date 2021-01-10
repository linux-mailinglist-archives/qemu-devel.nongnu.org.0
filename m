Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23912F047D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 01:04:06 +0100 (CET)
Received: from localhost ([::1]:35232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyODF-0007xq-Qp
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 19:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyOC2-0007Wx-VG
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 19:02:50 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:56270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyOBx-0005Gk-Dt
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 19:02:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id c124so10652938wma.5
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 16:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FDZUXvUmtcIWmbdDBGyyVWvJunFKN4yhyfU3SKU21DM=;
 b=XdH23OyiVhhNxonYPd0SM2lThywhxGpyJT6z5C4OCYkYNSgdeknRaWxj0NMdatBlYu
 V8eHzQvna6LxVUpkgGKgYDJMREvY8cI5/hCl0TPfYcxaoxN1lr82/Gbq05NzYpcCJov6
 WeN9WUikKn2ebos/uk6HSO2UYvyKFb+9+s1J7LZn5jPAjzmCcrj7ENzenXZ7tTrIxdXZ
 QaszFRxYqahmSsuPfLApfB63vtzl+g+rbYc0lUpgBqjoGEyJID98INWUhSgTFWAvQa3r
 jPjOrzT3qq0z+D/CVy2o6/PEkZI0h8i1gR7Bd2S+Dm7gfkDe6S2z1Jhwg25O6VeoiiZs
 lN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=FDZUXvUmtcIWmbdDBGyyVWvJunFKN4yhyfU3SKU21DM=;
 b=OKDIdYqrp4k3bl2qS2YpaupDL6WeyRiROUrlyovIfFjprTFRk5qduK9e8IPusbPkYU
 7LqWWZ6agFxhQUa1Ew0SNNgDP2lOLD4ZCwgkOGPym+KmaPBzsQKB11Tjt7y/sNboM2bU
 HPnLc+RR99zfp1wY2rx2BDuFClCOThDtHnr2JpY6wW1ElVKLLzE1ybrVUJjsFoj7nYWM
 vDscK68fxKfUyAfVTFrJIEPU4XC69HPAUrftvs3cKwtrSL37B0vqG1RrGf5Ij3Qr/iGp
 wpE1F5og2Rd6JTXD4AC8Z0OA4YrkQ6r/h9faZ4ec8C7kYqgTt+ECFdYj2BCLeA6s4pJD
 7AJQ==
X-Gm-Message-State: AOAM531pWK4vXMjES2A1GTztTZUln3SrM9kpR7YfmpGRkQfFbKiaghNj
 mUzFKbSlXhHKmMj/fz7jstDx1KhTDJM=
X-Google-Smtp-Source: ABdhPJx3YuAeFJoXnxPiKdqED4pzGJwFg+qB4kZVUCsVo8CIpE5dNIpL5CFl2uZ8ZCuYyUunPTwsig==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr8469520wmk.70.1610236963419; 
 Sat, 09 Jan 2021 16:02:43 -0800 (PST)
Received: from localhost.localdomain (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id q1sm18794346wrj.8.2021.01.09.16.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 16:02:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] decodetree: Open files with encoding='utf-8'
Date: Sun, 10 Jan 2021 01:02:40 +0100
Message-Id: <20210110000240.761122-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When decodetree.py was added in commit 568ae7efae7, QEMU was
using Python 2 which happily reads UTF-8 files in text mode.
Python 3 requires either UTF-8 locale or an explicit encoding
passed to open(). Now that Python 3 is required, explicit
UTF-8 encoding for decodetree source files.

To avoid further problems with the user locale, also explicit
UTF-8 encoding for the generated C files.

Explicit both input/output are plain text by using the 't' mode.

This fixes:

  $ /usr/bin/python3 scripts/decodetree.py test.decode
  Traceback (most recent call last):
    File "scripts/decodetree.py", line 1397, in <module>
      main()
    File "scripts/decodetree.py", line 1308, in main
      parse_file(f, toppat)
    File "scripts/decodetree.py", line 994, in parse_file
      for line in f:
    File "/usr/lib/python3.6/encodings/ascii.py", line 26, in decode
      return codecs.ascii_decode(input, self.errors)[0]
  UnicodeDecodeError: 'ascii' codec can't decode byte 0xc3 in position 80:
  ordinal not in range(128)

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: utf-8 stdout (Eduardo and Yonggang Luo)
v2: utf-8 output too (Peter)
    explicit default text mode.
---
 scripts/decodetree.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 47aa9caf6d1..4637b633e70 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -20,6 +20,7 @@
 # See the syntax and semantics in docs/devel/decodetree.rst.
 #
 
+import io
 import os
 import re
 import sys
@@ -1304,7 +1305,7 @@ def main():
 
     for filename in args:
         input_file = filename
-        f = open(filename, 'r')
+        f = open(filename, 'rt', encoding='utf-8')
         parse_file(f, toppat)
         f.close()
 
@@ -1324,9 +1325,11 @@ def main():
         prop_size(stree)
 
     if output_file:
-        output_fd = open(output_file, 'w')
+        output_fd = open(output_file, 'wt', encoding='utf-8')
     else:
-        output_fd = sys.stdout
+        output_fd = io.TextIOWrapper(sys.stdout.buffer,
+                                     encoding=sys.stdout.encoding,
+                                     errors="ignore")
 
     output_autogen()
     for n in sorted(arguments.keys()):
-- 
2.26.2


