Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AD55375F3
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 09:51:24 +0200 (CEST)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvaBO-0001Wx-E3
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 03:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nva1q-0005F2-1B
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:41:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nva1o-0000a5-9L
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653896487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ioljxq6PuUu4lxQDlH2MK2dNxIoWh+YwDSpERyNHcYc=;
 b=LRGXoVwAREXrPCfx90D0BjgX77Xc/RNMGPEAME4LCi0Pduhf9UFW8fiy2ITPVsx+R+ltpM
 bPkKa5av2hxSRrl5mrjgK6FHv3skKsyayI8ygpSCO1Xe/vfS6U0t0jb9hRBqTOJnPhKR0z
 63E25nNqQqb1UEmQAmqCpGK7lbwtC7w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-qH_n3dWIOwS9HF4uaeKTAw-1; Mon, 30 May 2022 03:41:26 -0400
X-MC-Unique: qH_n3dWIOwS9HF4uaeKTAw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l34-20020a05600c1d2200b003973a50c1e4so6567474wms.2
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 00:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=Ioljxq6PuUu4lxQDlH2MK2dNxIoWh+YwDSpERyNHcYc=;
 b=KCFBfYVppkkyEXTpLzcyDYYFxUZLn18JPjXeWge/ibQ9lQuadB7LiVwLxtx3I4x03t
 xEe5qzL9rhNYriGR/THJAR0+Ms6vBY+kuO7M0cPJVRmFPvQHBtf+oQ1f1HlrtZS59D0A
 MhRSRIuml1J+80voGHmokWveMjKHqYlsCPgaEH8+ZDgvcQrMWjZVlSVilInVfjVihzvC
 COqFH2GH1R463pxq502QmS4LBRAuAncET8kHgqOmLxghSj8f31CPG7vm9d3QiywdrA7q
 Qr7vHr2OuFu8D2GGmlK81dhdSPugapiW2CxcZmi2H6q3KLKGo2JzbJ1PI97wKDHcnLmx
 SElg==
X-Gm-Message-State: AOAM5320bFBeWzP7jMUinT1xrXXKwnVbmeqgN+f9YVdbshG5yykVnDil
 nOAkh8IFoBt3xMQ3nON8cphJgoFK9V2uqhHoW/CVUMoWI6CEr/Vq9SFGKO+SEq6oRa7weTr2Jk5
 2f2DczitQ8tODsCo=
X-Received: by 2002:a05:6000:144f:b0:20f:d6e8:a54 with SMTP id
 v15-20020a056000144f00b0020fd6e80a54mr30927456wrx.482.1653896483878; 
 Mon, 30 May 2022 00:41:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygmIHMNmIMibGNEd206s8mAH/2ItntHqoVW3Fp9CPDeipNv0CP+C+hoSkZ/LeN5Ih++u+6aA==
X-Received: by 2002:a05:6000:144f:b0:20f:d6e8:a54 with SMTP id
 v15-20020a056000144f00b0020fd6e80a54mr30927434wrx.482.1653896483573; 
 Mon, 30 May 2022 00:41:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736?
 (p200300cbc7047c00aaa92ce55aa0f736.dip0.t-ipconnect.de.
 [2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a7bc929000000b003974a3af623sm9688836wml.17.2022.05.30.00.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 00:41:23 -0700 (PDT)
Message-ID: <0d266c61-605d-ce0c-4274-b0c7e10f845a@redhat.com>
Date: Mon, 30 May 2022 09:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: zhenwei pi <pizhenwei@bytedance.com>, Peter Xu <peterx@redhat.com>,
 Jue Wang <juew@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, jasowang@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 mst@redhat.com, =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?=
 <naoya.horiguchi@nec.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org
References: <CAPcxDJ5pduUyMA0rf+-aTjK_2eBvig05UTiTptX1nVkWE-_g8w@mail.gmail.com>
 <Yo/I3oLkd9OU0ice@xz-m1.local>
 <24a95dea-9ea6-a904-7c0b-197961afa1d1@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 0/3] recover hardware corrupted page by virtio balloon
In-Reply-To: <24a95dea-9ea6-a904-7c0b-197961afa1d1@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27.05.22 08:32, zhenwei pi wrote:
> On 5/27/22 02:37, Peter Xu wrote:
>> On Wed, May 25, 2022 at 01:16:34PM -0700, Jue Wang wrote:
>>> The hypervisor _must_ emulate poisons identified in guest physical
>>> address space (could be transported from the source VM), this is to
>>> prevent silent data corruption in the guest. With a paravirtual
>>> approach like this patch series, the hypervisor can clear some of the
>>> poisoned HVAs knowing for certain that the guest OS has isolated the
>>> poisoned page. I wonder how much value it provides to the guest if the
>>> guest and workload are _not_ in a pressing need for the extra KB/MB
>>> worth of memory.
>>
>> I'm curious the same on how unpoisoning could help here.  The reasoning
>> behind would be great material to be mentioned in the next cover letter.
>>
>> Shouldn't we consider migrating serious workloads off the host already
>> where there's a sign of more severe hardware issues, instead?
>>
>> Thanks,
>>
> 
> I'm maintaining 1000,000+ virtual machines, from my experience:
> UE is quite unusual and occurs randomly, and I did not hit UE storm case 
> in the past years. The memory also has no obvious performance drop after 
> hitting UE.
> 
> I hit several CE storm case, the performance memory drops a lot. But I 
> can't find obvious relationship between UE and CE.
> 
> So from the point of my view, to fix the corrupted page for VM seems 
> good enough. And yes, unpoisoning several pages does not help 
> significantly, but it is still a chance to make the virtualization better.
> 

I'm curious why we should care about resurrecting a handful of poisoned
pages in a VM. The cover letter doesn't touch on that.

IOW, I'm missing the motivation why we should add additional
code+complexity to unpoison pages at all.

If we're talking about individual 4k pages, it's certainly sub-optimal,
but does it matter in practice? I could understand if we're losing
megabytes of memory. But then, I assume the workload might be seriously
harmed either way already?


I assume when talking about "the performance memory drops a lot", you
imply that this patch set can mitigate that performance drop?

But why do you see a performance drop? Because we might lose some
possible THP candidates (in the host or the guest) and you want to plug
does holes? I assume you'll see a performance drop simply because
poisoning memory is expensive, including migrating pages around on CE.

If you have some numbers to share, especially before/after this change,
that would be great.

-- 
Thanks,

David / dhildenb


