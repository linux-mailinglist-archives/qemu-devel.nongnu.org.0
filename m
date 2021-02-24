Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0856F323E72
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:42:52 +0100 (CET)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuRF-000612-Bz
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEuFv-0000XT-BK
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:31:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEuFr-0003lh-T9
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:31:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614173463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OMf3D3RU/1ovZVc0YpYwO+l+OWT57rA5QKZHxEOEOEg=;
 b=SYjaSImFAqsjpIDRq4VjFgQ2a2FxrpzzCxroguYefcREomz7CWDNhy2NSCkr0gRk0xF+fH
 K/AZ6HAsCoFkT1S7ndERTnrFnydUKiithX19WLNzvJUZ4bhh7m8OK0zX10R7fp3jvzRUUf
 tx3nYqnFlI95RKJBtL4qIIbUkiBynSg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-tXyNV4cBP0maXohb9aHKrg-1; Wed, 24 Feb 2021 08:31:00 -0500
X-MC-Unique: tXyNV4cBP0maXohb9aHKrg-1
Received: by mail-wm1-f69.google.com with SMTP id b62so564573wmc.5
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OMf3D3RU/1ovZVc0YpYwO+l+OWT57rA5QKZHxEOEOEg=;
 b=rAyTivRwZN8ynhFO3MjHqx6O1+QFmghwMNrqlu/H31dbIlwW7/WY4qvWyAlvchNKJt
 B4YBvIC3ieCkRXZIK1Vm9K33yJQfjufRpJ8yAkEDVpg7TeaQva4xJ3FgM+bM8ub4NPfB
 ighpLhVDKG/phd6DwG7ui6hYV3sHpsdRCjZTLQR6823bFJ7CvJ+5TUlhOhycr4/mswz6
 1fxRIodQ5dtW5HCqGPITjomquh36mNacohTzh0bl9QsB5tIIbodUoraUbflkLdbUrNIE
 gPAvUIjDSdviHIiLZsqYyU3bpDE8xHzp0S2y2E5brUE6yEv2heflyLIoyaV9NLXrcyf2
 GIJA==
X-Gm-Message-State: AOAM532uCIqi92DWcqJRE+uX1rXyv20XCpMPwapNB4qPVI5y8IycR4Gv
 qIbODeLNyUGHsE7D1qKCVokVWv4Zti9FnTdwoK49EpWwhvQ+URbreTXGHhF6Lbw2ZrwT1WdVUqj
 biQpcZef6P3/Krbc=
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr23443122wrx.3.1614173459177; 
 Wed, 24 Feb 2021 05:30:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx++Yy3k0FJY1Y7GcEPT+NBhq2uAVQSL5WLT1qp8ugF/8m5E4qd6oWvvYbssq/RL8G7YYHtnA==
X-Received: by 2002:a05:6000:89:: with SMTP id m9mr23443095wrx.3.1614173458871; 
 Wed, 24 Feb 2021 05:30:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j16sm3619776wra.17.2021.02.24.05.30.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 05:30:58 -0800 (PST)
Subject: Re: [PATCH] meson: Only generate trace files for selected targets
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210224120923.3154325-1-philmd@redhat.com>
 <CAFEAcA8OxLPeOb0TEAKSU-qJYntFPhmPeqooW5=C_55B8X+d_A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b59301fa-eec6-a2e2-4b7b-dfbfee3324a8@redhat.com>
Date: Wed, 24 Feb 2021 14:30:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8OxLPeOb0TEAKSU-qJYntFPhmPeqooW5=C_55B8X+d_A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 2:11 PM, Peter Maydell wrote:
> On Wed, 24 Feb 2021 at 12:11, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> We don't need to generate trace files for targets we
>> are not building. Restrict the the ones selected.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  meson.build | 10 +---------
>>  1 file changed, 1 insertion(+), 9 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 05a67c20d93..c9b0433667d 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1826,15 +1826,6 @@
>>    trace_events_subdirs += [
>>      'accel/tcg',
>>      'hw/core',
>> -    'target/arm',
>> -    'target/hppa',
>> -    'target/i386',
>> -    'target/i386/kvm',
>> -    'target/mips',
>> -    'target/ppc',
>> -    'target/riscv',
>> -    'target/s390x',
>> -    'target/sparc',
>>    ]
>>  endif
>>
>> @@ -2166,6 +2157,7 @@
>>    t = target_arch[arch].apply(config_target, strict: false)
>>    arch_srcs += t.sources()
>>    arch_deps += t.dependencies()
>> +  trace_events_subdirs += ['target' / arch]
> 
> This will catch all the 'target/foo' entries deleted above,
> but what about 'target/i386/kvm' ?

Yes, this doesn't work as expected... I just figured it was
working in my build directories because the trace header
previously generated are still present. I should have tested
in an empty directory before posting.

Regards,

Phil.


