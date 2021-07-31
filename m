Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06473DC3FA
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 08:31:43 +0200 (CEST)
Received: from localhost ([::1]:34654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9iX7-00044H-4o
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 02:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTP-0005BZ-Qs
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:51 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m9iTM-0001Ht-0E
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:27:51 -0400
Received: by mail-ed1-x52a.google.com with SMTP id v20so2399023eda.1
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 23:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KB5cV0NikdfkiBGJyhuIIvWdyJWHTJa73ThUZLg8tio=;
 b=Y7I+0QnVPkmknxFVdPIFcPf93SllDI7mdllk22cI7Ifd7YI8Xohkb1eOxXh9Y5XaOt
 1y8jhjFviV2e2qT/2+2w7y2OnohzZ8dNSVAl/oRw8AMiobh+jT33/YbcaMG9pkD77dQX
 oiEbdgJPwj8C3Rhc4czItqhcOMDKxxCRMbvOOOvdTlw6Fd2KcEW/kOwviaCQd7PjhZFP
 NM/DdZkY4ylomOpxDSWOLqhk7uluK6NT4DMUD9uFq/e7feNIx84FWF5Sfu4fkFC2Ktbs
 bkTBimHxzuYf/RcKAQBaKvDz1xuGMzvuVi4QkD5r/O0HGdCe4+ZcLCADjUE7Tzm8hkrq
 EMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KB5cV0NikdfkiBGJyhuIIvWdyJWHTJa73ThUZLg8tio=;
 b=Svnkj136cAKOZlykuB9ErFg4Dn/wCySQ9QbgDzzCoYf1F4o1jiAT2oiv+sQ2O7If3u
 aEGfErL9EINxgq+apCmmETncopaMaEv4qEBuxgEDMp87WPzg7L2p0neFsfyQLzdc7a7G
 0eYs9WXkuoaMawkSgmlNNo5BySza0ZB7qWQv2kDIlrJiTOebhkebjSt5Wg7DGYJx61FN
 ZaAeRWvikIzN8p3qON/cIW60RlAaoG09CcgTq19Ku0XYrhMSO2JGNCEW+WH/trLv5hiG
 xRSftJASY5G6kT+IqxTBN7vi8LVr76zSqZyzvsdbu4OpGIEqEAaRUNQYnU8DKoW+nBYh
 lgTg==
X-Gm-Message-State: AOAM530KM/yQT6yXP98mMHhF7PW57kCjSqojT2yYOlP6LYoYi0RERHCk
 13sVN8B8MRRZ27e7PLbnDIkoPSFfxMgWtw==
X-Google-Smtp-Source: ABdhPJyf44RC0IAsj1PZNY3s4b0lGtAiJ9IMczpEhfwXOTzxQLtolzXYo6GXvCGT3z1Tnpx8ZJvpew==
X-Received: by 2002:a50:f1d8:: with SMTP id y24mr7520047edl.275.1627712866717; 
 Fri, 30 Jul 2021 23:27:46 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 b25sm1766116edv.9.2021.07.30.23.27.46 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 23:27:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] coverity-model: constrain g_malloc/g_malloc0/g_realloc as
 never returning NULL
Date: Sat, 31 Jul 2021 08:27:40 +0200
Message-Id: <20210731062741.301102-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731062741.301102-1-pbonzini@redhat.com>
References: <20210731062741.301102-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
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

g_malloc/g_malloc0/g_realloc only return NULL if the size is 0; we do not need
to cover that in the model, and so far have expected __coverity_alloc__
to model a non-NULL return value.  But that apparently does not work
anymore, so add some extra conditionals that invoke __coverity_panic__
for NULL pointers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/model.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 2d384bdd79..028f13e9e3 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -183,6 +183,9 @@ void *g_malloc_n(size_t nmemb, size_t size)
     __coverity_negative_sink__(nmemb);
     __coverity_negative_sink__(size);
     ptr = __coverity_alloc__(nmemb * size);
+    if (!ptr) {
+        __coverity_panic__();
+    }
     __coverity_mark_as_uninitialized_buffer__(ptr);
     __coverity_mark_as_afm_allocated__(ptr, AFM_free);
     return ptr;
@@ -195,6 +198,9 @@ void *g_malloc0_n(size_t nmemb, size_t size)
     __coverity_negative_sink__(nmemb);
     __coverity_negative_sink__(size);
     ptr = __coverity_alloc__(nmemb * size);
+    if (!ptr) {
+        __coverity_panic__();
+    }
     __coverity_writeall0__(ptr);
     __coverity_mark_as_afm_allocated__(ptr, AFM_free);
     return ptr;
@@ -206,6 +212,9 @@ void *g_realloc_n(void *ptr, size_t nmemb, size_t size)
     __coverity_negative_sink__(size);
     __coverity_escape__(ptr);
     ptr = __coverity_alloc__(nmemb * size);
+    if (!ptr) {
+        __coverity_panic__();
+    }
     /*
      * Memory beyond the old size isn't actually initialized.  Can't
      * model that.  See Coverity's realloc() model
-- 
2.31.1



