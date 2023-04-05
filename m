Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C006D89B0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:37:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoJ-0005QP-Mp; Wed, 05 Apr 2023 17:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo7-0005K7-1g
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:43 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo5-0005co-H1
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:42 -0400
Received: by mail-il1-x136.google.com with SMTP id v5so16952436ilj.4
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bcNp7Qm4e5ur6jtltz7qLJuPFY0Q7omcuhRi+MALXJI=;
 b=zM9OHifSYnPImtDXox8+1hEC4YNuJqtHIuZMOP2VhCUKTobh7G7hzs+baOoi+p171q
 Tzgi8tUddo49FeBWiOrmV/XT3yyNbOVEshMz7vZYlHUb+w4KMY7hJe57bTJEouxhDGBH
 1g3h3MIhgbf3cNPn9x9CfA/mzaJLnE98C/Oc7p7QDnMMtK//gKEpTDMPxz55fqj7BP26
 xB58+p8Vj74gNZinVcKN/q50M2HniVXTaR3PPh/UuVDTW9AugE6pVAGuTTAGEIBphn9M
 hzX6EG/JViTOREq8bvBF5GQx5RWMaaFZL3hXWyv7RxB+ml7UmUf9W7uj2q2IVxBbZkh4
 tSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bcNp7Qm4e5ur6jtltz7qLJuPFY0Q7omcuhRi+MALXJI=;
 b=CvCjA2eSoQt3GoIiCCA/w7Iw0Dj/ElgGgcdKjXnqIMi6GOAVejOmz9ikHv7C/uhtZg
 qF5nVW2xIHMf7fzMcJKaSMWnIMed5jzGZ52ekr9yDsJJh+hkwwl4Qdq4naP0LTxqOp36
 8LPkvzqyohOmGrDyabJkA3rTtsy+DRXBNFV/EtEucVJBDw359xiUXwIDSLCkaHL0z7o4
 /fHXGuQrBiI/79hDLDp8FuvZhUs/YgCV+VTw8mji8D5ZAQ60P2Q3temOFoLiTkZa1XZe
 wjUy27cqJzcXRdIi539bqFa5hEVuU7UghAr/Rd1TOrs0T6h8Haa0ez5x6DbxNU7UWalO
 gVmQ==
X-Gm-Message-State: AAQBX9cZxow9yseo2/PEiRvpfIqcWOBx12b7VBbmlJc4zkCmZlpXQLdr
 XG8iA6YCynCX97sle2bB36FCuRV4Dfq9br/Ah9M=
X-Google-Smtp-Source: AKy350awoeDgAWmD/r4b/V2gJ9VdS0uHOnIvz4joWQwgw/+K5LV4d03c7J/cUIZJxITy9jIblrUoPw==
X-Received: by 2002:a92:dd86:0:b0:325:bab7:cb17 with SMTP id
 g6-20020a92dd86000000b00325bab7cb17mr4931494iln.24.1680730599882; 
 Wed, 05 Apr 2023 14:36:39 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:39 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>
Subject: [PATCH 15/16] bsd-user: Add SIGSYS to core dump signals.
Date: Wed,  5 Apr 2023 15:36:11 -0600
Message-Id: <20230405213612.15942-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

SIGSYS creates a core by default if uncaught. Follow that here. Sort
with the same order as is in the kernel.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index f4e078ee1da..4301595cc2f 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -330,17 +330,22 @@ int block_signals(void)
     return qatomic_xchg(&ts->signal_pending, 1);
 }
 
-/* Returns 1 if given signal should dump core if not handled. */
+/*
+ * Returns 1 if given signal should dump core if not handled.
+ * Compare with kern_sig.c sigproptbl[].
+ */
 static int core_dump_signal(int sig)
 {
     switch (sig) {
+    case TARGET_SIGQUIT:
+    case TARGET_SIGILL:
+    case TARGET_SIGTRAP:
     case TARGET_SIGABRT:
+    case TARGET_SIGEMT:
     case TARGET_SIGFPE:
-    case TARGET_SIGILL:
-    case TARGET_SIGQUIT:
     case TARGET_SIGSEGV:
-    case TARGET_SIGTRAP:
     case TARGET_SIGBUS:
+    case TARGET_SIGSYS:
         return 1;
     default:
         return 0;
-- 
2.40.0


