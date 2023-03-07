Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06F66ADDCB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:44:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVjb-0006qw-V0; Tue, 07 Mar 2023 06:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjR-0006nM-7b
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjP-0008G9-S1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3U+bn6i48RYLMFGa4DzfAVaTjQOjbQ9iFa0f/zDX6po=;
 b=MRRjLLWT/x1P0Tdk0kpSoGk/e6sLh0dlmJRh4UnE7Z03fX6Ag8KnLjEKiwLX4OiDklOux6
 Epk+2sVzJXjWQnstcRX2glnbXzjcPf8EJfsagfWND6f4RNLJ78vNjjo02xw7asscmL1MDf
 COVfcbs4H9dNiHIQ8QtIpSDzqSDw/UI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-PNNK5xLsO1eX9qPrMuqfcQ-1; Tue, 07 Mar 2023 06:43:46 -0500
X-MC-Unique: PNNK5xLsO1eX9qPrMuqfcQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so8379567eda.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3U+bn6i48RYLMFGa4DzfAVaTjQOjbQ9iFa0f/zDX6po=;
 b=V9A4M6NoWZhV/RBLSSNEh+6VCckkTmxN4lYZtgFyJT8wJndD9DDre47qUiwuS0Qkfy
 WDEPW/gQmwkHJ9WiYKWAbL4xX+XUHr+F5CJcgXOZbPooWVnORmHj/qCXVC7uYQitgmS+
 QzpH7JQUhUHUjwZXBRWxpgYoGH2gHLjpB6C0j/mZS6CDeZ66ThNx4xuIa+HLL9n5fjMk
 J8CFJrkWtJ9Z9Xqhf3ecxr10kd1VNj2ZT3rtWKV+pcFQ1N6CiA/0l2SYB760Htd8qxq9
 q74iEP7JfoA+S/IGgBKtVXKMutcOL0tdb4NrTAp+AB/R4DdwMsqZGzI96vd4ZmbiRYoN
 xgKA==
X-Gm-Message-State: AO0yUKUjn8jq4uOspAbPr12aBd/Z57e8zHCL9nktGKwg2EytGhf8BQrk
 Q438bEZ1SRtg2P4biPg6exHAUb5YTi76cijdt6e1dl47ZkL5GL0Qiku22qlwp1SSXvOfpIYJMuj
 AfmQDVCY69uT59hsPwG05973/xAaKMgNmU933raZE5+C1nk/mXARDyhKoJwU+pRSPpeXiPlvxgL
 s=
X-Received: by 2002:a17:906:b097:b0:8af:1a8c:f13f with SMTP id
 x23-20020a170906b09700b008af1a8cf13fmr13962808ejy.71.1678189424909; 
 Tue, 07 Mar 2023 03:43:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/og3oguOk1yPpqFVdx4B+tqkSgWaQU0CQ0LH2AbUiSh/Z3KFBl17p64foJXbO/YIVwt5nbBw==
X-Received: by 2002:a17:906:b097:b0:8af:1a8c:f13f with SMTP id
 x23-20020a170906b09700b008af1a8cf13fmr13962797ejy.71.1678189424723; 
 Tue, 07 Mar 2023 03:43:44 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a170906440800b008e8e975e185sm5954266ejo.32.2023.03.07.03.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:43:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 5/9] aio-wait: switch to smp_mb__after_rmw()
Date: Tue,  7 Mar 2023 12:43:25 +0100
Message-Id: <20230307114329.158094-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307114329.158094-1-pbonzini@redhat.com>
References: <20230307114329.158094-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

The barrier comes after an atomic increment, so it is enough to use
smp_mb__after_rmw(); this avoids a double barrier on x86 systems.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/aio-wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index dd9a7f6461ef..da13357bb8cf 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -85,7 +85,7 @@ extern AioWait global_aio_wait;
     /* Increment wait_->num_waiters before evaluating cond. */     \
     qatomic_inc(&wait_->num_waiters);                              \
     /* Paired with smp_mb in aio_wait_kick(). */                   \
-    smp_mb();                                                      \
+    smp_mb__after_rmw();                                           \
     if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
         while ((cond)) {                                           \
             aio_poll(ctx_, true);                                  \
-- 
2.39.1


