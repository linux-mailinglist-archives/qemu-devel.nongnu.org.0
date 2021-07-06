Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7F43BC911
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:09:44 +0200 (CEST)
Received: from localhost ([::1]:46676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0i1P-0008Uv-2G
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hto-0000cW-DQ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hti-0002DP-HL
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:52 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so1263826wmb.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=um8VQ+njAfw+9zAEGI7WhCAEvKOVGqmdmlXLxx6mEsQ=;
 b=EEhnl4qkIU1oOvRLouB0uEZtCBDOYsDZaj9fr2+fobOXGTeGUTffvbakU2EmjsozrU
 VQ3lA495V53fAMIg/jKR2sVeZ4mF0RX5uDMgFhvfynCGH/0olIs6gCaNDP2MAdHD5Xxq
 xNKMyd2QGHGlHgq+GyNyn/XIkudBpwu1UNVttKQCOOe8mEK8MASqLF9JcDnzOoe0LbI1
 /iaooLm5qt1ACJ4EJJtnN89Ma1SLUq9qzOiBnPqrAfn/ML/GunokB0TbH58nTN3mhdWE
 jk0ngGP1IO9yDbvv+qtUZKm+5XNgnuWtBgW+7/rDQNhFHVzTY/2GNOcWKhkW3mQyltVz
 SZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=um8VQ+njAfw+9zAEGI7WhCAEvKOVGqmdmlXLxx6mEsQ=;
 b=r0vqWZGVvcel1G2izK5b4xutf4zcelax8OUrPxoGhwk0J4iEG0YclB0nQibPZ1bRfa
 snGLYU+HPw4m0iRnFez7Db22KJIcDUubUu6lqWPvyiBEtHIMxSYSMAeMDONUsQNnFWxb
 m3ixnUsb4TKkBSVcuKd33ysZ66RhrZ2ry8yczll9MT2aR4MoqrvCQ5EYk60UUbuamBpW
 EV+CfHc7iaP2vRtgNJJ3qUgq8q8x7RVW0Pra0wJyjHuaEx7uezYWrbOZdUczxNozlkKt
 iIh3walUaNCkP+y0zLbE/AJvaufdHnzxwtg492KVFVLq7uilLZfSOu70gMhiucfQML8l
 abjg==
X-Gm-Message-State: AOAM532maoTQ+Ho77/emJ1z7FxcGxcF4ayP8f0Jn7KthNUZNU/+UkyRZ
 XN1pz/SGEWyHIhYCQzqAOjt+/9cge9c=
X-Google-Smtp-Source: ABdhPJxVG6oefHfwOCkh7Sga60e9M5gBAlnIoOwQRxSFwClwa+I34RXkTfOMVflTkSSFIVqxfQSW/w==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr3980456wmb.129.1625565704911; 
 Tue, 06 Jul 2021 03:01:44 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/40] ui: Fix the "-display sdl,window_close=..." parameter
Date: Tue,  6 Jul 2021 12:01:04 +0200
Message-Id: <20210706100141.303960-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

According to the QAPI schema, there is a "-" and not a "_" between
"window" and "close", and we're also talking about "window-close"
in the long parameter description in qemu-options.hx, so we should
make sure that we rather use the variant with the "-" by default
instead of only allowing the one with the "_" here. The old way
still stays enabled for compatibility, but we deprecate it, so that
we can switch to a QAPIfied parameter one day more easily.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210630163231.467987-3-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst | 6 ++++++
 qemu-options.hx            | 2 +-
 softmmu/vl.c               | 7 ++++++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e2e0090878..bb624d3170 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -126,6 +126,12 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
+``-display sdl,window_close=...`` (since 6.1)
+'''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-display sdl,window-close=...`` instead (i.e. with a minus instead of
+an underscore between "window" and "close").
+
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/qemu-options.hx b/qemu-options.hx
index ba3ca9da1d..ae56fa4f28 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1784,7 +1784,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_SDL)
     "-display sdl[,alt_grab=on|off][,ctrl_grab=on|off]\n"
-    "            [,window_close=on|off][,gl=on|core|es|off]\n"
+    "            [,window-close=on|off][,gl=on|core|es|off]\n"
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,grab_on_hover=on|off][,gl=on|off]|\n"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index cee6339580..36b761677d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1089,7 +1089,12 @@ static void parse_display(const char *p)
                 } else {
                     goto invalid_sdl_args;
                 }
-            } else if (strstart(opts, ",window_close=", &nextopt)) {
+            } else if (strstart(opts, ",window_close=", &nextopt) ||
+                       strstart(opts, ",window-close=", &nextopt)) {
+                if (strstart(opts, ",window_close=", NULL)) {
+                    warn_report("window_close with an underscore is deprecated,"
+                                " please use window-close instead.");
+                }
                 opts = nextopt;
                 dpy.has_window_close = true;
                 if (strstart(opts, "on", &nextopt)) {
-- 
2.31.1



