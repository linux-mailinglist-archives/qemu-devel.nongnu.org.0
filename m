Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E95D6E97F3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:04:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVpY-0004bo-5k; Thu, 20 Apr 2023 11:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppVpU-0004TN-K7
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:04:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppVpF-0004zW-1v
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:04:12 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l31-20020a05600c1d1f00b003f1718d89b2so3256278wms.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682003035; x=1684595035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZbSk7BG+pPYbXSNkcmisOU5yI5C0OADLfXQ8nDPotNk=;
 b=VCErB2+5xXmL9LiIHMfwC96mWIP478/dwHuQuaM3M9w9UTZYR38koKuottg9UpvEuA
 I9ChBgBflxx2HBSLcfuMX2Q5ihIGM9XU1rhZO+Vijqmoug+eEBi46vfzhxhLa0Ds3Sqp
 L2Ub3fpS8qZoGN6geLAmgkEBdYYNp1QjIqOuv5kSkGnq88LodF5cUFYa8DFy/d9GB76/
 2gfWFBqnAcFxfIieK6CFCQGxsOdzdnV4wI5ifuTvxxZd68InGnVTPgyeFOYjWHBZcxbo
 ZhafLstX6tZnebulCP2fRF0CjqquWqabgk7WG/OnO3pN9GeMN2gP4NXgfq3bMqMW6I18
 SNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682003035; x=1684595035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZbSk7BG+pPYbXSNkcmisOU5yI5C0OADLfXQ8nDPotNk=;
 b=WfLlahrSx+UhreP/wohEDjGAfyJKbsjRJ0INonrjDCqcAV5g1jNLfYJ65bx2agEh2H
 zouMDkLPc5GcJ83S1VJXYij5vNC1dP+c0EVOWgh8mSCT/gC4oMXAcWB22z6g3yzsvLom
 kN9AK6Nw09EA2L7NRRS1jkzsid3ZOLAc/mTwqb59IAceTFxig1PyzIkUWR3Bh9rPqXHO
 XRglI0S/FHS20Cv1yWU9NF0wXXlGAIwm8FjOHLb5+PcdpTxEP74IBSuGSJxHLNV3SXXK
 r/E9+/+J82tlBtwUrX2ITFzR0wWEq5p0FcEco+VE3ZiVHc6sB87+6BxhGK1GqiZZN2OH
 7/7A==
X-Gm-Message-State: AAQBX9cLMhNb23MWLAHMI8Lz/Jwa3cYP1VPQ0gl0JPhpX3/JQSx/EYLa
 fzQ+LHIGn5f2IE/H6IxOFfSvLRIJwY8JjzS3V5U=
X-Google-Smtp-Source: AKy350YwjylXLzJNyETVcqed0zragRGbRrODW7FlyoFNX4UFTI6JvfqXvYHOGfPSi9A+eJDyWfJZFw==
X-Received: by 2002:a1c:7712:0:b0:3f1:70d5:1be8 with SMTP id
 t18-20020a1c7712000000b003f170d51be8mr1669549wmi.15.1682003035494; 
 Thu, 20 Apr 2023 08:03:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y32-20020a05600c342000b003f173956a82sm5542458wmp.21.2023.04.20.08.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:03:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 2/2] docs/interop: Delete qmp-intro.txt
Date: Thu, 20 Apr 2023 16:03:52 +0100
Message-Id: <20230420150352.1039408-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420150352.1039408-1-peter.maydell@linaro.org>
References: <20230420150352.1039408-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/interop/qmp-intro.txt | 88 --------------------------------------
 qemu-options.hx            | 26 ++++++++---
 2 files changed, 21 insertions(+), 93 deletions(-)
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
index 59bdf67a2c5..2974de2c3ab 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4109,26 +4109,42 @@ DEF("qmp", HAS_ARG, QEMU_OPTION_qmp, \
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
+    Set up a monitor connected to the chardev ``name``.
+    QEMU supports two monitors: the Human Monitor Protocol
+    (HMP; for human interaction), and the QEMU Monitor Protocol
+    (QMP; a JSON RPC-style protocol).
+    The default is HMP; ``mode=control`` selects QMP instead.
     ``pretty`` is only valid when ``mode=control``, 
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


