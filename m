Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D956A37B6BE
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:18:48 +0200 (CEST)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgj8p-00027L-WE
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgj7O-0000h6-Cg
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgj7K-00017u-1O
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620803833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8u79L+6AztmrXQunsUlgGSY3ozchfRMRDkalVcHLINo=;
 b=KsAtzP3VNcUECuujj+ar2KQCCLsa6BZlau8Eaid3uGO6uJ785W78Tb+G4S6QfoGQowZlCd
 OmbsjI4uHHdT/iCeTXke+JpRtnOdllwxDEkRLT43ID8fBt5canq3AJ2nzBq02Uj/+rGX3P
 cHpAE3DpurzuKXZnPJnEvWQt+dojkK8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-LKKKhZ-GNHKiwv47ApkKbw-1; Wed, 12 May 2021 03:17:11 -0400
X-MC-Unique: LKKKhZ-GNHKiwv47ApkKbw-1
Received: by mail-wr1-f71.google.com with SMTP id
 f1-20020adf9f410000b029010e8048a0e3so4531801wrg.4
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8u79L+6AztmrXQunsUlgGSY3ozchfRMRDkalVcHLINo=;
 b=SZYvsXiGCW/aECfH9p0QUD4lXIn5yYKEq78cvShDGLyY6G8W1Brp3Wr/yF4JelchNy
 axnLQ2Az4N94mb/IRxZx47mq2GPbq6L89AmBWYqr8D6BjvoXWBzD5OOCUlI6gz0fmpJy
 VZ4Y9upBTKgY6UJiRFO4wSU1FFlpPgC7JSZW96GrwMsiHCDWrO9SfQTwRYOqO6bTQSYI
 n7pURFuVe9UVTR2JFVpYhhOgkfcd0hp/7NSmjPPxkVmzIkVxEnxp4b50GVeqMFIeLMQL
 RDY5OOHYU9cIZ466Z7TVo4llrLnjChkRK8sC+RlXGmKI1nNrpSnTxL2xYbURCZIn2L4G
 YOtA==
X-Gm-Message-State: AOAM532OCqCXOsLlWxQNnHId81UQZu0Y3TRktAz4QGDQehmwYfhXVWE4
 KlKRMKI7slX0rXDcfNlE121gDlfsWfqMueGn0ci7MGZaIkHojpA83ywZ5mwz4y+jrO8FEkUop+I
 0bDyknwiPVdPN294=
X-Received: by 2002:a7b:c846:: with SMTP id c6mr9752919wml.75.1620803829579;
 Wed, 12 May 2021 00:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkHK4hJqBgBVfocGGyPVJkZn9/iSv5rfwefEv2vWBM2w0NV6rT2Uh9SXK3bO855ir5w3aN7Q==
X-Received: by 2002:a7b:c846:: with SMTP id c6mr9752899wml.75.1620803829301;
 Wed, 12 May 2021 00:17:09 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id l18sm29957273wrt.97.2021.05.12.00.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 00:17:08 -0700 (PDT)
Subject: Re: [PATCH v26 00/20] i386 cleanup PART 2
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
References: <20210301085450.1732-1-cfontana@suse.de>
 <cfeead83-4890-bdd8-c5cb-9bdb2ca24abb@suse.de> <875z21aghn.fsf@linaro.org>
 <50c3c1e6-cc62-ee50-874b-72615d7bfac7@suse.de> <87o8dpo4ww.fsf@linaro.org>
 <03b6b51e-71d7-a2c9-4d3d-db1ac77a1484@redhat.com>
 <20210505193141.4tb6k5cupbovctbs@habkost.net>
 <a6049846-2edf-c22f-0b7b-5a9f087223ab@suse.de>
 <a6f5e405-039a-a055-ffec-dd9e65bf209e@redhat.com>
 <19a1ed59-af39-3c20-2156-6bf4b3026973@redhat.com>
