Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E406ACF83
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 21:50:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZHlD-0004yR-MO; Mon, 06 Mar 2023 15:48:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZHlB-0004xy-C7
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 15:48:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pZHl9-0007EH-5f
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 15:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678135716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=efomZ32Hv7DfiVUU3NJ/4iTpl3ELamjuioNhKyvskNM=;
 b=LmwBY9jiBuP/WlzINGvTuwKxr01RtsevrDbHnNEqp6VV5s0Uvuf8v4Vdmink0YsIFqWaf3
 Tf9xbhlbj94NJi4SwRFUedogZFXynG/Ng4tAIV+wrsIt656gmeJbHFRhIishMNAZWe3Wgk
 0aicg7viGXct+mKMvD48jlj0bWEXj4U=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-PD4sndxuNEa0BnsYFuLYTA-1; Mon, 06 Mar 2023 15:48:34 -0500
X-MC-Unique: PD4sndxuNEa0BnsYFuLYTA-1
Received: by mail-qk1-f199.google.com with SMTP id
 ou5-20020a05620a620500b007423e532628so6140812qkn.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 12:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678135714;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=efomZ32Hv7DfiVUU3NJ/4iTpl3ELamjuioNhKyvskNM=;
 b=53f+8Vj4SpxxEr/PoL2SpBhv09ZFdSfx7VZ6C41acJVA6uPc77aDMdHZjh1igrJBlU
 DrMaK6BtgROS/Ys1RM/4Aknh+PKghQmuUqKKZWMPHGEJZx+GnnhT1I2aD/SL6oVA2nMe
 +y9O4PS+aKgi4kbfp+KizBTHVjwPv3zPIF2eN6JyooboiGJ5iABJ9t0x9dk+NkZFIGTz
 GcJrDiAX6uFW9Rvb6871sQUVGnUblSG6KJWtynx5uE0kdeXLkC0DjROLcbqAo7QW+A7b
 Sue9Q0Wk7RcAgS8cyFn+Bhv/dzhO25FHM/LKrQIxK0PzAxqZUDJ1AccTB8smP5m6shvP
 XhaA==
X-Gm-Message-State: AO0yUKWnZWsbTX+aUYhpDIf9BuHw+enaYI+/6ScLpnZZQF+kTV9ThJG9
 Fruuzqltsy5e2TWpdWz6YsCgwGsxkymkSNKFMKY0skv1/352SED3CpzAEpuLqRLjqqCueepmAU4
 HWgsof68mj4jS9rs=
X-Received: by 2002:ac8:4e49:0:b0:3bf:c458:5bac with SMTP id
 e9-20020ac84e49000000b003bfc4585bacmr23623763qtw.0.1678135714194; 
 Mon, 06 Mar 2023 12:48:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9XESvpm5bzqLLXQFwR/Xbs5uQuNcX8MhfEekKjZ0vZJLSe7vEQHmsHCsSvkUns+OBbHz7fJg==
X-Received: by 2002:ac8:4e49:0:b0:3bf:c458:5bac with SMTP id
 e9-20020ac84e49000000b003bfc4585bacmr23623732qtw.0.1678135713823; 
 Mon, 06 Mar 2023 12:48:33 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 f17-20020a05620a15b100b006fbb4b98a25sm8072112qkk.109.2023.03.06.12.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 12:48:32 -0800 (PST)
Date: Mon, 6 Mar 2023 15:48:31 -0500
From: Peter Xu <peterx@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com,
 pbonzini@redhat.com, david@redhat.com, philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [PATCH RESEND v6 0/5] migration: reduce time of loading
 non-iterable vmstate
Message-ID: <ZAZRn9eNG1TEoEl1@x1n>
References: <20230303105655.396446-1-xuchuangxclwt@bytedance.com>
 <ZAUSPo9bJO0udf9p@x1n>
 <1ea4db90-7535-1dc3-a2ae-d44113a24e29@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0BGcET7Jaij+0Xrp"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ea4db90-7535-1dc3-a2ae-d44113a24e29@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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


