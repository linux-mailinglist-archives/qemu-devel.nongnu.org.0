Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003333D8A8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:05:59 +0100 (CET)
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCCj-00032j-Vi
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC7H-0000uM-9m; Tue, 16 Mar 2021 12:00:21 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:56270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC7B-0000JR-Av; Tue, 16 Mar 2021 12:00:14 -0400
Received: by mail-wm1-x32f.google.com with SMTP id 12so5368348wmf.5;
 Tue, 16 Mar 2021 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xgtdm62nkB77KDEB509RPm6RJ/Eax7jgJ8G9QzqE+DA=;
 b=MOL3F8VoPm/CmozSQWlfZzjI14xU2FOHJytLITmThr3oXvvAGGjGBcFPUsGs91iFVC
 B/YV2qY8N3WehDrl7pBXzmr7T7nbeybbNNL9XWAsKp9RyOrysTUpPZA7qWaS7WDv+Zo/
 G1AuHCL1M5fxbwjV8e2qkpq3bOkYL3o9R6bw98UsQbnUeoiRQGpSxAOklXDaMtfeGgt5
 muR6WBnmRxkcfTMiwk2CoT1DdeATU5OjormMnkDr6cd/6M4Q1Pvfu2zvmNdI4PkR2LSw
 Yklp7hd4n7hfDhb9AqkFTcvRG7rPZnIZtJUO7X2PsXbpcHraga6J2sXYk1DI5Pal3pr/
 ga6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xgtdm62nkB77KDEB509RPm6RJ/Eax7jgJ8G9QzqE+DA=;
 b=BU8TTFC7EJJa6/dAf8vkDzeEN3H0j/6AKdz8AQg7mKttcJKREcrfWlbA8j3M0yaGqh
 p+SfT/+lJB1L4In3WLD6hMhm3gJBiuidW3PShXuMcZRfjEubeS1/b/38BHMVypLpVSIf
 k6qpajX9+S+Jezh0v1DOA6Z0Cgy7nqw/s7w4KA0+2p6hUuAB51rJhFUc3wmL2SFmN8B+
 Tp22SUMgs9sEGrZG+anYQBUATBsmp6PlZBlHw0yNDd1dZbUyhWKd1crBWZaVGsg4UefP
 PxeFutaDJmVcAc3fUYDUdbTjLrUgCiVri/wTIdWOXHHX0XkSxl8CEd8DR8LDENhbGbr8
 5OGw==
X-Gm-Message-State: AOAM532ZYQoYmCHQrx9sOnBBNzMkP74ZDZRrfIn1HHqgrvdPzz5UnjGE
 vRuVv5aTfOmW8v5IM7vltNOaw3wzA08=
X-Google-Smtp-Source: ABdhPJzKlqZyrBSK9V8hW9NSNEZOI17h0Ji4VdE4QUhe4vTstwNQgRGBQ4xq0QME4KVhpqcSuPdk0Q==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr297567wme.107.1615910411137; 
 Tue, 16 Mar 2021 09:00:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j14sm22674851wrw.69.2021.03.16.09.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:00:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] coroutine/mutex: Store the coroutine in the CoWaitRecord
 only once
Date: Tue, 16 Mar 2021 17:00:05 +0100
Message-Id: <20210316160007.135459-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210316160007.135459-1-pbonzini@redhat.com>
References: <20210316160007.135459-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

When taking the slow path for mutex acquisition, set the coroutine
value in the CoWaitRecord in push_waiter(), rather than both there and
in the caller.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210309144015.557477-4-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 5816bf8900..eb73cf11dc 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -204,7 +204,6 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
     unsigned old_handoff;
 
     trace_qemu_co_mutex_lock_entry(mutex, self);
-    w.co = self;
     push_waiter(mutex, &w);
 
     /* This is the "Responsibility Hand-Off" protocol; a lock() picks from
-- 
2.29.2



