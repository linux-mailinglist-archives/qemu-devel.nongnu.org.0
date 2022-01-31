Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F32B4A4FD4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:07:25 +0100 (CET)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcxQ-00032s-00
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:07:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnZ-0004jl-M7
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:14 -0500
Received: from [2607:f8b0:4864:20::131] (port=41853
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcmz-0002bk-Gp
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:56:39 -0500
Received: by mail-il1-x131.google.com with SMTP id 15so12391586ilg.8
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kr3WAg3LFuIjGK7Kv0poOIctPcCnCwAaBtFgS4qf/b0=;
 b=u1Ldz/wJzFV4X9Q92P1sBl9Tnp18AhpT6hVph82SyBvOaVwhNgv7lVbqy1gZo0CGF0
 B+WEEyh5XBih30gL19n3A/D4TUFnWqFvPgaLruqdo0SpuuKlEuxpYQi8fVl1QziMVugd
 2d4QaTsGu8nPk3NyoPETZjQxjhASwvrrWO4icPBVFA3AgnP9m5yQgMdUeSWzxKLsfkeo
 jqUYUVTbJZQb7LL/r9OI1VvATuEsPs6LsXvHcjORuzgJHj0wwD05HyrDRN1y7TgngcBG
 ZfHbGgp/aqCZMqh3ICI6igPY4aa+JUK+8WCo7BUcgE+HZEZDnTtgZNnb+Mwp1C2QwaxU
 rrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kr3WAg3LFuIjGK7Kv0poOIctPcCnCwAaBtFgS4qf/b0=;
 b=lxViE0QdkzZzCncsTijW3PlIp0OwVsJ1Lnqk0O9Afeie5ZU6pjQK7NnpnPB8mZZXss
 wM57q8oZGpNznrgMnRM1De4ZiNA8acnWLj+tJo5quoqlDZ9H6yIiDN1X+BCraEkdZuLT
 KE8kXSpBsiZ9KUp6aRGDPHspj+w+/U/VwUz5NoCBuVkp1cf1Z5feYEns0MpKZ8mPGo8p
 LDjmh+Y7TJ8NTgoHF5+Y4NoXkEkHjySGD29eX0rOuWU6TU7Rdb7N7hJnRnZNXg5CcAzI
 r0Iwk9m7V6pbJGZNlIU6pX8HXDctyBe7ZVHmXAq+QNcQWpj82vXm6qRCeJnUyOyQYqvb
 JwCQ==
X-Gm-Message-State: AOAM533iccgGIxZMMPDpTYoIwcDWXWONg1tuP6qyhFmAWbA8mdsBT0Ob
 XQ9RLne3m2AfZIoSxEsWc000Mxesz7mAJQ==
X-Google-Smtp-Source: ABdhPJzk68R8J6qVUJfIbZwhdptQQLqu6Tezv+Q+JGCGu/gwek2gvqDIjts3I65ue4tMfSKIVWQgUA==
X-Received: by 2002:a05:6e02:18c9:: with SMTP id
 s9mr14159992ilu.294.1643658996259; 
 Mon, 31 Jan 2022 11:56:36 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:35 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/40] bsd-user: Bring in docs from linux-user for
 signal_pending
Date: Mon, 31 Jan 2022 12:56:02 -0700
Message-Id: <20220131195636.31991-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

This is currently unused, so no code adjustments are needed.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 4dd209e402d..671b26f00cc 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -86,7 +86,14 @@ typedef struct TaskState {
     struct image_info *info;
 
     struct emulated_sigtable sigtab[TARGET_NSIG];
-    int signal_pending; /* non zero if a signal may be pending */
+    /*
+     * Nonzero if process_pending_signals() needs to do something (either
+     * handle a pending signal or unblock signals).
+     * This flag is written from a signal handler so should be accessed via
+     * the qatomic_read() and qatomic_set() functions. (It is not accessed
+     * from multiple threads.)
+     */
+    int signal_pending;
 
     uint8_t stack[];
 } __attribute__((aligned(16))) TaskState;
-- 
2.33.1


