Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626F4432387
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:12:43 +0200 (CEST)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVFi-0003jB-Gh
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8d-0007dC-1L
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:23 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:45675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8b-0007sy-8M
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:22 -0400
Received: by mail-io1-xd2a.google.com with SMTP id 188so16851568iou.12
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RLjwrAOhbaeXdkBQmG2ODKBch/v6AHtkj1VQlFfA1Pk=;
 b=gZOUy86Sfnfor1v7qzJqKgFhJKa3hfjyHJ7y1sJ93Wk7sdrCleb8akGGjmStl9zsR9
 menI3ZZ2N2G2cVgyx+MzUnpYd+yDGlzzDCik/5BEHObahj3tbCoae4FMcijrKuGMwLPZ
 aAl/KgNnsl90RmagvhUaRTy6o5ck/eTavFf08WT1N1de16TyP1W2sD8xZk2Q2q/WCr3M
 uU81+huejEQjsjlDLuLRS1aou/yXsY3474cAdwJ9hqxAyPhRglb3FTLQwpkZprn8kTO4
 XjusvakPB8resmr6DOo6h2rPFE3Qq+dhTmBEqO9IoeSW7n67xCJvOOuNdwERS6B0mC8N
 UT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RLjwrAOhbaeXdkBQmG2ODKBch/v6AHtkj1VQlFfA1Pk=;
 b=TpHsVtDJ61SIvDjsthvgOne7qM4ODktyRNNc8LtLPVLRjg6xHVWF2W5B5ubH1bDNGx
 RbF2mIxV2UyzLBoc0ZQM7G6c9EjVBLiPxdQP0Ug7ukelfYstioT7vhcKHkotFKyBIYPH
 jE6B6YyTU39LCtCGpjVjOe2OR6G/qVYOWk2Hd+pHVBbYpTS1ziPjhuH1BW8xMqvCBhZ9
 NeXRu4GHvrrfM7l+pG+THMJAJD+8UCH/DPHwaoh/l+r578rXTUWRAtzrph/WzWayiDX2
 1+ZeQbota4ocRaEIADltepYTULJRrpGBRRexYLD2koqjr8c+92PxpI0Ruz7FWqWRtJEY
 +bdg==
X-Gm-Message-State: AOAM531NDpyT87ZIf8L3X2F9hq2a1TIoc1dgDdE87wck8F+EVbY8YwKg
 YxGiJvZEOCL2z06MELms5zYflKMh+mc5iw==
X-Google-Smtp-Source: ABdhPJz6fIRfKFjwTg0GH3oyGqFzzsR15KcH/BUplDQu0xlrFP1I/PPOLvBapaGGQzaCR54DQcNI+g==
X-Received: by 2002:a02:cac6:: with SMTP id f6mr444876jap.81.1634573119218;
 Mon, 18 Oct 2021 09:05:19 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:18 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/23] bsd-user/mmap.c: mmap return ENOMEM on overflow
Date: Mon, 18 Oct 2021 10:04:39 -0600
Message-Id: <20211018160458.1976-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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


