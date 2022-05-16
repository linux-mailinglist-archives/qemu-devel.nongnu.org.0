Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294B528BCA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 19:19:44 +0200 (CEST)
Received: from localhost ([::1]:49700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqeNj-0007F5-4X
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 13:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyY-00072g-2B; Mon, 16 May 2022 12:53:53 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:44798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nqdyT-0004jJ-1l; Mon, 16 May 2022 12:53:38 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 p12-20020a9d4e0c000000b00606b40860a3so10455818otf.11; 
 Mon, 16 May 2022 09:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pe7kD73hoVtMo2myBqhnPDJMPaoRk8lWfcPLt024a5E=;
 b=pYsCn0fR3kLXkWxFnnpirnMLA+ucCZTQ8xotdVFQ9dpLsfskiJvtoqddgyQmVq6IWJ
 oUJvOMlDEpfSqO0xwQZwoJs1LUL2WXJhdnuncKQQbLe3rcbQJoEN7423pKrQK/T899E8
 AvF3aKtrzoCjG1a3wcprHGtg8yhImw5th58xAu50Eoq86qhysBNQ1o2qlxJFzswmXij6
 cE1ErfVGml40MO26XtkonNAqvgCVUJj5wn6Poe0ranQudA7laRpEBr59gIkQg1jJR6Ak
 bjRt6O9fZeUHkZ20NIXQ9IrMUdI1N8PtPP40vtEY29C8BKHmfgXO2kSQzDiKp14gIqBH
 A6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pe7kD73hoVtMo2myBqhnPDJMPaoRk8lWfcPLt024a5E=;
 b=y/R6X0C3vCnIFkKrsWNV45b+g0No5nEUxoopejRQ00Shzcc4Vm/0JJBY7LmbNouQ+T
 P4oksNSMRJVhHdqw60jQ8YwPHU7WiTMqbdD7aj2Uqd6u9G1WQzOG8HtoZU5otITf4ZY6
 H3Yx0tnAOKk6UrDVcKxIhzHjVemtRj/eJ0VKqymim9hAaM65maVe6EllNZD5CkJTqpco
 pdIIJNPx90Wa6abRedGB3sUYWPsi8DkdNZGJ5C+CTnq5QYFve1Hgc19rkldMH+yQbL2U
 QRriYB+sfTcNI/tb8IQ3itK9qUs+LwVMt8VWdPt8oK6ThowcXaE7l8sQgdANQ9QeiYfO
 dwfw==
X-Gm-Message-State: AOAM531CqdqRnFbMwEEdWqVGzIewXtVRZ5MTBhThpGmeDMfQ317vwcCz
 DVjc1E5Na9FM3Su8Ao9MSnUqeKhEWK4=
X-Google-Smtp-Source: ABdhPJxEC7D6jiA/hwjyxBvcMcubpRE7Seggx9uah0mvsb/oYjJmxr6/EsOdwMGhHj0oVTL5Bun7Sg==
X-Received: by 2002:a05:6830:2705:b0:606:5c00:e45d with SMTP id
 j5-20020a056830270500b006065c00e45dmr6433409otu.375.1652720015318; 
 Mon, 16 May 2022 09:53:35 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.151.26])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a056870e30e00b000e686d13889sm5780731oad.35.2022.05.16.09.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 09:53:35 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 jsnow@redhat.com, crosa@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 bleal@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 2/5] machine.py: add default pseries params in machine.py
Date: Mon, 16 May 2022 13:53:18 -0300
Message-Id: <20220516165321.872394-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220516165321.872394-1-danielhb413@gmail.com>
References: <20220516165321.872394-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pSeries guests set a handful of machine capabilities on by default, all
of them related to security mitigations, that aren't always available in
the host.

This means that, as is today, running avocado in a Power9 server without
the proper firmware support, and with --disable-tcg, this error will
occur:

 (1/1) tests/avocado/info_usernet.py:InfoUsernet.test_hostfwd: ERROR: ConnectError:
Failed to establish session: EOFError\n  Exit code: 1\n  (...)
(...)
        Command: ./qemu-system-ppc64 -display none -vga none (...)
        Output: qemu-system-ppc64: warning: netdev vnet has no peer
qemu-system-ppc64: Requested safe cache capability level not supported by KVM
Try appending -machine cap-cfpc=broken

info_usernet.py happens to trigger this error first, but all tests would
fail in this configuration because the host does not support the default
'cap-cfpc' capability.

A similar situation was already fixed a couple of years ago by Greg Kurz
(commit 63d57c8f91d0) but it was focused on TCG warnings for these same
capabilities and running C qtests. This commit ended up preventing the
problem we're facing with avocado when running qtests with KVM support.

This patch does a similar approach by amending machine.py to disable
these security capabilities in case we're running a pseries guest. The
change is made in the _launch() callback to be sure that we're already
commited into launching the guest. It's also worth noticing that we're
relying on self._machine being set accordingly (i.e. via tag:machine),
which is currently the case for all ppc64 related avocado tests.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 python/qemu/machine/machine.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 07ac5a710b..12e5e37bff 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -51,6 +51,11 @@
 
 
 LOG = logging.getLogger(__name__)
+PSERIES_DEFAULT_CAPABILITIES = ("cap-cfpc=broken,"
+                                "cap-sbbc=broken,"
+                                "cap-ibs=broken,"
+                                "cap-ccf-assist=off,"
+                                "cap-fwnmi=off")
 
 
 class QEMUMachineError(Exception):
@@ -447,6 +452,14 @@ def _launch(self) -> None:
         """
         Launch the VM and establish a QMP connection
         """
+
+        # pseries needs extra machine options to disable Spectre/Meltdown
+        # KVM related capabilities that might not be available in the
+        # host.
+        if "qemu-system-ppc64" in self._binary:
+            if self._machine is None or "pseries" in self._machine:
+                self._args.extend(['-machine', PSERIES_DEFAULT_CAPABILITIES])
+
         self._pre_launch()
         LOG.debug('VM launch command: %r', ' '.join(self._qemu_full_args))
 
-- 
2.32.0


