Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE48C3498CB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:56:32 +0100 (CET)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPUDf-0000CA-QC
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPU82-0005jt-A2
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:50:43 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPU7v-0004ps-Ma
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:50:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id o16so3225014wrn.0
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WlvLB8nfkzFPQhAaXU+2e02Q11xHv7FAk8MfuDRn5iE=;
 b=jP2qmjJcRQMIsbhDSC6elqg4255hSgf4sirD7K2U/lUxUtzv7GDk7LClIVP3fmN+d2
 IeclS23ypN9k4mwnSndOjDcw+P9AfBCis7brnt+Qm6FeIvelpmpBTwPIPYm0IFD84sil
 diDSyiX9Wp4S1HM8sC40boKWpCY22vjP1mREkGqIu6v+gBQVmtS5EnuqCV+LcME6eAcn
 wQ5AdTkCf/8isFA4UyHmMx/nemyu9XcaLP9Mr//FUZWOUbO3HyAmLvrWgokq7rbedaMb
 9xfMFeZimFAf+eSQNHV9hbCNUpHX7XsWVkAfFVI86pPahjJIwpMD8nNBi/S0jmsnPhd+
 nINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WlvLB8nfkzFPQhAaXU+2e02Q11xHv7FAk8MfuDRn5iE=;
 b=YKLaqrFUxEr8nE/7HRfIRsv5iZ7H1AJcXsjIrtvhwOVjRcIRbjhZjdXUuDYLOnwF+o
 yzHmWC47g54fOdrGROm6WWzXAhmJVfePSDoBCIjZ/S4wknyHQh5wNPzOxFokImDz2+TE
 E0gIU5GZEbpNVi9CcBs16klDsz080eiMjirNY8xA03e2Pu8DtkGlZkm/u6Bvn4wLCynV
 vxzE9KEJVBTmwzh8c+5ctWePi9p+kgxZE+fBXbWBe3V2zuPRfnbiTgVNTmews6Kj4OG7
 0/1rGuTgND7kpdL2HC+NyePsqn5p9Yj8QN5Qz5l/Xk3iSSnlcbClxhJuEmrZknlmATRA
 CUxA==
X-Gm-Message-State: AOAM532CWHWsEWA09F2TNSvAkjekaYURr0dyydQ/ZmjRdcv5/JgcDkQH
 udoCTUrXvDHqdTBy80nr+/TRmck4Rj/Li3B/
X-Google-Smtp-Source: ABdhPJwAETPkr8b6YFU62BwugSeKF7SayvWViy3gSkd41mkzu0GrH/LYQoBAgoJZEgcn4iH+OflpcQ==
X-Received: by 2002:a5d:404f:: with SMTP id w15mr10723997wrp.106.1616694626716; 
 Thu, 25 Mar 2021 10:50:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s9sm8180794wmh.31.2021.03.25.10.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 10:50:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/2] docs/system/gdb.rst: Document how to debug
 multicore machines
Date: Thu, 25 Mar 2021 17:50:23 +0000
Message-Id: <20210325175023.13838-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325175023.13838-1-peter.maydell@linaro.org>
References: <20210325175023.13838-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document how multicore machines appear to GDB when debugged
via the debug stub. This is particularly non-intuitive for
the "multiple heterogenous clusters" case, but unfortunately
as far as I know there is no way with the remote protocol
for the stub to tell gdb "I have 2 inferiors, please connect
to both", so the user must set it all up manually.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/gdb.rst | 55 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 0bb1bedf1be..144d083df31 100644
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


