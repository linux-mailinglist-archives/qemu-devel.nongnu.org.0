Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED42414118
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 07:10:25 +0200 (CEST)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuWW-00029q-QA
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 01:10:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mSuPp-0002AA-UD
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 01:03:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mSuPo-00050j-Be
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 01:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632287007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izSWGRonVb5nbyzyHD9vbKGppoNzPOJNnTbMh5f0KKY=;
 b=EbkA9rM3qDxxjYIuI/Ga34u8v15VrWbAQ9aG9qUC98ed9UI4KfqMTqfBKaoJZtV4flPxpK
 Sd18fo4vLmRcykqy6rv9QIECGXhWJePVmbEpOtJ+R3P/YL6Qe+mLOmSb+OesRqnu2NPXQf
 fEH8XCo8TI/4QJKf/BbSYe84bWiQ4Ns=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-PG6KAhYHMn64s2NPqslgtA-1; Wed, 22 Sep 2021 01:03:26 -0400
X-MC-Unique: PG6KAhYHMn64s2NPqslgtA-1
Received: by mail-qk1-f200.google.com with SMTP id
 ay30-20020a05620a179e00b00433294fbf97so7897921qkb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 22:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=izSWGRonVb5nbyzyHD9vbKGppoNzPOJNnTbMh5f0KKY=;
 b=vJ7q0FHB0vDj3dZVX5EbDyA+ZnJAfD4SljaKRG4aniOtLLBOqQlhTzRDc5GutkpVP5
 XPKuW43BRvnBYfC7jKRd+7TXTkGdzfp/+Jv29UZy0YClFlq09TM3/w0jExDOW+cAZsOQ
 BJVIGsybKZUPd93Vv8dSU5/9URoG2KrcdSRPII0vP0lDoxq9Plv4jfVSlg4KUlIiAdyY
 6l4BzYc/JlBAcPSc0Hvhft8TjQ17Cgce5j0RcvkmjnaH3hbrDqT2Wwz1O5XpfL09Zr5W
 ZRYKtWQD24Ug7BCz2MHxsoQflDtZpH16mnYgBkgy0GMVVGFaYJkcwEgEYHFqPfmtyYJr
 HEEA==
X-Gm-Message-State: AOAM530xAcf04DJfzflYC3qSqAIbzCuhk8X93RW2W3rL2IA1yi+yv9Nq
 qxea3SD/tuA9qwddrl9wl+U+zsJJlrywcXW7xMGBsHmk+KIrxakBiAaIDaZtryMcHy9DZ3oTd80
 Q61BJrE6PEh6EZXU=
X-Received: by 2002:a37:a897:: with SMTP id r145mr15205959qke.16.1632287005969; 
 Tue, 21 Sep 2021 22:03:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjxggS9fVibLKy2hRD6prdPC/6AVsWh6Ak0oQJow5UWctnE5H9aRGIXuA/P6GTzdTmM9YQwg==
X-Received: by 2002:a37:a897:: with SMTP id r145mr15205941qke.16.1632287005800; 
 Tue, 21 Sep 2021 22:03:25 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:e5d7:bbae:108a:d2ca:1c18])
 by smtp.gmail.com with ESMTPSA id q192sm926675qka.93.2021.09.21.22.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 22:03:25 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 3/3] multifd: Send using asynchronous write on nocomp to
 send RAM pages.
Date: Wed, 22 Sep 2021 02:03:40 -0300
Message-Id: <20210922050340.614781-4-leobras@redhat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922050340.614781-1-leobras@redhat.com>
References: <20210922050340.614781-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change multifd nocomp version to use asynchronous write for RAM pages, and
benefit of MSG_ZEROCOPY when it's available.

The asynchronous flush happens on cleanup only, before destroying the QIOChannel.

This will work fine on RAM migration because the RAM pages are not usually freed,
and there is no problem on changing the pages content between async_send() and
the actual sending of the buffer, because this change will dirty the page and
cause it to be re-sent on a next iteration anyway.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 377da78f5b..d247207a0a 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -105,7 +105,7 @@ static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
  */
 static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
+    return qio_channel_async_writev_all(p->c, p->pages->iov, used, errp);
 }
 
 /**
@@ -546,6 +546,7 @@ void multifd_save_cleanup(void)
         MultiFDSendParams *p = &multifd_send_state->params[i];
         Error *local_err = NULL;
 
+        qio_channel_async_flush(p->c, NULL);
         socket_send_channel_destroy(p->c);
         p->c = NULL;
         qemu_mutex_destroy(&p->mutex);
-- 
2.33.0


