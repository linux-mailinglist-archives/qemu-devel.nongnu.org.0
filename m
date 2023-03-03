Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF296A9D10
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:21:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY94f-0005aw-K4; Fri, 03 Mar 2023 12:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94e-0005an-Ai
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94c-0003UR-Mj
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677864002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z6dc+PiE9+oOj3vx1rhfElc/CwN8tiroFq9k4yy+4YI=;
 b=AyefvkgW9Htf5opTcuaVZCAI1VViclEKlo+3QgO4Xs2upR/mp+DaSxJ+5HD8SOzrUJt04/
 k1uOoQpnB4B/F7mfWPkej4NxdzX3b2TBIWjRsf/dgtix6IOBt40zrKcfcYQWkvRScw0mKI
 BTZwCEL5hVw67X4/cgwpwNk0er/27GE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-mv4hcU1sOyq725JA_d99Sg-1; Fri, 03 Mar 2023 12:20:00 -0500
X-MC-Unique: mv4hcU1sOyq725JA_d99Sg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k20-20020a05600c1c9400b003e2249bd2b4so1193976wms.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:19:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z6dc+PiE9+oOj3vx1rhfElc/CwN8tiroFq9k4yy+4YI=;
 b=4SJh7uv7lle2DkTs+TjuVnL1zdo3yP6j6f72AjRtnzbaDB38vAWquRXM5BwG7VRF32
 TLbhgJilLhVXuBnFRFQ4rW8qPJ7aLY1JIMxeOx2v+6l7dgTxXhVbAE1wSTh8m7UOtiJ9
 a1W/OjhRGv4xP2kJ5vryhaKimLTP3bcewVaN5Lc7K/dYCRykOcAK9lLBt4xezzPRiMuP
 VR+b9Yt42vXgMVBUuyZzAi+cvQhWCalg16DyrtOebEe20XJUKaD0o/t3QKY7N0Gf6iu8
 yCkL+gD33myCGo9dxfL+cMbYY4ZwzY4ppzuodJlqRvNCTs7PnhDxayWgfcOicgufSozk
 Usiw==
X-Gm-Message-State: AO0yUKVRhJecXp+JOGbXRNcwobgslI7XeVpk7b1YVO7wS8FSG1/yd+/c
 p6qUNkrOmGIfLd/YqUzKSZ4R82JyCkyqR4TUeiCCJgq6AO9RHmsIbKMIhEhcfufuRiOCAlmMDQS
 nxmNX2g6OeKueocMKefRTyOPetxJXLixUDMRcdx7LR7B89VHQhBRLTvl6jASVOgxtGU/Wq+YC
X-Received: by 2002:a5d:67d2:0:b0:2ce:3a46:cee with SMTP id
 n18-20020a5d67d2000000b002ce3a460ceemr1537701wrw.2.1677863998604; 
 Fri, 03 Mar 2023 09:19:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8h4A8FJDd2kzcSusrREjHmquLkwQt4NfgmQkcYxbaUMCyNBkldEUrwYr0mUkCLPkdmJnn2ag==
X-Received: by 2002:a5d:67d2:0:b0:2ce:3a46:cee with SMTP id
 n18-20020a5d67d2000000b002ce3a460ceemr1537685wrw.2.1677863998328; 
 Fri, 03 Mar 2023 09:19:58 -0800 (PST)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d6042000000b002c70d269b4esm2579482wrt.91.2023.03.03.09.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:19:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Subject: [PATCH 5/8] util/async: add smp_mb__after_rmw() around BH
 enqueue/dequeue
Date: Fri,  3 Mar 2023 18:19:36 +0100
Message-Id: <20230303171939.237819-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303171939.237819-1-pbonzini@redhat.com>
References: <20230303171939.237819-1-pbonzini@redhat.com>
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

There is no implicit memory barrier in qatomic_fetch_or() and
atomic_fetch_and() on ARM systems.  Add an explicit
smp_mb__after_rmw() to match the intended semantics.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/async.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/util/async.c b/util/async.c
index 0657b7539777..6129f2c991cb 100644
--- a/util/async.c
+++ b/util/async.c
@@ -74,13 +74,15 @@ static void aio_bh_enqueue(QEMUBH *bh, unsigned new_flags)
     unsigned old_flags;
 
     /*
-     * The memory barrier implicit in qatomic_fetch_or makes sure that:
-     * 1. idle & any writes needed by the callback are done before the
-     *    locations are read in the aio_bh_poll.
+     * The memory barrier makes sure that:
+     * 1. any writes needed by the callback are visible from the callback
+     *    after aio_bh_dequeue() returns bh.
      * 2. ctx is loaded before the callback has a chance to execute and bh
      *    could be freed.
      */
     old_flags = qatomic_fetch_or(&bh->flags, BH_PENDING | new_flags);
+    smp_mb__after_rmw();
+
     if (!(old_flags & BH_PENDING)) {
         QSLIST_INSERT_HEAD_ATOMIC(&ctx->bh_list, bh, next);
     }
@@ -107,14 +109,15 @@ static QEMUBH *aio_bh_dequeue(BHList *head, unsigned *flags)
     QSLIST_REMOVE_HEAD(head, next);
 
     /*
-     * The qatomic_and is paired with aio_bh_enqueue().  The implicit memory
-     * barrier ensures that the callback sees all writes done by the scheduling
+     * The memory barrier is paired with aio_bh_enqueue() and it
+     * ensures that the callback sees all writes done by the scheduling
      * thread.  It also ensures that the scheduling thread sees the cleared
      * flag before bh->cb has run, and thus will call aio_notify again if
      * necessary.
      */
     *flags = qatomic_fetch_and(&bh->flags,
                               ~(BH_PENDING | BH_SCHEDULED | BH_IDLE));
+    smp_mb__after_rmw();
     return bh;
 }
 
-- 
2.39.1


