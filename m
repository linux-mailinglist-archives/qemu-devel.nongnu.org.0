Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D3A3DC3F9
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 08:31:20 +0200 (CEST)
Received: from localhost ([::1]:34364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9iWl-0003s9-83
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 02:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTN-000538-0M
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:49 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTL-0001GZ-Bi
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:48 -0400
Received: by mail-ej1-x631.google.com with SMTP id hw6so6970706ejc.10
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 23:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0w/cTVHey5w4upyorSaSfdFgQW9Muy6hj86ofEeuDqQ=;
 b=t4TKSLmPd926Yl+5Mbtvq+YoN90n0oEYRfOhI5ZNkkLoaW+NfjXKBGKjFN1fsdQEE6
 jdpgpdjAP0uug2wWvHyExmJyLkguGJe1q8IZOOEiYiOdRNddpVCZp4o7k7j+BRDccX6J
 arlyRogGRagDvrI/mNtvGNb6q5mqNaxojBdy9BqRdldStTqywfC0fR5D0Ue6d0jXLORp
 tzfcueUYxtzJzP3pyY76pvN5Zt9w0ZiLK9SvpT39cYl4puVYgGdIG8fHq38L9J12P+TB
 kElaqBZZiTm3nB14TF0Q5ONaKi0U2U9y05AdbH4Wh0sIJZhkg2UMcwtfJxLugOhhWfL3
 LxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0w/cTVHey5w4upyorSaSfdFgQW9Muy6hj86ofEeuDqQ=;
 b=WRuVIiEv4Ae+LVB1Dph3PP5qqJg0lS/ItfKmy6rGVwlutHivpbOxfhrqh9yThaZ9Bv
 qppZRuR5Ymcax2p4Z8CIVZdFBwCYLPwG4fOV041Uy63tSSIUdmnZF5JUJfbeAe/I9MS8
 VUv+IaakNSDzfXVT+zPQrS3n77ub4OKJHbAEHEFkvua5supk/vU666uaMLB3CZIoRxCl
 du5JvNzSLG3xPRsIDHk+3JBGAURmSvJsPNHBFBvgE5AM2kBqUvDcy+hIIpuWqqaGlaMg
 ZiThTxzpBSfLChsHro6uOIhO7DznJmYOSIUtY0aQk4M+c+gNTTFcoUyxU1Vvwx7G9pya
 RZNw==
X-Gm-Message-State: AOAM532y6Goy5dp3MsCOIScJxsZvCiGT6DwkcGfBOECUhHVnZvZ36m+n
 fd3PjK1MPDR3r8vPBTmCuBeidAbfxhcAfg==
X-Google-Smtp-Source: ABdhPJyvdxWSrom7kQkHaXN/hjlXeSQj1P15/sSEYHrrx1SFeOAm/bH4LEQmZkAzvTlyprdW0ha34Q==
X-Received: by 2002:a17:907:1b29:: with SMTP id
 mp41mr6274853ejc.459.1627712865934; 
 Fri, 30 Jul 2021 23:27:45 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 b25sm1766116edv.9.2021.07.30.23.27.45 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 23:27:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] coverity-model: clean up the models for array allocation
 functions
Date: Sat, 31 Jul 2021 08:27:39 +0200
Message-Id: <20210731062741.301102-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731062741.301102-1-pbonzini@redhat.com>
References: <20210731062741.301102-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sz is only used in one place, so replace it with nmemb * size in
that one place.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/model.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 1a5f39d2ae..2d384bdd79 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -178,13 +178,11 @@ uint8_t replay_get_byte(void)
 
 void *g_malloc_n(size_t nmemb, size_t size)
 {
-    size_t sz;
     void *ptr;
 
     __coverity_negative_sink__(nmemb);
     __coverity_negative_sink__(size);
-    sz = nmemb * size;
-    ptr = __coverity_alloc__(sz);
+    ptr = __coverity_alloc__(nmemb * size);
     __coverity_mark_as_uninitialized_buffer__(ptr);
     __coverity_mark_as_afm_allocated__(ptr, AFM_free);
     return ptr;
@@ -192,13 +190,11 @@ void *g_malloc_n(size_t nmemb, size_t size)
 
 void *g_malloc0_n(size_t nmemb, size_t size)
 {
-    size_t sz;
     void *ptr;
 
     __coverity_negative_sink__(nmemb);
     __coverity_negative_sink__(size);
-    sz = nmemb * size;
-    ptr = __coverity_alloc__(sz);
+    ptr = __coverity_alloc__(nmemb * size);
     __coverity_writeall0__(ptr);
     __coverity_mark_as_afm_allocated__(ptr, AFM_free);
     return ptr;
@@ -206,13 +202,10 @@ void *g_malloc0_n(size_t nmemb, size_t size)
 
 void *g_realloc_n(void *ptr, size_t nmemb, size_t size)
 {
-    size_t sz;
-
     __coverity_negative_sink__(nmemb);
     __coverity_negative_sink__(size);
-    sz = nmemb * size;
     __coverity_escape__(ptr);
-    ptr = __coverity_alloc__(sz);
+    ptr = __coverity_alloc__(nmemb * size);
     /*
      * Memory beyond the old size isn't actually initialized.  Can't
      * model that.  See Coverity's realloc() model
-- 
2.31.1



