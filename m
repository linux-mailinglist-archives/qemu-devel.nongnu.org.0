Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894E3445339
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 13:43:21 +0100 (CET)
Received: from localhost ([::1]:42750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mic5Q-0002SX-63
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 08:43:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mic1V-0000Ao-89
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mic1S-0005jG-1b
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 08:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636029553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T3ebbR1AiWG/PjtLTFQswMNb8cvDpN6w1YgQgpX3tVM=;
 b=IdprRhnGzlg0pO/DOkasrByNQiRbUl8sVSB+Ja+/h27+FaZVCy/jQ/xfFksBeePTpIOkEY
 NYMTv1FSurG1Oc/tgv1bUIMJ0mNGy3cA6Q2qE2h8xhqLdEE6Tmeuzj3fdXqQGmuTxdPq5P
 Yg8eumJRlJH6fYnVxFAEQlVipmoDZ1g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-O0KMLEkiNz-JmqUUDfJSuQ-1; Thu, 04 Nov 2021 08:39:12 -0400
X-MC-Unique: O0KMLEkiNz-JmqUUDfJSuQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f20-20020a05600c155400b0030db7b29174so2556154wmg.2
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 05:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T3ebbR1AiWG/PjtLTFQswMNb8cvDpN6w1YgQgpX3tVM=;
 b=EpWq52qGF13FwuGVYhOoUPwLn9zEMr4bjisjEtwo+aidNgqAWTwNleOGYa4Ck/sm5j
 92CWfwVZA38VUFoF+NmVUKshpnEHCHlOTUWa8sfhHEKfyMZlysyCxuuglBiPvg8Inlg/
 z6uuU9Ez84R6E/L7z3EBzalGqUS7U49PDmLZ4lYC3KJFnRM4BuOpz7XSzgZhIR0zbCFQ
 e9tKgyEJ5tWJ3BdFSSlaIuiUl3RtkPx6lccVaa0iMT+W+5hRO+yeLskZ2J/6Sn/ehVN8
 vzTA7Tz8DsvqvAMMcsdP6tl95sYgPnQV/3Sk/gHIKKEXn+Dxg8ZU1/dzHI6PtVLxU91P
 4pMA==
X-Gm-Message-State: AOAM5311+7ZSEw/BfPg0LiWK6t8gIA5YWI8+FuBWbu1lTkxJyipL4ZyP
 Mp/n2oUI9B0A7OAtptxXHR8313Xt4qPyfOug6+xHE1R9mbwM9ZqhoDhhTQyZjv0A3FNXIGfCfuV
 6yqigmS/Bn9bxbJI=
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr62057450wrn.82.1636029551067; 
 Thu, 04 Nov 2021 05:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqxQuVRS5FzwJytyFu9azDuWZd6k0n092fwTKU9WGR6bXQdkwfcvTYDFe9PU1o8cg5LJTAiQ==
X-Received: by 2002:adf:ee0c:: with SMTP id y12mr62057412wrn.82.1636029550772; 
 Thu, 04 Nov 2021 05:39:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id q14sm4765696wrr.28.2021.11.04.05.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 05:39:10 -0700 (PDT)
Message-ID: <13f8981a-55e5-e5d9-415f-4658aba16270@redhat.com>
Date: Thu, 4 Nov 2021 13:39:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
To: Kevin Wolf <kwolf@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <8e630c96-5d2c-d214-e594-6162356990b0@redhat.com>
 <YYOiyTcA6zZgtWBs@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YYOiyTcA6zZgtWBs@redhat.com>
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
Cc: eblake@redhat.com, berrange@redhat.com, armbru@redhat.com,
 ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 10:07, Kevin Wolf wrote:
>> Also, for the obligatory bikeshedding remark, do you have any other plans or
>> ideas for the colon-separated auto generated typenames?  Having both the
>> "namespace" (qom) and the more specific use (config) before the classname is
>> a bit weird, compared to the existing structs like RngRandomProperties.
>> Especially if boxed config is more used (or becomes the only possibility),
>> it might be that qom:class-name:config, or even just class-name:config, make
>> for nicer code in the object implementation.
> 
> 'qom-config:classname' isn't a type that is useful for the object
> implementations at all. Its only use is really storing the whole
> configuration temporarily in a QAPI C struct before applying it.

<rubbish>
It would be useful as the (auto-boxed) argument of the configuration 
code.  So basically you'd not need the RngProperties function anymore 
because you use something like QomConfigRngBackend (or 
RngBackendQomConfig - hence the question on how to name the 
auto-generated types).
</rubbish>

> The class implementations always want to store only their "local" config
> options, but 'qom-config:classname' contains those of the parent class
> as well.

Ah, I didn't understand that (hence the rubbish tag above).  It makes 
sense given that instance_config is called per-class while ObjectOptions 
stores all the info in one class.  That's a major change from my sketch, 
which planned to call the base class config function by hand (and handle 
the marshalling via QAPI 'base': '...').

> Oh, and I also wanted to say something about why not just directly using
> the class name, which was my first idea: 'foo': 'iothread' looks more
> like referencing an existing iothread rather than the configuration for
> a new one. I wanted to leave us the option that we could possibly later
> take a string for such options (a QOM path) and then pass the referenced
> object to QMP commands as the proper QOM type.

I agree that 'iothread' is going to be confusing when you're referring 
to the configuration.

Anyway I'm totally fine with 'qom-config:classname'.  Given this 
explanation, however, one alternative that makes sense could be 
'classname:full-config'. Then you could use 'classname:config' for the 
autoboxed configs---and reserve 'classname' to mean the pointer to an 
object.  Classes are (generally) lowercase and QAPI structs are 
CamelCase, so there is not much potential for collisions.

Paolo


