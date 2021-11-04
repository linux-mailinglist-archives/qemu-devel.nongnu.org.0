Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F534455BA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:53:11 +0100 (CET)
Received: from localhost ([::1]:41608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mie74-0001V0-MD
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:53:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mie3W-0000OE-6j
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mie3U-0005Aq-4p
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636037367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+nNbQMd3CQpTIKVFj1/cAvOB+eqitrGE3o+OPT+q2iY=;
 b=Xnkck8WfPK6z5uxzB1Qi1ZFdkuHGEJs3DwZK9LfwbW88rzILyflhFSgr3Hepq3N4hvd3tp
 FoXixcTmm7E6k4rrLuJAeOS4AezSc0FPLyu5Kvv7QuQvt11IbotJXHTzIVDVch5XS7Sqzu
 JqNk9EVzP9sc/R3MHl3z6cOBHBn8eh8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-1fuIh2SXPPSV583bzmY_5Q-1; Thu, 04 Nov 2021 10:49:26 -0400
X-MC-Unique: 1fuIh2SXPPSV583bzmY_5Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 j12-20020adf910c000000b0015e4260febdso1083758wrj.20
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+nNbQMd3CQpTIKVFj1/cAvOB+eqitrGE3o+OPT+q2iY=;
 b=0nNoPhhuMWEP0goIsavA510/2CT1z1bRQXWpSqrFH/J9nQMK8bxhezA0tvbRvSmK6A
 QPGhu6gztE7zl3MiY1sdR/KYMu73zQQ7ifXxnh0fj8r/EEZaRe8TDn393/k2DfbSoyLA
 aRNU0KnuwQ+QTRwAf3nFxUQav3h1G6gb6tcLdfH4l/MFMxHpCfEM5Jf25yIMjsTToo3N
 4pkvKMyxMtiFzQGdPTy8+OcO8fJBAFAYPID00pG7+ARgP5gxPB0JyvVSHDe/teuvi0KE
 rU+TFnGc4Swp0Myn2vYAAdICrILpMxOi+RWW/nu2ylPM+Qf8mlTb1GKtJwBOF87icdfD
 3CEQ==
X-Gm-Message-State: AOAM5307+NJ2gmTynhYwJ1u9CYG88YVfZ8YSsrRUFd68f8XzorAF7IC4
 JZmTPnmYkHshJydltPRt+REjZYD1YgrARwx/QS4/tY7kxh5q1hXFYaJn0lZZsUrSv4pJ6oM99qR
 cmxaHQig795Uj5so=
X-Received: by 2002:a5d:6e91:: with SMTP id k17mr65229732wrz.260.1636037364747; 
 Thu, 04 Nov 2021 07:49:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB0xx8P3fhaKQI9Ce8ES24CQDRgADzLJVUlGnKgkhyMw2U1nJthlRpMdOqkbTduYXVNTV/1w==
X-Received: by 2002:a5d:6e91:: with SMTP id k17mr65229698wrz.260.1636037364449; 
 Thu, 04 Nov 2021 07:49:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm2160969wmq.31.2021.11.04.07.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 07:49:23 -0700 (PDT)
Message-ID: <b6d97674-d1d3-222a-c6a5-d9ce8f724ca7@redhat.com>
Date: Thu, 4 Nov 2021 15:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
To: Kevin Wolf <kwolf@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <8e630c96-5d2c-d214-e594-6162356990b0@redhat.com>
 <YYOiyTcA6zZgtWBs@redhat.com>
 <13f8981a-55e5-e5d9-415f-4658aba16270@redhat.com>
 <YYPtokwlkWzhrJ2u@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YYPtokwlkWzhrJ2u@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, berrange@redhat.com, eblake@redhat.com,
 armbru@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 15:26, Kevin Wolf wrote:
> It took me a while to figure out how to deal with this, but I'm quite
> happy with the result.

I like it too.

>>> Oh, and I also wanted to say something about why not just directly using
>>> the class name, which was my first idea: 'foo': 'iothread' looks more
>>> like referencing an existing iothread rather than the configuration for
>>> a new one. I wanted to leave us the option that we could possibly later
>>> take a string for such options (a QOM path) and then pass the referenced
>>> object to QMP commands as the proper QOM type.
>>
>> I agree that 'iothread' is going to be confusing when you're referring to
>> the configuration.
>>
>> Anyway I'm totally fine with 'qom-config:classname'.  Given this
>> explanation, however, one alternative that makes sense could be
>> 'classname:full-config'. Then you could use 'classname:config' for the
>> autoboxed configs---and reserve 'classname' to mean the pointer to an
>> object.  Classes are (generally) lowercase and QAPI structs are
>> CamelCase, so there is not much potential for collisions.
> 
> Makes sense to me, too.
> 
> I just checked and I actually already forbid class names with colons in
> them (check_name_str() takes care of this), so yes, suffixes actually
> work on the QAPI level.
> 
> If we actually want to use these types in manually written C code, we
> might have to convert the name to CamelCase, though, for consistency
> with the coding style.
> 
> We already have a function camel_to_upper(), we'd need a new
> lower_to_camel(), so that from a class 'rng-random', you would get types
> 'RngRandomConfig' (the local ones) and 'RngRandomFullConfig' (with
> parent options).

That's nice.  IMO with these changes the autoboxing becomes again more 
appealing.  With the auto-generated local config struct,

     { 'class': 'rng-egd',
       'parent': 'rng-backend',
       'config': { 'chardev': 'str' } }

now maps to

     bool qom_rng_egd_config(Object *obj, RngEgdConfig *config,
                             Error **errp)
     {
         RngEgd *s = RNG_EGD(obj);

         s->chr_name = g_strdup(config->chardev);
         return true;
     }

The three arguments follow the same prototype as .instance_config:

     bool (*instance_config)(Object *obj, Visitor *v, Error **errp);

just with the visitor replaced by a nice C struct.  You started 
(obviously) with the simplest cases, and it's good to check whether easy 
things remain easy, but it seems to me that all but the simplest objects 
would end up using boxed config anyway.

Also (and this is something Markus and I have discussed in the past, but 
I'm not sure if we have actually reached an agreement), I would make 
instance_config return void.  The usual convention *is* to return bool 
from functions that have an Error** and no other return value; however, 
that's because in general there will be more calls to the function than 
definitions.

In this case, there will be just one call to the ti->instance_config 
function pointer, in object_configure, and N definitions of the 
function, so the ratio and the rationale are reversed.  See 
object_property_get for an example in qom/object.c.

Thanks,

Paolo


