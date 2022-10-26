Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BAA60D92E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:19:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuA-0004zB-2a; Tue, 25 Oct 2022 22:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVu8-0004z3-LQ
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:28 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVu6-0001Ey-Vq
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:12:28 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y13so9351049pfp.7
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOgmBaXKS/xi9ryJgDE8k+lfxN7FqNvokTcGz2ux3fA=;
 b=e9JYHcnw3UvO/s7NYw2kCNYgIpEwv/ipRVKhAeTy59sfcs6lMADLp/XvueYyG4WKam
 99F+e13nOMl8NUtfwsubJcLXuk+IfvBRNN6l0m43YqWF9RTBYOccSRMyOXc8n2KK1PD+
 8R3uYaNF6p41a76nj3w37D1ZCS7fiM4TL2LihfCKzm2ANBX3VJ0khoDJ2Uu2vjMcMpzd
 8rXTc1VYwNGx/RwGxjzyZRuQ3sJm9Vr+1aHBo9NHx2aIzSCwtf2m1OfhPkvVKc8p5RUk
 mwHuTgwYD0QxNRa0SzOXNdDSK+3ZGj1XNymsoUfpmJZrWVn6yi+lQoaVgfYYQA2g99KV
 0RzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tOgmBaXKS/xi9ryJgDE8k+lfxN7FqNvokTcGz2ux3fA=;
 b=cz/nuoI2BUrQo8/tnuyEZLxBarmU7q9SEPNfl52cJwkVufeeT9t4lVNMaQycDDLlCO
 5QB5qt69zsRn7bDZ2pyi7Oqx1QhZYMwPnq7UehJUeSvZg4QlHKfL82StOc9XDpnKmLni
 QlNNNQ9PKnoa9tVQ0UlpPX0pLhR93ERSZuQSckEGDz6gfS2j5+hxaMwxcL+aDaGSWa4z
 Rs0C7ULfulg93gzNMI/Qd7NW6u2dl5E6ixu5MNdRDNJz0PnpWxEyzKdH5r5OEo6YDR7K
 ps7g3+N85mlWMV5CaFEyXNNVcsvMFum+tO8P2Ki+clEVwSg9YSH+EKqzDkfk/H6oHsgm
 dEPw==
X-Gm-Message-State: ACrzQf16krsiGKdmpRPYGhEIaceVNq6ojAd6bUHreAXeW9dMrVEeTD/0
 gjpoFtb2f19mknZHGM3uB+mQXglwApccrlRL
X-Google-Smtp-Source: AMsMyM4XnWroeyILf+LXOYFAg68Z0BXf89TQEhPIbE8u1UhW6rLcbpTKvPEPvzBeM49wck9AmCbcHA==
X-Received: by 2002:a05:6a00:1781:b0:561:7f7f:dc38 with SMTP id
 s1-20020a056a00178100b005617f7fdc38mr42255840pfg.42.1666750345440; 
 Tue, 25 Oct 2022 19:12:25 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:12:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 22/47] accel/tcg: Use tb_invalidate_phys_range in page_set_flags
Date: Wed, 26 Oct 2022 12:10:51 +1000
Message-Id: <20221026021116.1988449-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Flush translation blocks in bulk, rather than page-by-page.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 41b6d5fe26..eea24dea96 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1352,7 +1352,7 @@ int page_get_flags(target_ulong address)
 void page_set_flags(target_ulong start, target_ulong end, int flags)
 {
     target_ulong addr, len;
-    bool reset;
+    bool reset, inval_tb = false;
 
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
@@ -1388,11 +1388,15 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
             && (reset ||
                 !(flags & PAGE_EXEC) ||
                 (flags & ~p->flags & PAGE_WRITE))) {
-            tb_invalidate_phys_page(addr);
+            inval_tb = true;
         }
         /* Using mprotect on a page does not change sticky bits. */
         p->flags = (reset ? 0 : p->flags & PAGE_STICKY) | flags;
     }
+
+    if (inval_tb) {
+        tb_invalidate_phys_range(start, end);
+    }
 }
 
 void page_reset_target_data(target_ulong start, target_ulong end)
-- 
2.34.1


