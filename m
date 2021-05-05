Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2663373AF8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 14:18:49 +0200 (CEST)
Received: from localhost ([::1]:41644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGUK-0007fO-PU
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 08:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leGRT-0006Tf-K5
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leGRE-0005FU-CT
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:15:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620216935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G/ukq4fBrMNOoXGhKZp67DscUDdoIvlYL2myCRUer4U=;
 b=Fj1fOuzAbaL7KiNmUz1ZaX7zvj9OT9HGoHqRSV18LaluYhes/wDWSs+DB44zKqBpyqkteH
 r7WckeJQR+s3091nrSsxDI+sJYRDoHK36Ab97phOygz15+sEtAYoWeczKcoYHRS7NEKDw2
 VMqPPC3ZsrxkhQq8hZYl8WtugSl6JQc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-mhvSEjW8P2aZTT5ZF8lXVg-1; Wed, 05 May 2021 08:15:32 -0400
X-MC-Unique: mhvSEjW8P2aZTT5ZF8lXVg-1
Received: by mail-wr1-f70.google.com with SMTP id
 d20-20020adfc3d40000b029010e1a640bbfso609549wrg.21
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G/ukq4fBrMNOoXGhKZp67DscUDdoIvlYL2myCRUer4U=;
 b=EJOgf0w2eKSDZRXnj/jXx5CbB5go3dxAI7lcCNuOhBpFKtD/Vi7muzIS43rtv/7xsC
 fTF8hgCx0N8G65+DDXPmPU5wOfHlNcm0DrN4V4NwwKNq19ehpHTPan1g+rWQFqYFzyJ1
 RLgANEMLvPo0vFNRp79l6N3K1gxQGWTYT04bnqjskUhaXlyX5IAIykSdll+ERGiSrxFk
 xGWr6PFaa74KU1F/kq3Ad/n/bXzezm0ouNbCGEXfxQjkJAkcUCrC9jEdYYxlEiQExqhf
 UvTxg77upa+ylssYyglojZkccCs00SQBnsFVSfp8dnYpgEdxZXdJtb/ayEUFOIymtbHZ
 e+AA==
X-Gm-Message-State: AOAM5308/woBdc+wm9iqEpmUGCDBWLlrfySuCQicN5G4YS4ETd9VYUj2
 n8f2NHrdIftiyvDNo8GsdP52O1vISjFKKetBfygiqyrx/q39DemuIPEHH14JySeGrkG2zByK44q
 gz+4zPcHmVO2CbV0=
X-Received: by 2002:adf:d215:: with SMTP id j21mr39066984wrh.251.1620216931225; 
 Wed, 05 May 2021 05:15:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn2DlVV2m4soR5E8FaW8gJIaHayepjonhK3qW3QQqsFR53iW6zckxmvcc3IoYGoKmLQo9k4A==
X-Received: by 2002:adf:d215:: with SMTP id j21mr39066943wrh.251.1620216930961; 
 Wed, 05 May 2021 05:15:30 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id w7sm11992077wru.51.2021.05.05.05.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 05:15:30 -0700 (PDT)
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de> <875z21aghn.fsf@linaro.org>
 <50c3c1e6-cc62-ee50-874b-72615d7bfac7@suse.de> <87o8dpo4ww.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <03b6b51e-71d7-a2c9-4d3d-db1ac77a1484@redhat.com>
Date: Wed, 5 May 2021 14:15:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87o8dpo4ww.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 12:04 PM, Alex Bennée wrote:
> Claudio Fontana <cfontana@suse.de> writes:
>> On 3/8/21 3:02 PM, Alex Bennée wrote:
>>> Claudio Fontana <cfontana@suse.de> writes:
>>>
>>>> Hi,
>>>>
>>>> anything else for me to do here?
>>>
>>> It looks to me that this series is looking pretty good. Every patch has
>>> at least one review so I think it's just waiting on the maintainers to
>>> pick it up.
>>>
>>> Paolo/Richard - are you intending to take the series as is or are you
>>> waiting for something else? I'd like to see the patch delta reduced for
>>> the ARM cleanup work which is still ongoing.
>>
>> I am a bit at a loss here, as this has been reviewed for a while, but nothing is happening.
>> Rebasing is starting to become more and more draining;
> 
> This is still the latest re-factor right?
> 
>   Subject: [PATCH v28 00/23] i386 cleanup PART 2
>   Date: Mon, 22 Mar 2021 14:27:36 +0100
>   Message-Id: <20210322132800.7470-1-cfontana@suse.de>
> 
>> I am seeing some changes from Phil that redo some of the patches here (like target arch user),
>> maybe you would like to drive this?
> 
> AIUI his changes where to get qtest passing.

I hadn't read Claudio's mail, I think he's mentioning commit 46369b50ee3

    meson: Introduce meson_user_arch source set for arch-specific user-mode

    Similarly to the 'target_softmmu_arch' source set which allows
    to restrict target-specific sources to system emulation, add
    the equivalent 'target_user_arch' set for user emulation.

The patch only contains 6 lines in 2 hunks, if it introduced a conflict
it should be trivial to resolve (I wasn't expecting it to conflict with
your work when I merged it TBH).

> I've just been chatting to
> Paolo on IRC so I think we are almost ready to go.
> 
>   > bonzini_: what's currently holding up getting Claudio's re-factoring
>       work merged?
>   > f4bug: also ^ - I'm a little worried we have splintering
>       re-factoring forks
>   *** First activity: f4bug joined 2 hours 8 minutes 6 seconds ago.
>   <f4bug> stsquad: the qtests series is pending imammedo review then
>       could go in
>   <f4bug> stsquad: which would simplify a bit Claudio's series (on
>       respin he could drop a pair of patches)
>   <f4bug> stsquad: my understanding was bonzini_ would merge the x86
>       series, then pm215 could merge the arm one on top
>   *** First activity: bonzini_ joined 1 hour 17 minutes 25 seconds ago.
>   <bonzini_> ok i can queue it in my next PR
>   <f4bug> the only blocking part is qtest not passing, but Claudio's
>       refactor series is not the culprit
>   <bonzini_> ok

I was referring to:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg804015.html

Then these aren't required:
- tests: restrict TCG-only arm-cpu-features tests to TCG builds
- tests: device-introspect-test: cope with ARM TCG-only devices

These could be reworked to use qtest_has_accel() instead of the
/* XXX */ comments:
- tests: do not run test-hmp on all machines for ARM KVM-only
- tests: do not run qom-test on all machines for ARM KVM-only

I didn't noticed the following patch had its content changed:
Revert "target/arm: Restrict v8M IDAU to TCG"
So now this is not a full revert, only the TYPE_IDAU_INTERFACE
type is moved back.

While this fixes the build, we still have a QOM design problem.
QOM interfaces can't be Kconfig-selected out. <- Eduardo, Markus?


More generally I think more code should be automatically stripped
out by Kconfig instead. In [1,2] I suggested to tie accel-specific
Kconfig selectors:

  config ARM_V7R
    bool
    depends on TCG && ARM

  config ARM_V7M
    bool
    depends on TCG && ARM
    select PTIMER

  config XLNX_ZYNQMP_ARM
    bool
    default y if TCG && AARCH64

But this can certainly be done on top of Claudio's work.

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg777710.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg777719.html


