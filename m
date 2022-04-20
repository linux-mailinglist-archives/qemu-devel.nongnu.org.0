Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E21508AC7
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:28:16 +0200 (CEST)
Received: from localhost ([::1]:52472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBJX-0000th-Ef
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMz-0006gV-7P
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAMv-0004ZC-Nq
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:27:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvLWqC+CpJQWIBnqDL4H8IFHRT5sE6h3YPy+bpLPxvo=;
 b=EeBn5qH/ojko7k/MqI1mPz2+N3Y43JzQEy72YtizvroW37IRoctIr9OiwgLfZTjLVO9oGG
 kmgv7WOkQDWYsyJFfG1uIaISyRehMdnXCVWtzzgsq6I7cYgA8CB/J710TiaPytq247kXKI
 etSZk/YpUeEDJNYOyX4clO9VMcDIRGI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-zhx5IB1eNLO45jCqW7MvYQ-1; Wed, 20 Apr 2022 09:27:30 -0400
X-MC-Unique: zhx5IB1eNLO45jCqW7MvYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CC22803D67;
 Wed, 20 Apr 2022 13:27:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21DCF140EBD5;
 Wed, 20 Apr 2022 13:27:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 13/41] arm/digic: replace snprintf() with g_strdup_printf()
Date: Wed, 20 Apr 2022 17:25:56 +0400
Message-Id: <20220420132624.2439741-14-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "open list:Canon DIGIC" <qemu-arm@nongnu.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Also fixes a GCC 12.0.1 false-positive:
../hw/arm/digic.c: In function ‘digic_init’:
../hw/arm/digic.c:45:54: error: ‘%d’ directive output may be truncated writing between 1 and 11 bytes into a region of size 5 [-Werror=format-truncation=]
   45 |         snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
      |                                                      ^~

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/digic.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 614232165cdc..6df554797734 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -39,10 +39,7 @@ static void digic_init(Object *obj)
     object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm946"));
 
     for (i = 0; i < DIGIC4_NB_TIMERS; i++) {
-#define DIGIC_TIMER_NAME_MLEN    11
-        char name[DIGIC_TIMER_NAME_MLEN];
-
-        snprintf(name, DIGIC_TIMER_NAME_MLEN, "timer[%d]", i);
+        g_autofree char *name = g_strdup_printf("timer[%d]", i);
         object_initialize_child(obj, name, &s->timer[i], TYPE_DIGIC_TIMER);
     }
 
-- 
2.35.1.693.g805e0a68082a


