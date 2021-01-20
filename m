Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F052FD6A9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:17:11 +0100 (CET)
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2H6U-00041p-SN
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Gsf-00009u-2f
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:02:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2Gsd-0002nj-BO
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611162170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jiwKR1CXWT3wNtqtS05O8pUHsGdDGW98NTE7qtrIE6o=;
 b=DfRrNsqsWt1X6u8EbPfTjUYM6v1VJ5uOGFc2Z87H1f7St6j6dqxHD13rQpzc1HQklmfw52
 JfumEPJKznYeJWGrrW6cHeXaCxXqpBeFoK8NZjUEIez+voZ2IuII4Pyh3o8S73Ljq2wpJ1
 2CA0NXNQLGrlpJ2K0FEo0YSMXvZ7qNo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-8wR3Ikg1MYadglYou3C8yg-1; Wed, 20 Jan 2021 12:02:48 -0500
X-MC-Unique: 8wR3Ikg1MYadglYou3C8yg-1
Received: by mail-ej1-f70.google.com with SMTP id jg11so7124308ejc.23
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 09:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jiwKR1CXWT3wNtqtS05O8pUHsGdDGW98NTE7qtrIE6o=;
 b=smQFdSp2rXwf0j8fuDbuLjqiwWO8ojNufkHcuiTdcK6rPG2vXNe3P0KKra5898+Ou5
 7ihXmrnud8xq5KhtjCaw/NmLNu3gYluMpi1kiotoGtI0Twp1yYQq6Fe+fJSFp8FZfIha
 N46k4qKlAhaf9DJ6ey35XZ0biA0S4l1KD4TxO9H78bSsqq0gxEEJ3ibOQ+KnPe5ydM72
 BojJoBvooUT4Pen5fmjeTqL162NlUJLKrWVROIXFddHkVsS23dU71tAsunJsZOJTAJNd
 wcUItIKwN7fnwh2eN2jp4J/f1LW10II141Fhyew6s6BoL3lRk8UPWocIG8k9v8RMATBD
 OZ1A==
X-Gm-Message-State: AOAM533cH0+ATApud23PQloGU6K7gnyoRpZmM3Tn1QDZaZwIkgIJnGEf
 brEL6Ag2CxklGNR8nSOOWwb9W/p7fPdIWgZGgMh1enpDo1FQK6RyCyZUi6uz/Lis5qg+wrZy82O
 0qE4p2O/1KL/gRlY=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr7821234eds.301.1611162167415; 
 Wed, 20 Jan 2021 09:02:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyC17q9ABkzhULtgM6BNcb82CpFHfASxhntAudXvHKgNV8+eBpiQw/M+yfTU437KA7ag6EdEg==
X-Received: by 2002:aa7:d755:: with SMTP id a21mr7821212eds.301.1611162167244; 
 Wed, 20 Jan 2021 09:02:47 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j18sm1143304ejv.18.2021.01.20.09.02.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 09:02:46 -0800 (PST)
Subject: Re: [PATCH 0/3] configure: Do not build TCG or link with capstone if
 not necessary
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210120151916.1167448-1-philmd@redhat.com>
 <260346c3-e1c1-5cb0-20d9-fb8a285e38f9@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8ff38dab-06e3-e250-7202-f46f613031c3@redhat.com>
Date: Wed, 20 Jan 2021 18:02:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <260346c3-e1c1-5cb0-20d9-fb8a285e38f9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 5:46 PM, Paolo Bonzini wrote:
> On 20/01/21 16:19, Philippe Mathieu-Daudé wrote:
>> We do not need TCG and capstone all the times. In some
>> configuration we can leave them out.
>>
>> Last patch emit a warning when a user explicitly select an
>> accelerator that the build with not use.
>>
>> Philippe Mathieu-Daudé (3):
>>    configure: Do not build TCG if not necessary
>>    configure: Do not build/check for capstone when emulation is disabled
>>    configure: Emit warning when accelerator requested but not needed
>>
>>   configure | 37 ++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 36 insertions(+), 1 deletion(-)
>>
> 
> Nice, but I have some remarks on how the patches are done. :)
> 
> For patch 1, which files are not compiled with the patch that were
> compiled without?

softfloat.

I'll mention and address Thomas and your's other comments.

Thanks,

Phil.

> 
> For patch 2, I think it's enough to add "build_by_default: false" to
> libcapstone (and while you're at it, to libslirp and libfdt).
> 
> Finally, I would prefer patch 3 to be done in Meson, right before the
> summary() call.  You can use config_all to check, like
> 
> if get_option('kvm').enabled() and not config_all.has_key('CONFIG_KVM')
> 
> etc.  This will also warn for e.g. --enable-kvm
> --target-list=sh4-softmmu, which could be considered an improvement over
> your patch.
> 
> Paolo
> 


