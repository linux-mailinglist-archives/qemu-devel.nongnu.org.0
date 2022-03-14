Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A554D7ECE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:39:39 +0100 (CET)
Received: from localhost ([::1]:38102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThAw-0000iK-C8
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:39:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3j-0007q5-9M; Mon, 14 Mar 2022 05:32:12 -0400
Received: from [2a00:1450:4864:20::32f] (port=35811
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3g-00082v-VT; Mon, 14 Mar 2022 05:32:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so11585433wmj.0; 
 Mon, 14 Mar 2022 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oXz+BWP/LDeXYvsbVe7m9SlkJdCNLdNyBH4D7wYcyC8=;
 b=o8F1IfEoqpOSC738PEUwDmuZh8kT2uBtJImIo90Db5uvf48IPBanMaOi8J/9sO9VJW
 Q/TZgl2hp2r1Ih17AxvUHGlyvUh0lqAi7tzf5ojnRnVAd86CURqYEEoxKCMlEI8vctae
 P1VUHsGaET30s/bfJfRMpuCMU2Q6ngjT6vIoSySzMX+zca307uxEKerRahxABRz8qAwv
 jtNANLjBBGzY41qbbzkp+bHuAwYS9CisdgtvmS5elIWl6WO62fND1XxbJ9MXlpfh3KGT
 tHY/8LERYFq+1RysAT1syQ8Wy8tB5MuVxSmT7MW3ZQdDyWRwBqkT9jOx7m9ulpkpUFnI
 VrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=oXz+BWP/LDeXYvsbVe7m9SlkJdCNLdNyBH4D7wYcyC8=;
 b=xQ5TOjPRPcc+Hspkw2bLr+jOdV9kFN98M4u7V3/iQtOA7Mr690LsdSsW34KzsUHxxa
 67lwYIUhGj+hj63RJm2az3NsqYs4J+dCB8LquxDqBGhPfxoJEY3iULbi9OfX/K9LxqwK
 6mud4Jle0xFfYtbPWiF/VGKIMgDlrbd+k7AkXN6HdyxMp18zkDe0S8EH8VNoGgyLWd25
 FThgN44gfazvGRwx9y2COIKZBvhUMbP3m7PgMLMVUAkjCsoGac8iL2zJ+viO+SNux2Cl
 XwkpDGQACN9N/weIsfD5v8F8qIM33+SU98e8R2ifrvmobg6VOWY68sjXLxf1tKAXznGH
 TuWQ==
X-Gm-Message-State: AOAM531+Oldnh8jNEA1Kpv2qPRUkT0cL6CwGw7FIUECKQ6Qi+TYHXq8A
 3GzDqZAhY7zM7c0orDfG72GQKmsaZm8=
X-Google-Smtp-Source: ABdhPJw25U5dVXwMehBIjsC/jR847X3PEYOQqfXBPqZPz2sWP49Yg6F69RyOMlFF0u2n+IeF9rllbw==
X-Received: by 2002:a05:600c:154a:b0:389:d76c:8a07 with SMTP id
 f10-20020a05600c154a00b00389d76c8a07mr16595174wmg.60.1647250326748; 
 Mon, 14 Mar 2022 02:32:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 02/16] coroutine: qemu_coroutine_get_aio_context is
 not a coroutine_fn
Date: Mon, 14 Mar 2022 10:31:49 +0100
Message-Id: <20220314093203.1420404-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since it operates on a given coroutine, qemu_coroutine_get_aio_context
can be called from outside coroutine context.

This is for example how qio_channel_restart_read uses it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h | 2 +-
 util/qemu-coroutine.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index da68be5ad2..666f3ba0e0 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -92,7 +92,7 @@ void coroutine_fn qemu_coroutine_yield(void);
 /**
  * Get the AioContext of the given coroutine
  */
-AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co);
+AioContext *qemu_coroutine_get_aio_context(Coroutine *co);
 
 /**
  * Get the currently executing coroutine
diff --git a/util/qemu-coroutine.c b/util/qemu-coroutine.c
index c03b2422ff..9f2bd96fa0 100644
--- a/util/qemu-coroutine.c
+++ b/util/qemu-coroutine.c
@@ -200,7 +200,7 @@ bool qemu_coroutine_entered(Coroutine *co)
     return co->caller;
 }
 
-AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co)
+AioContext *qemu_coroutine_get_aio_context(Coroutine *co)
 {
     return co->ctx;
 }
-- 
2.35.1



