Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 111CF403D76
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:18:53 +0200 (CEST)
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0Hk-0004oA-4K
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO0F7-0002YO-Pu
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:16:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mO0F1-0001K9-Ko
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631117761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hQHFLtMmb/JvuF9iTTZxUncbATWuvzH2GzdqIQsEkno=;
 b=Z1WS9qDfvAQr4XSRGpL+1DGdkVshsytAxtty1pfKkFpNe7dlBTFvzOahg4soPCQBSQuWRC
 /9+PS6yTDMij8ybhKqiGsFZwp4H6HTu0201Z7nBd7WkWdzGx/SKV1+NNVrcRccOaMj8rWd
 G8653nPRtlJRhIroOw7QK0+YWvnNKIA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-m_MePQGBM_Sk9zNb-zLDqw-1; Wed, 08 Sep 2021 12:16:00 -0400
X-MC-Unique: m_MePQGBM_Sk9zNb-zLDqw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m22-20020a7bca56000000b002e7508f3faeso1126651wml.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 09:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hQHFLtMmb/JvuF9iTTZxUncbATWuvzH2GzdqIQsEkno=;
 b=oJ/uNNuU1ETZNkCZpTbnbl03V+9HYzpiNcRCgtvkl5YXwFbF7w4MfeoX52oOue66XV
 Ri5jA27cEX1JEhqzOCGIQlwNIIll2i+DMLtXsX7QwZja4hr7a2KWliVbhh9G4pr5xhOB
 sZXTHlsuNq8faNGpZQRuCwRFQcs0IuHfUdpAG21IUS4A9rdd9zP5aNsKSTgbvcpjii+m
 bB78K96FNg7amQrQmm8311YkeM1/eligHTIM5OOM16jZwlank6Sj6f+Cp33p4n28F2Ru
 cPBR29eo9E3/5EVnF8E2Ravc6FGJQd1zvRwwBsZoG8E7AbByVJuBZ9rhDZbD/04boFVJ
 DnIg==
X-Gm-Message-State: AOAM531ahjVGKc0uyLkNEuv4+7gF2/5UfWI83bU6/MdLtporeLeUps+Q
 oA0OQRhxMoFEGsMURJNjg2RY/OixYCyqhrh8lr+O1sbXDY7lkLiJ3HCxGejJx+gDNy0BUEONkuR
 y/sQoKP4YpO3YyGw=
X-Received: by 2002:a05:6000:374:: with SMTP id
 f20mr5005718wrf.129.1631117759240; 
 Wed, 08 Sep 2021 09:15:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRchfAihZzRe8OarUix8rOy1EMFVGma+e0OLMwzez+CD4Rg2EGqhmqOwQcZyZFun9xQPfoLw==
X-Received: by 2002:a05:6000:374:: with SMTP id
 f20mr5005692wrf.129.1631117758971; 
 Wed, 08 Sep 2021 09:15:58 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t23sm2717407wrb.71.2021.09.08.09.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 09:15:58 -0700 (PDT)
Subject: Re: [PATCH 0/5] Stop adding HMP-only commands, allow QMP for all
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <875yvbrtnq.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e1ad6243-7967-3035-d6db-f6b3087a620c@redhat.com>
Date: Wed, 8 Sep 2021 18:15:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <875yvbrtnq.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.922, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 5:09 PM, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> We are still adding HMP commands without any QMP counterparts. This is
>> done because there are a reasonable number of scenarios where the cost
>> of designing a QAPI data type for the command is not justified.
>>
>> This has the downside, however, that we will never be able to fully
>> isolate the monitor code from the remainder of QEMU internals. It is
>> desirable to be able to get to a point where subsystems in QEMU are
>> exclusively implemented using QAPI types and never need to have any
>> knowledge of the monitor APIs.
>>
>> The way to get there is to stop adding commands to HMP only. All
>> commands must be implemented using QMP, and any HMP implementation
>> be a shim around the QMP implementation.
>>
>> We don't want to compromise our supportability of QMP long term though.
>>
>> This series proposes that we relax our requirements around fine grained
>> QAPI data design,
> 
> Specifics?  QMP command returns a string, HMP wrapper prints that
> string?
> 
>>                   but with the caveat that any command taking this
>> design approach is mandated to use the 'x-' name prefix.
>>
>> This tradeoff should be suitable for any commands we have been adding
>> exclusively to HMP in recent times, and thus mean we have mandate QMP
>> support for all new commands going forward.
>>
>> This series illustrates the concept by converting the "info registers"
>> HMP to invoke a new 'x-query-registers' QMP command. Note that only
>> the i386 CPU target is converted to work with this new approach, so
>> this series needs to be considered incomplete. If we go forward with
>> this idea, then a subsequent version of this series would need to
>> obviously convert all other CPU targets.
>>
>> After doing that conversion the only use of qemu_fprintf() would be
>> the disas.c file. Remaining uses of qemu_fprintf and qemu_printf
>> could be tackled in a similar way and eventually eliminate the need
>> for any of these printf wrappers in QEMU.
>>
>> NB: I added docs to devel/writing-qmp-commands.rst about the two
>> design approaches to QMP. I didn't see another good place to put
>> an explicit note that we will not add any more HMP-only commands.
>> Obviously HMP/QMP maintainers control this in their reviews of
>> patches, and maybe that's sufficient ?
> 
> We could add devel/writing-hmp-commands.rst, or go with a single
> document devel/writing-monitor-commands.rst.
> 
>> NB: if we take this approach we'll want to figure out how many
>> HMP-only commands we actually have left and then perhaps have
>> HMP-only commands we actually have left
> 
> Yes.
> 
> For many HMP commands, a QMP commands with the same name exists, and the
> former is probably a wrapper around the latter.  Same for HMP "info FOO"
> and QMP query-FOO.
> 
> HMP commands without such a match:

(1) Handy HMP commands while debugging:

- help
- info *
- i/o
- loadvm/savevm
- trace-event/trace-file
- wavcapture/stopcapture
- xp

Eventually also:

- hostfwd_add/hostfwd_remove
- log
- logfile
- print
- sendkey

(2) I suppose these are pre-QMP and wonder about their
    usefulness in the monitor (I'd certainly use a QMP
    equivalent to test).

- migrate_set_capability
- migrate_set_parameter
- migration_mode
- mouse_button
- mouse_move
- mouse_set
- nmi
- pcie_aer_inject_error
- exit_preconfig
- singlestep
- snapshot_blkdev_internal
- snapshot_delete_blkdev_internal

(3) I don't use them, I expect them to belong
    in either (1) or (2).

>     boot_set
>     change
>     commit
>     cpu
>     delvm
>     drive_add
>     drive_del
>     gdbserver
>     gpa2hpa
>     gpa2hva
>     gva2gpa
>     mce
>     qemu-io
>     snapshot_blkdev
>     sum
>     sync-profile
>     watchdog_action

> 
> This is 77 out of 170 HMP commands.  I was hoping for fewer.


