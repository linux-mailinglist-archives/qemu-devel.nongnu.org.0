Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D84A04A9
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:53:19 +0100 (CET)
Received: from localhost ([::1]:46466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDb3O-0005rt-OQ
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:53:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafr-0000ke-KH
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:01 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=41656
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafg-0001aw-Ol
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:58 -0500
Received: by mail-io1-xd2f.google.com with SMTP id q204so9679252iod.8
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2cxVzUGQfUKapU6iJyRCNz3mEY37Sx777/SzAWGZs48=;
 b=mqPYau6BZSOjx1Yyr2PcHIXydufDYzi5wGSCMj0y3widGHG5xNhnySzeUVVQ9gArs6
 0vkGwF7eJ0fub0/Sa+Bvla4CFfsbxaXeMSBG2ifpv1hXKDxvwJqAn55pZfVmmXEC7UFu
 nEXw02lBJUbsFpfFZ7ZwCeT3vzi9+fAYtfOfx8zZAC4WgnfI/bMLxYGgKKm34EV5Gjzj
 OwbtbUIt673JBOI+Stg5R+mlnmqAfpPt1Oncr3EoNNPFNr/zASzZOaoTndNO7Q1OYF6r
 G/spej2/9m2JtsWB9ElZHW1sYI5WDwRlWBNVbKLJXxKZcC9bBl5Id3g6pwRZQ9A5OYtW
 sahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2cxVzUGQfUKapU6iJyRCNz3mEY37Sx777/SzAWGZs48=;
 b=X+By1lO7B1C6xkMWBNTzuvWjjsSDdJFOUam6WhhFrVWFqXMru5BPjYhuC9jY1rHZs6
 mzZA+i7ScgomAh+RXREDUykKkPpLGgcoGKDaNK7FNdX6XxVqH1+lLy0hK4pktpKLxDsw
 WmurVuuNAWHjiZ+01msLFJSGSuiqFr8PIw44KQkjv9gAFztxJ0FL+5w3j3WEmVR5RWh/
 2JJoGXApsiHpGVOalGDqIVtm9RfNkoyYbigf2z+ekTAQ450dFYrLhLC9HnzdrIrX8O0n
 GLSCYq7oetLIv0NICZzkMqrUmvjMsnzKdLC1COt1AzsWJGAxX0/bLkELAYnFY0tuz4Q9
 vKeQ==
X-Gm-Message-State: AOAM533xHxDQQ7vfHkJLvvbAMj6b0eU7UtU8mkVIseVd5XoXURRLWr6R
 wpz7OmvzyerqwYsyiQYjDGpoNMSwt9NFxQ==
X-Google-Smtp-Source: ABdhPJweJI0hjKaijWEdAeKDD7lX82DZcdgfrYkb3LHWZgjN+XpdVXcX2OGKlBkxStENhW9wc8BwMg==
X-Received: by 2002:a05:6638:ecd:: with SMTP id
 q13mr787014jas.297.1643412510082; 
 Fri, 28 Jan 2022 15:28:30 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:29 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/40] bsd-user/signal.c: Implement
 rewind_if_in_safe_syscall
Date: Fri, 28 Jan 2022 16:27:50 -0700
Message-Id: <20220128232805.86191-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   |  2 ++
 bsd-user/signal.c | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 49f01932a53..8ed1bfbca89 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -446,4 +446,6 @@ static inline void *lock_user_string(abi_ulong guest_addr)
 
 #include <pthread.h>
 
+#include "user/safe-syscall.h"
+
 #endif /* QEMU_H */
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index db8cf0a08f1..454aef2993e 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -48,6 +48,18 @@ int target_to_host_signal(int sig)
     return sig;
 }
 
+/* Adjust the signal context to rewind out of safe-syscall if we're in it */
+static inline void rewind_if_in_safe_syscall(void *puc)
+{
+    ucontext_t *uc = (ucontext_t *)puc;
+    uintptr_t pcreg = host_signal_pc(uc);
+
+    if (pcreg > (uintptr_t)safe_syscall_start
+        && pcreg < (uintptr_t)safe_syscall_end) {
+        host_signal_set_pc(uc, (uintptr_t)safe_syscall_start);
+    }
+}
+
 static bool has_trapno(int tsig)
 {
     return tsig == TARGET_SIGILL ||
@@ -57,7 +69,6 @@ static bool has_trapno(int tsig)
         tsig == TARGET_SIGTRAP;
 }
 
-
 /* Siginfo conversion. */
 
 /*
-- 
2.33.1