--0BGcET7Jaij+0Xrp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 06, 2023 at 08:48:05PM +0800, Chuang Xu wrote:
> Hi, Peter,
> 
> On 2023/3/6 上午6:05, Peter Xu wrote:
> > Hi, Chuang,
> > 
> > On Fri, Mar 03, 2023 at 06:56:50PM +0800, Chuang Xu wrote:
> > > Sorry to forget to update the test results in the last patch of v6.
> > > 
> > > In this version:
> > > 
> > > - add peter's patch.
> > > - split mr_do_commit() from mr_commit().
> > > - adjust the sanity check in address_space_to_flatview().
> > > - rebase to latest upstream.
> > > - replace 8260 with 8362 as testing host.
> > > - update the latest test results.
> > > 
> > > Here I list some cases which will trigger do_commit() in address_space_to_flatview():
> 
> I ran qtest cases and used systemtap to trace those do_commit().
> 
> > > 
> > > 1.virtio_load->virtio_init_region_cache
> > > 2.virtio_load->virtio_set_features_nocheck
> > What is this one specifically?  I failed to see quickly why this needs to
> > reference the flatview.
> 
> 0x560f3bb26510 : memory_region_transaction_do_commit+0x0/0x1c0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bb26e45 : address_space_get_flatview+0x95/0x100 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bb296b6 : memory_listener_register+0xf6/0x300 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3baec59f : virtio_device_realize+0x12f/0x1a0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bbb3b1f : device_set_realized+0x2ff/0x660 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bbb6ec6 : property_set_bool+0x46/0x70 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bbb9173 : object_property_set+0x73/0x100 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bbbc1ef : object_property_set_qobject+0x2f/0x50 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bbb93e4 : object_property_set_bool+0x34/0xa0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3b9830d9 : virtio_pci_realize+0x299/0x4e0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3b901204 : pci_qdev_realize+0x7e4/0x1090 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bbb3b1f : device_set_realized+0x2ff/0x660 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bbb6ec6 : property_set_bool+0x46/0x70 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bbb9173 : object_property_set+0x73/0x100 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bbbc1ef : object_property_set_qobject+0x2f/0x50 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bbb93e4 : object_property_set_bool+0x34/0xa0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3b99e4a0 : qdev_device_add_from_qdict+0xb00/0xc40 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3bac0c75 : virtio_net_set_features+0x385/0x490 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3baec238 : virtio_set_features_nocheck+0x58/0x70 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x560f3baf1e9e : virtio_load+0x33e/0x820 [/data00/migration/qemu-open/build/qemu-system-x86_64]

I think this one can also be avoided.  Basically any memory listener
related op can avoid referencing the latest flatview because even if it's
during depth>0 it'll be synced again when depth==0.

> 
> > 
> > > 3.vapic_post_load
> > Same confusion to this one..
> 
> 0x557a57b0e510 : memory_region_transaction_do_commit+0x0/0x1c0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x557a57b0e9b5 : memory_region_find_rcu+0x2e5/0x310 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x557a57b11165 : memory_region_find+0x55/0xf0 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x557a57a07638 : vapic_prepare+0x58/0x250 [/data00/migration/qemu-open/build/qemu-system-x86_64]
> 0x557a57a07a7b : vapic_post_load+0x1b/0x80 [/data00/migration/qemu-open/build/qemu-system-x86_64]

AFAIU this one is the other one that truly need to reference the latest
flatview; the other one is (5) on AHCI.  It's a pity that it uses
memory_region_find_rcu() even if it must already have BQL so it's kind of
unclear (and enforced commit should never need to happen with RCU
logically..).

