Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B85C617F19
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 15:15:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaye-0000al-4j; Thu, 03 Nov 2022 10:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqayb-0000aF-8j
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 10:13:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqayY-0006to-59
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 10:13:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id p16so1220979wmc.3
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uigyf6qq9Am7cRVFYV/7zGs4tD3SV3rZRcR/12kbTNw=;
 b=GJ4cRsqvbT4tQCqvNXQlRyFWa4VxsyhIAMYz6nPN7zu6+f5I8kY1M/AsTDozUwKJZI
 kT6Pd4kSZZWgR1xpaLToiyIdn/wyG84k4kW/VJFzNL6ElMbykEooV8WelPrp2ShRUYuK
 eqk+0+xFsGHT4hoxuId8QL6gzUDZb4I6HRFJrbdb/xQHhsq6IYeMcJhArgv3EhbAI6Nk
 jP2kOTJAfdLgt6CtfGvOldvzLWom+R3no7Gg7zrk5r0EIr2Ls5sJp4cKFOMv3utxVCww
 dB7P4pKP6xSQMbL+58UNecoUwzGOVyMkCGtDKHXn/lKL/hb3bLPOJCcPVuvT+hIaYicl
 QCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uigyf6qq9Am7cRVFYV/7zGs4tD3SV3rZRcR/12kbTNw=;
 b=YIeUagQO10xkHHk5UtWWMnYMV05iyqNga6CA5M8YSn0no/q0uxG4qd1QvImumtovi1
 SSOqQDZlcmewQGPfgW7xe6hmY3ClKioBf0NGS09Wjlfb6OC4KhZ52h7ZFcpSwg9u5OYC
 oh/DKoSzGeX8zylWb85P8W1m9b7HIv9jQ489jtboSy1PrJkKsn7oItXDfC+3GGjZ2PyA
 nrUbh7TZQ2Szv1y0IdsuZkZT5b0GuimySVWI2Efk1nOZy0EdAiP86u4IJB49jFD+9Zgw
 u2K3pRZQ8Ipl4miP30vNQxkNvjytSK4pDsLP+THqxEv6JiP66ucRvqgaFCJ3sMd+qaBf
 27Tg==
X-Gm-Message-State: ACrzQf3uGutC/ksM5haJMQKPuR9c8NCvn5D2ymEB/LpVLPErJ6q3Uc21
 MQlwJGIPRdT76QhAAXdGGIxBYw==
X-Google-Smtp-Source: AMsMyM7ncdqaH9V2OVfLeFjhJiIHk9vVOnldTgCj9XyPDBhtdn7krClg89MD8lsHDthLkCQOO7ID6Q==
X-Received: by 2002:a1c:35c9:0:b0:3c3:d9a:385f with SMTP id
 c192-20020a1c35c9000000b003c30d9a385fmr19505105wma.139.1667484824427; 
 Thu, 03 Nov 2022 07:13:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bj9-20020a0560001e0900b002365cd93d05sm1026291wrb.102.2022.11.03.07.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:13:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31B481FFB7;
 Thu,  3 Nov 2022 14:13:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests/avocado: improve behaviour waiting for login prompts
Date: Thu,  3 Nov 2022 14:13:30 +0000
Message-Id: <20221103141330.2705821-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This attempts to deal with the problem of login prompts not being
guaranteed to be terminated with a newline. The solution to this is to
peek at the incoming data looking to see if we see an up-coming match
before we fall back to the old readline() logic. The reason to mostly
rely on readline is because I am occasionally seeing the peek stalling
despite data being there.

This seems kinda hacky and gross so I'm open to alternative approaches
and cleaner python code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/avocado_qemu/__init__.py | 89 +++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 910f3ba1ea..d6ff68e171 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -131,6 +131,58 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
             return path
     return None
 
+def _peek_ahead(console, min_match, success_message):
+    """
+    peek ahead in the console stream keeping an eye out for the
+    success message.
+
+    Returns some message to process or None, indicating the normal
+    readline should occur.
+    """
+    console_logger = logging.getLogger('console')
+    peek_len = 0
+    retries = 0
+
+    while True:
+        try:
+            old_peek_len = peek_len
+            peek_ahead = console.peek(min_match).decode()
+            peek_len = len(peek_ahead)
+
+            # if we get stuck too long lets just fallback to readline
+            if peek_len <= old_peek_len:
+                retries += 1
+                if retries > 10:
+                    return None
+
+            # if we see a newline in the peek we can let safely bail
+            # and let the normal readline() deal with it
+            if peek_ahead.endswith(('\n', '\r', '\r\n')):
+                return None
+
+            # if we haven't seen enough for the whole message but the
+            # first part matches lets just loop again
+            if len(peek_ahead) < min_match and \
+               success_message[:peek_len] in peek_ahead:
+                continue
+
+            # if we see the whole success_message we are done, consume
+            # it and pass back so we can exit to the user
+            if success_message in peek_ahead:
+                return console.read(peek_len).decode()
+
+            # of course if we've seen enough then this line probably
+            # doesn't contain what we are looking for, fallback
+            if peek_len > min_match:
+                return None
+
+        except UnicodeDecodeError:
+            console_logger.log("error in decode of peek")
+            return None
+
+    # we should never get here
+    return None
+
 
 def _console_interaction(test, success_message, failure_message,
                          send_string, keep_sending=False, vm=None):
@@ -139,17 +191,52 @@ def _console_interaction(test, success_message, failure_message,
         vm = test.vm
     console = vm.console_socket.makefile(mode='rb', encoding='utf-8')
     console_logger = logging.getLogger('console')
+
+    # Establish the minimum number of bytes we would need to
+    # potentially match against success_message
+    if success_message is not None:
+        min_match = len(success_message)
+    else:
+        min_match = 0
+
+    console_logger.debug("looking for %d:(%s), sending %s (always=%s)",
+                         min_match, success_message, send_string, keep_sending)
+
     while True:
+        msg = None
+
+        # First send our string, optionally repeating the send next
+        # cycle.
         if send_string:
             vm.console_socket.sendall(send_string.encode())
             if not keep_sending:
                 send_string = None # send only once
+
+        # If the console has no data to read we briefly
+        # sleep before continuing.
+        if not console.readable():
+            time.sleep(0.1)
+            continue
+
         try:
-            msg = console.readline().decode().strip()
+
+            # First we shall peek ahead for a potential match to cover waiting
+            # for lines without any newlines.
+            if min_match > 0:
+                msg = _peek_ahead(console, min_match, success_message)
+
+            # otherwise we block here for a full line
+            if not msg:
+                msg = console.readline().decode().strip()
+
         except UnicodeDecodeError:
+            console_logger.debug("skipped unicode error")
             msg = None
+
+        # if nothing came out we continue and try again
         if not msg:
             continue
+
         console_logger.debug(msg)
         if success_message is None or success_message in msg:
             break
-- 
2.34.1


