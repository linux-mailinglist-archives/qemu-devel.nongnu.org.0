Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B59B3620C18
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 10:24:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osKpG-0007EO-Gc; Tue, 08 Nov 2022 04:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKp9-0007Cx-GL
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:16 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1osKp6-0005oA-9l
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 04:23:15 -0500
Received: by mail-wr1-x435.google.com with SMTP id l14so19990880wrw.2
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 01:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uigyf6qq9Am7cRVFYV/7zGs4tD3SV3rZRcR/12kbTNw=;
 b=gMVXpVuwCKTklzwH67pRe0XXCetjVfuv/THCWKn8zhrIJXv6T3rrflI0NRVuy+dbFV
 ainMGfNgtL6qEnDWLiUdEf1eXS78Oc3JQpjd5QYklFsfmJ0sLj6UqtGpP/DhpGnJWUsf
 wSKjBASh56XrOpRGD/W3/LP/SOzMS5vTPTX9jedtN3RgDFglVY94G5Okx4jkdxkslDqD
 G5+zijTfy93EFleRpTwt57PY6CRYGy+7F8NNKQb8Ut4ZNLNNts/QU4bWA/Xl679NrG1f
 ni4aNMNlI1O43bRmRlfLZ5rqC3muUpRu+cjb2BdaU8odP2ZkAV2oOX8attLnOlbp2RwI
 Kspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uigyf6qq9Am7cRVFYV/7zGs4tD3SV3rZRcR/12kbTNw=;
 b=ueEPZCWjSggFGqYOFg7wRMGkw8dliE8mthxBKn9oBWIWhRLdZzg9F4B9LOzWaZJcJC
 IlfcvtofpGurHEd84DODLK7pwrwLFauKRVfd3LnZxZZPOKUNsmrs245UScmOyc70xHAn
 ZjhbNl3+sAVeJ3cQjU7O7wmRhIi0qeXmHBChFdVN/IZR3r18SU29Hh9wY1jpPBsQhnIo
 qTvLqyoeWSz52dLulhdHlIVchAG5U1e/AaZakQk1TN0CPqsvE9vmVJ/OdzXG0hRYJoep
 fd/ji2Nu7QVCwF1G7yGmqbeG54QhYEhiTEVsqWbmwacAECFTnYTZ1Q2wwZ0ndb+1yW7H
 7+iw==
X-Gm-Message-State: ACrzQf1J34mYk/L4RcDdNRTbWFXYjbmxqWKr3VdrsXjx+ZR3B25PZLm2
 3yUi2H4t/BG6M0qzly6qLL9+bQ==
X-Google-Smtp-Source: AMsMyM57atcpmt93uN1LlTCrKzA6tF3bVJK/fJXwFXXaSpwaT3pGJoCgJGtiFn3iDhcpftqowB8JWw==
X-Received: by 2002:adf:e40e:0:b0:236:b896:8f55 with SMTP id
 g14-20020adfe40e000000b00236b8968f55mr32824547wrm.281.1667899390697; 
 Tue, 08 Nov 2022 01:23:10 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fc15-20020a05600c524f00b003cf57329221sm15459328wmb.14.2022.11.08.01.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 01:23:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5434D1FFBA;
 Tue,  8 Nov 2022 09:23:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 2/9] tests/avocado: improve behaviour waiting for login
 prompts
Date: Tue,  8 Nov 2022 09:23:01 +0000
Message-Id: <20221108092308.1717426-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221108092308.1717426-1-alex.bennee@linaro.org>
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


