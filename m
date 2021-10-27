Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323F43C108
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 05:56:45 +0200 (CEST)
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfa3Q-0005mz-K2
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 23:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfa0w-0003Ja-K2
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 23:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfa0q-0001eH-Oh
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 23:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635306840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c1A9SpErqwV8DiCwlNUlAMho0ZWXy+0jGmOMtms+pJo=;
 b=VVp/Uv/NOAtxjnUruArSveTlsAbGEra+YLkEftV22DTEG8OLMcs7e3fXLe5lNhtW1i1uPf
 OPrjEjXBqupcY/XIKYpcoUi8gLPKGNc8FgfqVflqrqQluWy9FPwRFy9QfLD/+phxH0ImgD
 EZ17jq1tmL3mMmaAGyyVB9evyuT2yJg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-lFgKxTP5OfKHviSUwrx7jw-1; Tue, 26 Oct 2021 23:53:59 -0400
X-MC-Unique: lFgKxTP5OfKHviSUwrx7jw-1
Received: by mail-pg1-f199.google.com with SMTP id
 d6-20020a63d646000000b00268d368ead8so875189pgj.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 20:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c1A9SpErqwV8DiCwlNUlAMho0ZWXy+0jGmOMtms+pJo=;
 b=LYUthz5Yi4fhURzfHJQC/gaMg9qM1skUQls6ca30zJawWF4AahEHyDcEfmwZqmgXMr
 OZKL4OfInNpgWjKmLNbkgRgdIv3h7DylqW8G576yLYwStgMbwRYkkmXJawqRChxVdFzK
 zv6YCRJC8PVsax2jSqYFzXY8gfsir7Dn/IG8u27IYpVgCnJVSoziYakllqsODgnX0td4
 FMFb/4apaW1VmVZDZwo75DLX5tq4QOb0R/p38omSD/FipHWLyQ7OzTevg6hk3YuQ/bTH
 HyjoDjITy7fS+IZ9FWX7b87mdQgNzZGdZbQevwFK17dfo8xshxSRSVZ7nDOiIHQnoNP3
 bkgw==
X-Gm-Message-State: AOAM532+Gup5s8Jq5p/N5hr9WB7tbUE7t8Q4TBAkd5ONm/4LzDnr2Dcb
 GrM2716sLOuxf/NHWbDBtAVt71tHXysPrX5sWd2ti0tzwEVC6CC3zxcFS4ZgDIxFNVMC6Sk34mC
 WkLyG74oXPiBw5T8=
X-Received: by 2002:a17:902:c60b:b0:13f:59f9:db90 with SMTP id
 r11-20020a170902c60b00b0013f59f9db90mr25434620plr.37.1635306838328; 
 Tue, 26 Oct 2021 20:53:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl19VKsLa3k+yeA3yfFSgnols7SEhc2TtHsag19WIxoLP9wIinjCqYUD+nnfAFiR9k/0grng==
X-Received: by 2002:a17:902:c60b:b0:13f:59f9:db90 with SMTP id
 r11-20020a170902c60b00b0013f59f9db90mr25434607plr.37.1635306837960; 
 Tue, 26 Oct 2021 20:53:57 -0700 (PDT)
Received: from xz-m1.local ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id 11sm23479519pfl.41.2021.10.26.20.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 20:53:57 -0700 (PDT)
Date: Wed, 27 Oct 2021 11:53:52 +0800
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/3] memory: memory_region_is_mapped() cleanups
Message-ID: <YXjNULIsRufbyRZX@xz-m1.local>
References: <20211026160649.47545-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211026160649.47545-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 26, 2021 at 06:06:46PM +0200, David Hildenbrand wrote:
> This is the follow-up of [1].
> 
> Playing with memory_region_is_mapped(), I realized that memory regions
> mapped via an alias behave a little bit "differently", as they don't have
> their ->container set.

The patches look ok to me, though I have a few pure questions to ask..

> * memory_region_is_mapped() will never succeed for memory regions mapped
>   via an alias

I think you mentioned that in commit message of patch 2 that it fixes no real
problem so far, so I'm also wondering in which case it'll help.  Say, normally
when there's an alias of another MR and we want to know whether the MR is
mapped, we simply call memory_region_is_mapped() upon the alias .

To verify my thoughts, I did look up a few memory_region_is_mapped() random
callers that used with alias and that's what they did:

Here'sthe dino.c example:

*** hw/hppa/dino.c:
gsc_to_pci_forwarding[151]     if (!memory_region_is_mapped(mem)) {
gsc_to_pci_forwarding[155]     } else if (memory_region_is_mapped(mem)) {

The "mem" points to:

        MemoryRegion *mem = &s->pci_mem_alias[i];

Which is the alias.

Another one:

*** hw/pci-host/pnv_phb3.c:
pnv_phb3_check_m32[121]        if (memory_region_is_mapped(&phb->mr_m32)) {
pnv_phb3_update_regions[1076]  if (memory_region_is_mapped(&phb->mr_m32)) {

Andmr_m32 is the alias MR itself:

    memory_region_init_alias(&phb->mr_m32, OBJECT(phb), "phb3-m32",
                             &phb->pci_mmio, start, size);

I mean, if it should always be very straightforward to fetch the alias mr, then
I'm just afraid patch 2 won't really help in any real use case but pure overhead.

And I hope we won't trigger problem with any use case where
memory_region_is_mapped() returned false previously but then it'll return true
after patch 2, because logically with the old code one can detect explicitly on
"whether this original MR is mapped somewhere, irrelevant of other alias
mappings upon this mr".  Patch 2 blurrs it from that pov.

> * memory_region_to_address_space(), memory_region_find(),
>   memory_region_find_rcu(), memory_region_present() won't work, which seems
>   okay, because we don't expect such memory regions getting passed to these
>   functions.

Looks right.

> * memory_region_to_absolute_addr() will result in a wrong address. As
>   the result is only used for tracing, that is tolerable.

memory_region_{read|write}_accessor() seem to be only called from the address
space layer, so it looks fine even for tracing as it'll always fetch the alias,
afaiu.  Phil's patch may change that fact, though, it seems.

Thanks,

-- 
Peter Xu


