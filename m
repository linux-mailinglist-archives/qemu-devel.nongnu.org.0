Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331DE432392
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:14:22 +0200 (CEST)
Received: from localhost ([::1]:55778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVHJ-0007Tt-7Q
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV92-0007k1-Ku
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:48 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8t-0008AE-6q
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:48 -0400
Received: by mail-io1-xd35.google.com with SMTP id 188so16852712iou.12
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U8eVRhdRDAX2Ff1OPrMk4PiZ7Kj1eOgqNZuEjvmZbbc=;
 b=fb74gzMuZSUM+s+RLVEsYfnGEt+okP1Oo43hCLRFOOrYoVDrB9MoAEG5aLZ6W4QMM0
 XTg4k12H2jDlg4IAKC36MqF0PzQJ1KE5EuFKmgZCbsviLFrBG9I6FA/tRwMyvlc7667K
 qwPoeXm0ezb00Ogl1K3aLNct+zFa8FPoEwUym5lzjuZxreBdspygQDevYq1dAt1oqExf
 +PyK57uBwWa2GA33BNt3M4J2eaJC2i1YQGbVqA2saMj5yBc84PBAh6ka/EfOZxMsRM5E
 8Q9l7KAUzIaOa/PapTdo1LRLwYvkUBcF5j4nOAU3iUxtIZFf7MgxRIRWj11GZBv8Oi8L
 ervw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8eVRhdRDAX2Ff1OPrMk4PiZ7Kj1eOgqNZuEjvmZbbc=;
 b=OK/VAsNqvYrjotI3AmWh91aUuPaw5fJxmfg3+t79mlBPRa0q7QuQfSr5r8haTJ08iD
 OYEmpOh3UhxHJmj8ij5xRh/vdBry+tzl2sQEVtHdszDIGgyt7KSwKgYqe0zfbdOfxvV/
 FE0Ank4/L9TRRC0yRYo0yz/CGcikYz/XR5v4dSH8W06G8ODegZMIZ5K/7yDPiSB5HSg2
 v+mcbQBIABGKoyBy5fJdeo+m8ft++a+lMm+UFWZTyUiqXDIuScRKsx6W+0ZhLJm/3HoT
 Vc+OFAyoGHV0yeS0KZ61TGJCHEWuj1M/Hb6LiLXefeADHpARmrFVdGnUcF7sCf0qKJ1B
 zjQw==
X-Gm-Message-State: AOAM531MqKOMBQeclFjBR9lJ1jQ+1SXtwwuDn1y5Zq5p1KnrMroVEKXg
 8C8Tb1CUAbxD+3CLo4uH1SnJlAhmwGW32A==
X-Google-Smtp-Source: ABdhPJyyrHVR6mD20tI7/h3lfcrKznAQhrPVtG7u4fzButGjuEYYR+THZMIBPeRzwPDJVDxBHAiXiA==
X-Received: by 2002:a6b:193:: with SMTP id 141mr14717839iob.7.1634573137392;
 Mon, 18 Oct 2021 09:05:37 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:36 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/23] bsd-user/signal: Create a dummy signal queueing function
Date: Mon, 18 Oct 2021 10:04:58 -0600
Message-Id: <20211018160458.1976-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create dummy signal queueing function so we can start to integrate other
architectures (at the cost of signals remaining broken) to tame the
dependency graph a bit and to bring in signals in a more controlled
fashion.  Log unimplemented events to it in the mean time.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/qemu.h   |  2 +-
 bsd-user/signal.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index ba15b1b56f..1b3b974afe 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -17,7 +17,6 @@
 #ifndef QEMU_H
 #define QEMU_H
 
-
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "qemu/units.h"
@@ -209,6 +208,7 @@ void process_pending_signals(CPUArchState *cpu_env);
 void signal_init(void);
 long do_sigreturn(CPUArchState *env);
 long do_rt_sigreturn(CPUArchState *env);
+void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 
 /* mmap.c */
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index ad6d935569..0c1093deb1 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -16,10 +16,19 @@
  *  You should have received a copy of the GNU General Public License
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#include "qemu/osdep.h"
 
+#include "qemu/osdep.h"
 #include "qemu.h"
 
+/*
+ * Queue a signal so that it will be send to the virtual CPU as soon as
+ * possible.
+ */
+void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
+{
+    qemu_log_mask(LOG_UNIMP, "No signal queueing, dropping signal %d\n", sig);
+}
+
 void signal_init(void)
 {
 }
-- 
2.32.0


