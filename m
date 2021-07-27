Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2943C3D7C03
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 19:18:13 +0200 (CEST)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Qia-0007TJ-8C
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 13:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8QbM-0005AY-JK
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:10:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8QbI-0002IQ-Bt
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627405838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Y2i1f06zH9yX3FGNscZWPbf/StPBh+kF9ErhcHhuKc=;
 b=PoGa3NuouotNCsmVjXqbXKVb340e+guVEIYAruMyq0Uq1/u+T6RVnFZ7E5iORLf0N1tsQn
 aPTL/gANQEv7b5wAnWf81R3t6OC3l/Guig2s96YPUSrzohgL5YJ0LWKNUzqFIa6pShjBSe
 NOrsGvRMKOlD1BXZnjn+BG3uO3aPBAE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-k3XdFzyCNeaL4PuQ1fDopw-1; Tue, 27 Jul 2021 13:10:36 -0400
X-MC-Unique: k3XdFzyCNeaL4PuQ1fDopw-1
Received: by mail-qv1-f72.google.com with SMTP id
 15-20020a0562140dcfb02902e558bb7a04so43996qvt.10
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 10:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8Y2i1f06zH9yX3FGNscZWPbf/StPBh+kF9ErhcHhuKc=;
 b=Ti+3790sDUIWGoz1zkbeItfBDXcTETeES6HWgLAife58vlw2QvakgzJ6++BRF5dNQh
 M6tMOXwgAf05LfkJQqGdEmzh1WmavmUm0N2xjma+Cpf6Ey2Y9heJaGb8kiphs2KWrnqb
 x0gyLrGDxhWkvG1c71fibb77hQ/cZfkVAWfGenNUAZMtefkF1qLErIUH1QpEqIIn7y1o
 dLoEIHhH3dBa5Te8XQi1/0LhUbpiP2Qr8nNfvmTaKHEJ5XrE99LzS1XH0zbKADHrRgAW
 oJRJ69XXaTb9oR2VwyjEU4Hvw34W012nWABKP1Vh1T5WJeSf21mOn2gCTeMfCaLU4T3i
 4b7g==
X-Gm-Message-State: AOAM532vtWTipHRxmCt4egHFHZ2xcDv1kttxMXd0cN5179F3GWB4YxLn
 6dFUtmcWb9EbBVq/NcjPDprRKg1p4JxlRymRHiFwepKP7BpqaV/VYon8kcYs4UJ3QT7FEQ4XSou
 xlSZGs8tl2eBEJJg=
X-Received: by 2002:a0c:c981:: with SMTP id b1mr24096563qvk.39.1627405835484; 
 Tue, 27 Jul 2021 10:10:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwB+Sn9J2Uy6qDLqvL2H0RlikPj/No5jbFNJOnLlrkSGQ5ubIX4/FPe8JJr4TFPGkCw2LY+Kg==
X-Received: by 2002:a0c:c981:: with SMTP id b1mr24096532qvk.39.1627405835199; 
 Tue, 27 Jul 2021 10:10:35 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id q3sm1999379qkn.14.2021.07.27.10.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:10:34 -0700 (PDT)
Date: Tue, 27 Jul 2021 13:10:33 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 0/6] migration/ram: Optimize for virtio-mem via
 RamDiscardManager
Message-ID: <YQA+CUCWV4YDdu9C@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <YPlWqs8N+NiFH/yj@work-vm>
 <800e421c-70b8-1ef2-56f7-cdbce7a7706b@redhat.com>
 <YPrqfkCk7EM7QLpa@t490s>
 <ea9e9071-4ecb-9c28-9567-92585a18b4eb@redhat.com>
 <YPtAd+JqfNeQqGib@t490s>
 <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com>
MIME-Version: 1.0
In-Reply-To: <da54f4ab-2f20-a780-1a9c-b6f4c1c50969@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 27, 2021 at 11:25:09AM +0200, David Hildenbrand wrote:
> For 2) I see 3 options:
> 
> a) Sync everything, fixup the dirty bitmap, never clear the dirty log of
> discarded parts. It's fairly simple and straight forward, as I can simply
> reuse the existing helper. Something that's discarded will never be dirty,
> not even if a misbehaving guest touches memory it shouldn't. [this patch]
> 
> b) Sync only populated parts, no need to fixup the dirty bitmap, never clear
> the dirty log of discarded parts. It's a bit more complicated but achieves
> the same goal as a). [optimization I propose for the future]
> 
> c) Sync everything, don't fixup the dirty bitmap, clear the dirty log of
> discarded parts initially. There are ways we still might migrate discarded
> ranges, for example, if a misbehaving guest touches memory it shouldn't.
> [what you propose]
> 
> Is my understanding correct? Any reasons why we should chose c) over b) long
> term or c) over a) short term?

My major concern is we could do something during sync() for not a very good
reason by looping over virtio-mem bitmap for disgarded ranges - IIUC it should
be destined to be merely no-op if the guest is well-behaved, am I right?

Meanwhile, I still have no idea how much overhead the "loop" part could bring.
For a large virtio-mem region with frequent plugged/unplugged mem interacted,
it seems possible to take a while to me..  I have no solid idea yet.

The thing is I still think this extra operation during sync() can be ignored by
simply clear dirty log during bitmap init, then.. why not? :)

Clear dirty bitmap is as simple as "reprotect the pages" functional-wise - if
they are unplugged memory ranges, and they shouldn't be written by the guest
(we still allow reads even for virtio-mem compatibility), then I don't see it
an issue to wr-protect it using clear dirty log when bitmap init.

It still makes sense to me to keep the dirty/clear bitmap in-sync, at least
before your plan b proposal; leaving the dirty bits set forever on unplugged
memory is okay but just sounds a bit weird.

Though my concern is only valid when virtio-mem is used, so I don't have a
strong opinion on it as you maintains virtio-mem. I believe you will always
have a better judgement than me on that. Especially, when/if Dave & Juan have
no problem on that. :)

Thanks,

-- 
Peter Xu


