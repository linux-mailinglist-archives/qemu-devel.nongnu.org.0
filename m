Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC766470D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:09:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6g-0003dE-ID; Tue, 10 Jan 2023 11:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6N-0003QJ-Nf
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6J-000570-J1
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sp+v90SdO17Q3YnQ/1B/0vwvm96JM/TGxpmtJEW9yPU=;
 b=jMN8D4SevxRSOr1bA9VlA88MpYX7+z9mrSev2PpKpALoWOmrreqT8qZqsQRMRd/9VeivDR
 h6nHA9/R5MMc5Liu2RoBkB7EVGKGPsvx7DTH4togc6viPT2ij45fGSZBcmLkLtuJCqHZZp
 Hg+N//8QKzJsR26k683/kgrfGJ/2D+s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-29-BI6ZGeE9OOuzv6ETOVv2FQ-1; Tue, 10 Jan 2023 11:03:45 -0500
X-MC-Unique: BI6ZGeE9OOuzv6ETOVv2FQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 e29-20020adf9bdd000000b002bb0d0ea681so2083534wrc.20
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sp+v90SdO17Q3YnQ/1B/0vwvm96JM/TGxpmtJEW9yPU=;
 b=1pFr93HifRMKQKUlKoaK84lmt7GARAq0Slbf4RJPw2NIX0q+qjvQ5Gxkv2JFaUiONv
 w542uvNbWwynv54URy6drtguy3XYelin0G+s+pJ9Y2HpI+SSgMzVr9AgFSd92NbHdFyf
 cWx7r6mPQ7lSOoDkoWRe5Ws6WSO5SGknWMJbkIBSolOnJmYBsfp8j39LwP2B0jyCGMyA
 C6h6PfjUKfhsHFD1QkyQwy/bNK/OegmfBvIjkewnd3cTyCixdvvn5Doy8ly0nt2JP7ki
 mXsvA4GBUNUvZ9HiL2S0nPw1qnSe7jJ2hCrSxXBZx97owP8NbzRngWHpVk5uEzhp82TG
 kLdQ==
X-Gm-Message-State: AFqh2kphyy7yfxGRxGofrHdJLMDZ0ePqe70fw3UyE6/fSzLvortDOS9t
 qAIMr1tf8TCFja7wE28vkzlSYT4YTFUKL0NTrgOvNiKOXWwmU0xPcF3vBE6Q/EGq2U+/S18EKSm
 SShj12vwXTZ+zXm+zkk3O2ifsQamVZAyYzAArbrsUZpAe/9+w26NG5SYwgaQ3NPdjPTw=
X-Received: by 2002:a05:600c:3b22:b0:3c6:e63e:814b with SMTP id
 m34-20020a05600c3b2200b003c6e63e814bmr49259803wms.2.1673366624057; 
 Tue, 10 Jan 2023 08:03:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXscw8V9y5pMGMPZdULldWUfchJ+K9Y5vKP2cYxXsSWCINC0kLX5po0D651GwkEFaKEkx1pAAw==
X-Received: by 2002:a05:600c:3b22:b0:3c6:e63e:814b with SMTP id
 m34-20020a05600c3b2200b003c6e63e814bmr49259770wms.2.1673366623692; 
 Tue, 10 Jan 2023 08:03:43 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c1d2400b003d9fb59c16fsm2122120wms.11.2023.01.10.08.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>
Subject: [PULL 25/29] libvhost-user: Fix assignment in vring_set_avail_event
Date: Tue, 10 Jan 2023 17:02:29 +0100
Message-Id: <20230110160233.339771-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
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

From: Marcel Holtmann <marcel@holtmann.org>

Since it was proposed to change the code in libvduse.c to use memcpy
instead of an assignment, the code in libvhost-user.c should also be
changed to use memcpy.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <502b22723264db064e4b05008233a9c1f2f8aaaa.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index b28b66cdb159..fc69783d2bf6 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -2478,14 +2478,13 @@ vring_used_flags_unset_bit(VuVirtq *vq, int mask)
 static inline void
 vring_set_avail_event(VuVirtq *vq, uint16_t val)
 {
-    uint16_t *avail;
+    uint16_t val_le = htole16(val);
 
     if (!vq->notification) {
         return;
     }
 
-    avail = (uint16_t *)&vq->vring.used->ring[vq->vring.num];
-    *avail = htole16(val);
+    memcpy(&vq->vring.used->ring[vq->vring.num], &val_le, sizeof(uint16_t));
 }
 
 void
-- 
2.38.1


