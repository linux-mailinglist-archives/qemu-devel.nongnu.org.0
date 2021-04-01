Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506FD35136F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:28:20 +0200 (CEST)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuYl-0004Xl-BQ
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWm-0002nF-Sk
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:18 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRuWI-0001lN-Iw
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:26:06 -0400
Received: by mail-wm1-x334.google.com with SMTP id 12so779015wmf.5
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gaEdWGiRTo1hlw6xzQuwByewAfSKuO+zL+10ye64N3k=;
 b=TY9Xe8r+RgBZn2tZc8Fc71wR1aPUsR/jhO1fiTRBcoyph7cD2FDnNG0nmXB5/C9AyG
 KLw964Fzmvr4HN7yCgRklSWSYhmdSDDyJBomYR5bAqIfWR4AL2rN4Ludm8QtIfB88kT5
 QWEOKhoAPYKNpSTs2vqQ1/ksRadaoBx2DwWiWBfk2APObcAzAHDHZUZaAoq/cNCggzpd
 Ycxak0tligzQqIcsYoIdOOuTRb599hTqTrBHoFdutsHensC8eytH99h/54iH2Maay7N6
 1SPTrurYw3amvstisnGxicbkJjkpYLUPv1LVbkYy9JevlAl6lu3BwS6uknt4dvulv7nj
 uSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gaEdWGiRTo1hlw6xzQuwByewAfSKuO+zL+10ye64N3k=;
 b=SbY2txXJKN3w46azo6hQDjam2AF5mRp7C7HqLJVrLIs6casf/ty5mhVLAOOMM9Jtkl
 L53Gw3/AtFyZrZOCS578LYnsXH6h60heHUdKgIRxSwYnhgvhXFTFssm/ZEpGjIj6ob/L
 SQm7NLEycpRNwX+zMM7hZmDeJOR60GRkdjl75c1TkHGum571GIe0dUeY9Aq8S7HmhhY2
 YFssMoUItDWPfaBQb3W+5iTQsv8g9eBU5obfqWbe2VQ0avFXYOfuKOW8dLcMWRnjSLOj
 EEBbs0KmZ2FlNFLn4tJXhpWcwZYrN+L+NS4Mwz59lnEWe09rh+n9+37EPIXTnXnMbeQX
 V6BA==
X-Gm-Message-State: AOAM533sUWb7SxfMKfi/BYcApklsrDzmPkb3Hyozw6G+5i5pjIrNKcax
 560q23hpIo2U2z+4FMqKh93gFg==
X-Google-Smtp-Source: ABdhPJxTxfV/NbDI1Rp6Cv4keyU/UMSW71YssC9ZeTm5ZhDHumsulJ8tiuHRQ2fz+KXyGrsZuyRy5Q==
X-Received: by 2002:a1c:bdc2:: with SMTP id n185mr7482848wmf.128.1617272743265; 
 Thu, 01 Apr 2021 03:25:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x25sm9795455wmj.14.2021.04.01.03.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 03:25:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 421031FF98;
 Thu,  1 Apr 2021 11:25:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/11] docs/system/gdb.rst: Document how to debug multicore
 machines
Date: Thu,  1 Apr 2021 11:25:28 +0100
Message-Id: <20210401102530.12030-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401102530.12030-1-alex.bennee@linaro.org>
References: <20210401102530.12030-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Document how multicore machines appear to GDB when debugged
via the debug stub. This is particularly non-intuitive for
the "multiple heterogenous clusters" case, but unfortunately
as far as I know there is no way with the remote protocol
for the stub to tell gdb "I have 2 inferiors, please connect
to both", so the user must set it all up manually.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210325175023.13838-3-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/gdb.rst | 55 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 0bb1bedf1b..144d083df3 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -45,6 +45,61 @@ Here are some useful tips in order to use gdb on system code:
 3. Use ``set architecture i8086`` to dump 16 bit code. Then use
    ``x/10i $cs*16+$eip`` to dump the code at the PC position.
 
+Debugging multicore machines
+============================
+
+GDB's abstraction for debugging targets with multiple possible
+parallel flows of execution is a two layer one: it supports multiple
+"inferiors", each of which can have multiple "threads". When the QEMU
+machine has more than one CPU, QEMU exposes each CPU cluster as a
+separate "inferior", where each CPU within the cluster is a separate
+"thread". Most QEMU machine types have identical CPUs, so there is a
+single cluster which has all the CPUs in it.  A few machine types are
+heterogenous and have multiple clusters: for example the ``sifive_u``
+machine has a cluster with one E51 core and a second cluster with four
+U54 cores. Here the E51 is the only thread in the first inferior, and
+the U54 cores are all threads in the second inferior.
+
+When you connect gdb to the gdbstub, it will automatically
+connect to the first inferior; you can display the CPUs in this
+cluster using the gdb ``info thread`` command, and switch between
+them using gdb's usual thread-management commands.
+
+For multi-cluster machines, unfortunately gdb does not by default
+handle multiple inferiors, and so you have to explicitly connect
+to them. First, you must connect with the ``extended-remote``
+protocol, not ``remote``::
+
+    (gdb) target extended-remote localhost:1234
+
+Once connected, gdb will have a single inferior, for the
+first cluster. You need to create inferiors for the other
+clusters and attach to them, like this::
+
+  (gdb) add-inferior
+  Added inferior 2
+  (gdb) inferior 2
+  [Switching to inferior 2 [<null>] (<noexec>)]
+  (gdb) attach 2
+  Attaching to process 2
+  warning: No executable has been specified and target does not support
+  determining executable automatically.  Try using the "file" command.
+  0x00000000 in ?? ()
+
+Once you've done this, ``info threads`` will show CPUs in
+all the clusters you have attached to::
+
+  (gdb) info threads
+    Id   Target Id         Frame
+    1.1  Thread 1.1 (cortex-m33-arm-cpu cpu [running]) 0x00000000 in ?? ()
+  * 2.1  Thread 2.2 (cortex-m33-arm-cpu cpu [halted ]) 0x00000000 in ?? ()
+
+You probably also want to set gdb to ``schedule-multiple`` mode,
+so that when you tell gdb to ``continue`` it resumes all CPUs,
+not just those in the cluster you are currently working on::
+
+  (gdb) set schedule-multiple on
+
 Advanced debugging options
 ==========================
 
-- 
2.20.1


