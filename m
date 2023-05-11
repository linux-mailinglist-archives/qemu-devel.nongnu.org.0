Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214246FF161
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 14:17:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5DG-00024p-1y; Thu, 11 May 2023 08:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1px5DE-00024h-2M
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:16:00 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1px5DC-0004GV-32
 for qemu-devel@nongnu.org; Thu, 11 May 2023 08:15:59 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f450815d02so15010555e9.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 05:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683807356; x=1686399356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mIuVJ6ykHzw4ioL1c99nRR9egoSoB8gzHzOh88//kps=;
 b=munzCX/kkb7U6qatvMHVScFgRTQxrRDwMAmgtvBRCXJCW5c29Et0m8GUSS0edP1ajQ
 Wv2nbgXgVVqbbPX76tldf46w5kepxstX0JEUzaSR11NFzHGil3V02YvvS0kfrnof8pXn
 azNrbjsd8znLguaM4xVGAA8WRIxS7G3oYmFRq40p3TRs1X1+xGKwfzZRBIaKhnTtxtMq
 yGjxyk7dAR7TN0sxqyukTxcM0QG/37KYGGaoPfnJflQhIT1Qm7Wso1Dx2hOfo2FBjjwy
 U0f5GttzZNhor92lgTBaJ7MIiiW9uLAoe5a8pU7jU6J5BXxKI9ywCLRcn2fK40gKMFFY
 00xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683807356; x=1686399356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIuVJ6ykHzw4ioL1c99nRR9egoSoB8gzHzOh88//kps=;
 b=I/grRAXVglMK8fYJhwYE+3H5DVpQ5b17YmpLU4CwnsQErRbzHe5W2cRJSOZ/kWbVmo
 1Vd5X0tLWRdCL4gJR9zQagMpyFAqPlo7vy6TINEzIltGpd32H55xbh64Ao0FDznUbFzB
 q9soA3GcHc+eEtxVixuc8l+wCcaG7uzEBGezKwvbjAOKz7659NSVsCdNqYdjP0TAriIa
 4H/iNVlY7VaqiAf+mqeuTJMrPaPRUOvrmsy9T4scdYEa0HG7Gibf20k4E+rN1j0YV4cZ
 b9L88PerlkiL9M2QbfgnB9QnaQbI2int6UuwHJM95agGqG7VBm5KonQrr4HYzE1LXkoc
 ekqA==
X-Gm-Message-State: AC+VfDwKShywYLedI/SRmDCw6Rm2q41lu7UH19L+HUcKWak3CHlFaVJ2
 pgrjWwndEScaKEA/teuOfIjC9HFsd/FDAkhtYc0=
X-Google-Smtp-Source: ACHHUZ4qHV7FO56Jc9kzqfgeTVTtCDjIvQAuT4rg79dRwPvjP8QlEZU+CIt1moZCO7rMmUYxXuOw6w==
X-Received: by 2002:a7b:ca45:0:b0:3f4:22da:c3f1 with SMTP id
 m5-20020a7bca45000000b003f422dac3f1mr10043333wml.17.1683807356521; 
 Thu, 11 May 2023 05:15:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a1ccc05000000b003ee5fa61f45sm25430649wmb.3.2023.05.11.05.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 05:15:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 2/2] docs/interop: Delete qmp-intro.txt
Date: Thu, 11 May 2023 13:15:53 +0100
Message-Id: <20230511121553.3356127-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511121553.3356127-1-peter.maydell@linaro.org>
References: <20230511121553.3356127-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

qmp-intro.txt is quite small and provides very little information
that isn't already in the documentation elsewhere.  Fold the example
command lines into qemu-options.hx, and delete the now-unneeded plain
text document.

While we're touching the qemu-options.hx documentation text,
wordsmith it a little bit and improve the rST formatting.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: removed a trailing space spotted by Eric
---
 docs/interop/qmp-intro.txt | 88 --------------------------------------
 qemu-options.hx            | 28 +++++++++---
 2 files changed, 22 insertions(+), 94 deletions(-)
 delete mode 100644 docs/interop/qmp-intro.txt