Message-ID: <d3fea8e3-57a8-b50e-c072-9718f8d0967d@redhat.com>
Date: Wed, 12 May 2021 09:17:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <19a1ed59-af39-3c20-2156-6bf4b3026973@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 11:33 AM, Philippe Mathieu-Daudé wrote:
> On 5/6/21 11:10 AM, Philippe Mathieu-Daudé wrote:
>> On 5/6/21 9:55 AM, Claudio Fontana wrote:
>>> On 5/5/21 9:31 PM, Eduardo Habkost wrote:
>>>> On Wed, May 05, 2021 at 02:15:29PM +0200, Philippe Mathieu-Daudé wrote:
>>>>> On 5/5/21 12:04 PM, Alex Bennée wrote:
>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>> On 3/8/21 3:02 PM, Alex Bennée wrote:
>>>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>>>
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> anything else for me to do here?
>>>>>>>>
>>>>>>>> It looks to me that this series is looking pretty good. Every patch has
>>>>>>>> at least one review so I think it's just waiting on the maintainers to
>>>>>>>> pick it up.
>>>>>>>>
>>>>>>>> Paolo/Richard - are you intending to take the series as is or are you
>>>>>>>> waiting for something else? I'd like to see the patch delta reduced for
>>>>>>>> the ARM cleanup work which is still ongoing.
>>>>>>>
>>>>>>> I am a bit at a loss here, as this has been reviewed for a while, but nothing is happening.
>>>>>>> Rebasing is starting to become more and more draining;
>>>>>>
>>>>>> This is still the latest re-factor right?
>>>>>>
>>>>>>   Subject: [PATCH v28 00/23] i386 cleanup PART 2
>>>>>>   Date: Mon, 22 Mar 2021 14:27:36 +0100
>>>>>>   Message-Id: <20210322132800.7470-1-cfontana@suse.de>
>>>>>>
>>>>>>> I am seeing some changes from Phil that redo some of the patches here (like target arch user),
>>>>>>> maybe you would like to drive this?
>>>>>>
>>>>>> AIUI his changes where to get qtest passing.
>>>>>
>>>>> I hadn't read Claudio's mail, I think he's mentioning commit 46369b50ee3
>>>>>
>>>>>     meson: Introduce meson_user_arch source set for arch-specific user-mode
>>>>>
>>>>>     Similarly to the 'target_softmmu_arch' source set which allows
>>>>>     to restrict target-specific sources to system emulation, add
>>>>>     the equivalent 'target_user_arch' set for user emulation.
>>>>>
>>>>> The patch only contains 6 lines in 2 hunks, if it introduced a conflict
>>>>> it should be trivial to resolve (I wasn't expecting it to conflict with
>>>>> your work when I merged it TBH).
>>
>>> I'd suggest to move the discussions about the ARM series to the arm series thread.
>>>
>>> I am concerned here about the groundwork and x86 part.
>>
>> OK sorry, I was explaining the IRC chat.
>>
>> Is there any issue rebasing the groundwork on top of commit 46369b50ee3?
>>
>> Maybe my qtest/accel series is irrelevant to your x86 part, TBH I don't
>> remember.
> 
> So far I could rebase this series on top of commit 229a834518b
> (Mon Mar 8 15:45:48 2021).

Pfff I realized late you asked on the v26 series, but v28 is
available... Let's try again.

> First trivial conflict with 2cc1a90166b ("Remove deprecated
> target tilegx"), removing target/tilegx/meson.build resolves it.
> 
> Then apparently commit b8184135835 ("target/i386: allow modifying
> TCG phys-addr-bits") which is not trivial (to me).
> 
> Finally "meson: add target_user_arch" indeed clashes with commit
> 46369b50ee3 ("meson: Introduce meson_user_arch source set for
> arch-specific user-mode"). I am sorry I didn't notice your patch,
> but am glad we both sent a similar patch :) Mine allows optional
> sourceset, so you can simplify your patch, only keeping the x86
> part:
> 
> -- >8 --
> diff --git a/target/i386/meson.build b/target/i386/meson.build
> index fd24479590..cac26a4581 100644
> --- a/target/i386/meson.build
> +++ b/target/i386/meson.build
> @@ -19,6 +19,7 @@ i386_softmmu_ss.add(files(
>    'machine.c',
>    'monitor.c',
>  ))
> +i386_user_ss = ss.source_set()
> 
>  subdir('kvm')
>  subdir('hax')
> @@ -28,3 +29,4 @@ subdir('tcg')
> 
>  target_arch += {'i386': i386_ss}
>  target_softmmu_arch += {'i386': i386_softmmu_ss}
> +target_user_arch += {'i386': i386_user_ss}
> ---
> 
> Regards,
> 
> Phil.
> 


