Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED9C2CAE53
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 22:25:57 +0100 (CET)
Received: from localhost ([::1]:39968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkD9n-0004CU-Rv
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 16:25:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkD82-0003di-Cu
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:24:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkD7z-0005Xd-UQ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606857843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhmZqulaJP2LuqgEioKWcuv/qApG27kRSl1S80Eqtzg=;
 b=XTWqf05ZRekp4l7nN429xZXMV8KPFB+7A6fmsouzt1YUJozfjfUESCpYXVzu57dGcnFSIJ
 im9z9Xx9lFtitmVBM97AYu7/GanPuxYnnv3iTmTO75AeGHM5vPbR/hG6O4Mew9cCniBV+6
 2BzWWQqwsfaTOsS+xLbvSB8t+j7+12I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-vMo8asXUPbCOPUWLVmXwEg-1; Tue, 01 Dec 2020 16:24:01 -0500
X-MC-Unique: vMo8asXUPbCOPUWLVmXwEg-1
Received: by mail-ej1-f69.google.com with SMTP id t4so1958701eju.0
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 13:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VhmZqulaJP2LuqgEioKWcuv/qApG27kRSl1S80Eqtzg=;
 b=G94HZ49Fm/g5U2CQe8TEOXOqmlyLA3JLkTNGyF7v7GqdII9OEo1hbUPVRExiYLqrDO
 Y4QWKzhMbHNItPUpb09G0DHuDQSYv3iSWNvrDFQ9m3jRTMbPu4J5b9383F+wMD/pcbRY
 qEg5crW3SKigJd4zRQk/WG4uCQcBxAYhOJ1cBNNBD5znVZp13v3YNUcx0bgg1WjKSLam
 sSM3Yg0G1LAXJIW0hzmdmgikGiyBmMZuNTwR970Et2kEbZaK4uiSwz+aBELhbmvIJnCh
 hiAQ96yXh5znwdDF6y2RBDY6lVgxx4vPSeWCw2Vrvupt7alTOafdY4sVKXgdaC9QaBuw
 rwJw==
X-Gm-Message-State: AOAM530pJ9Rfq6NWonfpMOMO8A+qD0V/YkVMCgjnT0UkdUclEeX6qw6U
 Jw/gzyz7qkAALgq4SbMtZIhGLKYhJxsbqI/7uvkA76uqmlDXLeVhq8U10SaRY+79VlTw+wD1pGv
 +02Dt0QQG3sf8tq0=
X-Received: by 2002:a17:906:ce2b:: with SMTP id
 sd11mr5190725ejb.334.1606857840227; 
 Tue, 01 Dec 2020 13:24:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgnKEPka+SqwMMc9zT56InFOZI2TfRdVOdpc2w9aZDXpM42NCZa3cteNPIBymCzDlEhLXW+A==
X-Received: by 2002:a17:906:ce2b:: with SMTP id
 sd11mr5190696ejb.334.1606857839821; 
 Tue, 01 Dec 2020 13:23:59 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v8sm475451edt.3.2020.12.01.13.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 13:23:58 -0800 (PST)
To: Kevin Wolf <kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
 <01d32c8c-5023-6323-bed8-ede08f6ac8a3@redhat.com>
 <20201130154605.GC5078@merkur.fritz.box>
 <a9c1ebf3-ffcc-7312-ce66-a79902d1e9ba@redhat.com>
 <20201130181037.GG5078@merkur.fritz.box>
 <65a9600f-ca8c-ef29-94d8-d9ea114e5e06@redhat.com>
 <20201201162042.GB6264@merkur.fritz.box>
 <db61f61a-1ffa-6185-10dc-3109ff111a35@redhat.com>
 <20201201193528.GC6264@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 00/18] qapi/qom: QAPIfy object-add
Message-ID: <3449b5d6-d094-84c8-a0ea-4cd25364db2d@redhat.com>
Date: Tue, 1 Dec 2020 22:23:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201201193528.GC6264@merkur.fritz.box>
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/12/20 20:35, Kevin Wolf wrote:
> Am 01.12.2020 um 18:16 hat Paolo Bonzini geschrieben:
> I don't think this is actually a new things. We already have types and
> commands declared with things like 'if': 'defined(TARGET_S390X)'.
> As far as I understand, QAPI generated files are already built per
> target, so not compiling things into all binaries should be entirely
> possible.

There is some complication due to having different discriminators per 
target.  So yes it should be possible.  But probably best left after 
objects because it's so much bigger a task and because objects have a 
bit more freedom for experimentation (less ties to other qdev-specific 
concepts, e.g. the magic "bus" property).

> So maybe only the abstract base class that actually defines the machine
> properties (like generic-pc-machine) should be described in QAPI, and
> then the concrete machine types would inherit from it without being
> described in QAPI themselves?

