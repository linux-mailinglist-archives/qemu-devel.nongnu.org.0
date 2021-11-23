Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527345AAA9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 18:58:47 +0100 (CET)
Received: from localhost ([::1]:33686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpa46-0003o1-4b
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 12:58:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZx7-0006Xx-28
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZx4-0006oX-UA
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNFcFs+Y30M5WFnFRQOUK5vwTxuvNJYNEc1+Ka4Kfmg=;
 b=gm2NWDcecJO1R2JaKUFqO/K8Xv/64cDRAcsgokAVUiJFOlTGuezvukqRqWZ8qUJtAJrytl
 Z3iiodnSLp+rNcpKkGT++DqNOT8KtAR3335LJeQ/llAVtbO8mviEi2XA6J+ZoikEwBai9Q
 lWTgpMaBu+GShs5mZjAxcMnPFD5WV4s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-GZQxPpraPKiGaqOFIHmoLA-1; Tue, 23 Nov 2021 12:51:29 -0500
X-MC-Unique: GZQxPpraPKiGaqOFIHmoLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso1555068wml.9
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNFcFs+Y30M5WFnFRQOUK5vwTxuvNJYNEc1+Ka4Kfmg=;
 b=lMSs97Lxg/yaFqJuiVGIRXbH+IKitJyWRXDIWxwQLygciCApkjLrtUk1z/7yg8WRGz
 JgH2IEnCe7hQqEL8WeuD/HD21ApYZL6Pv4Y/ljLbPJIwbwOACt+q/R0WOI/lKBcScKSt
 r/S63k8i39TpCztMeIo5hirvgD8W/XScdH1K/FQOq32r5P8KfijHnjUwnWS5G4dkG9M/
 JEy03p6mzq6ZWMX15xwGJVK9SY4gnH+LsTjgbP3wYOPNEsfOMZ7xqXOtsgLq5nguQKQl
 zj78NN2OyEqH3LsksPThOwaAKZq5mCMpalrBw0eyctARJntms7MwDWRVO7vEgUK/p2Si
 o70w==
X-Gm-Message-State: AOAM530OMan/AzVsg6cEzTByrhTaRz4k4eLMWjZnHFKWjz+r6VHMVWxP
 o8Z2w46aZiszuXJESzzdIQvnNOOA8zPfKuilKgAJatK6FY1K+nGf43DDHKfis1qbVbYJDu4zDY1
 7tJgLB1+iP3aUn+ezCynv88UzSfUzRfYjbqhxM27x7kTTGGvY3lwlPdXNjmIifjWkIlo=
X-Received: by 2002:a1c:7714:: with SMTP id t20mr5438955wmi.139.1637689887237; 
 Tue, 23 Nov 2021 09:51:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYPQ55McseRJrznYJL1bC87wstOU9QcjE6m8Dt9HDrzx3a4p4wUhgvGpKf2jbPDrixWxFFIA==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr5438921wmi.139.1637689887044; 
 Tue, 23 Nov 2021 09:51:27 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id f13sm2250809wmq.29.2021.11.23.09.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:26 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/23] multifd: Fill offset and block for reception
Date: Tue, 23 Nov 2021 18:50:58 +0100
Message-Id: <20211123175113.35569-9-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123175113.35569-1-quintela@redhat.com>
References: <20211123175113.35569-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were using the iov directly, but we will need this info on the
following patch.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/multifd.c b/migration/multifd.c
index 55d99a8232..0533da154a 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -354,6 +354,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
         return -1;
     }
 
+    p->pages->block = block;
     for (i = 0; i < p->pages->num; i++) {
         uint64_t offset = be64_to_cpu(packet->offset[i]);
 
@@ -363,6 +364,7 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
                        offset, block->used_length);
             return -1;
         }
+        p->pages->offset[i] = offset;
         p->pages->iov[i].iov_base = block->host + offset;
         p->pages->iov[i].iov_len = page_size;
     }
-- 
2.33.1


