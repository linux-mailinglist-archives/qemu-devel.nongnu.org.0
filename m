Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446402E00D9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 20:19:53 +0100 (CET)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krQim-00028v-Bv
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 14:19:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krQfJ-0001JP-KQ
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:16:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1krQfB-0001Af-G4
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608578167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cLWmpR0pU6gPUUCk6VjVnVeROgxQIzAPWeqIYQ0RYw4=;
 b=MK7EBiWQKPg/3r03wDZ2p+PJ7B8cBV9phLizFG8CcWrmdtvHD1Jiij8QAMF0Mxcn3tMx6l
 hV+TkmZ8v6pQEN0mmghpIXRUkzhNDymwBI5Az9iejOLERA5KQhSlk5b32YG+K+D4WtmaWE
 caO3feSRUdM0DsQFgMxu24B5P3g8lKE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-pxoSTU_wNyes_geeUUK8ow-1; Mon, 21 Dec 2020 14:16:03 -0500
X-MC-Unique: pxoSTU_wNyes_geeUUK8ow-1
Received: by mail-ej1-f69.google.com with SMTP id gs3so4437609ejb.5
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 11:16:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cLWmpR0pU6gPUUCk6VjVnVeROgxQIzAPWeqIYQ0RYw4=;
 b=odpJsSFLNgvsGJwQSv85Z3dMVPFHjzz1m10KtszEiEumzSd6Ej9BobV0rdaVjHBGQb
 zE02KDjgkWDaaO9mLWMu5MQ3qACgxyHJFmzkAk96Nq+jXTLdWdtdT+kqGf5SLnQCKvdv
 T9ZKsY157RiexUCGHreGbnvCBL7SV6ov+jtxhd7UUSV5nigw5na+UxkSluO58cbl04Lk
 hTwZPGxo0v2W5L/1Z9IV9MrX6q0BOR4HDk38Jd7ViPCGSLf1yT3S5YM6EK8KiMrMpFdQ
 YjoIcFUII+FqoD7B27MohKhQXWiYFDkPhgoVVwPhKgtoo9SU7mmMo47vrcvn1C9nB/bu
 eTaQ==
X-Gm-Message-State: AOAM5325vMPdh/EGOop508XIJfaS9pmeZ5MoG/rkb1i4XfHY34T+9cZ5
 Byu8yAaWvz25gp2GlM3Ub4ybp//II0krn045L6IzaIs3+L2xY4SrGS0v9nYycOHVzzJu/cyfUpp
 zovgPqtEc+/nCbf8=
X-Received: by 2002:a17:906:38c8:: with SMTP id
 r8mr16916401ejd.39.1608578162634; 
 Mon, 21 Dec 2020 11:16:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4mcYyK2FvjEk6mBRqVUvZTLdjFC2uTrYkSUpgaz5kAe4KeGbsrW6OjQ3vEgHTa3aV2fgPOw==
X-Received: by 2002:a17:906:38c8:: with SMTP id
 r8mr16916387ejd.39.1608578162473; 
 Mon, 21 Dec 2020 11:16:02 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t26sm9407943eji.22.2020.12.21.11.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Dec 2020 11:16:01 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
 <4d4b1f60-98b6-6a41-42e7-685b2059da4c@redhat.com>
 <e3932dd6-545b-f329-f88f-e8c9694fc35e@ilande.co.uk>
 <20201218223250.GW3140057@habkost.net>
 <750e98b8-4e7b-f912-f06b-d2b835cc6113@redhat.com>
 <20201221185420.GA6040@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: QOM address space handling
Message-ID: <caf04038-213b-a88e-0dd7-ee294c0459b7@redhat.com>
Date: Mon, 21 Dec 2020 20:16:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201221185420.GA6040@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/12/20 19:54, Eduardo Habkost wrote:
> On Sun, Dec 20, 2020 at 10:25:25AM +0100, Paolo Bonzini wrote:
>> On 18/12/20 23:32, Eduardo Habkost wrote:
>>> Who owns the FlatView reference, exactly?
>>
>> The AddressSpace.  The device creates the AddressSpace, which holds a
>> reference to the MemoryRegion through FlatView and AddressSpaceDispatch,
>> which holds a reference to the device.
>>
>> By destroying the address space that it created, the device can break the
>> reference loop.
>>
>>> If the FlatView reference is owned by the MemoryRegion, we have a
>>> reference loop: the device holds a reference to the MemoryRegion,
>>> which owns the FlatView, which holds a reference to the device.
>>> In this case, who owns the reference loop and is responsible for
>>> breaking it?
>>
>> The reference loop is owned by the device, which breaks it through unrealize
>> (called by unparent).
>>
>> instance_finalize by definition cannot break reference loops, so this means
>> that my suggestion of using address_space_init in instance_init was wrong.
> 
> Once we fix that, I suggest we add an assertion to make it
> illegal to call object_ref() on an object during instance_init.

It's not necessarily illegal.  You can for example call a function that 
internally does

     object_ref(obj);
     oc->func(obj);
     object_unref(obj);

But perhaps we could assert that refcount == 1 on exit.

> Do we know how many address_space_init() calls in instance_init
> we have today?

I can see them in raven_pcihost_initfn, in sun4?_iommu.c's iommu_init 
and xtensa_cpu_initfn, I think that's all.

Paolo


