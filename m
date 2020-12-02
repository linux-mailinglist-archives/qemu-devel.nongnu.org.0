Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E532CBA54
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:17:48 +0100 (CET)
Received: from localhost ([::1]:57846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPCl-0006Uu-Bw
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkOSt-0003AX-Qr
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:30:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkOSr-0004ig-SN
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606901420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GplfJdRuQOzTd1uczkgdPAB2U+yMIn1m5Vg3mtW/dmg=;
 b=SsM6KCIL/5SRN2FPaGxkx9EDF/ou915LZ4uD7yRh3lGtSNL3kN+Y+F06I7DTBYF4Pl2HT/
 Bo8NaAgzj1glbvaM24sHBRQcmDQXt3qQDDrPaoqQJJ+dWu9UPyO8mvcAnMstiI7ooYD9ZL
 zh2QpcMijnu2le62ZvGTcrc/4aCzsGM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-8wiiehncOnWqbTAa3TQYew-1; Wed, 02 Dec 2020 04:30:16 -0500
X-MC-Unique: 8wiiehncOnWqbTAa3TQYew-1
Received: by mail-ed1-f72.google.com with SMTP id g1so2243300edk.0
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 01:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GplfJdRuQOzTd1uczkgdPAB2U+yMIn1m5Vg3mtW/dmg=;
 b=k58LTN7Do5iRy+Qq+8vwZsZV897n5o+Ay2fZvtIPr74xJKyDARtVLmJtEYly9ODfz9
 MsqAogyEjp05o9mYg/oOTYdKkNbjoXPdrLgy8c7cYrU/e72ceoxLimWV5chFK8X8zs+x
 Ny1cKLXlY6KTyw6CBrc0hc5STiTAXeFhAtNneR8FijDPAQ0bfYbT/Rathrggf5VBLKcu
 s1HCD/sD1WsnXvobwaN/0dLpsfOpulBfeLX+X/1pAq3gRx8OmC2aWNZ/aI0ScBqDkHpu
 pT7QhMYFwabEZEGG2X3PN3LKH18gblOnQun3CymbgizdyGJP0DHpXzJoHws204IO2Rel
 4v1w==
X-Gm-Message-State: AOAM532oYoVCoop/XpiCkZebpYuU0ffuzRfywe3ZOrIsLZDV3AqsD+yC
 bJ4NdjAvh7imBfq9ADZ7uhVd3RNyxcGoRwL/7AnTXnDY6WgS6JkbvviUFNwhSt/fMtblj4jYzl+
 C/RLXJteBQi7iUzw=
X-Received: by 2002:a17:907:d1f:: with SMTP id
 gn31mr1508445ejc.192.1606901414598; 
 Wed, 02 Dec 2020 01:30:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdKDrMEg0XhJprhzf2sMr5eSK3BpcWLIIL8AjbKZDNzC4yl2m5Ri2latQz2toEneRtbrUIMQ==
X-Received: by 2002:a17:907:d1f:: with SMTP id
 gn31mr1508350ejc.192.1606901413295; 
 Wed, 02 Dec 2020 01:30:13 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k2sm732787ejp.6.2020.12.02.01.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 01:30:12 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
 <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
 <20201201220854.GC3836@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <17afbbfe-209f-e4b2-e9e1-b50abe1fce3c@redhat.com>
Date: Wed, 2 Dec 2020 10:30:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201220854.GC3836@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/20 23:08, Eduardo Habkost wrote:
>> Properties are only a useful concept if they have a use.  If
>> -object/object_add/object-add can do the same job without properties,
>> properties are not needed anymore.
>
> Do you mean "not needed for -object anymore"?  Properties are
> still used by internal C code (esp. board code),
> -device/device_add, -machine, -cpu, and debugging commands (like
> "info qtree" and qom-list/qom-get/qom-set).

Yes.

>> Right now QOM is all about exposing properties, and having multiple
>> interfaces to set them (by picking a different visitor).  But in practice
>> most QOM objects have a lifetime that consists of 1) set properties 2) flip
>> a switch (realized/complete/open) 3) let the object live on its own.  1+2
>> are a single monitor command or CLI option; during 3 you access the object
>> through monitor commands, not properties.
>
> I agree with this, except for the word "all" in "QOM is all
> about".  QOM is also an extensively used internal QEMU API,
> including internal usage of the QOM property system.

Yeah, "all about exposing properties" includes internal usage.  And 
you're right that some "phase 3" monitor commands do work at the 
property level (mostly "info qtree", but also "qom-get" because there 
are some cases of public run-time properties).

> I'm liking the direction this is taking.  However, I would still
> like to have a clearer and feasible plan that would work for
> -device, -machine, and -cpu.

-cpu is not a problem since it's generally created with a static 
configuration (now done with global properties, in the future it could 
be a struct).

-machine and -device in principle could be done the same way as -object, 
just through a different registry (_not_ a huge struct; that's an 
acceptable stopgap for -object but that's it).  The static aka field 
properties would remain as read-only, with defaults moved to 
instance_init or realize.  But there would be again "triplication" with 
a trivial conversion:

1) in the QAPI schema, e.g. 'num_queues': 'int16'

2) in the struct, "int16_t num_queues;"

3) in the realize function,

     s->num_queues = cfg->has_num_queues ? cfg->num_queues : 8;

So having a mechanism for defaults in the QAPI schema would be good. 
Maybe 'num_queues': { 'type': 'int16', 'default': '8' }?

I also need to review more the part of this code with respect to the 
application of global properties.  I wonder if there are visitor tricks 
that we can do, so that global properties keep working but correspond to 
QAPI fields instead of QOM properties.

Paolo


