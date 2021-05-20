Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA1038AADE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:17:57 +0200 (CEST)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgge-0004Vu-Oi
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYx-0000CK-2y
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYu-0004as-2j
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621508995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fXNvsUG+9jJQpscb+R8eaH4L2n3MJcy4IDVc87G545A=;
 b=ddUPxr98ala7hn0IhUBj0LEsOb2gMEhFjlOu7aanjQGMdm+5Nh39GiGcUGv2xFkTqkFHRc
 +YQoVbZ3WS3Wn6MFB8KZ4J4mWC1Dle4z2xDyyUstPJe4MJfA+bPd8KAcVcq/PrPNEY3MW/
 1UKOTKUoH/tS9L+eSgmBAbudQKZ0Yws=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-cUvMqT6cOeiFo4Iep1Asyg-1; Thu, 20 May 2021 07:09:54 -0400
X-MC-Unique: cUvMqT6cOeiFo4Iep1Asyg-1
Received: by mail-wr1-f71.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso8501938wre.8
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fXNvsUG+9jJQpscb+R8eaH4L2n3MJcy4IDVc87G545A=;
 b=AQ7tFjwUKDpuc1+qLY6/nFS9fXpYLDhOkBhBPjgHCQQSs9pit6IjkgxkzJvEBrAUqH
 jBlpvk02o2FPzMU1fH8RCMzU1H49cnTMdCwCTYkLxbLWcer7QQAp6GtR+E3PkHlesKUe
 ZUzKm2hK1ocf3ku2nNpRxThwSpVnL2jGE9U60ELx9ryUetYMo4w1nzIZ2v1tDWOtcKBk
 3ebnR+/ptR+eiiwz9d6bba9e9/b15daPzlRbNSU5ShAnLFpD/5GOiy+C/8GAfnSVgdCq
 WUMS6KVC1IXapcsaG2v/vSgdX3rkdZZyu3/M2N4cXIC2bn9vQAq91H+qKbM6sdWWklDV
 8uMA==
X-Gm-Message-State: AOAM5331i6/aCI4R156zrlftenobyT8kCOOQM4Jc4U2GSRt57CxcBhmp
 utyKnXPiitlhXjlCeCUSaFXZa0S9MdQGKLUre3QEylceYUzJ7R8PYYPzHjwhli7BKtEfJEaTHmC
 9YXtQnUDdqUnu3lm6QDoiaPuROsPZTQi7mnRDvVlbi5QgdKfk+Drm3m+GKHlbjvHa
X-Received: by 2002:adf:b64b:: with SMTP id i11mr3726391wre.157.1621508992758; 
 Thu, 20 May 2021 04:09:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTd7krMeYhURd9rrzhSkonYF7s2c7PAIqcYV+Pz2bB20+DP+TDoCedf1y+fERUFDwyh3WMFw==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr3726360wre.157.1621508992578; 
 Thu, 20 May 2021 04:09:52 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id l14sm2981326wrv.94.2021.05.20.04.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:09:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/12] exec/memory_ldst_cached: Document aligned addresses
 are expected
Date: Thu, 20 May 2021 13:09:14 +0200
Message-Id: <20210520110919.2483190-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210520110919.2483190-1-philmd@redhat.com>
References: <20210520110919.2483190-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory_ldst_cached.h.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index a8f146251d4..515beb48f47 100644
--- a/include/exec/memory_ldst_cached.h.inc
+++ b/include/exec/memory_ldst_cached.h.inc
@@ -24,6 +24,7 @@
 #define LD_P(size) \
     glue(glue(ld, size), glue(ENDIANNESS, _p))
 
+/* warning: addr must be aligned */
 static inline uint16_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
@@ -39,6 +40,7 @@ static inline uint16_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
     }
 }
 
+/* warning: addr must be aligned */
 static inline uint32_t ADDRESS_SPACE_LD_CACHED(l)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
@@ -54,6 +56,7 @@ static inline uint32_t ADDRESS_SPACE_LD_CACHED(l)(MemoryRegionCache *cache,
     }
 }
 
+/* warning: addr must be aligned */
 static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
@@ -80,6 +83,7 @@ static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
 #define ST_P(size) \
     glue(glue(st, size), glue(ENDIANNESS, _p))
 
+/* warning: addr must be aligned */
 static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
     hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
@@ -94,6 +98,7 @@ static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
     }
 }
 
+/* warning: addr must be aligned */
 static inline void ADDRESS_SPACE_ST_CACHED(l)(MemoryRegionCache *cache,
     hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
 {
@@ -108,6 +113,7 @@ static inline void ADDRESS_SPACE_ST_CACHED(l)(MemoryRegionCache *cache,
     }
 }
 
+/* warning: addr must be aligned */
 static inline void ADDRESS_SPACE_ST_CACHED(q)(MemoryRegionCache *cache,
     hwaddr addr, uint64_t val, MemTxAttrs attrs, MemTxResult *result)
 {
-- 
2.26.3


