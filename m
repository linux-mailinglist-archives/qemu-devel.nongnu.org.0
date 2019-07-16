Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8016A2CD
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 09:22:16 +0200 (CEST)
Received: from localhost ([::1]:45844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnHmx-00049L-Q9
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 03:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnHml-0003l9-Nt
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:22:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hnHmk-0007zT-RP
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:22:03 -0400
Received: from mga12.intel.com ([192.55.52.136]:53917)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hnHmi-0007ut-Sa
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 03:22:02 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jul 2019 00:21:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,496,1557212400"; d="scan'208";a="342627492"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga005.jf.intel.com with ESMTP; 16 Jul 2019 00:21:54 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 15:21:27 +0800
Message-Id: <20190716072127.2000-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: [Qemu-devel] [PATCH] vl: make sure char-pty message displayed by
 moving setbuf to the beginning
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
Cc: pbonzini@redhat.com, armbru@redhat.com,
 Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recently we found a behavior change after commit 6ade45f2ac93611
('char-pty: Print "char device redirected" message to stdout').

When we redirect output to a file, the message "char device redirected
to PTY_NAME (label LABEL)" would not be seen at the beginning of the
file. Instead, the message is displayed after QEMU quit. This will block
test automation.

The reason is this message is printed after we set line buffer mode. So
move this to the beginning.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 vl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 5089fce6c5..a5808f9a02 100644
--- a/vl.c
+++ b/vl.c
@@ -2890,6 +2890,8 @@ int main(int argc, char **argv, char **envp)
     char *dir, **dirs;
     BlockdevOptionsQueue bdo_queue = QSIMPLEQ_HEAD_INITIALIZER(bdo_queue);
 
+    os_set_line_buffering();
+
     error_init(argv[0]);
     module_call_init(MODULE_INIT_TRACE);
 
@@ -4246,8 +4248,6 @@ int main(int argc, char **argv, char **envp)
         semihosting_arg_fallback(kernel_filename, kernel_cmdline);
     }
 
-    os_set_line_buffering();
-
     /* spice needs the timers to be initialized by this point */
     qemu_spice_init();
 
-- 
2.17.1


