Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F1B32B9FB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:43:55 +0100 (CET)
Received: from localhost ([::1]:59540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWTR-0000C2-VY
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWKJ-0006xW-Gj
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:34:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWKH-0004AF-NZ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614796463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IKbGWPuMfqFZhqqv8Tx97nnKZwF/7apb4sZ/S84yFi0=;
 b=F2thrGI3KhQKH3ggvUQCu4NzZjNVbZcojOM/FC9D8+R4ac+LfN3gZcLeD84BT6IFoDdOsg
 xTmo2kw7vlCByb5EsJs/0DgEvyTniIZem2EudzYBb4F20abwGxfUkuRwMenDNGro94SS/R
 hNXsxfhMxhBVPc3Al+zaUBRp0nsvjig=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-OuXUHC0COMO3x4V731TXCw-1; Wed, 03 Mar 2021 13:34:21 -0500
X-MC-Unique: OuXUHC0COMO3x4V731TXCw-1
Received: by mail-wm1-f70.google.com with SMTP id q24so3415328wmc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:34:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IKbGWPuMfqFZhqqv8Tx97nnKZwF/7apb4sZ/S84yFi0=;
 b=qFCwT5tOK4xL8i2DKthqLQsZBChj9HESA+NGdS2egpTOJ9Kf/rc2KP+/ROQ2QIwjyS
 aFGVTCqfPp5/ArbsQKXTw2FMGmYsR1Xo6h+hHm0ROxuDrFz5hSvWAAZTwoyjUHwSVfZ8
 IT+Ju1lxS8YYHgwHd7m9aYlnVbb9O2SNzbsB95spe979O1a7Y0SvTWRIdpXwVyEpDiXt
 VRUfSpPi2thEAhJjfY1974IjHQS8BO9Em5u7mtA6pAOKZ1yizUG19i3MtVvCExAXg1fd
 TP7vvt9UDpsJNIlNqC44qq4OCu/HNcKs8LO0G6E+ZDDV/BHh/U22dugMWCtQJCtt7xzP
 B8cw==
X-Gm-Message-State: AOAM530f31zOMivBqXxHOVdfrZTc/KXK8AXwpEjPmThbfZV9oGbvHLqz
 q61Q419bWV+R2xHHZhAf44wHkaLdt6qhzEtKuhLZllE/ew+MqX21mRR6l4Fy3QQToxfs8LK4OHE
 qR6pZUm9IkGu3LzI=
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr28332615wrw.355.1614796460031; 
 Wed, 03 Mar 2021 10:34:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzL9aslO+M8TPljFN2gzSkCHWSYnPL+PZMzeiCgIZH0pwUQkQdWCl9lgpws66HpBe16tFgyQ==
X-Received: by 2002:a5d:56d0:: with SMTP id m16mr28332598wrw.355.1614796459822; 
 Wed, 03 Mar 2021 10:34:19 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n186sm6551426wmn.22.2021.03.03.10.34.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:34:19 -0800 (PST)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org> <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de> <87a6rmkffo.fsf@linaro.org>
 <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <25bce8e9-2fad-6568-66a5-278a04817f63@redhat.com>
Date: Wed, 3 Mar 2021 19:34:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 6:57 PM, Claudio Fontana wrote:
> On 3/1/21 5:23 PM, Alex Bennée wrote:
>>
>> Claudio Fontana <cfontana@suse.de> writes:
>>
>>> On 2/23/21 10:18 AM, Philippe Mathieu-Daudé wrote:
>>>> On 2/22/21 8:00 PM, Alex Bennée wrote:
>>>>>
>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>
>>>>>> Hi all,
>>>>>>
>>>>>> this is an experiment, a cleanup based on and requiring the series
>>>>>> "i386 cleanup PART 2":
>>>>>>
>>>>>> https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg05935.html
>>>>>>
>>>>>> The goal is to split the code between TCG-only and non-TCG code,
>>>>>> fixing the KVM-only build (configure --disable-tcg),
>>>>>>
>>>>>> and laying the ground for further cleanups and the use of the
>>>>>> new accel objects in the hierarchy to specialize the cpu
>>>>>> according to the accelerator.
>>>>>>
>>>>>> This is known to be an early state, with probably a lot of work
>>>>>> still needed.
>>>>>
>>>>> Well early work is looking pretty good:
>>>>>
>>>>>   18:59:22 [alex@idun:~/l/q/b/default] review/arm-cleanup-rfc1|… ± ls -lh qemu-system-aarch64
>>>>>   -rwxr-xr-x 1 alex alex 107M Feb 22 18:08 qemu-system-aarch64*
>>>>>   18:59:29 [alex@idun:~/l/q/b/default] review/arm-cleanup-rfc1|… ± ls -lh ../disable.tcg/qemu-system-aarch64
>>>>>   -rwxr-xr-x 1 alex alex 76M Feb 22 17:47 ../disable.tcg/qemu-system-aarch64*
>>>>
>>>> :~)
>>>>
>>>>>
>>>>> and I've tested the KVM side works well enough with a basic image.
>>>>
>>>>
>>>
>>> I am working on the next version, one thing I noticed among others as I get close to the v2,
>>> is the fact that tests/ for arm require tcg in many cases.
>>
>> I think in a lot of cases they are historical because developers
>> generally weren't running on native hardware. That said off the top of
>> my head:
>>
>>   tests/tcg - linux-user, so implies TCG
>>   tests/tcg/system - use semihosting (at least for arm/aarch64) - which implies TCG
>>   tests/acceptance/[replay_kernel/reverse_debugging/tcg_plugins] - all need TCG features
>>
>> I don't think there is any reason the others can't run with KVM - and
>> probably should on real hardware.
> 
> 
> One thing I noticed is that tests try to run qemu-system-aarch64 with accel "qtest" and machine "virt",
> and the thing tries to create a cortex-a15 cpu model for some unknown reason.
> 
> Digging and sweating..

I already sent a series to fix that, feel free to reuse
some patches:
https://www.mail-archive.com/qemu-block@nongnu.org/msg80440.html


