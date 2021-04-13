Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422A35D9D2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:16:08 +0200 (CEST)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEDP-0005IX-5y
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWEBC-0003dQ-9y
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWEBA-0001Xh-19
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618301623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hSNAgrL9wCLyCCNAvxlzdAzmb8DPW9yZBvMY9BopSHc=;
 b=UV1DackIQkD5YPch/jqkqDZkl8R+7auOGHJs7UEf/BT81X+uWRR3kW1WwEySZUOdMit0qB
 AudKgsbcxrAGwenE3JhfJyE4+wezHxYIb3Qzp8drIlhBpPk2I+TdKWqCJLxGLes/wykzR9
 kZ/PU/3otsnFzbXqTjNcKvPR+YslRTc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-kUEVrxGgPtislENJdyKnnQ-1; Tue, 13 Apr 2021 04:13:42 -0400
X-MC-Unique: kUEVrxGgPtislENJdyKnnQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 b20-20020a7bc2540000b029010f7732a35fso534122wmj.1
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 01:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hSNAgrL9wCLyCCNAvxlzdAzmb8DPW9yZBvMY9BopSHc=;
 b=qPdivl4433m+EHgFzXv1H1sIZt7ht7CQQQymHZeE25dKpzKf+x54pddSaVnl3LfaKy
 jtvp5LL3dXp6/cl5iToyo70ldfXDC7pkJVph8t/1Pz9S0ocAXWK3itU9dMoM/AF0n4IA
 8/MV9VkuHcr6TsQW3aL/NGMnG5FPNaTRW5+rMiX9dErhOVAyxtXfKWTAaJRMF90e9PYy
 tdJN1K3eI5doTKVQ7rCuiYM4amzXmOUQ7ZY1TP0FQ4Nf77NwY0VoouXsdCsiKA/6s02C
 Kp59UOwJLvJAirjhAuWE3FZWItWbd8OGQ9spVKewj8H6+7PTW36tU5fJ+Ayb7Q6duTQW
 EUuA==
X-Gm-Message-State: AOAM532JSmcE/b565I1ixdn40xa620/PmH+Ck8WdpH/2FapP0EBOYyg3
 tIIMPj0cZGyMxS6fLIti+n38qoaDVIC4V0v2kYkCgONvcaQL8G6dUCWnC0j4kuIVTFBndNhhSrg
 tGNkfnDJmS99pyQ4=
X-Received: by 2002:adf:c64a:: with SMTP id u10mr35737211wrg.412.1618301620911; 
 Tue, 13 Apr 2021 01:13:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj9XUzasICpkGZcZV2idRrHox9RokPqxx6MnegmkLvw1aeY5RpUaQaF1vSAX8sFq+2fObRvg==
X-Received: by 2002:adf:c64a:: with SMTP id u10mr35737184wrg.412.1618301620655; 
 Tue, 13 Apr 2021 01:13:40 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c62e9.dip0.t-ipconnect.de. [91.12.98.233])
 by smtp.gmail.com with ESMTPSA id
 24sm1992444wmk.18.2021.04.13.01.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 01:13:40 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] qom: move user_creatable_add_opts logic to vl.c
 and QAPIfy it
To: Markus Armbruster <armbru@redhat.com>
References: <20210312173547.1283477-1-pbonzini@redhat.com>
 <20210312173547.1283477-3-pbonzini@redhat.com>
 <f0ea67d8-9641-104d-f8ec-5fc343256cc9@redhat.com>
 <87im4q23v2.fsf@dusky.pond.sub.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <07c08cc3-f3ca-6f7a-e5f7-d2d3ee8de79e@redhat.com>
Date: Tue, 13 Apr 2021 10:13:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im4q23v2.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.04.21 06:41, Markus Armbruster wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 12.03.21 18:35, Paolo Bonzini wrote:
>>> Emulators are currently using OptsVisitor (via user_creatable_add_opts)
>>> to parse the -object command line option.  This has one extra feature,
>>> compared to keyval, which is automatic conversion of integers to lists
>>> as well as support for lists as repeated options:
>>>     -object
>>> memory-backend-ram,id=pc.ram,size=1048576000,host-nodes=0,policy=bind
>>> So we cannot replace OptsVisitor with keyval right now.  Still, this
>>> patch moves the user_creatable_add_opts logic to vl.c since it is
>>> not needed anywhere else, and makes it go through user_creatable_add_qapi.
>>> In order to minimize code changes, the predicate still takes a
>>> string.
>>> This can be changed later to use the ObjectType QAPI enum directly.
>>>
>>
>> Rebasing my "noreserve"[1] series on this, I get weird errors from
>> QEMU when specifying the new "reserve=off" option for a
>> memory-backend-ram:
>>
>> "Invalid parameter 'reserve'"
>>
>> And it looks like this is the case for any new properties. Poking
>> around, I fail to find what's causing this -- or how to unlock new
>> properties. What is the magic toggle to make it work?
>>
>> Thanks!
>>
>> [1] https://lkml.kernel.org/r/20210319101230.21531-1-david@redhat.com
> 
> Wild guess: you didn't add your new properties in the QAPI schema.
> 
> For a not-so-wild-guess, send us a git-fetch argument for your rebased
> series.
> 

Oh, there is qapi/qom.json -- maybe that does the trick.

(I have mixed feelings about having to specify the same thing twice at 
different locations)

I'll have a look if that makes it fly.

-- 
Thanks,

David / dhildenb


