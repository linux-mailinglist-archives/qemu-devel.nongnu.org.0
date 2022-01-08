Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D077948826B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:38:38 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67FF-0000IR-TW
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:38:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66It-0005Ua-WE
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:21 -0500
Received: from [2607:f8b0:4864:20::d34] (port=37516
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Is-0003WQ-Bz
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:19 -0500
Received: by mail-io1-xd34.google.com with SMTP id 19so10095422ioz.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yTd5grbll1DlbzNLFo371dzmeKkoGihsZlNwerjeO8o=;
 b=uFRKi/yRihKMcKylTf3snOhrn3coz/uZ+yzZOqjjSCVYbbfK3vB+ixcFXRjHszEmvd
 DOMTxo/LVibyDqgxsoDFCe4yNzLIfrtxjMhjJHb/k/yNnXlFvX+koV7ex7XXNtYCN1np
 GgvUpVSlY7z/4lnXG/OUgzLxphZRnypeQtK3YA/+7nZSwdSn2yrr9r5hBaDqAYcMAU+w
 xVvMw8N3Hv3FlkEOlWLKqtcxS+2jd3Xm1PNWZ3wtJ0Vux/+qpawWaTFrXDFp/7XFHZSm
 CL6JmDiU41B5CGrBZaGijFubrbpHkuupWIToQuTuMr3GBzAIC7vqYvxl0EYOz4NLrUEx
 iBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yTd5grbll1DlbzNLFo371dzmeKkoGihsZlNwerjeO8o=;
 b=ze0/4zEBYE149kUzqsbPYtspemZMlBoiKSOiKgF1W/QLWBGbY25fqr5gq7Q0MKXYwd
 jb3dnWgq8q1TvKcw5+L/MbBiJyWmhfW/cicCuKj8NiROvrla5JA2RhkK4p6uOEYGvPKB
 d0T+jk/Es5IOOs4PcNZioLPMSp1HTL8Nsl/fmPu6BjwFOk8/UxXDRbCHA2bm986ioNzQ
 DYwuS39XUesYxJzSqNyPGEXMDPB5aLu/jFrN0rffJmFL2QUiWwKckO/ub2nBj/+J35Kf
 oYargYq/qIH8I1Q/PyZ/XfMPfNE6QwrxJUNrZIX83IcfqCvV9SGH/pGVaXa/kHW6Hu2b
 zI8A==
X-Gm-Message-State: AOAM533BkT15T850qh//0GrssdD+WSTBdiuItZ9dJi//afrkUsUAnfGn
 BUtHymDqBTV3Nc4My4rYFrt4UViy1CFboIKc
X-Google-Smtp-Source: ABdhPJzcvhM2FMMEByQkg2/JWYE/qshVJvApRwMl4oNEs/57gKOVoqAnc5lallBo2MKGw7WzxkQKeA==
X-Received: by 2002:a6b:1496:: with SMTP id 144mr6261573iou.119.1641627497083; 
 Fri, 07 Jan 2022 23:38:17 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:16 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/37] bsd-user/arm/signal.c: arm get_ucontext_sigreturn
Date: Sat,  8 Jan 2022 00:37:35 -0700
Message-Id: <20220108073737.5959-36-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org, kevans@freebsd.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update ucontext to implement sigreturn.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/signal.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
index fb6228db6cf..1478f008d13 100644
--- a/bsd-user/arm/signal.c
+++ b/bsd-user/arm/signal.c
@@ -185,3 +185,12 @@ abi_long set_mcontext(CPUARMState *env, target_mcontext_t *mcp, int srflag)
 
     return err;
 }
+
+/* Compare to arm/arm/machdep.c sys_sigreturn() */
+abi_long get_ucontext_sigreturn(CPUARMState *env, abi_ulong target_sf,
+                                abi_ulong *target_uc)
+{
+    *target_uc = target_sf;
+
+    return 0;
+}
-- 
2.33.1


