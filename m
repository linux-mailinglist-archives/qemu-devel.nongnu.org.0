Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA697435B88
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:19:50 +0200 (CEST)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSMf-0004mJ-D3
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdSL1-00046C-Be
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:18:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mdSKy-0005do-6u
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634800682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4n2fEuhkYdCSwAo08wmL8dIP1mB9bPrK17a0a17ZfsY=;
 b=ictEs20D/M7PFcLFo5F0PPbvVbBBGvzETb+SoKO2qaZMBDjKDWo3VrKDGmobMz9gUJo7Bs
 mc5Yto4yPzXuIDgm5/sC86A4GjZjFSZLGHiBUR04k5uBpq9t321H9zCkOB58zonZoc21BP
 Q39MT7hDuYIa995fb7DWbQtP9ZpqSBA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-HcWiDI6JNnaveqXQ7R_yqA-1; Thu, 21 Oct 2021 03:18:00 -0400
X-MC-Unique: HcWiDI6JNnaveqXQ7R_yqA-1
Received: by mail-wr1-f72.google.com with SMTP id
 o14-20020a5d62ce000000b0016747c32105so104274wrv.16
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 00:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=4n2fEuhkYdCSwAo08wmL8dIP1mB9bPrK17a0a17ZfsY=;
 b=dFhsEwmcly3u1ZsHpxWWxUB1aHn6vex2L5YMny9nnmSTp/mQmV2G6WrKZW4thTSZ2u
 BYHi1SxmrK8ubHD66R4E1nBQNTy8zikJIh7TILnKGxFMqIEtlKLfRkOCzc8j1DZBEzl4
 pDX1n4+nlDjNw67ClSJXON+rr6wg5KYDvCG7lf2fqC/ds+bNb987KP4Ov5W3ZoNIHfU5
 6jZRvLPOwnLsPTleguVfF+2cTmKCPMC3pVhO7pr2LexonFl5BbDfnUwHTzsOyHg6l62a
 hpIRNhsMkN0Dv/341RJXDG3ww9Y9o77tFtu35CPSU9k8fiU4OMdwfzxY8kmIPjyxHxj+
 yyhA==
X-Gm-Message-State: AOAM5332V/+beyCmzLlNegIHYLG+KEd5VbFHNtniu+wfhvh/EQgnPSjF
 r9JA2Ml3H1XsYjXXvPxMhBTVewADdu4QHlXBtv5BMznKs7vfzzKlGC7LDCUVU5ohmQlQZnIWYP2
 VuE7CWniZNkVxL+E=
X-Received: by 2002:a05:600c:3b17:: with SMTP id
 m23mr4619162wms.80.1634800679594; 
 Thu, 21 Oct 2021 00:17:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHNc96pTyH7zOM/06V4GLf+10d0SKYNntcSRhrqSuZDVTs7YdHJyiQK+oqY4SK1X8nQUPACw==
X-Received: by 2002:a05:600c:3b17:: with SMTP id
 m23mr4619126wms.80.1634800679276; 
 Thu, 21 Oct 2021 00:17:59 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23aba.dip0.t-ipconnect.de. [79.242.58.186])
 by smtp.gmail.com with ESMTPSA id z5sm8801339wmp.26.2021.10.21.00.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 00:17:58 -0700 (PDT)
Message-ID: <12cdd7f4-16c2-5af8-aeb2-e168506eefc2@redhat.com>
Date: Thu, 21 Oct 2021 09:17:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
To: Peter Xu <peterx@redhat.com>
References: <20210818194217.110451-1-peterx@redhat.com>
 <2817620d-facb-eeee-b854-64193fa4da33@redhat.com>
 <YXDqaZL71DCEghbr@xz-m1.local>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 0/4] vl: Prioritize device realizations