diff --git a/docs/interop/qmp-intro.txt b/docs/interop/qmp-intro.txt
deleted file mode 100644
index 1c745a7af04..00000000000
--- a/docs/interop/qmp-intro.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-                          QEMU Machine Protocol
-                          =====================
-
-Introduction
-------------
-
-The QEMU Machine Protocol (QMP) allows applications to operate a
-QEMU instance.
-
-QMP is JSON[1] based and features the following:
-
-- Lightweight, text-based, easy to parse data format
-- Asynchronous messages support (ie. events)
-- Capabilities Negotiation
-
-For detailed information on QMP's usage, please, refer to the following files:
-
-o qmp-spec.txt      QEMU Machine Protocol current specification
-o qemu-qmp-ref.html QEMU QMP commands and events (auto-generated at build-time)
-
-[1] https://www.json.org
-
-Usage
------
-
-You can use the -qmp option to enable QMP. For example, the following
-makes QMP available on localhost port 4444:
-
-$ qemu [...] -qmp tcp:localhost:4444,server=on,wait=off
-
-However, for more flexibility and to make use of more options, the -mon
-command-line option should be used. For instance, the following example
-creates one HMP instance (human monitor) on stdio and one QMP instance
-on localhost port 4444:
-
-$ qemu [...] -chardev stdio,id=mon0 -mon chardev=mon0,mode=readline \
-             -chardev socket,id=mon1,host=localhost,port=4444,server=on,wait=off \
-             -mon chardev=mon1,mode=control,pretty=on
-
-Please, refer to QEMU's manpage for more information.
-
-Simple Testing
---------------
-
-To manually test QMP one can connect with telnet and issue commands by hand:
-
-$ telnet localhost 4444
-Trying 127.0.0.1...
-Connected to localhost.
-Escape character is '^]'.
-{
-    "QMP": {
-        "version": {
-            "qemu": {
-                "micro": 0,
-                "minor": 0,
-                "major": 3
-            },
-            "package": "v3.0.0"
-        },
-        "capabilities": [
-            "oob"
-        ]
-    }
-}
-
-{ "execute": "qmp_capabilities" }
-{
-    "return": {
-    }
-}
-
-{ "execute": "query-status" }
-{
-    "return": {
-        "status": "prelaunch", 
-        "singlestep": false, 
-        "running": false
-    }
-}
-
-Please refer to docs/interop/qemu-qmp-ref.* for a complete command
-reference, generated from qapi/qapi-schema.json.
-
-QMP wiki page
--------------
-
-https://wiki.qemu.org/QMP
diff --git a/qemu-options.hx b/qemu-options.hx
index 42b9094c10f..920f9640155 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4170,26 +4170,42 @@ DEF("qmp", HAS_ARG, QEMU_OPTION_qmp, \
     QEMU_ARCH_ALL)
 SRST
 ``-qmp dev``
-    Like -monitor but opens in 'control' mode.
+    Like ``-monitor`` but opens in 'control' mode. For example, to make
+    QMP available on localhost port 4444::
+
+        -qmp tcp:localhost:4444,server=on,wait=off
+
+    Not all options are configurable via this syntax; for maximum
+    flexibility use the ``-mon`` option and an accompanying ``-chardev``.
+
 ERST
 DEF("qmp-pretty", HAS_ARG, QEMU_OPTION_qmp_pretty, \
     "-qmp-pretty dev like -qmp but uses pretty JSON formatting\n",
     QEMU_ARCH_ALL)
 SRST
 ``-qmp-pretty dev``
-    Like -qmp but uses pretty JSON formatting.
+    Like ``-qmp`` but uses pretty JSON formatting.
 ERST
 
 DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
     "-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]\n", QEMU_ARCH_ALL)
 SRST
 ``-mon [chardev=]name[,mode=readline|control][,pretty[=on|off]]``
-    Setup monitor on chardev name. ``mode=control`` configures 
-    a QMP monitor (a JSON RPC-style protocol) and it is not the
-    same as HMP, the human monitor that has a "(qemu)" prompt.
-    ``pretty`` is only valid when ``mode=control``, 
+    Set up a monitor connected to the chardev ``name``.
+    QEMU supports two monitors: the Human Monitor Protocol
+    (HMP; for human interaction), and the QEMU Monitor Protocol
+    (QMP; a JSON RPC-style protocol).
+    The default is HMP; ``mode=control`` selects QMP instead.
+    ``pretty`` is only valid when ``mode=control``,
     turning on JSON pretty printing to ease
     human reading and debugging.
+
+    For example::
+
+      -chardev socket,id=mon1,host=localhost,port=4444,server=on,wait=off \
+      -mon chardev=mon1,mode=control,pretty=on
+
+    enables the QMP monitor on localhost port 4444 with pretty-printing.
 ERST
 
 DEF("debugcon", HAS_ARG, QEMU_OPTION_debugcon, \
-- 
2.34.1


