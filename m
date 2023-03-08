Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E77E6B03BB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 11:09:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZqiu-0003PO-1k; Wed, 08 Mar 2023 05:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZqir-0003Mo-A9
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:08:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZqio-0002Ac-MJ
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678270113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jRbr6rX1i6av5xluwyddvDK+VC94vzlw8h4Y29mrAJA=;
 b=WeLLhI37OmQcFgm8ROLXdwX8Xgx1VOOT4IzIs3C6dNGH5Ev36GFlznigzK8ih48v4V9Fjq
 PeGxfA5AlSHY9pUwcyscrOyIYVMV1xWD7suaP0ZyewMWh4uSy+MAHzek/6jg0cril1fTs6
 v+ifGRhrvaA4bN48YFqSzA82fVEfyEQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-Q0GKA4tKO3aw4x1YirOYGQ-1; Wed, 08 Mar 2023 05:08:32 -0500
X-MC-Unique: Q0GKA4tKO3aw4x1YirOYGQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l14-20020a5d526e000000b002cd851d79b2so2726444wrc.5
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 02:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678270111;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jRbr6rX1i6av5xluwyddvDK+VC94vzlw8h4Y29mrAJA=;
 b=K1MdaWkyYoBGCcaVzZvpBsvcAZEEtGZFaY475ermiJtoi0M5qcKUAgmhIaC+9SvrOx
 c05VNcr7PskcbrgGOQCWv9VoinQS5ciyEGm1OKg+4ZxtcBaAJ9nkWsctLTh9jwdMEtxX
 eBKTMkifB1dJIkFcP9wFz4Dobtxjo3q3+izQjC7LXvT72h3nQI2Cg01weVHtEAJlNQO8
 PSOTEN78d6a8SJkkN/LmLkWGGygg8rKLdXyLgxzWGV1T0pHyD3l9cBbn5h3nev+r5BvP
 GRaBOmtZWxbgJaxGNWb6wrWoSosUp96E0F3uomc/Mf29XLtLOz9qN7CX+cAyViAXR6Ho
 o1BA==
X-Gm-Message-State: AO0yUKU7oRwA9+cl3qHv1AjrTNRd4w/JyojV2NtYB+gqKJWgJs3+NsdE
 H6lXd6H12Qpzdc4UZig5li3yhv16bJiJ9+QhbQFe3kprmdO/1LQtpKcw0IWB8d0lb5XAh2eC/bs
 Zr4nnOfW8MKbEMK8=
X-Received: by 2002:a05:600c:3506:b0:3e2:153e:6940 with SMTP id
 h6-20020a05600c350600b003e2153e6940mr15743877wmq.3.1678270110924; 
 Wed, 08 Mar 2023 02:08:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8rpvCR3N0Q+FBXhiCyPlQUBKt9Bv2SWgMSiHNpKYmJzykir0isMpdrJNjs+Vv3gbRgB+BK7w==
X-Received: by 2002:a05:600c:3506:b0:3e2:153e:6940 with SMTP id
 h6-20020a05600c350600b003e2153e6940mr15743858wmq.3.1678270110573; 
 Wed, 08 Mar 2023 02:08:30 -0800 (PST)
Received: from ?IPV6:2003:cb:c71b:cb00:d372:1da8:9e9e:422d?
 (p200300cbc71bcb00d3721da89e9e422d.dip0.t-ipconnect.de.
 [2003:cb:c71b:cb00:d372:1da8:9e9e:422d])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a1c7408000000b003ebf9e36cd6sm1815770wmc.26.2023.03.08.02.08.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 02:08:30 -0800 (PST)
Message-ID: <ae206750-0b6a-b63a-4e04-eedb7f0f944d@redhat.com>
Date: Wed, 8 Mar 2023 11:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 0/2] vhost: memslot handling improvements
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230217091959-mutt-send-email-mst@kernel.org>
 <20230307121404.20239e1f@imammedo.users.ipa.redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230307121404.20239e1f@imammedo.users.ipa.redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07.03.23 12:14, Igor Mammedov wrote:
> On Fri, 17 Feb 2023 09:20:27 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>> On Thu, Feb 16, 2023 at 12:47:50PM +0100, David Hildenbrand wrote:
>>> Following up on my previous work to make virtio-mem consume multiple
>>> memslots dynamically [1] that requires precise accounting between used vs.
>>> reserved memslots, I realized that vhost makes this extra hard by
>>> filtering out some memory region sections (so they don't consume a
>>> memslot) in the vhost-user case, which messes up the whole memslot
>>> accounting.
>>>
>>> This series fixes what I found to be broken and prepares for more work on
>>> [1]. Further, it cleanes up the merge checks that I consider unnecessary.
>>>
>>> [1] https://lkml.kernel.org/r/20211027124531.57561-8-david@redhat.com
>>>
>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>
>>
>> Igor worked on memslots a lot previously and he asked for
>> a bit of time to review this, so I'll wait a bit before
>> applying.
> 
> I've reviewed it as much as I could.
> (That said, vhost mem map code was mostly rewritten by dgilbert,
> since the last time I've touched it, so his review would be
> more valuable in this case than mine)

Thanks for the review! I'll resend (extending the patch description) and 
will move patch #1 last, so we can decide if we want to leave that 
broken in corner cases.

-- 
Thanks,

David / dhildenb


