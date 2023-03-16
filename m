Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659656BCD75
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 12:05:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pclOY-00079P-Ur; Thu, 16 Mar 2023 07:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pclOH-000767-2O
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 07:03:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pclNr-0007hB-2Y
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 07:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678964558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=15GnwlDRLU4avMmFbMZi6F7WTmX1tHCOoLuRobo+FnE=;
 b=BrTlwxE2WRJcZbGBSoptqBedxBgOaNXFU8mzkXeBS+vkUw1jN/fcCC7ZpVmgU/PpsqtilA
 xPWiz7IHSnAJANogX9WxUzJfqQ9nGAsHDXgKPAbIVZk33erkuJ56S99L5bbi0PiA9a80kt
 1kogp8W9dYya76CiuUmD6x2GeRsvvqA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-E1LKhwxLOOKqF33GaEzV2Q-1; Thu, 16 Mar 2023 07:02:36 -0400
X-MC-Unique: E1LKhwxLOOKqF33GaEzV2Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 r9-20020a05640251c900b004d4257341c2so2470351edd.19
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 04:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678964555;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=15GnwlDRLU4avMmFbMZi6F7WTmX1tHCOoLuRobo+FnE=;
 b=jjTOjzGE3LwRy203cQgALwVGf8nIXFkBsFQuUWlvdeSaP7bMHBlsBf77TVP0j9zplu
 iMjxpVvAO+j702TTweHhNWwXRf0Xd02xeWAHynQTvyq7S9HzLICqBQsfFNEdUiZWGC2e
 /40ZOogpUE0Ad8P9AY5HDlW5+9FeqKqjrxl73W5ywYvqEyKEANHEmDPe1axvag2RlEAM
 NfoAuizIAis9d2XSV9sr3GsVXUv+C2fpFYGad09vSj4aDO+6tj32ysTixmdiPc35GNdR
 VhW2I8bHIDBmZ6jNdVvQryShBQP3HlPQ7MEnTSCBtb1Z+K99ScbRe3HVpOR/O22qEVa8
 lJTg==
X-Gm-Message-State: AO0yUKXwD6bxZwe68GujWUdNugX/fSmztKCFfIYHVfPl2C7VyWjfIMtP
 nyerniLjJU5mMtncMotpjMYtzbn8qXmSSlgO037+oX+fRhv4mzCO3bAXxGImAKugfA3CRaIQ1Zx
 cjQ1xHSaE8DLUsrQ=
X-Received: by 2002:aa7:de82:0:b0:4fd:2b04:6e8b with SMTP id
 j2-20020aa7de82000000b004fd2b046e8bmr6143996edv.29.1678964555652; 
 Thu, 16 Mar 2023 04:02:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set+MBj/Y90In/z2ZiPkex91MOnjL0Re91vaC379NAOh85u0vr+x+p8Mx+zLzTOraGuoKFf/OGw==
X-Received: by 2002:aa7:de82:0:b0:4fd:2b04:6e8b with SMTP id
 j2-20020aa7de82000000b004fd2b046e8bmr6143974edv.29.1678964555346; 
 Thu, 16 Mar 2023 04:02:35 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-151.web.vodafone.de.
 [109.43.176.151]) by smtp.gmail.com with ESMTPSA id
 t14-20020a508d4e000000b004fc01b0aa55sm3696935edt.4.2023.03.16.04.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 04:02:34 -0700 (PDT)
Message-ID: <ac632c34-42e0-d715-52d9-b70ead6296a7@redhat.com>
Date: Thu, 16 Mar 2023 12:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Andrew Randrianasulu <randrianasulu@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-discuss@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
References: <CA+rFky6A9Q_5sJ4WDO-Z2HBT59qiNgr8A-xk+O7-gnAMZmHt2A@mail.gmail.com>
 <f06fddef-1e40-1858-2715-50a0518a97f6@linaro.org>
 <CA+rFky5=kc0Pwf3RRhuKrBqtRVkmtm=NDKhrVgJV2_Ame2nUOQ@mail.gmail.com>
 <c33b0e07-5c46-6ebe-fe4c-5308ce508a70@linaro.org>
 <632e7256-34f5-ca87-ff60-a5c11aa1dd7f@redhat.com>
 <CA+rFky6WqdLjNpeU3sCXwjwMEuEK+XVHE5BBCKYC=umRGK81eg@mail.gmail.com>
 <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: dropping 32-bit host support
