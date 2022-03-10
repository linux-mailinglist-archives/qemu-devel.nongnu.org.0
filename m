Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4612C4D4745
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:51:07 +0100 (CET)
Received: from localhost ([::1]:50536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIG2-00028z-C6
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:51:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9a-0006cy-DY; Thu, 10 Mar 2022 07:44:29 -0500
Received: from [2a00:1450:4864:20::42d] (port=37518
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9X-0005AI-Om; Thu, 10 Mar 2022 07:44:24 -0500
Received: by mail-wr1-x42d.google.com with SMTP id q14so7786847wrc.4;
 Thu, 10 Mar 2022 04:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2RZShYOopr9nsq75F7S8Tql1GSMxw9kb3WS3HyQD9ak=;
 b=JvrEmnocL3Wr16EdnOZkNU75SobLytLbSh5oo4jvcK/tFI/6RiWMctRV7iXJ/bY9sw
 nMTGv5k6Bk87VicFB8WivkRGE/Nh1oWKPPvZmvfULECziR8oP5zeqndoqkmy9i7W5wuw
 3Yx5yelzyAL+TRZi2SSAb3hXgKu65gJlUg6GWRgYnjnb0rkuJa3O97PBLz3OzOILkLoN
 4w/y0WWvdV2T/BGn4xwWoOVhM/ogzLjK3mNysaRrsAIu+7JUTv3nP4jRCd+YsxuzvO4q
 2T5vTbzjCfFd7TWQlQ0amW8YJoaU/P14ghZQooQ1ilqwbKAzNq5NIA9ifmleV5boJkgL
 e1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2RZShYOopr9nsq75F7S8Tql1GSMxw9kb3WS3HyQD9ak=;
 b=aw+X+pEXXPzURCMJPs0zEDopCBL4O1FjlG3YPtfr//g3OgsljSpU/DE83AVxi13kkl
 2acKd37c4Hr1swgu0t0VagTgJkAVPfbkZ5/c+AZ8EHxCaguKhItCBukP5KlzP3Vvccla
 7EVj1poU7i6w/zYPA4OQN7bGY9RrNuwO8UcpxF5IYsGQVxjNaRGioo2Z27z9FWBuFr4g
 cE6A6+ZIU6pALjNbZa/lU/NdtYZ2pbJIVmmiwZ0oqDw3HKyElD4cuU6H0sOG1QZTlUd7
 ujYLR0hip9Hn3DpDkbSVl+8Xjzyv7DZoh/3jE5tFKOTvQXcoRO+GV8kGvPzSny3PbupV
 hVKQ==
X-Gm-Message-State: AOAM533pv6zuGl5U4vWBEv9Z09tS6PgyL+LQDasjFJ7yXdRhth7KsvDO
 mF0M+e8PV4mxh8eZOEC8XJKrtg19DmE=
X-Google-Smtp-Source: ABdhPJykNkSOHVDs9kLx8RyYmyJzeseCWtASzus90CTwaYQPUMlEpryuq9CB1sNzSCDyK4U5gGV9zg==
X-Received: by 2002:a5d:4d4b:0:b0:1f1:d99e:1122 with SMTP id
 a11-20020a5d4d4b000000b001f1d99e1122mr3477829wru.604.1646916261665; 
 Thu, 10 Mar 2022 04:44:21 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:21 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/35] coroutine: introduce coroutine_only_fn
Date: Thu, 10 Mar 2022 13:43:42 +0100
Message-Id: <20220310124413.1102441-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some functions only make sense from coroutine context, but never yield.
Mark them as "coroutine_only_fn".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/coroutine.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 6f4596fc5b..b23fba88c2 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -43,6 +43,7 @@
  *   }
  */
 #define coroutine_fn
+#define coroutine_only_fn
 
 typedef struct Coroutine Coroutine;
 
@@ -97,7 +98,7 @@ AioContext *qemu_coroutine_get_aio_context(Coroutine *co);
 /**
  * Get the currently executing coroutine
  */
-Coroutine *coroutine_fn qemu_coroutine_self(void);
+Coroutine *coroutine_only_fn qemu_coroutine_self(void);
 
 /**
  * Return whether or not currently inside a coroutine
@@ -170,7 +171,7 @@ void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex);
 /**
  * Assert that the current coroutine holds @mutex.
  */
-static inline coroutine_fn void qemu_co_mutex_assert_locked(CoMutex *mutex)
+static inline void coroutine_only_fn qemu_co_mutex_assert_locked(CoMutex *mutex)
 {
     /*
      * mutex->holder doesn't need any synchronisation if the assertion holds
-- 
2.35.1



