Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB16D643960
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 00:20:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2Kjp-0006aE-Ev; Mon, 05 Dec 2022 18:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2Kjn-0006a4-Vm
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 18:19:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2Kjm-0005Xj-8C
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 18:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670282340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mjmrt1g8p//0T/83tfefWSQCfpFjRcBFW5WDz1NLQAE=;
 b=S6uoj/9BMWHW4xuSX0l/QY4/mN8UIAsQ1yOVw6cZzOS34W358k3SDQbFqJ/ju4lmQR9Cwj
 BggUQ8Bv6MVNS6Q59cAaPdadFdGZ85N6P/urJjsoY14YWYAX7hb9CjjPSba2IRmUSilLp5
 0RZio18VkUnx8yySeysuSZZP7JE6cIw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-94-cgTiog5jP9-_urNSR1HC3w-1; Mon, 05 Dec 2022 18:18:59 -0500
X-MC-Unique: cgTiog5jP9-_urNSR1HC3w-1
Received: by mail-qk1-f200.google.com with SMTP id
 w14-20020a05620a424e00b006fc46116f7dso18700996qko.12
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 15:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjmrt1g8p//0T/83tfefWSQCfpFjRcBFW5WDz1NLQAE=;
 b=MVtCwtOWRsubmvD3o1Mw39xmNSAo/FqS8VVlqxpCo1G4MkjYK0AaqqnuVuHd+9kkGP
 fRRS0E45QEA68kQw6UeIRXJLikMkYdn2q96z+OvmdLsE2LPWEHq2PUIQQKhwAdwcBLBW
 kM1FYdt5pCXF7sEB2DXfq/xELyiF83/R5bawnto3sShvdMtr5OTQ4q0hETDnRe7Zy7Oi
 WXetPoK/UUC1JLzTA/H5VJVLsujFZQxSgYPUcXmLjNb7gX4L8pj9QKKWpW7iKIVtuWrf
 dkd7zP3aVw1HSdOyQmWiVKZAJ5wd7POB+hbR3ULiBrJKTBwl0SklRWmhS9uhqWw28DDi
 jwjw==
X-Gm-Message-State: ANoB5pmDWthfaAcp7AWH7jWZQsph7KPwNar4OD02NfJ3zN4IiwPuR7w4
 nkknD/TMmVWEGyTBlEiLHxk11JrTnQ6jm6oKGv2VLPerP1cCjDjgoKeB/mwZARMHngn8XH+RJ2o
 7digHlI4ojqXN1mw=
X-Received: by 2002:a05:6214:3502:b0:4c7:1fa7:2cc0 with SMTP id
 nk2-20020a056214350200b004c71fa72cc0mr22932187qvb.1.1670282338686; 
 Mon, 05 Dec 2022 15:18:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf58zA2JVa61QNAuEvzO5rciUWkgcNQZbEt/Iq5RW4JFseAoVUXhWw1txKJ/hjGAsZ0w37ZmFA==
X-Received: by 2002:a05:6214:3502:b0:4c7:1fa7:2cc0 with SMTP id
 nk2-20020a056214350200b004c71fa72cc0mr22932170qvb.1.1670282338457; 
 Mon, 05 Dec 2022 15:18:58 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 u11-20020a05620a0c4b00b006fc8fc061f7sm13380050qki.129.2022.12.05.15.18.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 15:18:57 -0800 (PST)
Date: Mon, 5 Dec 2022 18:18:56 -0500
From: Peter Xu <peterx@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 viktor@daynix.com
Subject: Re: [PATCH 3/3] intel-iommu: build iova tree during IOMMU translation
Message-ID: <Y458YMavxao9XSwL@x1n>
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-4-jasowang@redhat.com> <Y4Yr5WvfioOJWOEX@x1n>
 <CACGkMEuC41jFin3XAVSs3ra0tmxZD7L5NeDLn5OD6ziq7z1huA@mail.gmail.com>
 <Y4d0HokcV/tg0wlk@x1n>
 <CACGkMEu-t7J=GP2ZJ3cw6X427SzzPk=XFV9tSCfffK4RKuFnAQ@mail.gmail.com>
 <Y4jBMkNEFqUA7edN@x1n>
 <CACGkMEszjH02RPRy5ps7JBqkELCqLSdcCCLyPLoxY155zh8BgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="jCPHgN2qD0x7grcr"
Content-Disposition: inline
In-Reply-To: <CACGkMEszjH02RPRy5ps7JBqkELCqLSdcCCLyPLoxY155zh8BgQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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


--jCPHgN2qD0x7grcr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Jason,

On Mon, Dec 05, 2022 at 12:12:04PM +0800, Jason Wang wrote:
> I'm fine to go without iova-tree. Would you mind to post patches for
> fix? I can test and include it in this series then.

One sample patch attached, only compile tested.

I can also work on this but I'll be slow in making progress, so I'll add it
into my todo.  If you can help to fix this issue it'll be more than great.
No worry on the ownership or authorship of the patch if you agree on the
change and moving forward with this when modifying - just take it over!

Thanks!

-- 
Peter Xu

--jCPHgN2qD0x7grcr
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-memory-sanity-check-flatview-deref-on-mr-transaction.patch"

From 57e5cab805c94d56f801a7e21098389a77584e34 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Mon, 5 Dec 2022 11:14:02 -0500
Subject: [PATCH] memory: sanity check flatview deref on mr transactions
Content-type: text/plain

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/exec/memory.h | 9 +++++++++
 softmmu/memory.c      | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 91f8a2395a..e136ab9558 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1069,8 +1069,17 @@ struct FlatView {
     MemoryRegion *root;
 };
 
+extern unsigned memory_region_transaction_depth;
+
 static inline FlatView *address_space_to_flatview(AddressSpace *as)
 {
+    /*
+     * Before using any flatview, sanity check we're not during a memory
+     * region transaction or the map can be invalid.  Note that this can
+     * also be called during commit phase of memory transaction, but that
+     * should also only happen when the depth decreases to 0 first.
+     */
+    assert(memory_region_transaction_depth == 0);
     return qatomic_rcu_read(&as->current_map);
 }
 
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bc0be3f62c..7cfcf5dffe 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -37,7 +37,7 @@
 
 //#define DEBUG_UNASSIGNED
 
-static unsigned memory_region_transaction_depth;
+unsigned memory_region_transaction_depth;
 static bool memory_region_update_pending;
 static bool ioeventfd_update_pending;
 unsigned int global_dirty_tracking;
-- 
2.37.3


--jCPHgN2qD0x7grcr--


