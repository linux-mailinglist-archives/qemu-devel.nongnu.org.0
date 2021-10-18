Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D943270E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:05:52 +0200 (CEST)
Received: from localhost ([::1]:53920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcXxH-0003hD-Kw
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtC-0007wV-By
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:38 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:36577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtA-0001Uw-8C
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:38 -0400
Received: by mail-io1-xd2f.google.com with SMTP id e144so17542949iof.3
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oK8OdzI3+mMf4vVbNx2oZhOXbhyBiMQd575mcLOjFB0=;
 b=0mKHfUQ+Q2LtYIbbeJopvIkXAxbJ44XQiIhbWvBieRDJGLZbMXtdjR5lijORYwFuBo
 LU3RQgQeK1MPsllWYeUcDgK3sD0ASLuysX+lbVtJ/LB1IbZEyoWuVpTeNUrqqkOrJos6
 TfkOi8Mj1gDY/tqSZxcFBDga4SJ0boBG18igKnUMGd0m501dZE1wQxcZJRpt0Ah4B4Iq
 B8i32tVXrUsvVdqk9iTbX5TchYiWCWcR/lAL0bznKkf8ybX5jIKMvnXtGsYYRiXQIaWZ
 Bq00byeWgUIAx+8CMe4yiGQB2sXKuGjBqUEEGESmmM/PYue1Mtqw8W/6bd4tdAu9uPtf
 ndBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oK8OdzI3+mMf4vVbNx2oZhOXbhyBiMQd575mcLOjFB0=;
 b=36t2uegnXCkO49ohGxIFVbdInVggQfJSx7kyY+1E50Oja4CA7gm27drgElxoxel2G7
 vj99Dt0tuo9dURF31xCTMg9t5gQKgKFj80DH+6ptJbbnYxNXoexeVdxVTE4TJQAGaSzI
 8M/zl3MaOSnitGerHAoXYl4FS9quLWa/8noOrj+QApcMxQTShXzKsS+A7D3hdaLNYD36
 Xkt+EUmQ0FpxHUO8e60qoNDksUZI2+12EbxMoGmREcx19cAeWxddb/U0AFrDtgg2g/Ra
 J/vIgKIkO06HstrqXh7dUuR0pCcbpKCQ5JvxKQTgcSWozbSE37jVGP+8w6+EN3i91riy
 l94w==
X-Gm-Message-State: AOAM530W/jCO+CsdFEtOaVHIKVzdFQfPEt71mgUZMaPmp2pELYf5V1t/
 DqE46VgPY6TeImfrp+1nxRSsJRL2OLLNcg==
X-Google-Smtp-Source: ABdhPJxKWMHWAGajQwHBe10tQT929i8JDyTbCL5NSqzZf46UPKLBjlWSqGAGLjpGH1InVH0IyVa1mg==
X-Received: by 2002:a02:c761:: with SMTP id k1mr1126353jao.74.1634583694629;
 Mon, 18 Oct 2021 12:01:34 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:34 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/23] bsd-user/mmap.c: Always zero MAP_ANONYMOUS memory in
 mmap_frag()
Date: Mon, 18 Oct 2021 13:00:53 -0600
Message-Id: <20211018190115.5365-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikaël Urankar <mikael.urankar@gmail.com>

Similar to the equivalent linux-user commit e6deac9cf99

When mapping MAP_ANONYMOUS memory fragments, still need notice about to
set it zero, or it will cause issues.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/mmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index b40ab9045f..fc3c1480f5 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -180,10 +180,12 @@ static int mmap_frag(abi_ulong real_start,
         if (prot_new != (prot1 | PROT_WRITE))
             mprotect(host_start, qemu_host_page_size, prot_new);
     } else {
-        /* just update the protection */
         if (prot_new != prot1) {
             mprotect(host_start, qemu_host_page_size, prot_new);
         }
+        if (prot_new & PROT_WRITE) {
+            memset(g2h_untagged(start), 0, end - start);
+        }
     }
     return 0;
 }
-- 
2.32.0


