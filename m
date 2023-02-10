Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE90C691888
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:32:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQMxB-00058F-5s; Fri, 10 Feb 2023 01:32:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1pQMx8-00057k-Ls
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:32:10 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leobras.c@gmail.com>)
 id 1pQMx7-0007gR-0F
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:32:10 -0500
Received: by mail-ot1-x32a.google.com with SMTP id
 g15-20020a9d6b0f000000b0068db1940216so1285391otp.5
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 22:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVKjVnaIscpJ3VchybK9zAWnObdNbO6GM/i6OX7DY8E=;
 b=DWlRUyZUeDFI+QrwqjQ0ow3GgdafvHr9s6Lk9+rmPZe3EL3Qn0cEV+Xd5ePjiYHEpQ
 xbWxH1PayDw76xyIa9bnIJs5deaXQSVm/dwqJpEPIrAW3HmJuIS7EHtHf8Wpdg8H4jPb
 N9pECzVQFwSaxRB+TPMmstG0923r3trWMUHpQclzXHaVdc3vf45vIghqfxdqV9fR7fPn
 B+XVcGXPuNfDk7QIOQlS0AOttPB7q18LeRm2xdHHjS8gNb0M6fa1AFC1MWgPKsb4LKv4
 Os49T/nz2oCDqBR+pMV/NfQfNvyg/tf4iOUHTLwrLe+pNZsXQhiKFDDJjSqZLlq3wUYl
 vOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LVKjVnaIscpJ3VchybK9zAWnObdNbO6GM/i6OX7DY8E=;
 b=VRwmamv92Mt/zSTTmAd5bPHKilL4mK/H4brq04EtRJF+wiETCiRpmpZ8eiJaRquoHy
 KAYQnrhzam7Gh5hTWW75nBobdT6zX4RhiZWmJW2mwcgDUtkC3ww554474qwcDYpak5NI
 oUpzWhyA89NSeg+Zez7hcGdFXPYgyG8mZ81p/wcdTBOjmeJvkRF6PEmnxZnri2Vl/77X
 EQzLu37r1sowvSYQk2OBIeHvmjqvH9ytK4DKdKvkEXqCkgGu5XQZG7SaZDtpSYdNfq/R
 u8L6I8lGGxhl0TONyWkqSBtO+jj3Dhv3CfoZOEECyyTPoR8bKkMopKo1F1jGeSfLyiQx
 gsHg==
X-Gm-Message-State: AO0yUKVZ7qioLGrxK9ITsjmP7+Lp2DugZRV7UzzjYHRXXRhAoTT/GrXX
 WifXqT3fHtkdEnLDewD1nWo=
X-Google-Smtp-Source: AK7set/uHMzvCETM2zhGNx+83Yf0cQc+QInTsqRto28+Epv9/hcAQCPWWLxXiGFEj64SeYij90E22Q==
X-Received: by 2002:a9d:734c:0:b0:68b:daba:9b2b with SMTP id
 l12-20020a9d734c000000b0068bdaba9b2bmr7227397otk.13.1676010727534; 
 Thu, 09 Feb 2023 22:32:07 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a9d6a52000000b00688449397d3sm1686285otn.15.2023.02.09.22.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:32:07 -0800 (PST)
From: Leonardo Bras <leobras.c@gmail.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 3/4] migration/multifd: Join all multifd threads in order
 to avoid leaks
Date: Fri, 10 Feb 2023 03:31:44 -0300
Message-Id: <20230210063145.530952-3-leobras.c@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210063145.530952-1-leobras.c@gmail.com>
References: <20230210063145.530952-1-leobras.c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=leobras.c@gmail.com; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Current approach will only join threads that are still running.

For the threads not joined, resources or private memory are always kept in
the process space and never reclaimed before process end, and this risks
serious memory leaks.

This should usually not represent a big problem, since multifd migration
is usually just ran at most a few times, and after it succeeds there is
not much to be done before exiting the process.

Yet still, it should not hurt performance to join all of them.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 migration/multifd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 1a445b36f1..7e37a459ed 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1039,8 +1039,9 @@ void multifd_load_cleanup(void)
              * however try to wakeup it without harm in cleanup phase.
              */
             qemu_sem_post(&p->sem_sync);
-            qemu_thread_join(&p->thread);
         }
+
+        qemu_thread_join(&p->thread);
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
-- 
2.39.1


