Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987762DB3C4
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:32:48 +0100 (CET)
Received: from localhost ([::1]:45092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpF7v-0000vG-Kp
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kpEZj-0006Rv-GS
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kpEZh-00020N-7o
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608055044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NVHSw98Fk2e0k0Tks1NpbMkvfdMNBonhoxN6qjDhoUw=;
 b=iTlV7ZtFB6Bs1H227ErImGWnqAAj9UR7Wmbi908y+6tCxYNbumkcKT3Q8N3NTd1bG+OYX2
 SsmhnzRu89PARwRqt3q9iSiYN0cIOf5GHv8R8TcOP3bHZSsYPXZT0p2jgHTSOUSTuxf90Q
 VALuK5ccHMyFjhtB6jDAbPviCDc3BDU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-2TIwBLC_MFeZTS3kXVr7OQ-1; Tue, 15 Dec 2020 12:57:22 -0500
X-MC-Unique: 2TIwBLC_MFeZTS3kXVr7OQ-1
Received: by mail-qk1-f198.google.com with SMTP id 189so12264933qko.1
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 09:57:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NVHSw98Fk2e0k0Tks1NpbMkvfdMNBonhoxN6qjDhoUw=;
 b=hJjJoNMWO4hOi9IK6hHuiSVM7JsPUrAA3kQ1ahVfGMEA6rPO10mz4SnlUO9v7FSRt2
 6+UdF4HeRXXnOyn+/SCsv2Q+AmOgrdhSVz3XtQnxC/V0KQGNwm6pq+9BdaRm/bE9O+v3
 QoRqTNKF1D9oxvvq8KRx4yuWvYx+jauJSIgGsjdziJKi0O0IM44uH8Y+HepF3Dn7S7Zy
 7MjyZmq+0+PTYNdvqpBhREKlWjgHgUQW8IyGaj57obyKnA/GUbtwU6zSiNHMn2ewUzYW
 prPwKkC9HQs+bt14RsyBC5nFO34U5AGjScTAUiWNlxTM3TOujVwLqoShQqeFuZcKiEDa
 oPfA==
X-Gm-Message-State: AOAM531V7wdTsSAEyKaTkd2BbixglGnLfM5w+ZbJSk4JspqS13Nf9zN0
 XiSY0ybK/7n/J1rPtP3jKIdV76l4gY05JTfr6NiHEZTcTxTtxQrsgo13C+Bx2yICMzeU/qXJkep
 maC6YhlmkeFaL2xE=
X-Received: by 2002:a37:9b8d:: with SMTP id
 d135mr37695657qke.338.1608055041940; 
 Tue, 15 Dec 2020 09:57:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8bfPuUic5IlFaMqNkLeT2QVRTv2MUhxj5amypjjTNH37ZermwlcZksjXs5Y7lW2zsVq9Skg==
X-Received: by 2002:a37:9b8d:: with SMTP id
 d135mr37695633qke.338.1608055041698; 
 Tue, 15 Dec 2020 09:57:21 -0800 (PST)
Received: from xz-x1 ([142.126.83.202])
 by smtp.gmail.com with ESMTPSA id c28sm9952166qtv.2.2020.12.15.09.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 09:57:21 -0800 (PST)
Date: Tue, 15 Dec 2020 12:57:19 -0500
From: Peter Xu <peterx@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH 1/2] accel: kvm: Fix memory waste under mismatch page size
Message-ID: <20201215175719.GA112585@xz-x1>
References: <20201215071948.23940-1-zhukeqian1@huawei.com>
 <20201215071948.23940-2-zhukeqian1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201215071948.23940-2-zhukeqian1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, jiangkunkun@huawei.com,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 15, 2020 at 03:19:47PM +0800, Keqian Zhu wrote:
> When handle dirty log, we face qemu_real_host_page_size and
> TARGET_PAGE_SIZE. The first one is the granule of KVM dirty
> bitmap, and the second one is the granule of QEMU dirty bitmap.
> 
> Generally speaking, qemu_real_host_page_size >= TARGET_PAGE_SIZE,
> so misuse TARGET_PAGE_SIZE to init kvmslot dirty_bmap may waste
> memory. For example, when qemu_real_host_page_size is 64K and
> TARGET_PAGE_SIZE is 4K, this bugfix can save 93.75% memory.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
>  accel/kvm/kvm-all.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index baaa54249d..c5e06288eb 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -620,8 +620,12 @@ static void kvm_memslot_init_dirty_bitmap(KVMSlot *mem)
>       * too, in most cases).
>       * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
>       * a hope that sizeof(long) won't become >8 any time soon.
> +     *
> +     * Note: the granule of kvm dirty log is qemu_real_host_page_size.
> +     * And mem->memory_size is aligned to it (otherwise this mem can't
> +     * be registered to KVM).
>       */
> -    hwaddr bitmap_size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
> +    hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
>                                          /*HOST_LONG_BITS*/ 64) / 8;

Yes I think this is correct.  Thanks.

So one thing I failed to notice is cpu_physical_memory_set_dirty_lebitmap()
will "amplify" the host dirty pages into guest ones; seems we're all good then.

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


