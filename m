Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2AA405B26
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 18:44:43 +0200 (CEST)
Received: from localhost ([::1]:46422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mONAI-0003fL-Mf
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 12:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mON9I-0002z9-N2
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mON9H-00056v-2a
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 12:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631205818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M1gKhu3AF1QG0dtKAnZsKhUyFGLiSFdJvc0n2vO70lc=;
 b=R7I95dWtuq+TqZUP95+2s65w8BN/3HBYGiuW+BzHYMigzND/fJtp+e6n1+TveAr71wQv5i
 cQu0kHRzJ3aI5IMIbM+VQ6fVRcmiWjBbN5hqrS5tI7MBNV8kAtIH6gZrxVyHuiURt5+CpK
 bZ+w4kkxgbEzIwvDNGvb3VGbnSkzpuQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-Px-3m1hiNwC9c1gETnQS_g-1; Thu, 09 Sep 2021 12:43:37 -0400
X-MC-Unique: Px-3m1hiNwC9c1gETnQS_g-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so949895wmj.6
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 09:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M1gKhu3AF1QG0dtKAnZsKhUyFGLiSFdJvc0n2vO70lc=;
 b=zkqZKwo7SpLUmcKTuFTDYJWs39L5BcVyWe4/7jLPU8HwFTKO2E//TA6/84J9Sufl4Q
 PD/9DqjRB9dqYrhvQKXC3y1JAnqp9LHk+eY6TvLQFowLUjiYaKWGcwzs3wH/9yDGUOor
 d7Wc+60ix7jLYhB0NiwJ7AbPj5bQEFP0S8G38oPglP6TsHK+nYlX9ybjE5em+K5hO+4n
 fHKXlKwJ4W77Fjw6MAC3zBaLKLYczGHZR18CMk0YLyx+cAY1DNWKIppINQehcYGVjjC4
 OVAqA4Uzf4B5IDKSXsNr+L/E/Q343yBBKORPnBM5OlLfaMAXbaPkeQHt9PbXIEJxhruc
 454g==
X-Gm-Message-State: AOAM532jt5+V+JedI43PEwHwdBgMyP9YkVR74FszLzHfz3E4V8Wg56Ic
 1SXv46nww9dH1WKfknHoJHt5+99Zya2MRC5FLvypiKuXm0KvxaN8kDcpAxZRsV743/ynhqnAJQP
 HhTQ2soqe3yMjkT0=
X-Received: by 2002:a1c:22c3:: with SMTP id i186mr4062578wmi.145.1631205816163; 
 Thu, 09 Sep 2021 09:43:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvshZGufVSeJau+bbaAuh5ZIpZvlwTsE/RpL2IvtfGuJRkN6aiRPv3/9hwKXE2yCglCdZqnA==
X-Received: by 2002:a1c:22c3:: with SMTP id i186mr4062563wmi.145.1631205815927; 
 Thu, 09 Sep 2021 09:43:35 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23fe4.dip0.t-ipconnect.de. [79.242.63.228])
 by smtp.gmail.com with ESMTPSA id e8sm2488813wrc.96.2021.09.09.09.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 09:43:35 -0700 (PDT)
Subject: Re: [PATCH] memory: remove incorrect RCU comment for
 address_space_read()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210909141031.958393-1-stefanha@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <bfb31413-31df-92b8-0bf1-841bcbd0f779@redhat.com>
Date: Thu, 9 Sep 2021 18:43:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210909141031.958393-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.975, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.09.21 16:10, Stefan Hajnoczi wrote:
> Although the doc comment says "Called within RCU critical section" the
> address_space_read() function takes the RCU read lock itself. There is
> no need for the caller to hold an RCU read lock.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Fixes: b2a44fcad74f1cc7a6786d38eba7db12ab2352ba ("address_space_read: address_space_to_flatview needs RCU lock")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/exec/memory.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index c3d417d317..60508a1e19 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2768,7 +2768,7 @@ static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
>    *
>    * Return a MemTxResult indicating whether the operation succeeded
>    * or failed (eg unassigned memory, device rejected the transaction,
> - * IOMMU fault).  Called within RCU critical section.
> + * IOMMU fault).
>    *
>    * @as: #AddressSpace to be accessed
>    * @addr: address within that address space
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


