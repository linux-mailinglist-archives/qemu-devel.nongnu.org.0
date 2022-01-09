Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 715CD488A8B
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:28:53 +0100 (CET)
Received: from localhost ([::1]:43644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b3s-0002xs-Fm
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:28:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av0-0005Zp-HM
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:42 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=46971
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6auz-00076g-6j
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:42 -0500
Received: by mail-io1-xd2e.google.com with SMTP id w9so1346243iol.13
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ES958KZKo5L8ikxaMtAOpI9/vZpy1zFREkT997pUi2c=;
 b=Ew6xBrV/iqN3Lq6qviqeLQhp31SZH4hyfzZkk6AgSWx61ujtaRfjRSAXA2pJMzvYDr
 MlwD9qOVEF0t86SbriaekZz37Dzl5xfgbvCuWASMTDQ4BfIZOZHwUAqLj5lTACGgRI5M
 yAbMcaT3sKOTMRagA3gvISkgU2TOmxVvo7YZWPzHdAbMTpzHfc+PakXeaZA87/IfMA3d
 f1zlw7UOurw5dnh0gsrddYJ+MoAZ9STXqW4fUWuArXDxAIXEY2hGjs3ttjRZcXDEVwrx
 3EaLkoxy1fM3ICVfs2MhxLX8HTMeNpFq1jwoSX+AnIL2nfpW1NrLA8GyqULors03XIzc
 U2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ES958KZKo5L8ikxaMtAOpI9/vZpy1zFREkT997pUi2c=;
 b=CFXGZLs6zo2qCTOW9sVNfNlrqRv7ngAnTVSS/3/hJxFsSBk2/JOmoQDURoo1uDPgZb
 +/g77upb9Cf1MNx1Zy3m9mVaVvaPRmAeXhHikEl+vrLFp8DYK807g1gq+IFzB8FEeoIg
 g5lh9gooI/BK/LaRHS6hi5IJfx+aFU+TXsIpbda9tYLqwz97WT4mA5yyHAxOQ9ojyvTk
 jlRx1OByeuubLWm0/hGmP7pCGxaVM5IUyFLWkhFxQ6G8oQxQJmeKCQRMfK/eGqtPSRVw
 /CU3PatLzudnkMXL383wBJ7uxv1Wz0aBZo2iWAYUU85PjNcK0o8yYCZMTp2ahaa22NIl
 xbfQ==
X-Gm-Message-State: AOAM532h/GBsznEe2RFL4MNp8n5p1uJTCM65+Xgn4D0eQzgrLqqx6aem
 1aDJQxu3iaTJUsEIUg7ovat0ggJhbUa9BaRO
X-Google-Smtp-Source: ABdhPJzUUgMxh839zDr6Lj1dDQxFIyJCbX/pw+HUa1dVr8Tk8wQguIjUVXBJz2zzATkB2kybo8cI0g==
X-Received: by 2002:a6b:f804:: with SMTP id o4mr34000090ioh.110.1641745179817; 
 Sun, 09 Jan 2022 08:19:39 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:38 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/30] bsd-user/signal.c: implement abstract target / host
 signal translation
Date: Sun,  9 Jan 2022 09:19:02 -0700
Message-Id: <20220109161923.85683-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement host_to_target_signal and target_to_host_signal.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  2 ++
 bsd-user/signal.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 1b3b974afe9..334f8b1d715 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -210,6 +210,8 @@ long do_sigreturn(CPUArchState *env);
 long do_rt_sigreturn(CPUArchState *env);
 void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
+int target_to_host_signal(int sig);
+int host_to_target_signal(int sig);
 
 /* mmap.c */
 int target_mprotect(abi_ulong start, abi_ulong len, int prot);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 844dfa19095..7ea86149981 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -2,6 +2,7 @@
  *  Emulation of BSD signals
  *
  *  Copyright (c) 2003 - 2008 Fabrice Bellard
+ *  Copyright (c) 2013 Stacey Son
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -27,6 +28,16 @@
  * fork.
  */
 
+int host_to_target_signal(int sig)
+{
+    return sig;
+}
+
+int target_to_host_signal(int sig)
+{
+    return sig;
+}
+
 /*
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
-- 
2.33.1


