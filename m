Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3800D2EF4AA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:18:40 +0100 (CET)
Received: from localhost ([::1]:37222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtXD-0005Pu-B0
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:18:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxtVG-0004T6-7j
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:16:39 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxtVE-0004H9-IB
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:16:37 -0500
Received: by mail-wr1-x436.google.com with SMTP id t30so9388037wrb.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MorWNuq47M/K8vM/SaYtobIREpFwkkpIJwzUuntcTXE=;
 b=NnwyqLcqejcTwRG/p7FYwr3OK6aoTTjRjr3hnY75oNYkyYj3XEv2l1J21r58YuBwlG
 yGNqgN6Dh1aPb+cOdkPkdrDMwbJV9aH/DnsjVgWQUBzBAgpoULuaXxIzPHs80HReNsIh
 Tka/BSzJ6yGM6EkNlX7vzmoxlkSF+WO/f3EJKKwXB4cPo+0w2YIc7hFcrulJ5xaoYQQs
 w48RsloVhaNJHQloHrTk6cYlEI92p0KFHKoIRCbNx2oHavWiTlqA0wt60Qg3P+Ya8XF0
 H8L3OCs/PEcZx6h8A+fEpJX0WVlSdRUNVhe5wP57lL2OnBW5q1bPy+A6JvJJNIyMdd4d
 aWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MorWNuq47M/K8vM/SaYtobIREpFwkkpIJwzUuntcTXE=;
 b=Od0Lsr5H9FkZUZSbO9iN8sUEI1Xi5rg1HcbEyJsJ5hRnOtgOkY7bEsaFVzmV9PdStT
 6N4q4lwXfUWD7P7hV86I5aixipTSrre/rgcDQ+T7VXRh2yXDch/2L7fmIJHH5JHEoD+a
 5cClyw0Y5Di0kfQAbwO9aENTDY+CQt83W1F3tv5xEXFEH2tqcc3D/cuxKPXWq+uAiUdX
 1KCPCoEnwq6tNn+YncM1f1NPj7zBkPJVnuFoL7hGyAxNNImXV9vA4QrSdPjuAdDnpcmK
 J9MsDlvsuvwfel2xozZoMBhIGwpxSpuM0JZjrYjhwfUBkisE6PwssqoJ8DAAhYIBKdUa
 6PGA==
X-Gm-Message-State: AOAM533TPeONA8KJ62A+qcNv/gL1KjABkiCtPCes3Q0gO3FD+rp6vfxB
 NXNU7dKzQZiZ/xWsvzx6JN5vdb32rJw=
X-Google-Smtp-Source: ABdhPJznAAc9Xs9ThgbVZnq/zaenbfqBIfSVOY684VElxU5j/oEKcs2OXk7SvJZYzCGvz3+CxTm+Rg==
X-Received: by 2002:a5d:4882:: with SMTP id g2mr4061602wrq.273.1610118994662; 
 Fri, 08 Jan 2021 07:16:34 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id v189sm13186986wmg.14.2021.01.08.07.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:16:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] decodetree: Open files with encoding='utf-8'
Date: Fri,  8 Jan 2021 16:16:32 +0100
Message-Id: <20210108151632.277015-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When decodetree.py was added in commit 568ae7efae7, QEMU was
using Python 2 which happily reads UTF-8 files in text mode.
Python 3 requires either UTF-8 locale or an explicit encoding
passed to open(). Now that Python 3 is required, explicit
UTF-8 encoding for decodetree sources.

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
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/decodetree.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 47aa9caf6d1..fa40903cff1 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1304,7 +1304,7 @@ def main():
 
     for filename in args:
         input_file = filename
-        f = open(filename, 'r')
+        f = open(filename, 'r', encoding='utf-8')
         parse_file(f, toppat)
         f.close()
 
-- 
2.26.2


