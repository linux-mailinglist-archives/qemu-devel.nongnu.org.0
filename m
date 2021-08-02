Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C553DDD64
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:17:58 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAadZ-0003n0-6H
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabW-0000xS-8q
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:52 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:42675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabU-0006rn-DM
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:50 -0400
Received: by mail-ed1-x52a.google.com with SMTP id p21so25224336edi.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0w/cTVHey5w4upyorSaSfdFgQW9Muy6hj86ofEeuDqQ=;
 b=sVK3JG2FVmLMB/f2Jh1qR0u7DAJF4te5zjcieIxJYwqZBHIhWQiC5IUCK2DiGy7sls
 Q8bJ1P3MoOIxOpOxlKEZKAE70obzFaAB8UUxD1HDu83JJPC8Wx7dOE9bgaWdxo0tKzmX
 iCixOlf5zVsKQYRmr3jQINlXsJzgm4ge9ZWop5O6LPGW5mvF1K18FNro11u2jdFF+K08
 a3reLkL20tZb2u8Qk06rIoKBV0bwAcaAuFL9yHu735EF2NWSb+Yl3Y076HGEXCurO2Wq
 HxGn0Zlt+1RkTM+ldt7NPQtCgfNqMYQ9latffJeVwYSMaU9vxGL88yV7JR4I7PXckQcv
 Tttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0w/cTVHey5w4upyorSaSfdFgQW9Muy6hj86ofEeuDqQ=;
 b=WA1RgOomk8p9+ukilbDGUoFYgAuOPJfnTdWaLzWB3z8cQmdWffRTisNhl4NO5ToDw3
 18avcVv1MSKPyzNWsG7RjisDBXggKDeCr35lW7oGL7TYLEJDcXKkxIJ8J28n/erkcszj
 1EBmf3NHe6RVyyuMwYBSwpWBTVD5kuGxlBM+CDAI4L8ioKtz+1cAwNvX9qd11uXP2gli
 XWxGN4KOBor+UfboEP7M72FYXLJPAthA//NNMZOG3lWehvNYn5Y392CepAPl1099p0DR
 ZSMjx5i3BZssmlJR59F1WBJ4zRazvtMzZ2gqCAf5x1LR0Hej6delj1yUXMmrQWoTVdjv
 l9Ig==
X-Gm-Message-State: AOAM533oGrHfak6nxqsQBbZpDv7lh2CcMampuP3eyadX9vPLUQC7AuCx
 B1LtqvZrArj8KIz0s7BCFcoSB2rS7EGyaQ==
X-Google-Smtp-Source: ABdhPJxMWs/CurdePUXBjuRIdIBiaDHIdqL0QBETRWF36zsLUKsQMoUyUraqdhmy0SzO0qCFTfSslw==
X-Received: by 2002:a05:6402:648:: with SMTP id
 u8mr14097821edx.162.1627920947210; 
 Mon, 02 Aug 2021 09:15:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm4835144ejb.125.2021.08.02.09.15.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:15:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] coverity-model: clean up the models for array allocation
 functions
Date: Mon,  2 Aug 2021 18:15:40 +0200
Message-Id: <20210802161542.381976-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802161542.381976-1-pbonzini@redhat.com>
References: <20210802161542.381976-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



