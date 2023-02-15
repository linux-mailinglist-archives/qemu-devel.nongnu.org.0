Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FD3698188
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:03:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSL9E-0005sr-UU; Wed, 15 Feb 2023 12:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSL8m-0005hz-Qf
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:00:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSL8k-0001q8-Hb
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:00:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676480417;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bDU/P7wneOx04CPdvwJJ4LAnZskVRXyFGBA0ki4AnOo=;
 b=TdfKOHJ0nMYYhGHQK+f1N3dro7aIY5+dlPjSlBHYLLT8wVpnj3cb9MOyRuKBBUJJjAMEzD
 +ZpNGAWCTEATdls/meb6NSV89h58w1TRCZERlJYdnK7uGWfsT55HxmJM7w+zSDjxv84D39
 IDhWLt/wE+RTkLwr0kSja4ure9gxR4o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-126-fRevmsTFMVKPvfKu90Cf-w-1; Wed, 15 Feb 2023 12:00:15 -0500
X-MC-Unique: fRevmsTFMVKPvfKu90Cf-w-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg9-20020a05600c3c8900b003e1e7d3db06so1438484wmb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDU/P7wneOx04CPdvwJJ4LAnZskVRXyFGBA0ki4AnOo=;
 b=FyVOHMvI4SyEmLpqMWlHRlHaz4AZWQzvvwI79YWFe7cOKQdGjRqHsLn9xWsghs9cxV
 Apq11BJA5DgPiBB84ZVyELAWPVUZAcZ74ty34x8vDqXjs1Eaj+NrUDMiBPuaNc98GFXY
 gmWW1jDeweVtKinIb2IfX9H3QHrVjBpUJmf4Z4wNIS3O5Z9I3GAvzQ9Ehs6bm+kFCB4s
 TihASVpYIHZsrMQBC17t3gTjB1URSo8scITVwdVUTAJFciF6KZaT0MbFsUdokNhy/Yl/
 /8HRP/uUGnarh1eFHZcAtJaF8LAFKsGHI9D80t4tEHBbQJ8Gcd9jreFgwlk05MbzE4kP
 O4PA==
X-Gm-Message-State: AO0yUKV+3ddKzNnvuGOn93HimM1kaRgbN5U8EUavfXiGQzl+XpoaQGwH
 rhG3AIOTF39lUy1Tbp1KTxoXtqDiz7JLRSGGsaqBr9jgTvIIOc4NbleegxZdoRDhhGBBNu9WYhg
 SVwv5K5Co1uI0Qu0=
X-Received: by 2002:a05:600c:3506:b0:3df:e21f:d705 with SMTP id
 h6-20020a05600c350600b003dfe21fd705mr3119288wmq.28.1676480414537; 
 Wed, 15 Feb 2023 09:00:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+xZSUVV8LLfppwCn20zHS6YnvgAzlIf06sYY/nmcGk1QvCOuCZ9koIskOoIxuKhq0fW0n2Cg==
X-Received: by 2002:a05:600c:3506:b0:3df:e21f:d705 with SMTP id
 h6-20020a05600c350600b003dfe21fd705mr3119265wmq.28.1676480414273; 
 Wed, 15 Feb 2023 09:00:14 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003dc3f07c876sm3135090wms.46.2023.02.15.09.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 09:00:13 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Chuang Xu <xuchuangxclwt@bytedance.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com,  pbonzini@redhat.com,
 peterx@redhat.com,  david@redhat.com,  philmd@linaro.org,
 zhouyibo@bytedance.com
Subject: Re: [RFC v5 0/3] migration: reduce time of loading non-iterable
 vmstate
In-Reply-To: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com> (Chuang
 Xu's message of "Tue, 17 Jan 2023 19:55:08 +0800")
References: <20230117115511.3215273-1-xuchuangxclwt@bytedance.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 18:00:12 +0100
Message-ID: <87ilg227ab.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Chuang Xu <xuchuangxclwt@bytedance.com> wrote:
> In this version:
>
> - rename rcu_read_locked() to rcu_read_is_locked().
> - adjust the sanity check in address_space_to_flatview().
> - improve some comments.

queued series.

>
> The duration of loading non-iterable vmstate accounts for a significant
> portion of downtime (starting with the timestamp of source qemu stop and
> ending with the timestamp of target qemu start). Most of the time is spent
> committing memory region changes repeatedly.
>
> This patch packs all the changes to memory region during the period of	
> loading non-iterable vmstate in a single memory transaction. With the
> increase of devices, this patch will greatly improve the performance.
>
> Here are the test1 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 16-queue vhost-net device
>   - 16 4-queue vhost-user-blk device.
>
> 	time of loading non-iterable vmstate     downtime
> before		about 150 ms			  740+ ms
> after		about 30 ms			  630+ ms
>
> (This result is different from that of v1. It may be that someone has 
> changed something on my host.., but it does not affect the display of 
> the optimization effect.)
>
>
> In test2, we keep the number of the device the same as test1, reduce the 
> number of queues per device:
>
> Here are the test2 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 8 1-queue vhost-net device
>   - 16 1-queue vhost-user-blk device.
>
> 	time of loading non-iterable vmstate     downtime
> before		about 90 ms			 about 250 ms
>
> after		about 25 ms			 about 160 ms
>
>
>
> In test3, we keep the number of queues per device the same as test1, reduce 
> the number of devices:
>
> Here are the test3 results:
> test info:
> - Host
>   - Intel(R) Xeon(R) Platinum 8260 CPU
>   - NVIDIA Mellanox ConnectX-5
> - VM
>   - 32 CPUs 128GB RAM VM
>   - 1 16-queue vhost-net device
>   - 1 4-queue vhost-user-blk device.
>
> 	time of loading non-iterable vmstate     downtime
> before		about 20 ms			 about 70 ms
> after		about 11 ms			 about 60 ms
>
>
> As we can see from the test results above, both the number of queues and 
> the number of devices have a great impact on the time of loading non-iterable 
> vmstate. The growth of the number of devices and queues will lead to more 
> mr commits, and the time consumption caused by the flatview reconstruction 
> will also increase.
>
> Please review, Chuang.
>
> [v4]
>
> - attach more information in the cover letter.
> - remove changes on virtio_load.
> - add rcu_read_locked() to detect holding of rcu lock.
>
> [v3]
>
> - move virtio_load_check_delay() from virtio_memory_listener_commit() to 
>   virtio_vmstate_change().
> - add delay_check flag to VirtIODevice to make sure virtio_load_check_delay() 
>   will be called when delay_check is true.
>
> [v2]
>
> - rebase to latest upstream.
> - add sanity check to address_space_to_flatview().
> - postpone the init of the vring cache until migration's loading completes. 
>
> [v1]
>
> The duration of loading non-iterable vmstate accounts for a significant
> portion of downtime (starting with the timestamp of source qemu stop and
> ending with the timestamp of target qemu start). Most of the time is spent
> committing memory region changes repeatedly.
>
> This patch packs all the changes to memory region during the period of
> loading non-iterable vmstate in a single memory transaction. With the
> increase of devices, this patch will greatly improve the performance.
>
> Here are the test results:
> test vm info:
> - 32 CPUs 128GB RAM
> - 8 16-queue vhost-net device
> - 16 4-queue vhost-user-blk device.
>
> 	time of loading non-iterable vmstate
> before		about 210 ms
> after		about 40 ms


