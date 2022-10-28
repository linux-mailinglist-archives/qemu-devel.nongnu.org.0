Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A156461198D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 19:45:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooTOg-0002VM-5s; Fri, 28 Oct 2022 13:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1ooTOQ-0002Rn-76
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 13:43:46 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1ooTOO-0005Z2-9W
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 13:43:41 -0400
Received: by mail-il1-x130.google.com with SMTP id o2so3316498ilo.8
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcEn/MPEcp7Orardhffba022UeWLHLN8pp6ZchjscQE=;
 b=UAZJRHgpvqQh+b+lWZ57eIZ5DLkzOEjiOATcUxOV1676nzV7qkhmgct1fHC9OfIUQT
 TrZb6qUOQPYZSq6tbTSayPulwkMPc1mDucKH5kcZ+3AhM/M4xKKodM4x3LWIlia00tWs
 SvXodamIwNyOQIWFwvT3hz/YUG510eVeUDEoyzAaI8NbNZHuh6yS+T6QnKzhZok/Dihy
 NhWI23sJLgObDx/EKXWa5KdLaSBnzWbEWoVsu3EuMpV0mQMYagrhM/qB9DgCdn01kZ/R
 wdQ5HYcAw5LVo+c8vwAHNffaWMQCQYQ48d9BnlXRr6eN0N668rNTt7pa3opjFXVmq78W
 9q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcEn/MPEcp7Orardhffba022UeWLHLN8pp6ZchjscQE=;
 b=fkko27an4tH0NDNmxA1sBhNQSyKSjU2tL4DHIfHQEQVlUNzxkKB+tudWrNt9nVKL5y
 6MDFML21yToEb9aBHzbOSoeC2FYsEonMyjvlNZgGNCIZYKCl8PN3MDtfWzwj0om2FdJ4
 Y5cC6iQOYh038mxR4xfY1c0LpsTeybGTG7pNtdGJXbFE7LGlphU3xUAUyMLyjAdFBmN8
 vS8IE5acsEVdM6FRHtrVphhUubXknJl29sv7aXLAN6WYlJTKeVmjTNi1FWSjuO1lxFwQ
 ZEOwv99eCebkXQlA/9EAEAimiI9H9gQp8Ui+bwJbzwgc0ctAWr6f1Q5bpXO1uwUJr3p0
 ++Zg==
X-Gm-Message-State: ACrzQf0AOR9AFOshSXjmtQWLr8Ju0nRCB/SiXxOuBc0p54WAarEqNhCt
 a3bHOUzaCk9L06De4y0oMjO7AsTvliTGhg==
X-Google-Smtp-Source: AMsMyM7iqqTWLwqtbQ11WKaXIST1SRo5LTVkWMxUeBJw/7BeQowBqPUulE1z0RSBU7t8LTjpZPuYfw==
X-Received: by 2002:a92:ca0c:0:b0:2f9:204:7a0d with SMTP id
 j12-20020a92ca0c000000b002f902047a0dmr292053ils.194.1666979018869; 
 Fri, 28 Oct 2022 10:43:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 p8-20020a027808000000b003733e2ce4e8sm1930453jac.59.2022.10.28.10.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 10:43:38 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Baldwin <jhb@freebsd.org>, Muhammad Moinur Rahman <bofh@FreeBSD.org>
Subject: [PULL 1/1] bsd-user: Catch up with sys/param.h requirement for
 machine/pmap.h
Date: Fri, 28 Oct 2022 11:45:46 -0600
Message-Id: <20221028174546.88683-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20221028174546.88683-1-imp@bsdimp.com>
References: <20221028174546.88683-1-imp@bsdimp.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Muhammad Moinur Rahman <bofh@FreeBSD.org>

Some versions of FreeBSD now require sys/param.h for machine/pmap.h on
x86. Include them here to meet that requirement. It does no harm on
older versions, so there's no need to #ifdef it.

Signed-off-by:  Muhammad Moinur Rahman <bofh@FreeBSD.org>
Reviewed-by:	John Baldwin <jhb@FreeBSD.org>
Signed-off-by:	Warner Losh <imp@bsdimp.com>
---
 bsd-user/host/i386/host-signal.h   | 1 +
 bsd-user/host/x86_64/host-signal.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/bsd-user/host/i386/host-signal.h b/bsd-user/host/i386/host-signal.h
index 169e61b154c..ffdfaba534a 100644
--- a/bsd-user/host/i386/host-signal.h
+++ b/bsd-user/host/i386/host-signal.h
@@ -9,6 +9,7 @@
 #ifndef I386_HOST_SIGNAL_H
 #define I386_HOST_SIGNAL_H
 
+#include <sys/param.h>
 #include <sys/ucontext.h>
 #include <machine/trap.h>
 #include <vm/pmap.h>
diff --git a/bsd-user/host/x86_64/host-signal.h b/bsd-user/host/x86_64/host-signal.h
index 47ca19f8814..32ac4e41803 100644
--- a/bsd-user/host/x86_64/host-signal.h
+++ b/bsd-user/host/x86_64/host-signal.h
@@ -9,6 +9,7 @@
 #ifndef X86_64_HOST_SIGNAL_H
 #define X86_64_HOST_SIGNAL_H
 
+#include <sys/param.h>
 #include <sys/ucontext.h>
 #include <machine/trap.h>
 #include <vm/pmap.h>
-- 
2.33.1


