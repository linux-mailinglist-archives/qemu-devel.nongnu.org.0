Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF52D76CA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:42:08 +0100 (CET)
Received: from localhost ([::1]:45178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knigR-0006oV-8V
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:42:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knif2-0006H5-1Y
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:40:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knif0-0001r2-7p
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607694037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXdTbbDzfX9cX0QgVccEyhUiTi5xH+enXnLYKtyLAmA=;
 b=KAUH7DQyYwcA09zmRISnyF3LS7td4h96Ez8L3Ixq+SnrVas1ip6gddhnsgPjbYZG95qKF4
 /LctM009/IHCK9hCaguzm/7Uc40hFR9izZuM77zPb9SFT50xvhIaERPhh3i0C96vepGdpR
 1UuH+EZvkuW/5OXQnRfub0QUC1UzCRs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-kbGLDYLKMDSNuOGu7AA6Ww-1; Fri, 11 Dec 2020 08:40:35 -0500
X-MC-Unique: kbGLDYLKMDSNuOGu7AA6Ww-1
Received: by mail-ej1-f69.google.com with SMTP id dc13so2774937ejb.9
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 05:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HXdTbbDzfX9cX0QgVccEyhUiTi5xH+enXnLYKtyLAmA=;
 b=XD/IeJJrEcstJc/1qJzfAKN3beH6djDJVkauk4XvNGcD/fj4PmYQfGnG6zSNWhbjRk
 zbKJi1C0tNnudD/X3QaPYX0xUBEragkwjDtWJs4YrrT40lt0iY9UjLNBjAlFqzzn0CJS
 etbljCJipVR1vLAZ/31PlV8y7TKaasLm5It7c5ySzKqr9twBYTUrWJYA7853y5ZhMClt
 kaLv2Mq2EV6askVbr8PjrY8exf8cYnRTopbHHFE7QQXkB+ZzHsz/8PstVxgWzRg9k0xN
 Fxm4F0QL0gmRNn12smGWptSJU+UP3+6IlDKUJKkUENbGd2vbF3mjs/WHflUKjO1zp40K
 mC+g==
X-Gm-Message-State: AOAM531BX5xMIOr0BhMHp772I5eZHTjwbrYRjr52jr5OdveWJi1VgKWF
 BQOyLp1nBUms0uTmY3gACp/B0fmC6aAvWM+/uexMZ4YyExS/ExUFviI7+ce4WyLkpW2Gtb3ldmM
 G552M33YJS/DO7LU=
X-Received: by 2002:a17:907:414c:: with SMTP id
 od20mr10844486ejb.75.1607694034509; 
 Fri, 11 Dec 2020 05:40:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+kV/q1ov2J07hF/3cKcPHLFLzUKgxvYLjW9lJ6HcLuGM4MttZ3bDzItCpfsRpwhsYt20Z1w==
X-Received: by 2002:a17:907:414c:: with SMTP id
 od20mr10844473ejb.75.1607694034268; 
 Fri, 11 Dec 2020 05:40:34 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id f19sm6865828ejk.116.2020.12.11.05.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 05:40:33 -0800 (PST)
Subject: Re: [RFC PATCH v4] compiler.h: remove GCC < 3 __builtin_expect
 fallback
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201211131346.473882-1-philmd@redhat.com>
 <CAFEAcA-xn2QfcJ9pWx6SW=sjh3GeNZ_aOA_SHoycqC=zE-5ozQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <86831153-46c0-3bea-dd24-594ef258c1f4@redhat.com>
Date: Fri, 11 Dec 2020 14:40:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-xn2QfcJ9pWx6SW=sjh3GeNZ_aOA_SHoycqC=zE-5ozQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 2:33 PM, Peter Maydell wrote:
> On Fri, 11 Dec 2020 at 13:13, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Since commit efc6c07 ("configure: Add a test for the minimum compiler
>> version"), QEMU explicitely depends on GCC >= 4.8.
>>
>> (clang >= 3.4 advertizes itself as GCC >= 4.2 compatible and supports
>> __builtin_expect too)
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> [PMD: #error if likely/unlikely already defined]
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Supersedes: <20201210134752.780923-4-marcandre.lureau@redhat.com>
>> ---
>>  include/qemu/compiler.h | 7 ++-----
>>  1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>> index c76281f3540..ae1aee79c8d 100644
>> --- a/include/qemu/compiler.h
>> +++ b/include/qemu/compiler.h
>> @@ -43,14 +43,11 @@
>>  #define tostring(s)    #s
>>  #endif
>>
>> -#ifndef likely
>> -#if __GNUC__ < 3
>> -#define __builtin_expect(x, n) (x)
>> +#if defined(likely) || defined(unlikely)
>> +#error building with likely/unlikely is not supported
> 
> When exactly will the system headers have 'likely' defined,
> and when would they define it to something other than the
> obvious __builtin_expect() definition the way we do?

Since there was a check, I tried to be extra-cautious
(better safe than sorry).

> likely() and unlikely() in my view fall into a category of
> macros like "container_of()" which aren't defined by a system
> header but which do have a standard known set of semantics.
> 
> I think there are two reasonable approaches:
>  (1) just define the macro, on the assumption that the
> system headers won't have done (because these aren't standard
> macros)
>  (2) as we do with container_of() currently, wrap our
> definitions in #ifndef whatever, so that we assume that
> whatever version we might have got from the system is fine
> 
> I don't think there's any point in explicitly #error-ing here:
> in fact, it makes the diagnostic to the user less useful,
> because instead of the compiler complaining about the macro
> being defined twice and giving both locations where it was
> defined, now it won't tell the user where the other definition
> was...

"diagnostic less useful" is a good reason (to invalidate this
patch).

> I think my preference would be "just drop the ifdef", but
> there isn't much in it really.

Yes, let's stick to Marc-André v3.

Thanks for your review!

Phil.


