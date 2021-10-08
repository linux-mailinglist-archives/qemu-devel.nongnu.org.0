Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0593542742B
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:27:29 +0200 (CEST)
Received: from localhost ([::1]:45182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYzGx-0004jr-Od
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5Z-0000J3-1r
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:42 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:46011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5W-0006tN-6j
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:40 -0400
Received: by mail-il1-x134.google.com with SMTP id i11so10490582ila.12
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XEk73uKVfZpm8z5h/+0J1fZF1BlRdZmKpQRA57KJATI=;
 b=mpNKan6AIQvIu3/Oq9KoiZVdMfp4zXd4jR+dK/rjoaK4hQlIsbAmBnbtF+qhLGiW5T
 x+5c+U18NPHZbxrptSTDRhvs6Mzf0C683ZLxFEkfb+rnpv0NIhoCjaBQEX/bCIzXOng4
 ywsLV6PGGXwiFqGftTiz+MGotCE2eH9p83IMnSohipCuw0v05QyjqpHSakKyzlhEoHxd
 vYf/EyzkxBBr7+FjYk+nw/2EIXKb7ZQgdP2QoZQuqtQcUCHutxqe9PDJd65UtpEM9dSC
 1f4dyM+9LMRZIGWjdC9spPdbtFXTXWSNzODqlNxSMtPT+BaGkOg9uuE37k0RqyLOElSm
 Ic1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XEk73uKVfZpm8z5h/+0J1fZF1BlRdZmKpQRA57KJATI=;
 b=799sILadYSMwwevyzT3tX9ziwW3OQPL7+VTsOYQsKFtnzdFeGVmuUehnbtsWLou3mc
 0LuPiR779YNV2UnzRElxc+lq/310Kpr5lg5QMVoYDW8IpCcMHmyZ/lRFsS8BBkBWw0n7
 Y/HlQKYwatXY5d8ZEjgFks8QG9IYg4guriv0lLsKboPJQk4gz0YT4BTzTzXx/gJ7qLjl
 FQ4JzeXan8E9MV0RKMxdyX262fvQNeyqsC2WwtnS2GMo3KM/hpRXAKodPvnzQyJdZM6o
 fvcf7gKtgIg87AheBUAlYnmyaqYu97qr2KGig2g3NEwHBQ3Nojf1G8Rtv/UIGP1QbUY/
 mjAA==
X-Gm-Message-State: AOAM530DBw9kNC5vC5efRQqTvEago2vrI+rKA9Doac6dtBquCrRqinEk
 rDHrHj4j0vM4vWUyZ2lyHY9shCQlU25dIA==
X-Google-Smtp-Source: ABdhPJw3AIJ9STtBZJfXfEk3BwnDaP6yJ6r0yvzsZV7AZYYWxs65WBuiv8kGwR1YDg8p/jpcJu0OFw==
X-Received: by 2002:a05:6e02:18ce:: with SMTP id
 s14mr824268ilu.96.1633734933586; 
 Fri, 08 Oct 2021 16:15:33 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:33 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/15] bsd-user/signal: Create a dummy signal queueing
 function
Date: Fri,  8 Oct 2021 17:15:06 -0600
Message-Id: <20211008231506.17471-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create dummy signal queueing function so we can start to integrate other
architectures (at the cost of signals remaining broken) to tame the
dependency graph a bit and to bring in signals in a more controlled
fashion. Log unimplemented events to it in the mean time.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  2 +-
 bsd-user/signal.c | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 5b815c3a23..62095eb975 100644
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


