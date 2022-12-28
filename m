Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D689B65777D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 15:07:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAX4i-0003fD-07; Wed, 28 Dec 2022 09:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pAX4c-0003Yk-Bd
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 09:06:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pAX4Y-00017T-0F
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 09:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672236380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uqA4P/8KFf5DgTfeuilT+Z8Vn+oQqfQojNVKUAZoO1Q=;
 b=MpvUFsZG0taO6VTaTGWvjtMhsCDZj1QtFWaYCpnqxHViVkai/j7dCURRI5NFeUz+oDbcDG
 NPDQOwAA+JrdnlVi914LzJCGffxsNzV62jZ7fw+a74FcZgiJIFVAWYVFo/dLtxBF5+laAM
 K3amhTJfWXHJBsTFLPPkswpqK7L2S64=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-621-hgqATy9_NBeg1CVxU-lZMA-1; Wed, 28 Dec 2022 09:06:19 -0500
X-MC-Unique: hgqATy9_NBeg1CVxU-lZMA-1
Received: by mail-wr1-f69.google.com with SMTP id
 w20-20020adf8bd4000000b00272d0029f18so1599807wra.7
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 06:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uqA4P/8KFf5DgTfeuilT+Z8Vn+oQqfQojNVKUAZoO1Q=;
 b=EPNy9ZE9gwX2cWSJMTh0XwPHwa0MgIDdmJ+BKukEKTQoAgeB+qr/Nn0Jl91iPNnCXW
 Y3/Uzyi4Etiu2f1qIdw7KT/EFCjCkfNM8We1MIhaM/Xd5tSuzzIGhm+NDIqhKr1C9hXl
 dPvKfViBhruOJTbMTS2OKvV6LU4CNA7FfJOWixt9M8bQdwEqqrUhozh++0gexlve+yN0
 /lhxR42BnSsj7T9Dc2YsaPa3Wjpb8x4uV0D2QadlDsYz5/Fd4xpwggIAx13E8OcP4+4R
 jQAasqjZpqx0K+XJpH3HDaC6+v5whf2ib8ReWmrFF98uZQImmkkCdtQyo/F0drFggRF0
 nY0A==
X-Gm-Message-State: AFqh2kqjIG91JK/JBgkgIlUL9OeQ1CSVqa2yo6ujpu8m6xs2eHJcbJGm
 cZqbTkb35fUYTr9RH3Pxx5QlzF7YQo3gEp9spi4arIePiDE1wROFj5SAIHN1t9FLWA4p86Gm0w/
 vUamuMWjAhvmy8WM=
X-Received: by 2002:a05:600c:3d0e:b0:3d1:ee97:980 with SMTP id
 bh14-20020a05600c3d0e00b003d1ee970980mr23093011wmb.7.1672236378159; 
 Wed, 28 Dec 2022 06:06:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvbwJhjS7bN/qNbKEhFeSVQo1kQpJ3mgf2aLhT5M/tZcORR8X6qm/Yz/JwELjhpzo6VBhOB8w==
X-Received: by 2002:a05:600c:3d0e:b0:3d1:ee97:980 with SMTP id
 bh14-20020a05600c3d0e00b003d1ee970980mr23092994wmb.7.1672236377895; 
 Wed, 28 Dec 2022 06:06:17 -0800 (PST)
Received: from ?IPV6:2003:d8:2f16:1800:a9b4:1776:c5d9:1d9a?
 (p200300d82f161800a9b41776c5d91d9a.dip0.t-ipconnect.de.
 [2003:d8:2f16:1800:a9b4:1776:c5d9:1d9a])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c4f5600b003d995a704fdsm2289461wmq.33.2022.12.28.06.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 06:06:17 -0800 (PST)
Message-ID: <6a533ba5-5613-1f96-866a-974530fb10bc@redhat.com>
Date: Wed, 28 Dec 2022 15:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 10/12] virtio-mem: Fix typo in
 virito_mem_intersect_memory_section() function name
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Peter Xu <peterx@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Hui Zhu <teawater@gmail.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>,
 kvm@vger.kernel.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20211027124531.57561-1-david@redhat.com>
 <20211027124531.57561-11-david@redhat.com>
 <8a2fb7aa-316d-b6bc-1e8d-da5678008825@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <8a2fb7aa-316d-b6bc-1e8d-da5678008825@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28.12.22 15:05, Philippe Mathieu-Daudé wrote:
> On 27/10/21 14:45, David Hildenbrand wrote:
>> It's "virtio", not "virito".
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>    hw/virtio/virtio-mem.c | 12 ++++++------
>>    1 file changed, 6 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

I already queued your patch :)

https://github.com/davidhildenbrand/qemu.git mem-next

-- 
Thanks,

David / dhildenb