In-Reply-To: <YXDqaZL71DCEghbr@xz-m1.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Yes I should follow this up, thanks for asking.
> 
> Though after Markus and Igor pointed out to me that it's much more than types
> of device and objects to order, I don't have a good way to fix the ordering
> issue for good on all the problems; obviously current solution only applies to
> device class ordering.
> 
> Examples that Markus provided:
> 
> https://lore.kernel.org/qemu-devel/87ilzj81q7.fsf@dusky.pond.sub.org/
> 
> Also there can be inter-dependency issue too for single device class, e.g., for
> pci buses if bus pcie.2 has a parent pci bus of pcie.1, then we must speficy
> the "-device" for pcie.1 before the "-device" of pcie.2, otherwise qemu will
> fail to boot too.
> 
Interesting case :)

> Any of above examples means ordering based on device class can only solve
> partial of the problems, not all.
> 
> And I can buy in with what people worry about on having yet another way to fix
> ordering, since the root issue is still unsettled, even if the current solution
> seems to work for vIOMMU/vfio, and I had a feeling it could work too with the
> virtio-mem issue you're tackling with.

The question is if we need to get it all 100% right from the start. To
me, for example, the single device class issue is a whole different beast.

I know, whenever someone proposes a way to tackle part of a challenging
problem, everybody discovers their hopes and dreams and suddenly you
have to go all the way to solve the complete problem. The end result is
that there is no improvement at all instead of incremental improvement.

> 
> My plan is to move on with what Igor suggested, on using either pre_plug hook
> for vIOMMU to make sure no special devices like vfio are realized before that.
> I think it'll be as silly as a pci bus scan on all the pcie host bridges
> looking for vfio-pci, it can even be put directly into realize() I think as I
> don't see an obvious difference on failing pre_plug() or realize() so far.
> Then I'll just drop this series so the new version may not really help with
> virtio-mem anymore; though not sure virtio-mem can do similar thing.

In case of virtio-mem, we'll already fail properly when realizing the
vhost-* device and figuring out that the memslot limit the device
imposes isn't going to work. So what you would want to have for vIOMMU
is already in place (fail instead of silently continue).

> 
> One step back, OTOH, I do second on what Daniel commented in the other thread
> on leaving that problem to the user; sad to know that we already have pmem
> restriction so hot plugging some device already start to fail, but maybe
> failing is fine as long as nothing will crash? :)

I very much agree.

There are two cases:

1. QEMU failing to start because vhost-* was specified after virtio-mem.
We get an indication that points at the number of memslots. And as the
user explicitly enabled e.g., "max-memslots=0", I think that's fair enough.

2. Hotplug of vhost-* devices failing. We similarly get an indication
that points at the number of memslots. Similarly, I think that's fair
enough. The guest will continue working just fine.

The result of that discussion is that the default should always be
"max-memslots=1" and that users have to opt in manually.

> 
> I also do think it's nice to at least allow the user to specify the exact value
> of virtio-mem slot number without any smart tricks to be played when the user
> wants - I think it's still okay to do automatic detection, but that's already
> part of "policy" not "mechanism" to me so imho it should be better optional,
> and now I had a feeling that maybe qemu should be good enough on providing
> these mechanisms first then we leave the rest of the problems to libvirt, maybe
> that's a better place to do all these sanity checks and doing smart things on
> deciding the slot numbers.  For qemu failing at the right point without
> interrupting the guest seems to be good enough so far.

I'm not planning on letting the user set the actual number of memslots
to use, only an upper limit. But to me, it's fundamentally the same: the
user has to enable this behavior explicitly.

> 
> I think "early failing" seems to not be a problem for virtio-mem already since
> if there's a conflict on the slot number then e.g. vhost-user will already fail
> early, not sure whether it means it's good enough.  For vIOMMU I may need to
> work on the other bus scanning patchset to make sure when vfio is specified
> before vIOMMU then we should fail qemu early, and that's still missing.

Right, thanks!


-- 
Thanks,

David / dhildenb


