Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CD637130E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:34:31 +0200 (CEST)
Received: from localhost ([::1]:51516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUyE-0005pA-SH
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldUv1-0003t0-DJ
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldUuz-0007XN-Ew
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:31:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620034267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MuymhP0nABEil2Pu03KbOMXhXT2nwGlgSrtCR0H6zaQ=;
 b=cKJ6v958/6GTSCakrh3Smq+byrJCKAXawXs1BSFhQfkaD2RWXgLYfpEbhcsnz1tLsKt8je
 6y4XIZO5bjOlRsycy33ZQEJUi2dbQuLndf8luFlbVqtR7WEpW/NUX1n+ayYLhVYFm0MbIN
 00eOGeJApt4h4uE8B8f73UnJG2foJKQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-sEZ445jDNcuAIbbkVji5Pg-1; Mon, 03 May 2021 05:31:03 -0400
X-MC-Unique: sEZ445jDNcuAIbbkVji5Pg-1
Received: by mail-wm1-f70.google.com with SMTP id
 n9-20020a1c40090000b02901401bf40f9dso2270712wma.0
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 02:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MuymhP0nABEil2Pu03KbOMXhXT2nwGlgSrtCR0H6zaQ=;
 b=Nr6oDcyQ51fJowE5M50CIUM02ACTFOWIchGfl4It6SM9w5+K0ovUMjYBvUHnggAJWE
 Qfg80is26g2HzKM3D+UWj/5SGssmBvJWAgGaeOHlcTLdShAdIJTyGWnW92fRkEe6lP3x
 jcxWohJDiZOErohmsu4nuN4eAGkbdaGRgvmwn1v6rbRhP3jLLjkjfK1IXGvn5yN/FdSl
 ZeGzw/djEsUcvNOFcmvvbo7N8B04C9SM2Uw09KccF9zV+gbhCaAuBzVOa1ST0jgWx1ZW
 ww4OY9go/HXmODK0KB1otAgZyptkBoiprbkbdi6uQ+mjbfMH1ijwsVrtkFiVlgOIsUFW
 MO6w==
X-Gm-Message-State: AOAM530XvoOD9DnsZhY43LfS0LCIVay6slBBQ8Fss+2XFDiJOia0Iu3F
 bxRE34gIImUVhYiMPsuQUgLWGksKl3+6DOHMukkMavtDa6deD2x9npD/ECZrMvzgvdiXfb/z2gp
 dQxwfkutUw0z27BycSTrv8u4yxHPGbYIaKfbbjd5DmTFXocP4W+ewYJ0XzU+ABBs=
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr23874782wrn.6.1620034262682; 
 Mon, 03 May 2021 02:31:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHpxnXQItN58m0lQoa/NeYjGwXyMynIaJl9anUnImBAvc69Vy3mQ77+Ln0YEoVN0BQKQ9a4g==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr23874752wrn.6.1620034262466; 
 Mon, 03 May 2021 02:31:02 -0700 (PDT)
Received: from thuth.remote.csb (p5791d0bc.dip0.t-ipconnect.de.
 [87.145.208.188])
 by smtp.gmail.com with ESMTPSA id y5sm11802928wrm.61.2021.05.03.02.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 02:31:02 -0700 (PDT)
Subject: Re: [PATCH 4/4] pc-bios/s390-ccw: Allow building with Clang, too
To: Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-5-thuth@redhat.com>
 <87r1iofm61.fsf@dusky.pond.sub.org>
 <15271277-98c2-3925-5937-b9f04ad376b3@redhat.com>
 <3808e5d4-b755-bce5-a25f-2d46ed6a59e7@redhat.com>
 <87mttcdy4n.fsf@dusky.pond.sub.org>
 <20210503111457.6f8e3597.cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9a0823a5-3782-c004-bbe6-7c5bc6830465@redhat.com>
Date: Mon, 3 May 2021 11:31:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503111457.6f8e3597.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/05/2021 11.14, Cornelia Huck wrote:
> On Mon, 03 May 2021 10:23:20 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
> 
>> David Hildenbrand <david@redhat.com> writes:
>>
>>> On 03.05.21 07:17, Thomas Huth wrote:
>>>> On 03/05/2021 06.58, Markus Armbruster wrote:
>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>   
>>>>>> Clang unfortunately does not support generating code for the z900
>>>>>> architecture level and starts with the z10 instead. Thus to be able
>>>>>> to support compiling with Clang, we have to check for the supported
>>>>>> compiler flags. The disadvantage is of course that the bios image
>>>>>> will only run with z10 guest CPUs upwards (which is what most people
>>>>>> use anyway), so just in case let's also emit a warning in that case.
>>>>>
>>>>> What happens when you try to use this bios with an old CPU anyway?
>>>>
>>>> Interesting question. I was expecting the guest to crash since it would be
>>>> using a CPU instruction that is not supported on the old CPU model. But I
>>>> just gave it a try, and there was no crash. The guest booted just fine.
>>>> Either Clang only emits instructions that work with the old z900 anyway, or
>>>> our emulation in QEMU is imprecise and we allow newer instructions to be
>>>> executed on old models, too.
>>>
>>> Yes, that's currently still done. We once thought about disabling that
>>> (there was a patch from Richard), but decided against it because -- back
>>> then -- the default QEMU model was still very basic and would have
>>> essentially disabled all more recent instructions as default.
>>>
>>> We can most probably do that change soon as we have a "fairly new"
>>> default QEMU CPU model. I can glue it to my z14 change.
>>
>> In case this makes the BIOS crash with old CPUs: when a guest refuses to
>> start because the BIOS was compiled the wrong way for it, configure
>> having told you so back then is not a nice user experience.  Can we do
>> better, with reasonable effort?
> 
> I fear the experience will be as bad as for any guest that is using
> features from a newer cpu level (i.e. random crashes when the guest
> actually tries to use that newer instruction.)
> 
> I see two options:
> - Just try to start and hope that it works.
> - Deprecate any cpu model older than z10.
> 
> Anyone have a better idea? I don't particularly like any of the two.

I think we should simply continue to build the default bios with GCC and 
-mz900. So the normal user (who does not explicitly use the freshly compiled 
binaries but the pre-built ones) will never experience any problem here. The 
Clang builds are (at least right now) rather only meant for us developers to 
check the sources from time to time with this compiler, to see whether it 
detects some additional issues compared to GCC.

  Thomas


