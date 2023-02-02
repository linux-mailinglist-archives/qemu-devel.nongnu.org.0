Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12039687B86
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXRW-0000t2-SR; Thu, 02 Feb 2023 06:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXQq-0000nq-87
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:07:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNXQo-0000hw-Fh
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675336025;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0hlAwLolgYXBxOgW/0V2gyZWptyHDHr9uh45aanugzU=;
 b=JWJBzWXaACzlet8W/USEBdPHyUx9OTZ7XZ3ZJcSPC1WW1rMwlR4Wh23MEUkdmQB3D8TUSK
 gilGRYBDcdKbzMZW5q0shaVAmc7o5fQiHKPqZRF38X5/VjRYL1fj2zPa78IpzVKd04rcms
 IpvNEFthPuzn+KPPU9U2J8Wx7fMWUFg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-PA0rLSDQMtKYMP6t4av-CQ-1; Thu, 02 Feb 2023 06:07:04 -0500
X-MC-Unique: PA0rLSDQMtKYMP6t4av-CQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 e38-20020a05600c4ba600b003dc434dabbdso2640836wmp.6
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hlAwLolgYXBxOgW/0V2gyZWptyHDHr9uh45aanugzU=;
 b=nqmxxmsGydV/Azm8dt3IkVqyH0xjhN36Oxj7kJyMitA8vaUdwjQJ4MLVlfFXKQ3Q9i
 u6n5K7XQSK5FVNTaqkEpfXrMaysTbobLTz+1A9zj8BM8b8FQrTPSqNLZZnDA2dG/yFkG
 N5UqoAXS4NQf6+0ZGnKsrSg+fJP/e2+OfI5CRSgDxKkCpSK9ARlAKXa5pYe8C2lGCNNS
 NZZ1hGj/3fi0dUKXA2/6gBKu6EcHlEorPSlahSCJq6Uc6lCnJezlqSC2lZJ5c/PnKu2p
 SVDPYDnbC7QfRqz99Wh2oOmLBjV70NazHCYn4Y7DrjHiZ9k9hBssjimJ4BvRaWe6hSG7
 xZTg==
X-Gm-Message-State: AO0yUKWFxUccYfNr5+o2zegT6zA5EyHqchLPEGKylOYEU1mT+77X6Fel
 1BCGRlbFE6/oMUi/xOlngHjTdtofxYyNoxHPjhMpjObn/+eh42pcrAKkqCqnYWAeSkmxb5vCU19
 vvFxRCjh1kFaQKZM=
X-Received: by 2002:a05:600c:1c81:b0:3dc:5987:fe9 with SMTP id
 k1-20020a05600c1c8100b003dc59870fe9mr5390447wms.2.1675336023140; 
 Thu, 02 Feb 2023 03:07:03 -0800 (PST)
X-Google-Smtp-Source: AK7set8TNK/3qzY4QWMAWBGIgBT5ZD1xNVmY5Ng92nzIU3bqltKHbYUMf4VOTBcSmJS9XaDbgfvv9A==
X-Received: by 2002:a05:600c:1c81:b0:3dc:5987:fe9 with SMTP id
 k1-20020a05600c1c8100b003dc59870fe9mr5390425wms.2.1675336022915; 
 Thu, 02 Feb 2023 03:07:02 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c43d400b003daf681d05dsm4247515wmn.26.2023.02.02.03.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:07:02 -0800 (PST)
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
Date: Thu, 02 Feb 2023 12:07:01 +0100
Message-ID: <87a61ws4ve.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

Hi

As on the review, I aggree with the patches, but I am waiting for Paolo
to review the rcu change (that I think that it is trivial, but I am not
the rcu maintainer).

If it happens that you need to send another version, I think that you
can change the RFC for PATCH.

Again, very good job.

Later, Juan.


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


