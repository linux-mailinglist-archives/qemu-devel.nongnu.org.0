Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB8041536F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 00:28:17 +0200 (CEST)
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTAiu-0003Ku-K6
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 18:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mTAf8-0007S6-TI
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 18:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1mTAf3-0000hM-Ke
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 18:24:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632349456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=izSWGRonVb5nbyzyHD9vbKGppoNzPOJNnTbMh5f0KKY=;
 b=hpSZRCkk0EG/mDJGXy9LMy8/6tWRHVOmLJyEJeDzAvDOfygiU32pw8mDEJmx0/tp3hcCb9
 q+u2fnbIZghn9TTUcNBbxS2wLZmPD2rOMGj1OdVSJzoyAQEWShFfFtke6Xlg+kHKgV6e7z
 GrAn7eoGWGfI1GOtNhguCtsGlhN4IDo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-G_U_SM1oNR-yiezl9TJzow-1; Wed, 22 Sep 2021 18:24:15 -0400
X-MC-Unique: G_U_SM1oNR-yiezl9TJzow-1
Received: by mail-qv1-f69.google.com with SMTP id
 h18-20020ad446f2000000b0037a7b48ba05so14175948qvw.19
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 15:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=izSWGRonVb5nbyzyHD9vbKGppoNzPOJNnTbMh5f0KKY=;
 b=ym+dEa7QcY6qWYKxn42TUMLuUayfJAMfs2E/QiO2t7Bo7YWav8oNDVYoNf0yDCnbHp
 qpaToE+CTAdW1c0nuvCPeLIDKOO2CNPQQ7TVlWkQKcUE9P2DeGfg4fSnTqFcwm8XP/oB
 1JJaptxIEt67RyS3q4dWBlz3EsB84c1PIOX0vMjeyxM7FMMAolcsc2CLKObEytI/EyMS
 dNnMj9fWcLl8UQNim77L8odgx3rMa1mfM4HZT4dhB58k28B0A4PwO2l5TYyhMHdgkLPR
 QTn7ReieHwsRecYhCT13oskf5u0NHBiMSSDtPX+ieLepJUCWk80LJdEHQcyaCYXOV86q
 jd9A==
X-Gm-Message-State: AOAM532zvB9+acKbPQKzfN+B0gGqQVOezyQICXwDGV20nBjtvKXHqwF1
 Tn+R7JmZozh55mElJWkXHlYvN59Y2/ikZvR9gD2dNzxtvHFqYpVfWjxnksogS1BaAT7t4oAgWK6
 OQBRNom2+wIf8GsY=
X-Received: by 2002:ac8:3b51:: with SMTP id r17mr1746360qtf.139.1632349454927; 
 Wed, 22 Sep 2021 15:24:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2oz5a8RdM08wiaYtYNJs3E3UuSbFl6ISN0B5q3LTYb39Vhu1s4t6kVOAeLCy0Sw0uklb0AA==
X-Received: by 2002:ac8:3b51:: with SMTP id r17mr1746348qtf.139.1632349454774; 
 Wed, 22 Sep 2021 15:24:14 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:e5d7:bbae:108a:d2ca:1c18])
 by smtp.gmail.com with ESMTPSA id 9sm2948633qkc.52.2021.09.22.15.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 15:24:14 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v3 3/3] multifd: Send using asynchronous write on nocomp to
 send RAM pages.
Date: Wed, 22 Sep 2021 19:24:23 -0300
Message-Id: <20210922222423.644444-4-leobras@redhat.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922222423.644444-1-leobras@redhat.com>
References: <20210922222423.644444-1-leobras@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=leobras@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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


