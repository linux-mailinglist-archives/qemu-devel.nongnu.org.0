Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1983945B812
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:09:48 +0100 (CET)
Received: from localhost ([::1]:58226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppDn-0003dh-7t
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:09:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0R-0003Xz-BP
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:56:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpp0N-0004tm-LA
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 04:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637747755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UNFcFs+Y30M5WFnFRQOUK5vwTxuvNJYNEc1+Ka4Kfmg=;
 b=XGPRHpBjOlpyqhWfldMjF+4tAastTP27BlSGgrFikyrVnOJoDLOa/Hdw94Tu5ZQMDJY51e
 7lKf8pdsvZ0HCpWX5OFvcP/55lIMmVq3SXyac9MyU38JzEpbbdWnrp/rrQq9MJy0/LVVup
 QDK9SXFbuTYFqtNpGjBC6M3z2i5QfYE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-ZDBKwtsoNIWgD54XIBFZJQ-1; Wed, 24 Nov 2021 04:55:53 -0500
X-MC-Unique: ZDBKwtsoNIWgD54XIBFZJQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 187-20020a1c02c4000000b003335872db8dso1066480wmc.2
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 01:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNFcFs+Y30M5WFnFRQOUK5vwTxuvNJYNEc1+Ka4Kfmg=;
 b=0KT53jgW8z/0sWH6AAl71AxiGg+OUvhusEZBxQKedURFJRbHrxp/9Sapl0waWr2G9j
 Qec6CBK2NpZ30aGEcpfgpbVXrJL9lhl5kRFpwsy8omv98xs9qr8qtGH4U+ZmbBta+6xK
 ff1+WZr399DDuVbVZEb3UXu8/4nVQmzDCY7UOt73Kg74grGAE0VT0OgIFkRPTmCAiLDp
 4aY3NeCQRnZJEmmk5C9UkFDca0GUmrxTPRGHtmMhR0cJMp+ZJKPL0DR7Jshv8PIX+qt3
 iCl0cEJszepMYk21KTnnPU1wUic3L3rvqJtrk4R2ODsgprsWsUCj9J3sxwsmbVdoDEuL
 rfGw==
X-Gm-Message-State: AOAM530xRNsDM4FIuFvAHZXuBAddxojA4l+Z/U7eik91RD0jaCTxJxrA
 bBrJl/JylHuC8NgzNP+6gBFJtU2Aay1nLR1SF5gsJrsznbYjIGDbaZFfRlRS9SJLTm8vHMdot5G
 j/q287n0cQBuv8QJ4mVdflXQnxqqQoonKxhaAunNEZ08kvdhEGMDtIeoEfOi5XHa/g+s=
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr13627643wmq.102.1637747751982; 
 Wed, 24 Nov 2021 01:55:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDhRuhMc4WIYFhSqbBfsekoYw1+ijPGGBRR+XXW3jTTW97dtiFYCHfFV/qyshmV66Q6+niGw==
X-Received: by 2002:a05:600c:34c2:: with SMTP id
 d2mr13627613wmq.102.1637747751793; 
 Wed, 24 Nov 2021 01:55:51 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id o12sm4871684wmq.12.2021.11.24.01.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 01:55:51 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/23] multifd: Fill offset and block for reception
Date: Wed, 24 Nov 2021 10:54:45 +0100
Message-Id: <20211124095500.42078-9-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124095500.42078-1-quintela@redhat.com>
References: <20211124095500.42078-1-quintela@redhat.com>
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


