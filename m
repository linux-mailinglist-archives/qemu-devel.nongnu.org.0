Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAD24D4771
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:56:42 +0100 (CET)
Received: from localhost ([::1]:41702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSILR-0007AN-3c
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:56:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9f-0006fv-Pt; Thu, 10 Mar 2022 07:44:32 -0500
Received: from [2a00:1450:4864:20::332] (port=46722
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9d-0005Bl-Rd; Thu, 10 Mar 2022 07:44:31 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so3293919wmp.5; 
 Thu, 10 Mar 2022 04:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dT+i83yAoZd+9rOLeIq77urD76H3LMrkKX/uEElWQyo=;
 b=T/iGyIUsvFykhWGbbVrd6ncd8YOrMw3wDhzqFhuTT4bR7uz4P8SWZzJ9Q7gHigrmxA
 6bdXJzXhR2G2+JxPdz49bANFmcO9ZYuIt6aKjeEx3DZPqMqO90BDyKXXVv1Ud/g1dNY9
 aK3MQqDUbWMvQKeuDauKzbfPj2km677cUtrOWt50W8a3lixLNFsmpFAk4IYI55QI9Dxd
 mkciZ9c4ZZBTQhg/TfDbPieMad1A5M1iS+lftAwpUWDMAxYiMQh3kZHC1KURPfFIgwtP
 SkE7Kpfn3TWjXnGfbFBJADuS7OS6F2Edtx92lHnEmBNR2R4SCaeYwgqiE5e9Q1d5wQrh
 QW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dT+i83yAoZd+9rOLeIq77urD76H3LMrkKX/uEElWQyo=;
 b=pnsOxRp2xDpu9rvCEEsi1NYHU9FH9KZw5PpESSv5wM45i+9/b2GyWmw3VFwHI84ISr
 unj9DjlaYOTIqEEo9CL28Ws2yLQvTIAYPR7KmzgZiKOT6yVl0DsznAlw3BTY4+C2e8gV
 jt+D7ciwi1zrgYK1tDe1pNfAQ9zzwJb4OrpkYS62qpItaApKRDE6MXLyyMVhTZN5IXPD
 RmfUvJWmgIFbwHENiDI0o6ArTvc2xnoo3AsMh4+br4R4+b1lZZOzjr4HRSNpld9JF4Zk
 g94k33KUeepF2yqYwnzVjHjjFqcUJkadbs6rgKrskM5WjuuXgKUXLBA1w22WEAxbnRYq
 GfUw==
X-Gm-Message-State: AOAM532rGsx5J4xTtk9Nz5RwafXECc3D7cgPDAnTzTtTKBug/H8goL9x
 cenXwzj7+rdL/1qhWaptEVo6JXKyxP0=
X-Google-Smtp-Source: ABdhPJwKUWciv+lvHNKs9R92wmAIPItHs9heNkd6/mlgZwI7DWSjmN8PFzdR7mhMcrJCjZ2SXQMjHw==
X-Received: by 2002:a05:600c:42c1:b0:389:8310:1128 with SMTP id
 j1-20020a05600c42c100b0038983101128mr3482550wme.3.1646916268253; 
 Thu, 10 Mar 2022 04:44:28 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/35] enable tail call optimization of qemu_co_mutex_lock
Date: Thu, 10 Mar 2022 13:43:48 +0100
Message-Id: <20220310124413.1102441-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
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

Make qemu_co_mutex_lock_slowpath a tail call, so that qemu_co_mutex_lock
does not need to build a stack frame of its own.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index d6c0565ba5..048cfcea71 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -231,6 +231,8 @@ static void coroutine_fn qemu_co_mutex_lock_slowpath(AioContext *ctx,
 
     qemu_coroutine_yield();
     trace_qemu_co_mutex_lock_return(mutex, self);
+    mutex->holder = self;
+    self->locks_held++;
 }
 
 void coroutine_fn qemu_co_mutex_lock(CoMutex *mutex)
@@ -266,11 +268,11 @@ retry_fast_path:
         /* Uncontended.  */
         trace_qemu_co_mutex_lock_uncontended(mutex, self);
         mutex->ctx = ctx;
+        mutex->holder = self;
+        self->locks_held++;
     } else {
         qemu_co_mutex_lock_slowpath(ctx, mutex);
     }
-    mutex->holder = self;
-    self->locks_held++;
 }
 
 void coroutine_fn qemu_co_mutex_unlock(CoMutex *mutex)
-- 
2.35.1



