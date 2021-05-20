Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA1638AA47
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:12:29 +0200 (CEST)
Received: from localhost ([::1]:39132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgbM-0002pf-Dp
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYp-0008LI-QN
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYl-0004Yw-HO
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621508986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2KMRus6wjZmSwZp3NDF0wx5q7DfpOUE+gwTHQ1DOIM=;
 b=OvIwjHtx16e8o68pBJiP26jflzS1gTmo9sXfwL2lBisbG0aEBIney1fmpC2fBBILBrJH+j
 yiQIEaOFJO5Mns+it5UNRPUSjR67BRvUUkq+0D6O3UOutxVFZAUjkg0E81gjTpYsKEapVb
 IWBDNjjMnthhQ2vCs9/fxuZt0qYQyZg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-0iqnPVf-OxGDd7W_SzKpBA-1; Thu, 20 May 2021 07:09:45 -0400
X-MC-Unique: 0iqnPVf-OxGDd7W_SzKpBA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u20-20020a0560001614b02901115c8f2d89so8415973wrb.3
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z2KMRus6wjZmSwZp3NDF0wx5q7DfpOUE+gwTHQ1DOIM=;
 b=dqjbyIzo+tG0pcS3mEbZD2AmcgixEw39dE6/8BN/Y4jQ2Tpl1P+OUN3YpK9dJ2xy8X
 jKO7CYMX9YVPdyXFw40A9gdMYZT4t3I3KAAX/HHYQ2w5J+C6WhiTcqRaEsTHmW2ZGn8/
 KSnAXL/Eg9DpqrAL7aGYORVuhz5REbMP1kAuH5S0R6D98nehyhsdl3qJkLslAjoHlCLc
 08qsam7i7pQXQtuwnU0SEgbRnnKMzyLRRLDnMNGJ7+iavkVeAewYeHWrjmeC6gFs7HLt
 9NS1wFqXQlRhoCayVp44P+nVTTRExZcKz31yfNQGXFYNKzMs2AHoRo430KSqiHx13AFN
 mDtg==
X-Gm-Message-State: AOAM53056JPSnp2K3SwspygeDQs1Zplq0Fpe/jROYEee1IMmx114mZNs
 J+8aqjRb9o6Yb3qCx65xwhqbqfn1g10edOvj6Uvc6YpQqTOFVj8Q5ztJmB8KiLLJSXyXRL7YSXV
 p2VO5ns6cy4DrHoDSd17HI74FpNtq2TJTrI660g/zzCj3/nX7BCpCg1mReE6HLzzP
X-Received: by 2002:a1c:e912:: with SMTP id q18mr3537325wmc.59.1621508983718; 
 Thu, 20 May 2021 04:09:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLhOJKw0e+IS+8hJ9Mbrivf9UaERQte7v+dmAjQJHYAmlB2Ck2m5Gb2a36fs4CI+wOqsTQwA==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr3537300wmc.59.1621508983572; 
 Thu, 20 May 2021 04:09:43 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id f202sm1290316wmf.14.2021.05.20.04.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:09:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 05/12] exec/memory_ldst_cached: Use correct type size
Date: Thu, 20 May 2021 13:09:12 +0200
Message-Id: <20210520110919.2483190-6-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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

Use uint16_t for (unsigned) 16-bit word.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory_ldst_cached.h.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index c33449d0cd5..d7834f852c4 100644
--- a/include/exec/memory_ldst_cached.h.inc
+++ b/include/exec/memory_ldst_cached.h.inc
@@ -24,7 +24,7 @@
 #define LD_P(size) \
     glue(glue(ld, size), glue(ENDIANNESS, _p))
 
-static inline uint32_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
+static inline uint16_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
     hwaddr addr, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 2 <= cache->len - addr);
@@ -72,7 +72,7 @@ static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
     glue(glue(st, size), glue(ENDIANNESS, _p))
 
 static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
-    hwaddr addr, uint32_t val, MemTxAttrs attrs, MemTxResult *result)
+    hwaddr addr, uint16_t val, MemTxAttrs attrs, MemTxResult *result)
 {
     assert(addr < cache->len && 2 <= cache->len - addr);
     if (likely(cache->ptr)) {
-- 
2.26.3


