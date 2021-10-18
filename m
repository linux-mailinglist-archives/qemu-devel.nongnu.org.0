Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0287432702
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:04:36 +0200 (CEST)
Received: from localhost ([::1]:52058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXw3-0002Sg-V5
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtG-0007x3-7e
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:42 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:38801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtE-0001Wi-1i
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:41 -0400
Received: by mail-io1-xd32.google.com with SMTP id d125so17524789iof.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RLjwrAOhbaeXdkBQmG2ODKBch/v6AHtkj1VQlFfA1Pk=;
 b=cx1zDtiOPrsgzkblYxrC/N+IhoifRU4rG+5Av6shtwIPpradxWRZtEnjJi2Ob1W1RK
 DS2mk8IYC8GcNgys9xUtrTB+HUr/aGra//Tp6Gj/lfHt+0HHAJybtFMAHaSKUbM0qNiC
 TXQa1iuWzeoLmwNsQxnkEqSBUrucvAOSDA4ciR9KJLHSmzAKuX9E9mt2MhbUejW3dPh/
 y378c0Mbygfc5KAUshyy9eEdYmXXtQ1M8SzR4MthREE0wXUH/ySf47VhiXscNNGjFgI8
 b9z0HETG5KcNCpM6CQdZYuukxjBVZbt2Ki0kVXNbMauRjVxdAM7NBcEOhZRJivFdK3E3
 33JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RLjwrAOhbaeXdkBQmG2ODKBch/v6AHtkj1VQlFfA1Pk=;
 b=sIMPSOAPQgd1wyMhaCuU1oqNDfNYrdgy2zaXBb78a38PFzuO3aRLl+aLDh2HL213NV
 ufBJSMzZapEFsaxEhi+z42B/ddQkPkvoYPCsO/EGGHoZxiRtAlSE1aM9X/aUyE8NwnKe
 li6gKejqwjaj+x4U4ryQ+XLQi5T/Vi4auwP4PWgBI1qT4eljaVurc41BMrP5DfrPBOK1
 faQ1OHRih9oPKiaqXSkDYYdp2EpFH6ePH2krylTjZ47ksTeT5R9KWOn4BwXRBMd18FVh
 0zuJOYUwE8Szw/Ai3rK2PBMb7V4nBLuavrVzW2vdSPx/0Tx0psxwTru4pjC16aQbe8yj
 LEcA==
X-Gm-Message-State: AOAM53298GvbwKLS4OcQiAv2M3h2AoPjC9qlojctGC/hTz7z4OPHVUZm
 dPIaQ/iXEa2kuBgBdCjG758J/UcpJVaPjw==
X-Google-Smtp-Source: ABdhPJydhlJ3gZoNyytNS/Hv/aUcZ2d0IegbVf7CKwJjHr+uXpEw9tZsOAPVS+OsK7PQkUBi9DMsPQ==
X-Received: by 2002:a6b:2c95:: with SMTP id s143mr15354420ios.36.1634583698253; 
 Mon, 18 Oct 2021 12:01:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/23] bsd-user/mmap.c: mmap return ENOMEM on overflow
Date: Mon, 18 Oct 2021 13:00:56 -0600
Message-Id: <20211018190115.5365-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mmap should return ENOMEM on len overflow rather than EINVAL. Return
EINVAL when len == 0 and ENOMEM when the rounded to a page length is 0.
Found by make check-tcg.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
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


