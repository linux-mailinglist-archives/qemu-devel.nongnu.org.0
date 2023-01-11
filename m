Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E65665B47
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 13:24:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFa82-0004RJ-9e; Wed, 11 Jan 2023 07:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFa7y-0004Qg-GV
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 07:22:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pFa7v-000057-Gy
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 07:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673439762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yEYZiH/Ph6zRFMocgLriJV3qKykFL1ySLUuMpvE1co0=;
 b=H+C6/IDY2Ec4ZPBW/xFM53iMJ1CuLP4UJhAammNKSte+3651tHabKsKA/4Pb6Uum3I8/xQ
 d3PbaZOnMDeosbyFUJUrhvgZX1WJ4VZQfxQZ9r6qUbiKBszIV4XbrdU18COhEOhjge4mz5
 152+gN1gwUn1WQYwJ/oeMoF6Y2VXuFg=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-_i4x6VlFP3aXRwpeoUnNFw-1; Wed, 11 Jan 2023 07:22:41 -0500
X-MC-Unique: _i4x6VlFP3aXRwpeoUnNFw-1
Received: by mail-vs1-f70.google.com with SMTP id
 65-20020a671544000000b003c4da67b3easo3697016vsv.19
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 04:22:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yEYZiH/Ph6zRFMocgLriJV3qKykFL1ySLUuMpvE1co0=;
 b=kjjK0X0Ekt8VmtlrWSM4N2iHvJ7aIrdckT3wKbcav+63jdC92cOhr5y0tSRpQv1Ouf
 nQ2NszRDNPYVxhJLTMDNbwDlN4fuGOw9zrOLgvZJ6S+DxWP5ZHL8x+QX0B9TWRiHKiHk
 Z2onOjL53XT5BLRm4HpzJqpk9VOIu1r7e/XbzIEXxPRw+PVxupr49h1OmdG9cR6H3vxp
 W1sMimXyDYjHw8QX7V/Nbu2Gc4+zTIefFcRsHb/a82L32HgEAAzavHtVyEWcFV2hEcPW
 uZb0SPH1DYcp+q3RtePgozBSOHcbkqg0FgJkURkNIOPLOqy37ld+p9guYkhYRd39BdUY
 oDZQ==
X-Gm-Message-State: AFqh2kpv29FTYYKeni8/sq1XjSlmSJU2yHyPYqfecIlN0YT/TKnjk/fQ
 cHETRznvlEelgqi8j9vIx/599CqbxtH/SN4nygH5IkFrP1XMJTNibAz8IxZkR3n+NscJoRu2ljY
 mKkeVIkLr9G5Qv2g=
X-Received: by 2002:a67:d902:0:b0:3cb:bbc5:ba60 with SMTP id
 t2-20020a67d902000000b003cbbbc5ba60mr26218357vsj.5.1673439760849; 
 Wed, 11 Jan 2023 04:22:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuJQcJ+waI38fFpoDSkhHcR5OHno4dldtD3yLISmsRncE9ugT9zXYZf20vyfnknaXL5ew2hCg==
X-Received: by 2002:a67:d902:0:b0:3cb:bbc5:ba60 with SMTP id
 t2-20020a67d902000000b003cbbbc5ba60mr26218338vsj.5.1673439760586; 
 Wed, 11 Jan 2023 04:22:40 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-91.web.vodafone.de.
 [109.43.176.91]) by smtp.gmail.com with ESMTPSA id
 q5-20020a05620a0d8500b006eee3a09ff3sm8920213qkl.69.2023.01.11.04.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 04:22:39 -0800 (PST)
Message-ID: <dd02aa03-1c97-9a1f-4d06-6f9802ce7644@redhat.com>
Date: Wed, 11 Jan 2023 13:22:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
Content-Language: en-US
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
 <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/01/2023 13.08, Claudio Fontana wrote:
> On 1/10/23 15:02, Peter Maydell wrote:
>> On Tue, 10 Jan 2023 at 13:36, Fabiano Rosas <farosas@suse.de> wrote:
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
>>>>>
>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>
>>>>>> On 09/01/2023 23.42, Fabiano Rosas wrote:
>>>>>>> From: Claudio Fontana <cfontana@suse.de>
>>>>>>>
>>>>>>> on ARM we currently list and build all machines, even when
>>>>>>> building KVM-only, without TCG.
>>>>>>>
>>>>>>> Until we fix this (and we only list and build machines that are
>>>>>>> compatible with KVM), only test specifically using the "virt"
>>>>>>> machine in this case.
>>>>>>
>>>>>> Why don't you fix it immediately? ...
>>>>>
>>>>> My idea was to have in this series the minimum to unbreak the
>>>>> --disable-tcg build and later bring the rest of the changes
>>>>> incrementally.
>>>>
>>>> This test is basically checking "all the machines should
>>>> work". That's an important invariant to maintain, so
>>>> I don't think we should just skip it for Arm targets.
>>>
>>> But what does "all machines" mean in a no-TCG build? The original intent
>>> of the patch was that only 'virt' should be present and therefore the
>>> only one tested.
>>
>> It means "every machine the user can create". If the
>> machine can't run then either we shouldn't compile it
>> in, or else we should be compiling in enough extra stuff
>> to allow it to work.
>>
>> -- PMM
> 
> Hi,
> 
> once upon a time there was a series by Philippe to accomplish that (KConfig) right?

Maybe that one:

  https://lore.kernel.org/qemu-devel/20190903114729.3400-1-philmd@redhat.com/

?

  Thomas



