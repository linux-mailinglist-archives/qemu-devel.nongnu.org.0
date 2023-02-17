Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AD769AE09
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 15:28:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT1i9-0004HW-Vi; Fri, 17 Feb 2023 09:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pT1i7-0004Go-3w
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:27:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pT1i5-0001lf-Bq
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 09:27:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676644056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8IDAHozSQAq5Te5pDPGDk57dSzPaMhfhqtig8qome8=;
 b=NTiSy0C+o+7XaqQJvo81LhUno2ggUwRUoykcfcnWE2UodFt2jzVx8P/qYXVKYd0xkBIHOl
 5Oa9iOGzqVkyI05e0k0kKTnFda+cvDuh6ck9N7vx7xjgLd/bYn6DUTWqNMNaDG7vz9v5nt
 RiP+notGtcd5hpSUT6ad8CJqfZp/6zE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-GoiZSPs_NLi6pftbHxF-tw-1; Fri, 17 Feb 2023 09:27:34 -0500
X-MC-Unique: GoiZSPs_NLi6pftbHxF-tw-1
Received: by mail-wm1-f72.google.com with SMTP id
 ja7-20020a05600c556700b003dc51c95c6aso292966wmb.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 06:27:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V8IDAHozSQAq5Te5pDPGDk57dSzPaMhfhqtig8qome8=;
 b=OylActXqXASZM4DNslxL+mSzYthLSuWn9BxBqs9UwU5tpo1WQewOWmGHt+9Y6tP6as
 nQWZewN1xLMciMbszLZRGcYy9lLhahl5Kc4GB8Vp0U1qkQIxaJug9eBSZrWrKFnlF7nm
 tnlM/G+KnTb6SMhDT/6hobg4USsVo2dTV5VcrA0r2vS/IfuDyZRv04pw/GPwbRjziTdy
 rY4bpu9KnBhq1K1ooJ5hZVRJT+0CcoLfIQ3cSzhciz86sRGozXJZEaiqZ/VgMVgY/IqV
 gVdwHlgz2Wz5I3yQirNAoijs8gqc0Bmt6tKeslA5et/8T3QCoi9CE5QWHXCqEq4pUq0I
 d24g==
X-Gm-Message-State: AO0yUKUjfgH0v3xnvxoTkMb+fnkQY4wLdi5DkZ/Ul+ynhXeNQAeCgBat
 p6/87yZKWf55xI3S4lBJoprTf2ZbFZ02OOMdTFKuTPRlPnZUftkButYAAqRbPvaBwodiXobtoAg
 MUJ2Y2CgquWQ80LY=
X-Received: by 2002:a05:600c:30ca:b0:3df:db2f:66a with SMTP id
 h10-20020a05600c30ca00b003dfdb2f066amr1071907wmn.31.1676644053832; 
 Fri, 17 Feb 2023 06:27:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+KfjwFTz9hGF2sK2c/uyy5c9sVyHgNuNZOr4fZKcHznxqxX+lcJ5MdBKRqYWTi3HTdAxoypA==
X-Received: by 2002:a05:600c:30ca:b0:3df:db2f:66a with SMTP id
 h10-20020a05600c30ca00b003dfdb2f066amr1071894wmn.31.1676644053496; 
 Fri, 17 Feb 2023 06:27:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:9800:59ba:1006:9052:fb40?
 (p200300cbc707980059ba10069052fb40.dip0.t-ipconnect.de.
 [2003:cb:c707:9800:59ba:1006:9052:fb40])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a7bc7d7000000b003e2096da239sm6138580wmk.7.2023.02.17.06.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 06:27:33 -0800 (PST)
Message-ID: <5dab48e3-f6b2-0d7a-fcd5-4eb348591a53@redhat.com>
Date: Fri, 17 Feb 2023 15:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 0/2] vhost: memslot handling improvements
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230216114752.198627-1-david@redhat.com>
 <20230217091959-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230217091959-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.256, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17.02.23 15:20, Michael S. Tsirkin wrote:
> On Thu, Feb 16, 2023 at 12:47:50PM +0100, David Hildenbrand wrote:
>> Following up on my previous work to make virtio-mem consume multiple
>> memslots dynamically [1] that requires precise accounting between used vs.
>> reserved memslots, I realized that vhost makes this extra hard by
>> filtering out some memory region sections (so they don't consume a
>> memslot) in the vhost-user case, which messes up the whole memslot
>> accounting.
>>
>> This series fixes what I found to be broken and prepares for more work on
>> [1]. Further, it cleanes up the merge checks that I consider unnecessary.
>>
>> [1] https://lkml.kernel.org/r/20211027124531.57561-8-david@redhat.com
>>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> 
> Igor worked on memslots a lot previously and he asked for
> a bit of time to review this, so I'll wait a bit before
> applying.

Sure, no need to rush. I'm still working on the other bits of the 
virtio-mem approach.

-- 
Thanks,

David / dhildenb


