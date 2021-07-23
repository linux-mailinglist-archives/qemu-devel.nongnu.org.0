Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D031D3D4074
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 20:58:06 +0200 (CEST)
Received: from localhost ([::1]:36844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m70N3-0007Vi-Tb
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 14:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m70M4-0006pf-GZ
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 14:57:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m70M2-0001kR-65
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 14:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627066620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iO9wr2/qSAlInyjIfzRrXV+VMqCsTspz6Qe/oEohpbU=;
 b=CmS5cV66Pt+tEjAsq8uAmIuvefUSWHbY0jE/viW00Eel5KRRYlUpGlX4yySvswiqO3ryPw
 cn0mrUwcFNGhz8hLNZHbPl09qxwvSTp1uxYyoOfliWY/BWqsrErGv0mI6g8u+ah82IfsOj
 5CGIS27C6Xo8Fi2Efww19MF2tgqh9oI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-eD9e_JjXNou4H9wClPud9A-1; Fri, 23 Jul 2021 14:56:57 -0400
X-MC-Unique: eD9e_JjXNou4H9wClPud9A-1
Received: by mail-wr1-f71.google.com with SMTP id
 p12-20020a5d68cc0000b02901426384855aso1295650wrw.11
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 11:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iO9wr2/qSAlInyjIfzRrXV+VMqCsTspz6Qe/oEohpbU=;
 b=QUBZZWIXE0FmkO/bQ8q/SRVExoelcUThBPB1SBBYAUpoW7fzT95WRSMEEt41DoGfGr
 H0iucLld0NdcphPlFoD/ymbHa7kDlcUfnfUrawke4KyWsp+BPJKW/s4tf2G3AlQEh7Fa
 A3edp1YqLPqdmjzRBhxHJrrg0MGuwPtaMN32DZs90gEXybqLAsTgVBHmX1V9HgaLq4Yx
 rkprVqEEiQVrfKhC1SjC8YuSYvPiGEbTb5G8OWgn2s47UyYag4TQP30D56zkZmwppirv
 RrgfWfx1nAcOJ72TruVg6nvsbtuNjEJUaa+xcBPOaAKKnB31uI7UshNEte8NGDCHu5sD
 DDVA==
X-Gm-Message-State: AOAM533wvokd8AzWZybSzy16Nbj3nGMc8jzGeifGU4UCeOZITJDRFog9
 TV3Ms7/kaLIrXthPBNR9VrBPLRAtE4dCcgEEFvNc9VfZukDKRGf/KB8//ge/A1Dt0EoDtUFHYtq
 jjhW3x0Xj5q/ZHVQ=
X-Received: by 2002:a1c:4b0d:: with SMTP id y13mr5769614wma.142.1627066616083; 
 Fri, 23 Jul 2021 11:56:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfAVejo1BxdukkvYqak/wT7qgApWRD07HBMOx+P27DZSwrrEPhDpISv4aZjd6QZn/Gv9eHyA==
X-Received: by 2002:a1c:4b0d:: with SMTP id y13mr5769597wma.142.1627066615824; 
 Fri, 23 Jul 2021 11:56:55 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c676e.dip0.t-ipconnect.de. [91.12.103.110])
 by smtp.gmail.com with ESMTPSA id e11sm41585496wrt.0.2021.07.23.11.56.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 11:56:55 -0700 (PDT)
To: Peter Xu <peterx@redhat.com>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-6-david@redhat.com> <YPrgEXkl2wsXYs03@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH resend v2 5/5] softmmu/memory_mapping: optimize for
 RamDiscardManager sections
Message-ID: <32088854-3df2-cdc8-0a1a-ce6cf2289adb@redhat.com>
Date: Fri, 23 Jul 2021 20:56:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPrgEXkl2wsXYs03@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> 
> As I've asked this question previously elsewhere, it's more or less also
> related to the design decision of having virtio-mem being able to sparsely
> plugged in such a small granularity rather than making the plug/unplug still
> continuous within GPA range (so we move page when unplug).

Yes, in an ideal world that would be optimal solution. Unfortunately, 
we're not living in an ideal world :)

virtio-mem in Linux guests will as default try unplugging 
highest-to-lowest address, and I have on my TODO list an item to shrink 
the usable region (-> later, shrinking the actual RAMBlock) once possible.

So virtio-mem is prepared for that, but it will only apply in some cases.

> 
> There's definitely reasons there and I believe you're the expert on that (as
> you mentioned once: some guest GUPed pages cannot migrate so cannot get those
> ranges offlined otherwise), but so far I still not sure whether that's a kernel
> issue to solve on GUP, although I agree it's a complicated one anyway!

To do something like that reliably, you have to manage hotplugged memory 
in a special way, for example, in a movable zone.

We have a at least 4 cases:

a) The guest OS supports the movable zone and uses it for all hotplugged
    memory
b) The guest OS supports the movable zone and uses it for some
    hotplugged memory
c) The guest OS supports the movable zone and uses it for no hotplugged
    memory
d) The guest OS does not support the concept of movable zones


a) is the dream but only applies in some cases if Linux is properly 
configured (e.g., never hotplug more than 3 times boot memory)
b) will be possible under Linux soon (e.g., when hotplugging more than 3 
times boot memory)
c) is the default under Linux for most Linux distributions
d) Is Windows

In addition, we can still have random unplug errors when using the 
movable zone, for example, if someone references a page just a little 
too long.

Maybe that helps.

> 
> Maybe it's a trade-off you made at last, I don't have enough knowledge to tell.

That's the precise description of what virtio-mem is. It's a trade-off 
between which OSs we want to support, what the guest OS can actually do, 
how we can manage memory in the hypervisor efficiently, ...

> 
> The patch itself looks okay to me, there's just a slight worry on not sure how
> long would the list be at last; if it's chopped in 1M/2M small chunks.

I don't think that's really an issue: take a look at 
qemu_get_guest_memory_mapping(), which will create as many entries as 
necessary to express the guest physical mapping of the guest virtual (!) 
address space with such chunks. That can be a lot :)



-- 
Thanks,

David / dhildenb


