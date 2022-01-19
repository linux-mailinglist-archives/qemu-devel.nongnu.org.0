Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA457493B65
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 14:48:58 +0100 (CET)
Received: from localhost ([::1]:55026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nABKN-0002LS-8E
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 08:48:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nAB0X-000804-AJ
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 08:28:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nAB0L-0003Sl-TW
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 08:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642598880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P96KsK8JBpK+GU9Geqb5icosHQlV0AGOtizo9vga+5Q=;
 b=B+k6CUdERtsrw/j6iZCJEfXQHa46DggdjbwFbOk7J43bwBuoL6QbKRhJChWuhFrb7Ao1QJ
 OIAzqfx4hHqaaKqFynXr0p2xoS9O6rIYySsBGjZma0P80hlv9n0EvTInBm/IbYYQkdUZMD
 Uo2ZZepmXfWCvv2XZtz9ZUV3dZg58wY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-tusZ6h_OMD23kqPsmgmD0A-1; Wed, 19 Jan 2022 08:26:46 -0500
X-MC-Unique: tusZ6h_OMD23kqPsmgmD0A-1
Received: by mail-ed1-f71.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso2290693edt.20
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 05:26:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P96KsK8JBpK+GU9Geqb5icosHQlV0AGOtizo9vga+5Q=;
 b=gYjRYAQhEBX1uFTtKzXAIsxj1821HiOQ9nlgfsuAJ20geqh71fWn8pjKEzT+B7om9B
 IVi7FFcRqwNM++KzTHqyP2KwVBa8DS6fH9YVKgAqsealnj1hOm/R4+4qk7bnnWewvq6q
 y975agLtrKYmvKzShEwIpV9CL2z4KI2vhMN2kHyt2dxuCcrHyfxgpo6eR4A30ZAl/IXF
 raECIjt5oqr726ivjNgryibdCobi5/4b7P6kT3bJOuKqZ9U+UhONqPazMWt7fRhjjHN9
 PvLHSPrEx+IDqbdyY9JQkkpHZNevN8THXT16cBdmjPp1+2upDz91yLSbVQnlkC715oDx
 z3Kg==
X-Gm-Message-State: AOAM531wCKX7ybeGZ9IqdohMTwF4qWPMgaGGUK34DP7wnoBb8wiTBcqZ
 2eJpwA5OItfJtGu23OGoYqtaD1nmthNyTZegCCGHQJy4h20Rdf9BqHAsYxZysR7PBrtPGfzWvVX
 z63kgjT8H7zet4Oc=
X-Received: by 2002:a17:907:7b8e:: with SMTP id
 ne14mr24433268ejc.259.1642598805202; 
 Wed, 19 Jan 2022 05:26:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkZEaClWPeypLcRc7vrBZHBYdosssCArP9CGTiw0TURMmCBl6UzgJwgiah7Ampw6PSyKEQXg==
X-Received: by 2002:a17:907:7b8e:: with SMTP id
 ne14mr24433257ejc.259.1642598805041; 
 Wed, 19 Jan 2022 05:26:45 -0800 (PST)
Received: from [10.43.2.56] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id b15sm1243798edd.91.2022.01.19.05.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 05:26:44 -0800 (PST)
Message-ID: <88fe6a24-40d5-0da6-14b1-3b62d9daf0a0@redhat.com>
Date: Wed, 19 Jan 2022 14:26:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/2] virtio-mem: Handle preallocation with migration
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220118150712.139953-1-david@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220118150712.139953-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 16:07, David Hildenbrand wrote:
> While playing with migration of virtio-mem with an ordinary file backing,
> I realized that migration and prealloc doesn't currently work as expected
> for virtio-mem, especially when migrating zeropages or skipping migration
> of some pages.
> 
> In contrast to ordinary memory backend preallocation, virtio-mem
> preallocates memory before plugging blocks to the guest. Consequently,
> when migrating we are not actually preallocating on the destination but
> "only" migrate pages. When migrating the zeropage, we might not end up
> allocating actual backend memory.
> 
> Postcopy needs some extra care, and I realized that prealloc+postcopy is
> shaky in general. Let's at least try to mimic what ordinary
> prealloc+postcopy does: temporarily allocate the memory, discard it, and
> cross fingers that we'll still have sufficient memory when postcopy
> actually tries placing pages.
> 
> For postcopy to work with prealloc=on, we need a matching "requested-size"
> on source and destination, meaning we have to start QEMU on the destination
> with the current "requested-size" on the source. Only that way, we can try
> temporarily allocating the "requested-size" to see if there is a
> fundamental issue. If we detect a mismatch, we don't start postcopy.
> 
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Michal Privoznik <mprivozn@redhat.com>
> 
> David Hildenbrand (2):
>   virtio-mem: Warn if a memory backend with "prealloc=on" is used
>   virtio-mem: Handle preallocation with migration
> 
>  hw/virtio/virtio-mem.c         | 143 +++++++++++++++++++++++++++++++++
>  include/hw/virtio/virtio-mem.h |   6 ++
>  2 files changed, 149 insertions(+)
> 

I don't feel confident to review, but I feel confident enough to test:

Tested-by: Michal Privoznik <mprivozn@redhat.com>

Michal


