Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE82336D8D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 09:15:19 +0100 (CET)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKGTW-00087S-JS
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 03:15:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKGSY-00076c-MX
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:14:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKGSV-0002mc-Rj
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 03:14:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615450454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndCW6Va7mJC6zu8s4/0e8iYmeTIrPY9JbLY8pmnxdNM=;
 b=RyCBgdb5pDl/XuxJbUnFJyCBy/4RB6H3uEa6h2dkThE4oa8trbWfpEBLcXjIpWsMuFtTwz
 ZGqAr5DRAS78StfXeFT+hoOZr6FYKu7QqGbB7TG4ev8BH71+mE/T/4H3kB+tY8+qanSD9H
 52yCZICPCyU/4jP125b4Y1fgTZFsmW4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-_JWHT4_3PV-0ICi0qXLm4Q-1; Thu, 11 Mar 2021 03:14:12 -0500
X-MC-Unique: _JWHT4_3PV-0ICi0qXLm4Q-1
Received: by mail-ed1-f69.google.com with SMTP id q2so9498795edt.16
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 00:14:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ndCW6Va7mJC6zu8s4/0e8iYmeTIrPY9JbLY8pmnxdNM=;
 b=AMIViACcwymCojz/f6c6r82CWzMFwTy3KUuc+oTgNBDnvA5hwXqbhT2mdvfnt2tXuR
 E2srKF0jkpq0opT8RkFn+dHde3d27fK389Q0aOO+U0osqZw4rr59BCCoIQjNovCE9m4G
 CdRxQhqAJJ/xKczVzWkyYbfdzcrkNWBJMHe8m05IunG6Q0xh9EYoG7ZD+KzcC0+aselV
 /F6U7dIt2XnqRsfc/6tLPQezasvVU3wF9HssW7uvLofwzFxDt6hhnOClQ6z7KlJQLY9X
 6rtliMfg/uXTupfsWQUxRUk1Z1lqmIshdt4cuLpIUJCN69O/nwoQKMwPrwripzH3ciG0
 i9oA==
X-Gm-Message-State: AOAM533tXCNkbIaiaLLGIW0Q+ZQiuP6roOR+YkMe+TXKbUQk6ha26tUS
 uC/lMgHUtWvGXdbjxVoVaL7gveq5edif++wqooY6PIa7j7UJRnpjiYkSVYnGt08OALqL9veFNRW
 TsH1pBuw97VtU/Rg=
X-Received: by 2002:a05:6402:2d0:: with SMTP id
 b16mr7421130edx.194.1615450451561; 
 Thu, 11 Mar 2021 00:14:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxiFJz+a0e/uiaLyJXcscaaof0CxN+naKWc7HtHViczF4Xp2CKb4BYYCmUZNktDA0LplQo6LQ==
X-Received: by 2002:a05:6402:2d0:: with SMTP id
 b16mr7421100edx.194.1615450451253; 
 Thu, 11 Mar 2021 00:14:11 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c20sm892839eja.22.2021.03.11.00.14.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 00:14:10 -0800 (PST)
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
To: Kevin Wolf <kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ad85d8d9-74a7-9e8f-8287-b6ce66670ed3@redhat.com>
Date: Thu, 11 Mar 2021 09:14:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310173044.GF6076@merkur.fritz.box>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, Peter Krempa <pkrempa@redhat.com>,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/21 18:30, Kevin Wolf wrote:
> Am 10.03.2021 um 15:31 hat Paolo Bonzini geschrieben:
>> On 10/03/21 15:22, Peter Krempa wrote:
>>> I've stumbled upon a regression with this patchset applied:
>>>
>>> error: internal error: process exited while connecting to monitor: qemu-system-x86_64: -object memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind: Invalid parameter type for 'host-nodes', expected: array
>>
>> This is the magic conversion of "string containing a list of integers"
>> to "list of integers".
> 
> Ah, crap. This one wouldn't have been a problem when converting only
> object-add, and I trusted your audit that user creatable objects don't
> depend on any QemuOpts magic. I should have noticed it, too, of course,
> but during the convertion I didn't have QemuOpts in mind, only QOM and
> QAPI.

Yeah, let's just drop the -object conversion for now. It will just 
remove a few patches.

Who is going to include this series in the next pull request, Markus or 
myself?  The time is ticking for soft freeze.

Paolo

> I checked all object types, and it seems this is the only one that is
> affected. We have a second list in AuthZListProperties, but it contains
> structs, so it was never supported on the command line anyway.
> 
>> The relevant code is in qapi/string-input-visitor.c, but I'm not sure where
>> to stick it in the keyval-based parsing flow (i.e.
>> qobject_input_visitor_new_keyval).  Markus, any ideas?
> 
> The best I can think of at the moment would be adding a flag to the
> keyval parser that would enable the feature only for -object (and only
> in the system emulator, because memory-backend-ram doesn't exist in the
> tools):
> 
> The keyval parser would create a list if multiple values are given for
> the same key. Some care needs to be taken to avoid mixing the magic
> list feature with the normal indexed list options.
> 
> The QAPI schema would then use an alternate between 'int' and ['int'],
> with the the memory-backend-ram implementation changed accordingly.
> 
> We could consider immediately deprecating the syntax and printing a
> warning in the keyval parser when it automatically creates a list from
> two values for a key, so that users don't start using this syntax
> instead of the normal list syntax in other places. We'd probably still
> leave the implementation around for -device and other users of the same
> magic.
> 
> Kevin
> 


