Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E536B2B6B10
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:06:50 +0100 (CET)
Received: from localhost ([::1]:35040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4RN-0005Dk-UH
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:06:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4El-0002sS-Gt
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:47 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:43670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kf4Ej-0007DW-IU
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 11:53:47 -0500
Received: by mail-ed1-x541.google.com with SMTP id q16so7995237edv.10
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 08:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DUmfTNjlKy0Q9IhZ7wEbjJoGFlCIUy8CMRbJxon/jUY=;
 b=TiYEwZf4V5gjaz1FDKXBdeEfvcV6bPClWt80nRUNAf1R900c9O+kpSUG6PXVq1YPW0
 5mlPdTZ0FPAKCDa81p9VT9XuV5BO/ms9xt8i3FEBb3uw6XJzE730z/hr8+lCMR8tfJhe
 C/8JK3AEI5uEANeuRklPRi4DxqL1l4QRvercKUL3V7rOgMTkihYoupdnbtczjc8WC5YK
 TEwY6XFkeg0453wt4/qActlKql8lRSpKEwu0ytxd5/3imWP8Eb62uWq198oiwQHkaUo+
 2UFH08GHF9cO7pzuRa3q4Id/25oyfYd9Ii90h5zASMMgiWIzdR/Nf9S7cCOus35DTfIL
 CQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DUmfTNjlKy0Q9IhZ7wEbjJoGFlCIUy8CMRbJxon/jUY=;
 b=N1l/rw5hXAOCXPIMRJ0+0PF+TSZLRU4LZPC99vR/X0FHSBO8asRD/hdk1QALst4xOh
 nqLJlj9gCOQN3dA9nbD+ih+vVycDV1sjpC+cF6A9J9SMCIWw/QRIC4sZJQLvPe1zFIix
 TlTyTNPk9a1Ch19a/D6w2B10M4K1OK+dll7Sgh9ttjIWh3KWjvp//28XexJfrzuEtIk3
 FPYfjjtyD901aL4iSD4MT/mK2gk05U+YkV4gwVnLAXw5hDUitFbqC1jYAx4NsUdaSC1S
 TLvRdPf3M8BLq0p9o/n9+IdwH1GnQy/ou/zJfM1lfQClK/u+iF5npsABm4/GiTGQY2Xw
 wBjA==
X-Gm-Message-State: AOAM5316gfWcwr+ERKxF+j4xyY4W+TbwD54xgwfW3Pnbs63YpCMi9MML
 B5AX466mW3OEdVPRBaYScYvFREPIJjs=
X-Google-Smtp-Source: ABdhPJyN+ZnMmXBe4gyOASStVpUJHkBiNcbBez1WOgLZb51sT2J+8WnKF80CoILVMFFsxfmzhkSxBw==
X-Received: by 2002:a05:6402:1d3b:: with SMTP id
 dh27mr20622536edb.183.1605632024020; 
 Tue, 17 Nov 2020 08:53:44 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u7sm639067ejf.83.2020.11.17.08.53.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:53:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/29] scripts: kernel-doc: fix troubles with line counts
Date: Tue, 17 Nov 2020 17:53:01 +0100
Message-Id: <20201117165312.118257-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201117165312.118257-1-pbonzini@redhat.com>
References: <20201117165312.118257-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

There's currently a bug with the way kernel-doc script
counts line numbers that can be seen with:

	$ ./scripts/kernel-doc -rst  -enable-lineno include/linux/math64.h >all && ./scripts/kernel-doc -rst -internal -enable-lineno include/linux/math64.h >int && diff -U0 int all

	--- int	2020-09-28 12:58:08.927486808 +0200
	+++ all	2020-09-28 12:58:08.905486845 +0200
	@@ -1 +1 @@
	-#define LINENO 27
	+#define LINENO 26
	@@ -3 +3 @@
	-#define LINENO 16
	+#define LINENO 15
	@@ -9 +9 @@
	-#define LINENO 17
	+#define LINENO 16
	...

This is happening with perl version 5.30.3, but I'm not
so sure if this is a perl bug, or if this is due to something
else.

In any case, fixing it is easy. Basically, when "-internal"
parameter is used, the process_export_file() function opens the
handle "IN". This makes the line number to be incremented, as the
handler for the main open is also "IN".

Fix the problem by using a different handler for the
main open().

While here, add a missing close for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/kernel-doc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 75ddd3b5e6..f33a4b1cc7 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -2268,7 +2268,7 @@ sub process_file($) {
 
     $file = map_filename($orig_file);
 
-    if (!open(IN,"<$file")) {
+    if (!open(IN_FILE,"<$file")) {
 	print STDERR "Error: Cannot open file $file\n";
 	++$errors;
 	return;
@@ -2277,9 +2277,9 @@ sub process_file($) {
     $. = 1;
 
     $section_counter = 0;
-    while (<IN>) {
+    while (<IN_FILE>) {
 	while (s/\\\s*$//) {
-	    $_ .= <IN>;
+	    $_ .= <IN_FILE>;
 	}
 	# Replace tabs by spaces
         while ($_ =~ s/\t+/' ' x (length($&) * 8 - length($`) % 8)/e) {};
@@ -2311,6 +2311,7 @@ sub process_file($) {
 	    print STDERR "${file}:1: warning: no structured comments found\n";
 	}
     }
+    close IN_FILE;
 }
 
 
-- 
2.28.0



