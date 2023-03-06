Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6583F6AD1A6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:34:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZJOp-0004Tj-N6; Mon, 06 Mar 2023 17:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOo-0004TQ-Bf
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZJOn-0003ZO-3z
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678142020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1rNPAcKSjGM/N+sMNI8BsxsPy3EoZ3hfvlt7wnsSHM=;
 b=hBE0cOC3JQbcNl2PRKEZPnOtjnX265FRPljIvFVDoVf6aOOJbYszYtXXmQy0rXqU9J4v1t
 XtCFJtNBAgJcJgnrlu+yB+J/B5eN1vG5z9YSS7tsaWp/Pd9D/HAytDbBW6lb9n9s5aw1B0
 ZGeb/kzCzhDIeSBbNwbhsjHAzlqavLQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-tjswA7ypPj2BFnwq-E78nQ-1; Mon, 06 Mar 2023 17:33:39 -0500
X-MC-Unique: tjswA7ypPj2BFnwq-E78nQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 r9-20020a05640251c900b004d4257341c2so10198259edd.19
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678142017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y1rNPAcKSjGM/N+sMNI8BsxsPy3EoZ3hfvlt7wnsSHM=;
 b=u59cPZbKvFLajvKND2orYwy+Key8dzjlN7RgNL/CA9S5xsQcR6k5Jwj7cYVSOaXJF6
 52YiFNHb7SyVKMLW4vWrSg1hPpDBvoRf6rUiSvdkVl++EJVN/VJLPcAj6wIcdMu7ilEm
 cMTqhtrgunD2a8ekYOBz6z0nMT7fC0urYqPQbRU1GYHynSIeHe18VkW8/Nw5Ajni+kDf
 3tQWfJE+YGOU+dRVa3Kd8cAFMmXAZyIaCeE05yMbyVdPsLwk/Y/cBpeN40mMcZHlzBCw
 UOg86JXJS769C230++10RjatfpEVwCZ+fNncG4cWomrXJ4TECypdJ1H69bs8aOJYdtpj
 IwmQ==
X-Gm-Message-State: AO0yUKXB5cpwvj1Faq9nDo0WF7Q7SQTxKfgpyHXNVGYEmzUzrrgSRS74
 9L0sUep29bPcUMYlQhvGT9GbvxQki6QDRG8mzAI0KwNUa9FoEH484vkWYpY3+W86Jq7IPDYTObj
 Ar/MP6TQTyZGsS6l98e3ZJTAwky0yBE0NKh8T9aCQ8QUHU15Xb/Q8fP4KHNOH6AQzRKTeWaXiKq
 s=
X-Received: by 2002:a17:906:85c3:b0:881:f614:44ed with SMTP id
 i3-20020a17090685c300b00881f61444edmr12876635ejy.30.1678142017597; 
 Mon, 06 Mar 2023 14:33:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/vTmi9j+MVwfqTUWwYHjVvj3Z4BdZWRStWGuwU751O2iiGBCHbVUss2vDVlBkd+sJ6TF5EIA==
X-Received: by 2002:a17:906:85c3:b0:881:f614:44ed with SMTP id
 i3-20020a17090685c300b00881f61444edmr12876617ejy.30.1678142017330; 
 Mon, 06 Mar 2023 14:33:37 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ay24-20020a170906d29800b0090953b9da51sm5111325ejb.194.2023.03.06.14.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:33:36 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com,
 richard.henderson@linaro.org
Subject: [PATCH v2 9/9] async: clarify usage of barriers in the polling case
Date: Mon,  6 Mar 2023 23:33:06 +0100
Message-Id: <20230306223306.84383-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230306223306.84383-1-pbonzini@redhat.com>
References: <20230306223306.84383-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Explain that aio_context_notifier_poll() relies on
aio_notify_accept() to catch all the memory writes that were
done before ctx->notified was set to true.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/async.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/util/async.c b/util/async.c
index e4b494150e7d..21016a1ac7c1 100644
--- a/util/async.c
+++ b/util/async.c
@@ -474,8 +474,9 @@ void aio_notify_accept(AioContext *ctx)
     qatomic_set(&ctx->notified, false);
 
     /*
-     * Write ctx->notified before reading e.g. bh->flags.  Pairs with smp_wmb
-     * in aio_notify.
+     * Order reads of ctx->notified (in aio_context_notifier_poll()) and the
+     * above clearing of ctx->notified before reads of e.g. bh->flags.  Pairs
+     * with smp_wmb() in aio_notify.
      */
     smp_mb();
 }
@@ -498,6 +499,11 @@ static bool aio_context_notifier_poll(void *opaque)
     EventNotifier *e = opaque;
     AioContext *ctx = container_of(e, AioContext, notifier);
 
+    /*
+     * No need for load-acquire because we just want to kick the
+     * event loop.  aio_notify_accept() takes care of synchronizing
+     * the event loop with the producers.
+     */
     return qatomic_read(&ctx->notified);
 }
 
-- 
2.39.1


