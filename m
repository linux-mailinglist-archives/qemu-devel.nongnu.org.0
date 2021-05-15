Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F3838192C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:49:10 +0200 (CEST)
Received: from localhost ([::1]:59444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhufF-0007ec-T4
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhucH-00049q-Nn; Sat, 15 May 2021 09:46:05 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhucG-0002Jx-6Q; Sat, 15 May 2021 09:46:05 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 a10-20020a05600c068ab029014dcda1971aso2690764wmn.3; 
 Sat, 15 May 2021 06:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G8s61eN0lJK7kTgoNeT21G2dYt+87J3oMV0XWs16zIo=;
 b=maP1gYzPaJouaW35ycnih8wS0VpxQNalAe0otrRDSgBfcBhXPejntVPtxHFavaZnCJ
 Ljsn/qlfJZIzspIpcmzKbMDABL9/6J6i0GeTM8H/yNv/yBH+nSR1eMlnZdryYkqVt4GR
 D+eCgAYiUtZnRcwqDP1Bq4W5znp1bCG5CvIKzQpK9ceGEAvBiNBWn/9kpuQzFWVX390s
 U43/8Ybgsq7avRzfi/oDPeVQAlpR39jmrjkZR2u748O6sah3z5YuMT/I8R4Tk1YuyrFq
 GbZrSb8gV0+3etW73T4+tBaqXuRZ5hmGzYxlEgw2eKnB/CZ5HElcYXWA6gf/vdIpMPqR
 ZtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G8s61eN0lJK7kTgoNeT21G2dYt+87J3oMV0XWs16zIo=;
 b=lqXJ/jwkgPgZS0PHvBtoCO4AyLtzBTC6g/H1hji9TqNBGM/l3NlapWdHHymZgbWHG1
 ZtBS9g9PyGAoMfreEp0rH3zIC92lEZR+2sXfnInwD5jnzQjOA3KXxkrWO08Fzi5/iYaS
 XjcS55xmvsEBGLtOAJSXDNs4ssY0Uo86yh/hc14YRe2PTm6JoArJ9g7gCfRyLhUlcOlf
 2Bedtt6Vsv7XaQiodnuca/E4OjyYkby/jz/Ru4cDXzonZevs5E5US1ghnPtdSfNyLvsq
 tTWendO5ShHJ0mT7+oxPLjWoAU3ee09g+IkKgx6Q7Mm4/TuMz2bLgQr1BqVFz9z6zbIQ
 1DPQ==
X-Gm-Message-State: AOAM531LchFh804ODtEmqttRrrPj+cjMAFCi4xpE7KlCSJsfJNLNwMs3
 lp2gAbWt07vFknE9/cwHsMUBcdixFqhC4w==
X-Google-Smtp-Source: ABdhPJzlg2LQMKC8l6u3jq/Fy7ML3z3z5fCpru5Y2lCgRd6lqXG/9AIkZcf35zFMk+8OiW2HNcBobg==
X-Received: by 2002:a05:600c:6d6:: with SMTP id
 b22mr27078112wmn.134.1621086362238; 
 Sat, 15 May 2021 06:46:02 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id e20sm1300893wme.26.2021.05.15.06.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:46:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests/acceptance: Ignore binary data sent on serial
 console
Date: Sat, 15 May 2021 15:45:54 +0200
Message-Id: <20210515134555.307404-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515134555.307404-1-f4bug@amsat.org>
References: <20210515134555.307404-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a guest sends binary data on the serial console, we get:

 File "tests/acceptance/avocado_qemu/__init__.py", line 92,
   in _console_interaction msg = console.readline().strip()
 File "/usr/lib64/python3.8/codecs.py", line 322,
   in decode (result, consumed) = self._buffer_decode(data, self.errors, final)
 UnicodeDecodeError: 'utf-8' codec can't decode byte 0xa9 in position 2: invalid start byte

Since we use the console with readline(), fix it the easiest
way possible: ignore binary data (all current tests compare
text string anyway).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 83b1741ec85..b55578e1cca 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -82,14 +82,17 @@ def _console_interaction(test, success_message, failure_message,
     assert not keep_sending or send_string
     if vm is None:
         vm = test.vm
-    console = vm.console_socket.makefile()
+    console = vm.console_socket.makefile(mode='rb', encoding='utf-8')
     console_logger = logging.getLogger('console')
     while True:
         if send_string:
             vm.console_socket.sendall(send_string.encode())
             if not keep_sending:
                 send_string = None # send only once
-        msg = console.readline().strip()
+        try:
+            msg = console.readline().decode().strip()
+        except UnicodeDecodeError:
+            msg = None
         if not msg:
             continue
         console_logger.debug(msg)
-- 
2.26.3


