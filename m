Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CA5387FEF
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 20:51:22 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj4oL-0001PW-Jq
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 14:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bu-00031Z-CH
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj4bo-0000AO-5x
 for qemu-devel@nongnu.org; Tue, 18 May 2021 14:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621363101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqYM/7O26sE43anlCu8uHsOrRtDjTSh1fZivMot9f2U=;
 b=hygKs72GyHe4A0uw2QGiECLltTaTVn0wFYZVIu6tG6+cLKTr1aFhiypmrPWzzdCBTUBoFm
 tTa/BMLiySrHKi2w7kt4gDlY7YCUvqlb2+ZewAj5ocL77HrzNTQ90L7QRMJn86tiD6lQGr
 rglH3TgJlBwJ7SexHPQuVecQG6wZXzI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-wPu36B7KPHWNyDbdoP1ccg-1; Tue, 18 May 2021 14:38:19 -0400
X-MC-Unique: wPu36B7KPHWNyDbdoP1ccg-1
Received: by mail-ed1-f69.google.com with SMTP id
 v18-20020a0564023492b029038d5ad7c8a8so1286358edc.11
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 11:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qqYM/7O26sE43anlCu8uHsOrRtDjTSh1fZivMot9f2U=;
 b=YIHnhZS5Eapn+GblrqI8hcnPkY8jupF9trLbhjAd+lA0nr/sGueQ8y6mLvhD2fipF0
 cwKU/Jcl4KllH4isXpE9DZo9SfseKgPW8qBQtzHg1XYeYAZ7u8/3YYadW3uMtYlo43W5
 iam7+8Oepa7lUlTWLYTytnNvR8i65Oxx3GPuJOmjGo2ABX9embV5FIuTDjl8NC8DAMyO
 JazlO4R/tuPzI0rxF0HKq/uUGtNavy51ozGhuDpdsV1jKLJBcHvBS5HPc5yUh5y5cpr4
 abOhf8EsqG2MyBAzcAHz+MsA689bbyK+LinTNY1BQ7hTo70oFLVYAhW026V6YV6b5yak
 W/TA==
X-Gm-Message-State: AOAM530KRuF8sswXwg2cI9SSQOGLIqwkMQyLufHmWHKWOzy8YksNM6EA
 s8JE48ps8tZEpIyYK2mDQjZOWQ+fnx0yxtg2uDfwp7zs9pXtIZhOAm7AUN2tPtgTs8BLNXLx/mI
 Jgakwu2g0SwPSS6woGru/xEp3gzmXkaNpdmLFA/SVCDW67JxA87sysHwrS2AkdCOF
X-Received: by 2002:a17:906:6c96:: with SMTP id
 s22mr7583202ejr.468.1621363098356; 
 Tue, 18 May 2021 11:38:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvH82nxBgFJavZyhFjeAm/jhHskgo7jepWzdvR3sz8IDH4v59U8/quTmPbVhYd9OV3TwnvlQ==
X-Received: by 2002:a17:906:6c96:: with SMTP id
 s22mr7583186ejr.468.1621363098151; 
 Tue, 18 May 2021 11:38:18 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k22sm1498256ejz.108.2021.05.18.11.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 11:38:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 16/25] exec/memory: Add methods for aligned pointer access
 (physical memory)
Date: Tue, 18 May 2021 20:36:46 +0200
Message-Id: <20210518183655.1711377-17-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518183655.1711377-1-philmd@redhat.com>
References: <20210518183655.1711377-1-philmd@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 7eeabbceef3..28c0e68e7d8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2337,6 +2337,11 @@ static inline void address_space_stb_cached(MemoryRegionCache *cache,
 #define ARG1_DECL    MemoryRegionCache *cache
 #include "exec/memory_ldst_phys.h.inc"
 
+#define SUFFIX       _cached_aligned
+#define ARG1         cache
+#define ARG1_DECL    MemoryRegionCache *cache
+#include "exec/memory_ldst_phys.h.inc"
+
 /* address_space_cache_init: prepare for repeated access to a physical
  * memory region
  *
-- 
2.26.3


