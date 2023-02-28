Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA806A5E11
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 18:16:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX3ac-0005zc-MS; Tue, 28 Feb 2023 12:16:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pX3aZ-0005xz-Pe
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:16:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pX3aV-0004zU-JN
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 12:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677604586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLUJVcYg/xF6CLs83TGnMc9OBpblxeR5Rg+jVNT+eKo=;
 b=ctc8qrFCPXU6DmkKwuhgPh/UvohIWFeyvlIlomJrBZ7NiYnR7RyTVBt9BvX0QFChst5GdD
 q79b6z7xbumEljL6KBdoREHk+Jz4BHGMdQrEqZWQpH5DLLVM8utjlZ2pL7gy4t2GMjZzat
 raZ8qkGNctPG9kFjf+VJ4EVrvLFWiZI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-33-fnyxpl_sM-uYT5iwSj9B7Q-1; Tue, 28 Feb 2023 12:16:24 -0500
X-MC-Unique: fnyxpl_sM-uYT5iwSj9B7Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 n6-20020a5d51c6000000b002ca3c48ba46so1537936wrv.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 09:16:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cLUJVcYg/xF6CLs83TGnMc9OBpblxeR5Rg+jVNT+eKo=;
 b=Jqzw9xAuAo5DclOdNiaC6V+KXKy1NEeoXGkuFSDwhSpeGf/TkLAxnJ8f0yMiIhNw0j
 OVzF2GQhPWpW+vF3l8NM7FXiiwxJRVBhEi958BV1YpQ+PAAC/H7tQlRhfmwy+8k2+G6X
 MrGxY1JellGshfyAMXSn73jg5h7nG/a6CGrlDCPmm9bwrgFehG2gx85hO/oV1Bdz5qSm
 5/wbxlBET2z547nE32cs1prEFPX2pMGcfTYPoUgCuoeFOyLG5daOfXwRzSD4xT8qKtsI
 GKaYSEiaMKbydN7pXDLvUkxB1Gf2ZLZXfc00bt2wVe78nrfZpYrsov9aLyCkqcu28rhb
 oh9g==
X-Gm-Message-State: AO0yUKVF2ZvgFjuq2oWJMs5hMUhIJ+xPuNTGi7Kq3OImSwvrMNIUYoHy
 nwj9ygjHCVtWa1K0R3iDIbcdoJ2W2azpBH1u19z9y6yDAmYyHRrJZ5AD0R9iCBBxkwoI+B+Cu8m
 aUPIMwSjC4QRoBps=
X-Received: by 2002:a5d:50c5:0:b0:2c5:8353:e0ec with SMTP id
 f5-20020a5d50c5000000b002c58353e0ecmr2998763wrt.10.1677604583724; 
 Tue, 28 Feb 2023 09:16:23 -0800 (PST)
X-Google-Smtp-Source: AK7set9KZhwEJGZgEluyAd/AgqC6OLbcnJObfvXdK8fvUZ4v7S7cwk8azGPlMDwqkh5PSfRHPUccSA==
X-Received: by 2002:a5d:50c5:0:b0:2c5:8353:e0ec with SMTP id
 f5-20020a5d50c5000000b002c58353e0ecmr2998731wrt.10.1677604583351; 
 Tue, 28 Feb 2023 09:16:23 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac?
 (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de.
 [2003:cb:c706:b800:3757:baed:f95e:20ac])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a5d4cc2000000b002bfd524255esm10168288wrt.43.2023.02.28.09.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 09:16:22 -0800 (PST)
Message-ID: <2018fac3-ac49-5d5a-93b4-298438bf624f@redhat.com>
Date: Tue, 28 Feb 2023 18:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] memory: avoid unnecessary iteration when updating
 ioeventfds
Content-Language: en-US
To: "Longpeng(Mike)" <longpeng2@huawei.com>, pbonzini@redhat.com,
 peterx@redhat.com, philmd@linaro.org, mst@redhat.com, jasowang@redhat.com
Cc: qemu-devel@nongnu.org, eperezma@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com
References: <20230228142514.2582-1-longpeng2@huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230228142514.2582-1-longpeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28.02.23 15:25, Longpeng(Mike) via wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> When updating ioeventfds, we need to iterate all address spaces and
> iterate all flat ranges of each address space. There is so much
> redundant process that a FlatView would be iterated for so many times
> during one commit (memory_region_transaction_commit).
> 
> We can mark a FlatView as UPDATED and then skip it in the next iteration
> and clear the UPDATED flag at the end of the commit. The overhead can
> be significantly reduced.
> 
> For example, a VM with 16 vdpa net devices and each one has 65 vectors,
> can reduce the time spent on memory_region_transaction_commit by 95%.
> 
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>   include/exec/memory.h |  2 ++
>   softmmu/memory.c      | 28 +++++++++++++++++++++++++++-
>   2 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 2e602a2fad..974eabf765 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1093,6 +1093,8 @@ struct FlatView {
>       unsigned nr_allocated;
>       struct AddressSpaceDispatch *dispatch;
>       MemoryRegion *root;
> +#define FLATVIEW_FLAG_IOEVENTFD_UPDATED (1 << 0)
> +    unsigned flags;
>   };
>   
>   static inline FlatView *address_space_to_flatview(AddressSpace *as)
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 9d64efca26..71ff996712 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -815,6 +815,15 @@ FlatView *address_space_get_flatview(AddressSpace *as)
>       return view;
>   }
>   
> +static void address_space_reset_view_flags(AddressSpace *as, unsigned mask)
> +{
> +    FlatView *view = address_space_get_flatview(as);
> +
> +    if (view->flags & mask) {
> +        view->flags &= ~mask;
> +    }

Just do it unconditionally.

Unfortunately, I cannot comment on the bigger picture, but it does look 
good to me.

-- 
Thanks,

David / dhildenb


