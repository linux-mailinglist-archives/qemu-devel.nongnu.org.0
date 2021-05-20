Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D598038AAA5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:15:17 +0200 (CEST)
Received: from localhost ([::1]:47610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljge4-0008Vm-RI
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYv-00005B-Dc
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYs-0004ad-FI
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621508993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tQhRr1d+vMSeLXHOF3EqT8MC2o1YqDGEA5IrzwoyL/A=;
 b=BIEtd2LKtNF1xzEoqejpLq884xStnEp9GjuzIPMqfnPysivvTNJi+k37yJjg7fbvtXVp09
 mTEVumSe0+64g9zDTUon8BVtJ2E2C7y6bBn0B1PtNxRQ9FmY+jMxTkX4vvoVi2IyRDJqeF
 0e0ioQLJ7FpLCvODEaybO7SN8eyUp5Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-kUOxFY_HM6uVngaDyZVC_Q-1; Thu, 20 May 2021 07:09:49 -0400
X-MC-Unique: kUOxFY_HM6uVngaDyZVC_Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 k124-20020a1ca1820000b0290175dd5429afso2190129wme.7
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tQhRr1d+vMSeLXHOF3EqT8MC2o1YqDGEA5IrzwoyL/A=;
 b=mO6ljzIO+IxO40HPk2xyc05My48q7m4BL+oGY718kpgqc+N9G8aHSAOSo/CTFLCshA
 xQTo4ssg2TzPjbHgy1pU9IFo13/N5bTogF7aLVAySDneVEVrz+jz7/hsSCY4YVO34Cts
 BbH6naa4P+qgNv7Cg5S3vjOpW1oXrKVPGGmt9biA0Ez+r3ssXkeT+6HlAB52nM0ZvRST
 yij/3hgKpFLzCZFnkTUTU1MZumrKCobFp9nfoqBvll+49c+EkCnfymzgQ0CcLeMgAqRG
 UKgXyW/9FZgN2C+csIMJzzNGLlID4dlKzJhhM7kFW+IMKyyrHrWkHz9og6rv1/DKXnrA
 LICQ==
X-Gm-Message-State: AOAM531fCFt1VRx2CBn5NTrSQOfdbwd1e47Cflm+PXlrz+2VLeES6Asd
 wiDsV5McwGyUlun0TeiMq7QYmeMuuo+5Y3TnyauKIrUYzKxtUX5pZwtCtf3peQDdqIISwCfD2uJ
 PqxljLGiucNVJ/8A5wVLVC+pzlnCSnNEwTN4mO3YCK0jPlnsyB9yaurvmDhRn6MgC
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr3770271wri.260.1621508988336; 
 Thu, 20 May 2021 04:09:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvmtUkJ6f+dcEKHN9qasYVs6lq5BJbUSp5Zjup/3gB/YtMpl/W8Zp2YdMNfPqKFTtDG3y7Zw==
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr3770245wri.260.1621508988100; 
 Thu, 20 May 2021 04:09:48 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m20sm3826907wmi.5.2021.05.20.04.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:09:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/12] exec/memory_ldst_cached: Set MemTxResult on success
Date: Thu, 20 May 2021 13:09:13 +0200
Message-Id: <20210520110919.2483190-7-philmd@redhat.com>
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

If the caller passed a MemTxResult argument, we must fill
it with the transaction result. We do it when no cache is
present, complete the other case (which is always successful).

Fixes: 48564041a73 ("exec: reintroduce MemoryRegion caching")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory_ldst_cached.h.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index d7834f852c4..a8f146251d4 100644
--- a/include/exec/memory_ldst_cached.h.inc
+++ b/include/exec/memory_ldst_cached.h.inc
@@ -30,6 +30,9 @@ static inline uint16_t ADDRESS_SPACE_LD_CACHED(uw)(MemoryRegionCache *cache,
     assert(addr < cache->len && 2 <= cache->len - addr);
     fuzz_dma_read_cb(cache->xlat + addr, 2, cache->mrs.mr);
     if (likely(cache->ptr)) {
+        if (result) {
+            *result = MEMTX_OK;
+        }
         return LD_P(uw)(cache->ptr + addr);
     } else {
         return ADDRESS_SPACE_LD_CACHED_SLOW(uw)(cache, addr, attrs, result);
@@ -42,6 +45,9 @@ static inline uint32_t ADDRESS_SPACE_LD_CACHED(l)(MemoryRegionCache *cache,
     assert(addr < cache->len && 4 <= cache->len - addr);
     fuzz_dma_read_cb(cache->xlat + addr, 4, cache->mrs.mr);
     if (likely(cache->ptr)) {
+        if (result) {
+            *result = MEMTX_OK;
+        }
         return LD_P(l)(cache->ptr + addr);
     } else {
         return ADDRESS_SPACE_LD_CACHED_SLOW(l)(cache, addr, attrs, result);
@@ -54,6 +60,9 @@ static inline uint64_t ADDRESS_SPACE_LD_CACHED(q)(MemoryRegionCache *cache,
     assert(addr < cache->len && 8 <= cache->len - addr);
     fuzz_dma_read_cb(cache->xlat + addr, 8, cache->mrs.mr);
     if (likely(cache->ptr)) {
+        if (result) {
+            *result = MEMTX_OK;
+        }
         return LD_P(q)(cache->ptr + addr);
     } else {
         return ADDRESS_SPACE_LD_CACHED_SLOW(q)(cache, addr, attrs, result);
@@ -76,6 +85,9 @@ static inline void ADDRESS_SPACE_ST_CACHED(w)(MemoryRegionCache *cache,
 {
     assert(addr < cache->len && 2 <= cache->len - addr);
     if (likely(cache->ptr)) {
+        if (result) {
+            *result = MEMTX_OK;
+        }
         ST_P(w)(cache->ptr + addr, val);
     } else {
         ADDRESS_SPACE_ST_CACHED_SLOW(w)(cache, addr, val, attrs, result);
@@ -87,6 +99,9 @@ static inline void ADDRESS_SPACE_ST_CACHED(l)(MemoryRegionCache *cache,
 {
     assert(addr < cache->len && 4 <= cache->len - addr);
     if (likely(cache->ptr)) {
+        if (result) {
+            *result = MEMTX_OK;
+        }
         ST_P(l)(cache->ptr + addr, val);
     } else {
         ADDRESS_SPACE_ST_CACHED_SLOW(l)(cache, addr, val, attrs, result);
@@ -98,6 +113,9 @@ static inline void ADDRESS_SPACE_ST_CACHED(q)(MemoryRegionCache *cache,
 {
     assert(addr < cache->len && 8 <= cache->len - addr);
     if (likely(cache->ptr)) {
+        if (result) {
+            *result = MEMTX_OK;
+        }
         ST_P(q)(cache->ptr + addr, val);
     } else {
         ADDRESS_SPACE_ST_CACHED_SLOW(q)(cache, addr, val, attrs, result);
-- 
2.26.3


