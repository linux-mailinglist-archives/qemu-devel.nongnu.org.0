Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC5629AB0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 14:37:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouw68-0006Rf-Pm; Tue, 15 Nov 2022 08:35:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5N-0006HV-LN
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:45 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouw5L-0004IV-Nw
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 08:34:45 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso10249267wms.4
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 05:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hd677+bfuIhpkyc3PSGbpAuJqC4YjdSOyP8U5M+NGW8=;
 b=Io5WJ/Gw51NkOBE3tns9bK4v7JsGaoqxFdxvzkYEPrWxAHc2mqy8DZMe9vROJXqUDo
 y4MqKzPpB5m0QJQECFh9nJU/yfq31ICmu8gW5wFunPaDh5B53rG4/2q9PpGSlRkyZMcb
 2uMm7vwqiv7MBd4JkQASICxgWQ7ZqQwy59jcoNvoitmBSbe+/j8HfbZ2kpq3NwCru3Lz
 SjATSG5Lr1StiIxa2zeGj9/lpzXZDXmbx/fb6Q5/+MWBCYa0PErS5cbiKWVv0kMv3ece
 NikSFAp4FqDpYMsWc0rxuY9hG9GGMrjRGo044c3fnD/rC2Ra1LFBNetTUnmgsGjNKbxm
 TxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hd677+bfuIhpkyc3PSGbpAuJqC4YjdSOyP8U5M+NGW8=;
 b=peswpJ5mK4rQvdywv29WB2TnOgMpJN9v7gmHjsfWlb6WsAseWRVEQfnRIQrrzanwzi
 yKkJ7L+IK8jrX1J1Wo9W1n53ejKqKy0jmr3kPh8vFgu+mO8XvyRA91HWIdN7ejVjA4Oe
 EqXKMP+6EJDF7Fd9BoC3hLsI1TsxSJL+1DQzeKLR3dSFh3xZVmzmor4z91fTlxWJs1CB
 tt96QyhCbvzvPEY5Gx+sJWII9eyX2dSNhIdGeTghGtwWH2Ofq5Mw5PUU+FQjN3pQuOlD
 su75H5sW9mkOsCio3vOtNdRdJYD3Y3HsDwVmBmHvLZgRDQ5zIYnTPEvuSKw4EfVPkgvF
 Jr9g==
X-Gm-Message-State: ANoB5pnVUvZAkzaG2q9DXIorv7eRUYF5S721K2w4APWlFyD/xVER0StS
 XOaoXqggx36UYW4l2WMbYkGSOw==
X-Google-Smtp-Source: AA0mqf7ucE3+0KIU1AJbwkdCfooB5q1vHKbiE27xlOh52wclbCaLe7PA2YvrDQ83d3TDNkE0Lo5eLw==
X-Received: by 2002:a05:600c:5390:b0:3cf:9b4d:ec4f with SMTP id
 hg16-20020a05600c539000b003cf9b4dec4fmr413974wmb.114.1668519281351; 
 Tue, 15 Nov 2022 05:34:41 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bt17-20020a056000081100b0023677e1157fsm12636017wrb.56.2022.11.15.05.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:34:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CDAE1FFBA;
 Tue, 15 Nov 2022 13:34:39 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 02/10] tests/avocado: improve behaviour waiting for login
 prompts
Date: Tue, 15 Nov 2022 13:34:31 +0000
Message-Id: <20221115133439.2348929-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115133439.2348929-1-alex.bennee@linaro.org>
References: <20221115133439.2348929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221111145529.4020801-3-alex.bennee@linaro.org>

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 910f3ba1ea..7469a06804 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -131,6 +131,59 @@ def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
             return path
     return None
 
+def _peek_ahead(console, min_match, success_as_str):
+    """
+    peek ahead in the console stream keeping an eye out for the
+    success message. Because we are partially peeking into the data
+    stream we do everything as bytes to avoid partial UTF decode
+    issues.
+
+    Returns some message to process or None, indicating the normal
+    readline should occur.
+    """
+    console_logger = logging.getLogger('console')
+    success_message = bytes(success_as_str, 'utf-8')
+    peek_len = 0
+    retries = 0
+
+    while True:
+        old_peek_len = peek_len
+        peek_ahead = console.peek(min_match)
+        peek_len = len(peek_ahead)
+
+        # if we get stuck too long lets just fallback to readline
+        if peek_len <= old_peek_len:
+            time.sleep(0.001 * retries)
+            retries += 1
+            if retries > 20:
+                return None
+        else:
+            retries = 0
+
+        # if we see a newline in the peek we can let safely bail
+        # and let the normal readline() deal with it
+        if peek_ahead.endswith((b'\n', b'\r')):
+            return None
+
+        # if we haven't seen enough for the whole message but the
+        # first part matches lets just loop again
+        if len(peek_ahead) < min_match and \
+           success_message[:peek_len] in peek_ahead:
+            continue
+
+        # if we see the whole success_message we are done, consume
+        # it and pass back so we can exit to the user
+        if success_message in peek_ahead:
+            return console.read(peek_len).decode()
+
+        # of course if we've seen enough then this line probably
+        # doesn't contain what we are looking for, fallback
+        if peek_len > min_match:
+            return None
+
+    # we should never get here
+    return None
+
 
 def _console_interaction(test, success_message, failure_message,
                          send_string, keep_sending=False, vm=None):
@@ -139,17 +192,52 @@ def _console_interaction(test, success_message, failure_message,
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


