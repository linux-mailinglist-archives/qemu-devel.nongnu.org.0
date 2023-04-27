Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2836F0285
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 10:27:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prwx6-0001GS-Uk; Thu, 27 Apr 2023 04:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prwx5-0001Fz-3D
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1prwx2-0001Ei-F2
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 04:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682583963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VniyrMwMUeOpGEimTcUSJ+ddNI4PtF2FFblZzcTMdyQ=;
 b=Eow8YgRz9I+i/HG/SiO9nXStiSX+fyTKUmHQ10SHNU9FzXxFCWX02zEeM0l4TOPuZHPI3b
 qymajauMXcsFLusUObpumYr23ZJ7VBIo+yHyGVz3tUYqWOc60vsbHbp1pVbCaO1Tsv6Jgu
 M8gD4kV3mG56kFiWyruQTZBbT3jhZ6c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-CeRyeqivN-ykaB0lzyXkaA-1; Thu, 27 Apr 2023 04:26:01 -0400
X-MC-Unique: CeRyeqivN-ykaB0lzyXkaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f3157128b4so9998815e9.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 01:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682583960; x=1685175960;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VniyrMwMUeOpGEimTcUSJ+ddNI4PtF2FFblZzcTMdyQ=;
 b=JwJDQCv67CiWVFXRqjI/fpa7s8eZv4r5v/ANm0Ea8mYJbVkMAfCAoYShClezMTHdJA
 jWfk3KEX/o9lOrYiKihvHoTal5KdnhP7ws3qEbyjDVVPAtYaCdQ45qKR1WgRIbqjbthS
 HfooWhgFHImycrAKE8N9axc6pTWWmLOug3X/VpH8FFBPPLn2l8ab+zr0bh6Kf256UC8p
 wXdYoTqEmU0cTNdaT+n7CKh4YE+Js07nN+Ajcs6Recug2KSGD9GQmmKhtNIyoRpjVwAS
 lZU4H8HmA0lCQ2P0/MqbQOrX8IahrUSq3y60cfEfj5CikEMhpzhFPCLZoO0FxVRrmMrP
 EEZw==
X-Gm-Message-State: AC+VfDzobRkcvzTqnq9kWD+7mVv4AgCJS0g09qRGAdt0BNRfW7u+9npd
 dwGdq/RXrIjcWaoGHgNlheTfWpHyffg3/w9wDIXA2QUwBhhYmB8ovSVMSg4ap27/3UO8EVivIDP
 ehBt6Y3xPLXEfKQc=
X-Received: by 2002:a05:600c:5409:b0:3f1:754e:69e6 with SMTP id
 he9-20020a05600c540900b003f1754e69e6mr3553637wmb.17.1682583960298; 
 Thu, 27 Apr 2023 01:26:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BL8jhtkLmCPdUPtJnoLcJd1q16cf/TFI/j42cugjcZVNmRPfYXLfd3TesyiKtYkFWKkJCDw==
X-Received: by 2002:a05:600c:5409:b0:3f1:754e:69e6 with SMTP id
 he9-20020a05600c540900b003f1754e69e6mr3553621wmb.17.1682583959995; 
 Thu, 27 Apr 2023 01:25:59 -0700 (PDT)
Received: from [10.32.181.74] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
 by smtp.googlemail.com with ESMTPSA id
 he13-20020a05600c540d00b003f198b9eac5sm14864850wmb.6.2023.04.27.01.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 01:25:59 -0700 (PDT)
Message-ID: <7528672e-9b12-84db-dd83-7addf987d49c@redhat.com>
Date: Thu, 27 Apr 2023 10:25:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 0/3] Deprecate the qemu-system-i386 binary
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230425133851.489283-1-thuth@redhat.com>
 <5fc11d22-275d-cc8d-bf9c-f1c015cbee23@redhat.com>
 <f0c9cd0b-d1f4-4fb8-1f47-6506a09a56e0@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <f0c9cd0b-d1f4-4fb8-1f47-6506a09a56e0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/27/23 10:13, Thomas Huth wrote:
> On 26/04/2023 12.59, Paolo Bonzini wrote:
>> On 4/25/23 15:38, Thomas Huth wrote:
>>> - CPU types have different suffixes between the -x86_64 and -i386
>>>    variant (see TYPE_X86_CPU in cpu-qom.h) ... do we need to care
>>>    about this in the new qemu-system-i386 symlink run mode?
>>>
>>> - The code in target/i386/tcg/sysemu/smm_helper.c looks like it
>>>    maybe needs a runtime switch, too ... or is it ok to leave this
>>>    hard-coded to the x86_64 version?
>>
>> Yes, it would have to switch based on the CPU's LM feature.
> 
> Ok. BTW, what happens if you run qemu-system-x86_64 with -cpu lm=off 
> today? Isn't that a problem already?

Nothing special---I was thinking of migration compatibility from old 
savefiles created with qemu-system-i386, but using LM would break 
compatibility from old savefiles created with qemu-system-x86_64 and 
32-bit CPU models.

A better way to go would be to have a separate property than LM (e.g. 
64bit-smm-format=on|off), and add a "-global" based on -i386 vs. -x86_64.

>>> Anyway, I'd like to get some feedback on this idea here... What
>>> do you think of the idea of getting rid of the qemu-system-i386
>>> binary this way in the future?
>>
>> I wonder if we should take this a step further and rename 
>> qemu-system-x86_64 to qemu-system-x86!  Distros can if they wish 
>> create symlinks to both qemu-system-i386 and qemu-system-x86_64.
>>
>> Then we would name the CPUs "foo-x86" and alias them to foo-x86_64 
>> and, if they don't have LM set, to foo-i386 as well.
> 
> I like the idea! ... we could maybe even go a step further and change 
> the default machine to "q35" in the -x86 binary (or use no default 
> machine at all), and switch back to "pc" as default if running in 
> -x86_64 or -i386 mode...

That's a clever way to move away from the "-M pc" default, indeed.

(BTW, on the user-mode emulation side qemu-i386 and qemu-x86_64 identify 
the ABI, so the binaries cannot be unified.  Still, it would be 
beneficial to make qemu-i386 use the x86_64 emulation code, because 
right now QEMU user-mode emulation---unlike real hardware---cannot run 
32-bit binaries with new CPU models.  So the above unification effort 
would benefit both system and user-mode emulators).

Paolo


