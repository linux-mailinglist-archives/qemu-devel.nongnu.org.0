Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3FE42730F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 23:28:33 +0200 (CEST)
Received: from localhost ([::1]:57820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYxPs-0001mw-TI
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 17:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLb-0003Dh-8X
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:07 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:36439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYxLY-0007dq-QJ
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 17:24:07 -0400
Received: by mail-il1-x12b.google.com with SMTP id h10so4319747ilq.3
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 14:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+iCM+yR0qcttTMwYSn2e4jAE9+L2FqOFocc4ASN0OLo=;
 b=WaZNQ98svrVxbeiuAHb3aA3S5AADbwwegmXYeRgqm4h0HHLSGaGtUUOgULHc7EVxZe
 F0/XFhQV33ca1wICtcmANt/OQaeKbQaV19C9KyeXtQzqkWh1x6+UiJOsEvRcdam5tYrC
 lIWmxn+UHfA/cXN2zODHUS1UCcaGpBLl6yFGSKch7xlEEoRobyiZuOx+PnPbQC6DAKpk
 R0G5ZZEdLHB5wDsAQgsD5vqLwoSvY1aUoUnOneQ2sRuZpdXmNcQmaJNa3dKnp9QIgztg
 7J7bktJ7BJEfxq3u8uoyMmzq80hN7n9KAjhtqWJEUUx3GQyzeAsQiVSMaHzwFyfNqS9i
 qC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+iCM+yR0qcttTMwYSn2e4jAE9+L2FqOFocc4ASN0OLo=;
 b=lC9OBK02dfP14MqIzPkVhyxCmxY1fXhj4qfRC6y855IGVhYpx5wgQhN1MURFXjyKYz
 7EP5xvUvFtAeZ1Us0Z9rGPVSBR9EW49esVZ3wFsJ2dU3zeJ0azbXeSUq5VmL+9rVxAIb
 2RuaPc+oiA/arbhpEJJB4cGd2TC9tDYGOSkAmqQhhcbuxyNPlR3xbCEmGHY7PfS9lAcE
 Ctmk6FlEBGwpwu6TYqVGIow0mUCRVojlADGepEXlYs4iiBhYovqga72IH3mI7K4ScGjZ
 /LWHgerFGBtU4yTNRlcHhglDhB4iQYynQcpRTELHJ18wTAp/8UZFBwlyBBJvFgQkbrdi
 nIfw==
X-Gm-Message-State: AOAM531Itegzq+88eQyLyowD7CsSPrV0tGKwN2TEn5sUxasM08b1bxcI
 zrIwpeCD4p4/oBtF3KBgrqDNG4hNSEaszw==
X-Google-Smtp-Source: ABdhPJxwHjiy0WYUE8csiTpcD1Y+ZPD2Xk/nVCljnBSX0YSP9wZIfGm+b9nkfSOmQV+fq9fUwUS4YQ==
X-Received: by 2002:a05:6e02:14d3:: with SMTP id
 o19mr9806343ilk.156.1633728243477; 
 Fri, 08 Oct 2021 14:24:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm186620ild.52.2021.10.08.14.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:24:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/9] bsd-user/mmap.c: mmap return ENOMEM on overflow
Date: Fri,  8 Oct 2021 15:23:39 -0600
Message-Id: <20211008212344.95537-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008212344.95537-1-imp@bsdimp.com>
References: <20211008212344.95537-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mmap should return ENOMEM on len overflow rather than EINVAL. Return
EINVAL when len == 0 and ENOMEM when the rounded to a page length is 0.
Found by make check-tcg.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/mmap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 6f33aec58b..f0be3b12cf 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -455,11 +455,18 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
         goto fail;
     }
 
-    len = TARGET_PAGE_ALIGN(len);
     if (len == 0) {
         errno = EINVAL;
         goto fail;
     }
+
+    /* Check for overflows */
+    len = TARGET_PAGE_ALIGN(len);
+    if (len == 0) {
+        errno = ENOMEM;
+        goto fail;
+    }
+
     real_start = start & qemu_host_page_mask;
     host_offset = offset & qemu_host_page_mask;
 
-- 
2.32.0


