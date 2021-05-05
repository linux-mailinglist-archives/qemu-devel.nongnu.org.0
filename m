Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CB13739B1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:51:21 +0200 (CEST)
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leG3k-0000Iq-81
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leG2M-0007pB-7m
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:49:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leG2J-0006rA-PC
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:49:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620215390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Foc+EOorem03bggqAaC3TwgLAf5/22fodFDCT7rTgo=;
 b=iY1pIAyjk1vt1ReXeRy1bbBlfyPu08by1KEu3xtE5Fp9K6vOtepQ04ocWFzK9EQ16Okt78
 XK9GE9x98Ef3aUmfp972DMOAyvHAax+BThIs0ZmDCeyn2kUp6oX+vjctWfTQHtaEEEXUyx
 pSlQRMlO1njLbizg7j5cDcL2HXxxPe0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-qplIcsC4Mk6YFKbO75sZ0A-1; Wed, 05 May 2021 07:49:48 -0400
X-MC-Unique: qplIcsC4Mk6YFKbO75sZ0A-1
Received: by mail-wr1-f71.google.com with SMTP id
 t18-20020adfdc120000b02900ffe4432d8bso600514wri.6
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 04:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Foc+EOorem03bggqAaC3TwgLAf5/22fodFDCT7rTgo=;
 b=dtLVmaaQlQ/d7ud+VErfri6aY4XGtyLIllyUfU/5MlMm4HbxaTgmUZ3O25H7tOzgvN
 2KvpRspGaASBpWCZfP9WQ80+5nsMetPrPINwmQ0n0quIyvQZ1Kqw+AmFd1jtq+wln+xW
 yj27BNYSA7BliIuM6MrtCb+X99vJXnpSDhLtEM8UNou2h/eWOFEhQZA4gatDHfYic9i+
 CYnz8Sh4Q6hummu8w3ohlfB2j1UcGLRPk6xRjC7K5PTrxiMGmhO+1P9WXO9ZXG19BsWH
 U07OP7CjMFlnrPibvA8/IiH6hDH3F+tnno4EDY+y28FPVOv992x28uCiC8DveW8jYoVT
 yx/A==
X-Gm-Message-State: AOAM5332WbJ4ZC8Xt9bLWVI3rasrKGWNDqa09o59graaqktXFttUVyoP
 TEwXwP7079agATN6G4Ous68Oy7RYsLK4xlZlypTDiUmgv0GlHCp9+AyTrbpVwiLvP83hqxohRx1
 S6SWQJV+X8l/9zCA=
X-Received: by 2002:adf:c541:: with SMTP id s1mr37556800wrf.370.1620215387585; 
 Wed, 05 May 2021 04:49:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBmciLH1UUTn1foXYESO0byhRG0S0fysIYE0FmLB6NE3ZPqpv6QvZCsq/DCtFs6kEkSNdNew==
X-Received: by 2002:adf:c541:: with SMTP id s1mr37556763wrf.370.1620215387228; 
 Wed, 05 May 2021 04:49:47 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id m16sm9370290wru.68.2021.05.05.04.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 04:49:46 -0700 (PDT)
Subject: Re: [PATCH v5 02/10] accel: Introduce 'query-accels' QMP command
To: Markus Armbruster <armbru@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
 <20210501223638.510712-3-philmd@redhat.com>
 <87o8dpvet4.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <918d1fc1-260c-57b7-2dd9-61f1125a2aa2@redhat.com>
Date: Wed, 5 May 2021 13:49:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87o8dpvet4.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 9:07 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>   specific information. Currently the common structure base
>>   provides the name of the accelerator, while the specific
>>   part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>     { "execute": "query-accels" }
>>     {
>>         "return": [
>>             {
>>                 "name": "qtest"
>>             },
>>             {
>>                 "name": "kvm"
>>             }
>>         ]
>>     }
>>
>> Note that we can't make the enum values or union branches conditional
>> because of target-specific poisoning of accelerator definitions.
> 
> Let me try to complete this argument;
> 
>   If we did, enum Accelerator could only be used in target-specific
>   code.  But we want to use it in generic code, too.
> 
> Which generic code exactly?


cpu.c:133:#ifdef CONFIG_TCG
hmp-commands-info.hx:271:#if defined(CONFIG_TCG)
monitor/misc.c:324:#ifdef CONFIG_TCG
softmmu/physmem.c:28:#ifdef CONFIG_TCG

and more importantly:

include/exec/cpu-all.h:430:#ifdef CONFIG_TCG
include/exec/cpu-defs.h:77:#if !defined(CONFIG_USER_ONLY) &&
defined(CONFIG_TCG)
include/exec/exec-all.h:25:#ifdef CONFIG_TCG
include/sysemu/cpu-timers.h:27:#ifdef CONFIG_TCG

Thomas might provide more cases, IIRC he audited this recently.


