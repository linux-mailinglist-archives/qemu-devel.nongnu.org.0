Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681CC432787
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:25:10 +0200 (CEST)
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcYFv-0000HG-Q6
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtk-0008UK-Im
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:12 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:35480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXth-000218-9t
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:12 -0400
Received: by mail-il1-x130.google.com with SMTP id k3so15986295ilu.2
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U8eVRhdRDAX2Ff1OPrMk4PiZ7Kj1eOgqNZuEjvmZbbc=;
 b=mrIAc+kapMRKb7J0agTZ83y7q8Ta4plKO/2I6HoUQjpC1g/eNYu0fmhjKswFj3g6rK
 FwgZ87uSLivOdvgXehgZsW4g7GUX7po4IT7vVAJZi8jPw5Xg66eELVSL0z55nsbRXH66
 057sphz0+PutWeeUpfGSXTqgtUbkhgIb/WM3SoWBgdzPbovv//m1km0fnN4pOUStswgh
 KwWLhqD/XyTbJ51BoIQAIQfB2fUwC328btCwiCI5srz86ruYFvPTgvyyy5Msws4741v9
 M4MvfgFxBrj5n/vlwXbsgfdUKEiV+9DnbmDeZkxXHpADLcsVUDMyVB2G78yFTucSO4UQ
 GIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8eVRhdRDAX2Ff1OPrMk4PiZ7Kj1eOgqNZuEjvmZbbc=;
 b=NK6xMzPklllGADxg4xeUVRPyxKGNUQGmsp1xVBRwKvlfCcYEYAoLPLn8PM4t685Fe6
 qJmuLd0srng+diOkQ0FIBHHlVcHqFp2+7by/7WHCHIef6+WaipbfbxhWzSG993P6O2wq
 3FmqDK8FN3aPrciedOrmvERPLf9gKDWvVc/GfLzoDi7mw21YuPn3lJKuoCD2K168xpUL
 GDMANU72jXh6YKsU/tQVg/OvViNy5z25x4sL2Wnj3RdFydcp5MEwguMhD+KHrMSFH7fH
 /2OOhryryQ931uIjeUO3t99BLxinvWipqk+bKtuXQLxt+D5YrswKiNFN804nQ6gsyoPj
 GTCw==
X-Gm-Message-State: AOAM531cuOyr33BzNkON3uaVgFRBtvpjG51PgG8zxY2sv57fCxVm+D9z
 tzcR9pwCM0BUWvaOIZwx8T+rPhm40Nd56Q==
X-Google-Smtp-Source: ABdhPJyClczp6PJcQuEMXAAb7/XvhE9AQWJI1djGu6EYbqsFtPwVEolnVXkKoOsRUP/FOKOP11A+ew==
X-Received: by 2002:a92:1a08:: with SMTP id a8mr15277032ila.67.1634583727832; 
 Mon, 18 Oct 2021 12:02:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:02:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 23/23] bsd-user/signal: Create a dummy signal queueing
 function
Date: Mon, 18 Oct 2021 13:01:15 -0600
Message-Id: <20211018190115.5365-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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