Yes, maybe.

>> 1) whether to generate _all_ boilerplate or only properties
> 
> I would like to generate as much boilerplate as possible. That is, I
> don't want to constrain us to only properties, but at the same time, I'm
> not sure if it's possible to get rid of all boilerplate.
> 
> Basically, the vision I have in mind is that QAPI would generate code
> that is the same for most instances, and then provide an option that
> prevents code generation for a specific part for more complicated cases,
> so that the respective function can (and must) be provided in the C
> source.

Ok, so that's a bit different from what I am thinking of.  I don't care 
very much about the internal boilerplate, only the external interface 
for configuration.  So I don't care about type registration, dynamic 
cast macros etc., only essentially the part that leads to ucc->complete.

>> 2) whether we want to introduce a separation between configuration
>> schema and run-time state
> 
> You mean the internal run-time state? How is this separation not already
> present with getter/setter functions for each property? In many cases
> they just directly access the run-time state, but there are other cases
> where they actually do things.

I mean moving more towards the blockdev/chardev way of doing things, 
increasing the separation very much by having separate configuration 
structs that have (potentially) no link to the run-time state struct.

>> 3) in the latter case, whether properties will survive at all---iothread and
>> throttle-groups don't really need them even if they're writable after
>> creation.
> 
> How do you define properties, i.e. at which point would they stop
> existing and what would be a non-property alternative?

Properties are only a useful concept if they have a use.  If 
-object/object_add/object-add can do the same job without properties, 
properties are not needed anymore.

Right now QOM is all about exposing properties, and having multiple 
interfaces to set them (by picking a different visitor).  But in 
practice most QOM objects have a lifetime that consists of 1) set 
properties 2) flip a switch (realized/complete/open) 3) let the object 
live on its own.  1+2 are a single monitor command or CLI option; during 
3 you access the object through monitor commands, not properties.

> So in summary, it seems to me that the QOM way is more flexible because
> you can get both models out of it. Whether we actually need this
> flexibility I can't say.

I'm thinking there's no need for it, but maybe I'm overly optimistic.

> * Configuration options are described in the QAPI schema. This is mainly
>    for object creation, but runtime modifiable properties are a subset of
>    this.
> 
> * Properties are generated for each option. By default, the getter
>    just returns the value from the configuration at creation time, though
>    generation of it can be disabled so that it can be overridden. Also,
>    setters just return an error by default.
> 
> * Property setters aren't called for object creation. Instead, the
>    relevant ObjectOptions branch is made available to some init method.
> 
> * Runtime modifiable properties (declared as such in the schema) don't
>    get the default setter, so you have to provide an implementation for
>    them.

I wouldn't bother with properties at all in the QAPI schema.  Just do 
the first and third bullet.  Declaring read-only QOM properties is trivial.

> So while this series is doing only one part of the whole solution, that
> the second part is missing doesn't make the first part wrong.

Yeah, I think it's clear that for the long term we're not really 
disagreeing (or perhaps I'm even more radical than you :)).  I'm just 
worried about having yet another incomplete transition.

> One possibly nasty detail to consider there is that we sometimes declare
> the USER_CREATABLE interface in the base class, so ucc->complete is for
> the base class rather than the actually instantiated class. If we only
> instantiate leaf classes (I think this is true), we can move
> USER_CREATABLE there.

You can also use a while loop covering each superclass to decide how to 
dispatch ucc->complete.  I don't care much about these details, they're 
Simple Matter Of Programming. :)

> I also had in mind just passing the whole configuration struct
> (essentially always 'boxed': true), but you're right that individual
> parameters like for commands would be possible. I'm not entirely
> convinced that they would be better (there was a reason why we
> introduced 'boxed': true), but it's an option.

Having 'boxed': true by default would be just an implementation choice, 
nothing to worry about.  (When I said the arguments would be the 
configuration, having a boxed struct as the argument would fit the 
description just as well).

> I was hoping that by converting object-add in this series, and the CLI
> options soon afterwards, it would be very obvious if you forget to
> change the schema because your new property just wouldn't work (at least
> not during creation).

Converting the CLI options is not entirely trivial due to -readconfig 
and friends, so I was expecting that to last until that part of my 6.0 
keyval work goes in.  (It's almost ready for posting BTW, 
https://gitlab.com/bonzini/qemu/-/commit/b59288c86c).

As soon as we have an idea of what we want UserCreatable to look in the 
end, on both the QAPI side and the object implementation side.  That's 
also the part where we have the biggest need to document the schema. 
With that part at least roughly sketched out (no code needed), I'm okay 
with this series going in.

I still don't like the triplication, but as George Michael puts it I 
just gotta have faith---because I must admit, I'm positively surprised 
at the ideas that came out of the discussion.

Paolo