In-Reply-To: <CA+rFky4su7ZEo8pNQGk3qEkTOLEkFAqO2Tsrh6VyDaNOf7w=_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/03/2023 11.22, Andrew Randrianasulu wrote:
> 
> 
> чт, 16 мар. 2023 г., 12:17 Andrew Randrianasulu <randrianasulu@gmail.com 
> <mailto:randrianasulu@gmail.com>>:
> 
> 
> 
>     чт, 16 мар. 2023 г., 11:31 Thomas Huth <thuth@redhat.com
>     <mailto:thuth@redhat.com>>:
> 
>         On 16/03/2023 08.36, Philippe Mathieu-Daudé wrote:
>          > On 16/3/23 08:17, Andrew Randrianasulu wrote:
>          >>
>          >> чт, 16 мар. 2023 г., 10:05 Philippe Mathieu-Daudé
>         <philmd@linaro.org <mailto:philmd@linaro.org>
>          >> <mailto:philmd@linaro.org <mailto:philmd@linaro.org>>>:
>          >>
>          >>     Hi Andrew,
>          >>
>          >>     On 16/3/23 01:57, Andrew Randrianasulu wrote:
>          >>      > Looking at https://wiki.qemu.org/ChangeLog/8.0
>         <https://wiki.qemu.org/ChangeLog/8.0>
>          >>     <https://wiki.qemu.org/ChangeLog/8.0
>         <https://wiki.qemu.org/ChangeLog/8.0>>
>          >>      > <https://wiki.qemu.org/ChangeLog/8.0
>         <https://wiki.qemu.org/ChangeLog/8.0>
>          >>     <https://wiki.qemu.org/ChangeLog/8.0
>         <https://wiki.qemu.org/ChangeLog/8.0>>>
>          >>      >
>          >>      > ===
>          >>      > System emulation on 32-bit x86 and ARM hosts has been
>         deprecated.
>          >>     The
>          >>      > QEMU project no longer considers 32-bit x86 and ARM
>         support for
>          >>     system
>          >>      > emulation to be an effective use of its limited
>         resources, and thus
>          >>      > intends to discontinue.
>          >>      >
>          >>      >   ==
>          >>      >
>          >>      > well, I guess arguing from memory-consuption point on 32
>         bit x86
>          >>     hosts
>          >>      > (like my machine where I run 32 bit userspace on 64 bit
>         kernel)
> 
>         All current PCs have multiple gigabytes of RAM, so using a 32-bit
>         userspace
>         to save some few bytes sounds weird.
> 
> 
>     I think difference more like in 20-30% (on disk and in ram), not *few
>     bytes*. 
> 
> 
> I stand (self) corrected on *on disk* binary size, this parameter tend to be 
> ~same between bash / php binaries from Slackware 15.0 i586/x86_64. I do not 
> have full identical x64 Slackware setup for measuring memory impact.
> 
> 
> Still, pushing users into endless hw upgrade is no fun:
> 
> https://hackaday.com/2023/02/28/repurposing-old-smartphones-when-reusing-makes-more-sense-than-recycling/ >
> 
> note e-waste and energy consumption

Now you're mixing things quite badly. That would be an argument in the years 
before 2010 maybe, when not everybody had a 64-bit processor in their PC 
yet, but it's been now more than 12 years that all recent Desktop processors 
feature 64-bit mode. So if QEMU stops supporting 32-bit x86 environments, 
this is not forcing you to buy a new hardware, since you're having a 64-bit 
hardware already anyway. If someone still has plain 32-bit x86 hardware 
around for their daily use, that's certainly not a piece of hardware you 
want to run QEMU on, since it's older than 12 years already, and thus not 
really strong enough to run a recent emulator in a recent way.

  Thomas


