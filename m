Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABE53D42FB
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 00:34:37 +0200 (CEST)
Received: from localhost ([::1]:55310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m73kY-0003mU-Fj
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 18:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m73jZ-000389-4E
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 18:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m73jV-0003rq-Ev
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 18:33:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627079607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pDHnbAclK85QNKGyz0Tal6kk4PCjEmoWd+ywmB6UvjA=;
 b=bQydi5/L4ICnk+tlpwhqHKOOQB117lWpfgomTZjrRchPF4KUUAa0VoJV9H5ZYNxvpx2Gv+
 9lk2fBRMB2JAA8CJeOG4kaLOH3G6hCb0dkrQ7lAmR/LRVnFNDLHuR5z+zmmN0y5jD7J6/K
 KqkihPDPkRzGkhmLrtPbvVObp+VreVo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-eSBQTp0ZMLGAgCJSFE2bZw-1; Fri, 23 Jul 2021 18:33:24 -0400
X-MC-Unique: eSBQTp0ZMLGAgCJSFE2bZw-1
Received: by mail-qv1-f69.google.com with SMTP id
 hf7-20020a0562140e87b02902dc988b8675so2769261qvb.3
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 15:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pDHnbAclK85QNKGyz0Tal6kk4PCjEmoWd+ywmB6UvjA=;
 b=U3x49hjZMzzbbEk+BGurFeQ1+aVV3ZDr/6/PUNq2W9X56NRWefxtU6pUl5Qs0Dfo4G
 e3hqeNHAFbpoHut2aJ9yer6C4xikmI2IqYariFsxZkNqplEzEfule4bHCxYKNu8J3dE2
 TvcoxlFPfuE6IWeiD6S/9yq5HJNFmHimVIViG+uQE506Srv4YJezypyzG9VcF4bzzCyb
 4DOarTB3a7UPWCpD+CNwEwmp6j2bTWKqAyqO9Yhl1XwFN+qPjNTBn3/06kWIeffAe/Fs
 WFD/gZ2YfRvng5nhS0nJyT4RfrIdy+0wf09enzuPPQyAGPk07m2as6nNhf7O9HT1PsGc
 7CXw==
X-Gm-Message-State: AOAM532rUWFHgXHZk4zrdYMDLvZAW6pSQ1SvJou2zkT357n92zXNpmuj
 CkcZGyhdsaJxPar/cQ7Y5TB5x0RptHCPhJHOssdoD2K1l5N8hClaWqqYdsfdMpRXDghEC/cbczH
 WUbC8dhfnAQA00OI=
X-Received: by 2002:a37:9ace:: with SMTP id c197mr6569075qke.461.1627079604113; 
 Fri, 23 Jul 2021 15:33:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+L8DLMYTqWlriwZzBmry2HAcL7pwgJBqRPaDMNm2tf1/JEY0IHDCwvgH7WEB87sFx10DV8Q==
X-Received: by 2002:a37:9ace:: with SMTP id c197mr6569042qke.461.1627079603891; 
 Fri, 23 Jul 2021 15:33:23 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id c2sm12283646qtw.30.2021.07.23.15.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 15:33:22 -0700 (PDT)
Date: Fri, 23 Jul 2021 18:33:21 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 5/5] softmmu/memory_mapping: optimize for
 RamDiscardManager sections
Message-ID: <YPtDsQxJcy4Am2wG@t490s>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-6-david@redhat.com> <YPrgEXkl2wsXYs03@t490s>
 <32088854-3df2-cdc8-0a1a-ce6cf2289adb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <32088854-3df2-cdc8-0a1a-ce6cf2289adb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 08:56:54PM +0200, David Hildenbrand wrote:
> > 
> > As I've asked this question previously elsewhere, it's more or less also
> > related to the design decision of having virtio-mem being able to sparsely
> > plugged in such a small granularity rather than making the plug/unplug still
> > continuous within GPA range (so we move page when unplug).
> 
> Yes, in an ideal world that would be optimal solution. Unfortunately, we're
> not living in an ideal world :)
> 
> virtio-mem in Linux guests will as default try unplugging highest-to-lowest
> address, and I have on my TODO list an item to shrink the usable region (->
> later, shrinking the actual RAMBlock) once possible.
> 
> So virtio-mem is prepared for that, but it will only apply in some cases.
> 
> > 
> > There's definitely reasons there and I believe you're the expert on that (as
> > you mentioned once: some guest GUPed pages cannot migrate so cannot get those
> > ranges offlined otherwise), but so far I still not sure whether that's a kernel
> > issue to solve on GUP, although I agree it's a complicated one anyway!
> 
> To do something like that reliably, you have to manage hotplugged memory in
> a special way, for example, in a movable zone.
> 
> We have a at least 4 cases:
> 
> a) The guest OS supports the movable zone and uses it for all hotplugged
>    memory
> b) The guest OS supports the movable zone and uses it for some
>    hotplugged memory
> c) The guest OS supports the movable zone and uses it for no hotplugged
>    memory
> d) The guest OS does not support the concept of movable zones
> 
> 
> a) is the dream but only applies in some cases if Linux is properly
> configured (e.g., never hotplug more than 3 times boot memory)
> b) will be possible under Linux soon (e.g., when hotplugging more than 3
> times boot memory)
> c) is the default under Linux for most Linux distributions
> d) Is Windows
> 
> In addition, we can still have random unplug errors when using the movable
> zone, for example, if someone references a page just a little too long.
> 
> Maybe that helps.

Yes, thanks.

> 
> > 
> > Maybe it's a trade-off you made at last, I don't have enough knowledge to tell.
> 
> That's the precise description of what virtio-mem is. It's a trade-off
> between which OSs we want to support, what the guest OS can actually do, how
> we can manage memory in the hypervisor efficiently, ...
> 
> > 
> > The patch itself looks okay to me, there's just a slight worry on not sure how
> > long would the list be at last; if it's chopped in 1M/2M small chunks.
> 
> I don't think that's really an issue: take a look at
> qemu_get_guest_memory_mapping(), which will create as many entries as
> necessary to express the guest physical mapping of the guest virtual (!)
> address space with such chunks. That can be a lot :)

I'm indeed a bit surprised by the "paging" parameter.. I gave it a try, the
list grows into tens of thousands.

One last question: will virtio-mem still do best-effort to move the pages, so
as to grant as less holes as possible?

Thanks,

-- 
Peter Xu


