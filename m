Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277BB3E3751
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:02:59 +0200 (CEST)
Received: from localhost ([::1]:33642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUPC-0005Mm-5w
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6U-0000EO-SU
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:39 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:36826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6T-0005S1-Gi
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:38 -0400
Received: by mail-io1-xd2b.google.com with SMTP id f11so19877567ioj.3
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G3nLLdhEF/Vlqw5++2FHKdCGPSKrUbgdgJXcPdhW92g=;
 b=1G0T10du/yj9eilbkg2SThlMESF+kIjMCqEBnFNEHcGnJQ9IVJD9WhCyraS/W+jKHw
 Xyja13XKgiiOTbiGFPypinaNuKJGhHBajiBTTQ9ZMe2q5/ALJxz+5sihaojk49HDtnPJ
 4Jj07WP4HKAFqBZlwv2JeOTFLQ59fkp30qqAhi0+w5TeThfAFslat5wKEwZHctuwuGzT
 82aREfk09toR7/unfw0W6KOAg5Dk2aoCdmyf6p9vsdThQX2E0+OjvK/A3FfY+6gh58FI
 rRW48v0din5AVPRlYmbdnpyV4ycWSLfNZDvUXepAGCeHsnlDT3dxxfEG4WIwQfs+rSHm
 j4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G3nLLdhEF/Vlqw5++2FHKdCGPSKrUbgdgJXcPdhW92g=;
 b=el8nILTwdNDmTMLaTvaLwylIgnJ+XH+2zTBc1ScmYnKKgUkOWGEBfFmCUBKfbqkt+R
 i6zu8Gg0cpqWHHQ9rbofm7/imSZWhFYMtyvy0dJVAfOm6sldlGYHb7dRA5uyqhHzWsYl
 3LwclCD2kkP0/zCRm9n52uAi5Bk9hVGaIE4Y5XNIDOt333qaC8NNSI6YxmIZjz1tML1i
 gHphNr+r2lT1TYt7aOZR9QHYN5pVWHp1+k0UNlcEZAxGF803B8KBj+/dudJ9ja7+Otsx
 ETgLbNRIlvRDxrQSZPlJbtddocAuV5b4eA+oNM7RCGF2F+fRu+hc8Sl/Wa3xZcmBnSFB
 Pexg==
X-Gm-Message-State: AOAM530tGw9wUCLwRQhwGldgodydwLc5mlNw+4ZmiNiljygyj3wR4CWg
 x+yasC/igeFFKuSxaaxglV7GCSI9tiRluXgF
X-Google-Smtp-Source: ABdhPJwYXEvFdOPWQEef7DnvY3fjFTy7Ok1JcBFsNc8IxF2BUHcKDZY112n+6cCqwD/+EtaV0ueGZQ==
X-Received: by 2002:a02:2307:: with SMTP id u7mr15852354jau.28.1628372616326; 
 Sat, 07 Aug 2021 14:43:36 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 45/49] bsd-user: Make guest_base an unsigned long
Date: Sat,  7 Aug 2021 15:42:38 -0600
Message-Id: <20210807214242.82385-46-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Make the guest_base a plan, uneigned long rather than a uintptr_t. It
isn't really a pointer.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 08f88d9668..c8fafa78d0 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -49,9 +49,9 @@
 #include "target_arch_cpu.h"
 
 int singlestep;
-uintptr_t guest_base;
 static const char *cpu_model;
 static const char *cpu_type;
+unsigned long guest_base;
 bool have_guest_base;
 #if (TARGET_LONG_BITS == 32) && (HOST_LONG_BITS == 64)
 /*
@@ -440,7 +440,7 @@ int main(int argc, char **argv)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  %p\n", (void *)guest_base);
+        qemu_log("guest_base  0x%lx\n", guest_base);
         log_page_dump("binary load");
 
         qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
-- 
2.32.0


