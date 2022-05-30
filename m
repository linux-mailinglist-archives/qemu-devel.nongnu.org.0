Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63F6538563
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:50:59 +0200 (CEST)
Received: from localhost ([::1]:52682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvhfW-0007He-L4
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:50:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nvhe6-0006VD-QA
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nvhe3-0004Hq-FW
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653925765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3rYstiXH+DFFxpN0eJSYZFfNb9vwPKdu6j6eGmXRMcc=;
 b=M2cuTkNMQteUJHFEgHcyE+jcpA5EHymk6THJWjRxBeQNvw+Kd5RBbidrImObkV8A/rAmtd
 dB7Wrr/azt/ilBQxc5TKJvQdB6I+5rX7RMUeJ25fJiO8Qhx3CKdZneAEYHTECNNSyLlj0T
 E8no5hIgnFW3e7igApGwel4+ecSMRn0=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-V3QwgW8kNyW3mKD-BdoMYg-1; Mon, 30 May 2022 11:49:24 -0400
X-MC-Unique: V3QwgW8kNyW3mKD-BdoMYg-1
Received: by mail-io1-f71.google.com with SMTP id
 ay41-20020a5d9da9000000b006685ce50214so3130077iob.22
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3rYstiXH+DFFxpN0eJSYZFfNb9vwPKdu6j6eGmXRMcc=;
 b=aE1LdBmkp5wYdv/88UALJSqzE6BojgTqHf9yqdcmU8GUjDdsoKNRO5GxalRjaEK7nf
 CSYmczvIm9Qqa3DvjEJImx7mYXAoPqFj+Hwuo+mkMjQ2S1MNMANuvWV22Eu2/Mrbq1+c
 leMBVdqR//uDTXhTJw0FSsWMTtrrD+Rlmy5d2KXK4Ca8zto7O52+r0Ho4R6KZz3EIVq9
 ovPSzg8Dp7nVND7KbCcBOuAJ5eFgIIzlglbqToEfKpMaR6bVORlqo4fgUHgm4q0P58+W
 2BchbJdLdhMvi0rva4bxJg9Q0wWN1Zheo8+Zp3l5Z0ivmWYBOuZGKk2pkJ3X7o3+XC3o
 6lUw==
X-Gm-Message-State: AOAM530hBk92d+Q7QYM6R1w5uo12XEAyT+fB9N6pWF73WK/diUSFeHdf
 r9avh8NclmQNV42XauRQyiXsgVa3kL0RQrTr2ixhiq7wZ0wO4Rr2mQtz3pcAXqLy1ew1y7jbV1E
 edwH1KgTZdxmwH1w=
X-Received: by 2002:a05:6e02:1c4e:b0:2d1:a8d:e94d with SMTP id
 d14-20020a056e021c4e00b002d10a8de94dmr29213934ilg.194.1653925763930; 
 Mon, 30 May 2022 08:49:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyavXgOOvyHvCgnhXUybuBh2qRd2Dsuuan5kKliX95y7YWU6WnNJ4Q63813uIsXDGIP+OZk1Q==
X-Received: by 2002:a05:6e02:1c4e:b0:2d1:a8d:e94d with SMTP id
 d14-20020a056e021c4e00b002d10a8de94dmr29213912ilg.194.1653925763620; 
 Mon, 30 May 2022 08:49:23 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a926014000000b002cde6e35302sm3764514ilb.76.2022.05.30.08.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:49:22 -0700 (PDT)
Date: Mon, 30 May 2022 11:49:21 -0400
From: Peter Xu <peterx@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: David Hildenbrand <david@redhat.com>, Jue Wang <juew@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, jasowang@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 mst@redhat.com,
 HORIGUCHI =?utf-8?B?TkFPWUEo5aCA5Y+jIOebtOS5nyk=?= <naoya.horiguchi@nec.com>, 
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org
Subject: Re: Re: [PATCH 0/3] recover hardware corrupted page by virtio balloon
Message-ID: <YpTngZ5Qr0KIvL0H@xz-m1.local>
References: <CAPcxDJ5pduUyMA0rf+-aTjK_2eBvig05UTiTptX1nVkWE-_g8w@mail.gmail.com>
 <Yo/I3oLkd9OU0ice@xz-m1.local>
 <24a95dea-9ea6-a904-7c0b-197961afa1d1@bytedance.com>
 <0d266c61-605d-ce0c-4274-b0c7e10f845a@redhat.com>
 <4b0c3e37-b882-681a-36fc-16cee7e1fff0@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4b0c3e37-b882-681a-36fc-16cee7e1fff0@bytedance.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 30, 2022 at 07:33:35PM +0800, zhenwei pi wrote:
> A VM uses RAM of 2M huge page. Once a MCE(@HVAy in [HVAx,HVAz)) occurs, the
> 2M([HVAx,HVAz)) of hypervisor becomes unaccessible, but the guest poisons 4K
> (@GPAy in [GPAx, GPAz)) only, it may hit another 511 MCE ([GPAx, GPAz)
> except GPAy). This is the worse case, so I want to add
>  '__le32 corrupted_pages' in struct virtio_balloon_config, it is used in the
> next step: reporting 512 * 4K 'corrupted_pages' to the guest, the guest has
> a chance to isolate the other 511 pages ahead of time. And the guest
> actually loses 2M, fixing 512*4K seems to help significantly.

It sounds hackish to teach a virtio device to assume one page will always
be poisoned in huge page granule.  That's only a limitation to host kernel
not virtio itself.

E.g. there're upstream effort ongoing with enabling doublemap on hugetlbfs
pages so hugetlb pages can be mapped in 4k with it.  It provides potential
possibility to do page poisoning with huge pages in 4k too.  When that'll
be ready the assumption can go away, and that does sound like a better
approach towards this problem.

> 
> > 
> > I assume when talking about "the performance memory drops a lot", you
> > imply that this patch set can mitigate that performance drop?
> > 
> > But why do you see a performance drop? Because we might lose some
> > possible THP candidates (in the host or the guest) and you want to plug
> > does holes? I assume you'll see a performance drop simply because
> > poisoning memory is expensive, including migrating pages around on CE.
> > 
> > If you have some numbers to share, especially before/after this change,
> > that would be great.
> > 
> 
> The CE storm leads 2 problems I have even seen:
> 1, the memory bandwidth slows down to 10%~20%, and the cycles per
> instruction of CPU increases a lot.
> 2, the THR (/proc/interrupts) interrupts frequently, the CPU has to use a
> lot time to handle IRQ.

Totally no good knowledge on CMCI, but if 2) is true then I'm wondering
whether it's necessary to handle the interrupts that frequently.  When I
was reading the Intel CMCI vector handler I stumbled over this comment:

/*
 * The interrupt handler. This is called on every event.
 * Just call the poller directly to log any events.
 * This could in theory increase the threshold under high load,
 * but doesn't for now.
 */
static void intel_threshold_interrupt(void)

I think that matches with what I was thinking..  I mean for 2) not sure
whether it can be seen as a CMCI problem and potentially can be optimized
by adjust the cmci threshold dynamically.

-- 
Peter Xu