> 
> > 
> > > 4.tcg_commit
> > This is not enabled if kvm is on, right?
> 
> Yes.
> 
> I obtained these results from qtests. And some qtests enabled tcg.😁
> 
> > 
> > > 5.ahci_state_post_load
> > > 
> > > During my test, virtio_init_region_cache() will frequently trigger
> > > do_commit() in address_space_to_flatview(), which will reduce the
> > > optimization  effect of v6 compared with v1.
> > IIU above 1 & 4 could leverage one address_space_to_flatview_rcu() which
> > can keep the old semantics of address_space_to_flatview() by just assert
> > rcu read lock and do qatomic_rcu_read() (e.g., tcg_commit() will run again
> > at last stage of vm load).  Not sure how much it'll help.
> 
> This can really improve the performance of the existing patch, which is
> basically the same as that of v1, but it needs to add address_space_to_flatview_rcu()
> and address_space_get_flatview_rcu(). I have also considered this, but will
> others find it confusing? Because there will be to_flatview(), to_flatview_raw()
> and to_flatview_rcu()..

Why do we need address_space_get_flatview_rcu()?  I'm not sure whether you
mean the two calls in memory listener add/del, if so would you consider a
fixup that I attached in this reply and squash it into patch 1 of mine?  I
assume that'll also remove case (2) above, and also remove the need to have
address_space_get_flatview_rcu().

Having address_space_to_flatview_rcu() alone is fine to me (which is
actually the original address_space_to_flatview).  Again IMHO it should
only be called in the case where a stall flatview doesn't hurt.

> 
> > 
> > You may also want to have a look at the other patch to optimize ioeventfd
> > commit here; I think that'll also speed up vm load but not sure how much
> > your series can further do upon:
> > 
> > https://lore.kernel.org/all/20230228142514.2582-1-longpeng2@huawei.com/
> > 
> > Thanks,
> 
> Here are the latest test results:
> 
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8362 CPU
>   - Mellanox Technologies MT28841
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 16-queue vhost-net device
>   - 16 4-queue vhost-user-blk device.
> 
> 			time of loading non-iterable vmstate
> before		 			112 ms
> long's patch applied			103 ms
> my patch applied	 	 	 44 ms
> both applied		 	 	 39 ms
> add as_to_flat_rcu			 19 ms

The result is useful.  Thanks a lot.

-- 
Peter Xu

--0BGcET7Jaij+0Xrp
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-fixup-memory-Reference-as-current_map-directly-in-me.patch"

From b293489af25030ee2d643eeb388828ed928ed7dc Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Mon, 6 Mar 2023 15:31:08 -0500
Subject: [PATCH] fixup! memory: Reference as->current_map directly in memory
 commit

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 softmmu/memory.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 213496802b..4744b7e5e8 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2973,8 +2973,7 @@ static void listener_add_address_space(MemoryListener *listener,
             listener->log_global_start(listener);
         }
     }
-
-    view = address_space_get_flatview(as);
+    view = address_space_to_flatview_raw(as);
     FOR_EACH_FLAT_RANGE(fr, view) {
         MemoryRegionSection section = section_from_flat_range(fr, view);
 
@@ -2988,7 +2987,6 @@ static void listener_add_address_space(MemoryListener *listener,
     if (listener->commit) {
         listener->commit(listener);
     }
-    flatview_unref(view);
 }
 
 static void listener_del_address_space(MemoryListener *listener,
@@ -3000,7 +2998,7 @@ static void listener_del_address_space(MemoryListener *listener,
     if (listener->begin) {
         listener->begin(listener);
     }
-    view = address_space_get_flatview(as);
+    view = address_space_to_flatview_raw(as);
     FOR_EACH_FLAT_RANGE(fr, view) {
         MemoryRegionSection section = section_from_flat_range(fr, view);
 
@@ -3014,7 +3012,6 @@ static void listener_del_address_space(MemoryListener *listener,
     if (listener->commit) {
         listener->commit(listener);
     }
-    flatview_unref(view);
 }
 
 void memory_listener_register(MemoryListener *listener, AddressSpace *as)
-- 
2.39.1


--0BGcET7Jaij+0Xrp--


