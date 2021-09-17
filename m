Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8AA40EFE5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 04:58:58 +0200 (CEST)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR45Z-0000Zs-B6
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 22:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43P-0006Or-5d
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:43 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:41499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43N-0005mn-3P
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:42 -0400
Received: by mail-il1-x12c.google.com with SMTP id d11so4854551ilc.8
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VNnZYNNWkXZfPumYFKmw5xunCUfR3eo4wtv9cbIoG60=;
 b=SKSsnhPA4LLJgtyk3JI1AcTuNLxAVjcGcgMO9rEHh9rVMpvVRW7j4R5kWC7K9/cPTv
 eBHx+nuovVk/+jEwMYwxXOdp0cRL2jdXQ194pWyK9a6dZIndBlv2x7RB3BqUu7zaqnJL
 FhtNXPZ6Z+cIOPsR7HZi+PWGuJMXK6R9soSLKSu1OdmM2VAEy4Fl39pZyoU392MtVH9P
 YVa4GC3n09CG4Q4Ovc1RZQxJJFP35JSzewWtUMk1Lc018rImx2672NHkLZn4N1NlON+y
 0CT+ktyF5s1KCtuL1EXeRzFb1lNN8MKBDGr3wDxfCxC7ICSIZvse59brnXuzKql/deVg
 1uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VNnZYNNWkXZfPumYFKmw5xunCUfR3eo4wtv9cbIoG60=;
 b=cEu7gJ1rBEHcB/HuyTKTMSsG54pt2qdzDjCp0xUb3ClJccoo+NNponpKB3AZgj0AB4
 /mLAl+T665jsvA+x0Ak8Yf7VdciviGljx21n/vWUvhvP7NRugVd3AEcAVuQty537xl4V
 4AXCmmBowXZATRGvbQrXLfwhe87qUvZgVwgt6P1A8VjyyOUjtVoHfUNCevJzbzn9vHdZ
 h32qgiQYHsrvYbbK5QOq7MYWFTlhWvdcEo/gSCbMQ9LtWEg7aUHiVEj156xPqnOJb1XR
 eseP4M0KtvSMgi3lH0JZJBiNWXeL5TOfAzBgbeyEj6cS56YiqCUFbi3ubwa6BxN1skUC
 kMUw==
X-Gm-Message-State: AOAM533HFgmZ2XhEssnkgHYTzLcLYva+K40DZq1he+F1V8U01AsiFJic
 6QAAZdaPatHlvoHa0sVsVc43YjTkK8lQ0YG1+Ro=
X-Google-Smtp-Source: ABdhPJzudDLB0wvhn0RI/6wjTSiAE7RL8ZySclt7F1SwXefqC9sfNivALDwsr0pKe/gbbAJ1lfUA3A==
X-Received: by 2002:a05:6e02:10c4:: with SMTP id
 s4mr5907769ilj.285.1631847399325; 
 Thu, 16 Sep 2021 19:56:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id e10sm2603738ili.53.2021.09.16.19.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 19:56:38 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] bsd-user: Apply e6deac9cf99 from linux-user (zero
 anonymous memory)
Date: Thu, 16 Sep 2021 20:56:27 -0600
Message-Id: <20210917025635.32011-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210917025635.32011-1-imp@bsdimp.com>
References: <20210917025635.32011-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
Cc: Chen Gang <gang.chen.5i5j@gmail.com>, kevans@freebsd.org,
 Riku Voipio <riku.voipio@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikaël Urankar <mikael.urankar@gmail.com>

linux-user/mmap.c: Always zero MAP_ANONYMOUS memory in mmap_frag()

When mapping MAP_ANONYMOUS memory fragments, still need notice about to
set it zero, or it will cause issues.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
[ bsd-user merge by Mikaël Urankar, updated for untagged by Warner Losh ]
Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
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


