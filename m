Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0D368F023
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 14:50:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPkof-0001w3-MX; Wed, 08 Feb 2023 08:48:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pPkod-0001tF-70
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:48:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pPkob-0005UT-AL
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 08:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675864120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6xGRznFLY9AO29VwdYeaQruVHBl1v76YNKmz0OVNrA=;
 b=CfpDBHD1Xy+mb4dPEQ+E2JuvVOdcCjwvwlxEdssegVXGhdFxrNvGWrA9QBgIJsh31lMQNk
 lqHcCLZmHaQzLUBJhQF0Bej7mUKqdSmZuydPhfC+0GJeGUyy7Cc3OweSH8kYpx8e9qH6nu
 oB7rKVkwXldrV22rKmlEJwDiFnftpYI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-252-wlZ0Bp0IObOPzCKGbU34IA-1; Wed, 08 Feb 2023 08:48:39 -0500
X-MC-Unique: wlZ0Bp0IObOPzCKGbU34IA-1
Received: by mail-wr1-f70.google.com with SMTP id
 bo19-20020a056000069300b002c406934513so55062wrb.14
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 05:48:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6xGRznFLY9AO29VwdYeaQruVHBl1v76YNKmz0OVNrA=;
 b=1AlI676F+ARPiTY2Syb1/ha6dyfK15Hr+J1uawItt22vg4Hmor2NABxa/VnnvGFYrC
 wJUqKVKmx9yjfa6IGzYAuqgG+C0w/w3LxIysfz3iTwAVm50KACubQLT6qzatxUeLaymP
 kVqDOZFBBZ6IiFAMIcnVGezbXuwgT4l4x/dVXRadqoO35t+YWJG0t3IWICUDgensewGm
 7W91apitjhb/0Yoe6Clk5qw0+0ZoDimqZ2qoptUoC7T34BOYHiUzN901IFWjj76m7BiK
 TaTVwZ7Yi5rOlZBvgsgqVw2zandJBYs0Yt3WDMG0fitA3nGKEiopfJAx02hJxvwO6ZVI
 5n6w==
X-Gm-Message-State: AO0yUKUK7vehh6vEr4K8nNvKflg78CenTeqmK7ZDit9tRzGsWHrzFw2d
 g2C3yepQGq+47VPc3/tp0rKC9dBl/ArWbQiqXcYqmcjQJCpTiE6sj1c5bj6zW46Swy9iCZXyoqp
 LvMznRwGoC5MEtPU=
X-Received: by 2002:a5d:490d:0:b0:2bf:d3ef:4c4 with SMTP id
 x13-20020a5d490d000000b002bfd3ef04c4mr5993544wrq.52.1675864117887; 
 Wed, 08 Feb 2023 05:48:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/uYFw9KdwGjMKkpdUoMkaQCELwzrkxml8Ce3TaIPCVpXOJFViGU9sMXYoTSxQ4SRCLs2i6zg==
X-Received: by 2002:a5d:490d:0:b0:2bf:d3ef:4c4 with SMTP id
 x13-20020a5d490d000000b002bfd3ef04c4mr5993527wrq.52.1675864117571; 
 Wed, 08 Feb 2023 05:48:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:b300:758c:6214:cd51:8ab0?
 (p200300cbc704b300758c6214cd518ab0.dip0.t-ipconnect.de.
 [2003:cb:c704:b300:758c:6214:cd51:8ab0])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a5d43d2000000b002c3dd9bb283sm11209976wrr.37.2023.02.08.05.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 05:48:37 -0800 (PST)
Message-ID: <f5de0749-f60a-bd0e-033b-a23de5619b3a@redhat.com>
Date: Wed, 8 Feb 2023 14:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH V2] memory: flat section iterator
To: Steven Sistare <steven.sistare@oracle.com>, Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <1675796609-235681-1-git-send-email-steven.sistare@oracle.com>
 <Y+KwNN9v81aLKct2@x1n> <d2cf4bae-1a45-d2ae-8f47-f4ce56cf21dd@oracle.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <d2cf4bae-1a45-d2ae-8f47-f4ce56cf21dd@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07.02.23 22:28, Steven Sistare wrote:
> On 2/7/2023 3:10 PM, Peter Xu wrote:
>> On Tue, Feb 07, 2023 at 11:03:29AM -0800, Steve Sistare wrote:
>>> Add an iterator over the sections of a flattened address space.
>>> This will be needed by cpr to issue vfio ioctl's on the same memory
>>> ranges that are already programmed.
>>
>> Should this better be proposed with the context of using it?  Or I don't
>> know how to justify this new interface is needed.
>>
>> For example, any explanations on why memory region listeners cannot work?
> 
> For context, the new interfaces is used in the patch
>    "vfio-pci: recover from unmap-all-vaddr failure"
> in the original live update series:
>    https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
> 
> More succinctly, the memory region listeners already ran, and the vfio
> callbacks created vfio memory regions.  Now we want to perform live update,
> and are in steady state, so no listeners are being called.  We need the
> flat section iterator to reproduce the same addresses and extents that were
> produced by the listeners, to make a state change on each distinct vfio
> memory region.

Would a "replay" functionality on a registered memory notifier 
eventually be cleaner?

-- 
Thanks,

David / dhildenb


