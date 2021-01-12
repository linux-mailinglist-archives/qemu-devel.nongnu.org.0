Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5B32F3701
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:24:51 +0100 (CET)
Received: from localhost ([::1]:39032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNPW-0005ef-AF
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG7-0003eT-Nm
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:07 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG4-0004tR-0E
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:07 -0500
Received: by mail-ej1-x62e.google.com with SMTP id w1so4547247ejf.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MYwXQkjkGyHa6d3oKH/TvhkJ1MzQV0+oIcuJEspAGwE=;
 b=ViXJ9PCJdFmPqnYCysr6cD1igywMN69t76NSAaktnE6Sdtotd6NogzP0UAWY/crok8
 6gOtvU9hwgdf9tXepB0A0imcp0vZHgMSuhN4CWToYCA41Ce4912DaStc3VrzcU66FPV1
 zpj5roRuxHXuosAmgCbZGVcbRJGN32GhE7fFHKZ5hZ5fUJOD61+RemwcOtE3KQ/s7zst
 xyoBNl3Pw+YaKAggEu0lyeB/1aBdcoH8FfEfzTnV8BBhLlBzq0UDXUyirOztC0mOO40W
 e0Gd4Sa9ZxFw6oaT7eC6TGWl2oglYWXlTMniqDAw835ZXP+EsGikOYMm7qCDaCvWaJDe
 3oXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MYwXQkjkGyHa6d3oKH/TvhkJ1MzQV0+oIcuJEspAGwE=;
 b=mvHqoJi1bIZPaXBLpsWBinGTDev3HgoKNB3jd/YjXVb4vWfTRomykYdMdgQgJFNhPR
 Ez898B7W6ilkqFtPpN2UrQehMN3s/fmX+B2gbpHa/+X51lUWFB9A5B9IrOq81mnv1pD5
 uKeMMFadUPTvVxs/Rcx0zQ9Nd9RTmLuAxTuJxS4IcK3I5rm5Y+9xNkb6I8MyqWYPUO0a
 sho1oYJCaGXgbUB7EMnO+JxQMVOqePuiQwpQOOBeSYGYyeTh5bjL5f2rJUQnIVs1XU3Q
 VT80tqpHq9yY/Xeck6QbduFph2WCSIE2eY5phMB0VIA+nvlvFvkjfvufP5hMKXC05BnE
 lFjA==
X-Gm-Message-State: AOAM533ZTGGKkon7w7OGJ8pbGJlWWXsCqmDnZW4efRBxpBW1sB6VB9e6
 6oPzA+zrPJKrRcAB7Ik/zfN06vBzdxZKPg==
X-Google-Smtp-Source: ABdhPJytCZ1DpCPRuGLOv8G8yKUlQqXDC6g+c02ypGjd3LYbIQba5twZ2/VcGsvh5jQuq2L/2ErYHA==
X-Received: by 2002:a17:906:8292:: with SMTP id
 h18mr4030953ejx.481.1610471701162; 
 Tue, 12 Jan 2021 09:15:01 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:15:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/20] scripts/gdb: implement 'qemu bt'
Date: Tue, 12 Jan 2021 18:14:40 +0100
Message-Id: <20210112171450.791427-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

This script first runs the regular gdb's 'bt' command, and then if we are in a
coroutine it prints the coroutines backtraces in the order in which they
were called.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-Id: <20201217155436.927320-3-mlevitsk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qemu-gdb.py          |  1 +
 scripts/qemugdb/coroutine.py | 28 +++++++++++++++++++++++++++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/scripts/qemu-gdb.py b/scripts/qemu-gdb.py
index e0bfa7b5a4..4d2a9f6c43 100644
--- a/scripts/qemu-gdb.py
+++ b/scripts/qemu-gdb.py
@@ -40,6 +40,7 @@ timers.TimersCommand()
 
 coroutine.CoroutineSPFunction()
 coroutine.CoroutinePCFunction()
+coroutine.CoroutineBt()
 
 # Default to silently passing through SIGUSR1, because QEMU sends it
 # to itself a lot.
diff --git a/scripts/qemugdb/coroutine.py b/scripts/qemugdb/coroutine.py
index e1399211e6..7db46d4b68 100644
--- a/scripts/qemugdb/coroutine.py
+++ b/scripts/qemugdb/coroutine.py
@@ -88,8 +88,11 @@ def bt_jmpbuf(jmpbuf):
 
     selected_frame.select()
 
+def co_cast(co):
+    return co.cast(gdb.lookup_type('CoroutineUContext').pointer())
+
 def coroutine_to_jmpbuf(co):
-    coroutine_pointer = co.cast(gdb.lookup_type('CoroutineUContext').pointer())
+    coroutine_pointer = co_cast(co)
     return coroutine_pointer['env']['__jmpbuf']
 
 
@@ -107,6 +110,29 @@ class CoroutineCommand(gdb.Command):
 
         bt_jmpbuf(coroutine_to_jmpbuf(gdb.parse_and_eval(argv[0])))
 
+class CoroutineBt(gdb.Command):
+    '''Display backtrace including coroutine switches'''
+    def __init__(self):
+        gdb.Command.__init__(self, 'qemu bt', gdb.COMMAND_STACK,
+                             gdb.COMPLETE_NONE)
+
+    def invoke(self, arg, from_tty):
+
+        gdb.execute("bt")
+
+        if gdb.parse_and_eval("qemu_in_coroutine()") == False:
+            return
+
+        co_ptr = gdb.parse_and_eval("qemu_coroutine_self()")
+
+        while True:
+            co = co_cast(co_ptr)
+            co_ptr = co["base"]["caller"]
+            if co_ptr == 0:
+                break
+            gdb.write("Coroutine at " + str(co_ptr) + ":\n")
+            bt_jmpbuf(coroutine_to_jmpbuf(co_ptr))
+
 class CoroutineSPFunction(gdb.Function):
     def __init__(self):
         gdb.Function.__init__(self, 'qemu_coroutine_sp')
-- 
2.29.2



