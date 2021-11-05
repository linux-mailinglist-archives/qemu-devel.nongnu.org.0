Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A692D4466E5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:20:51 +0100 (CET)
Received: from localhost ([::1]:38852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1xS-00071b-Qz
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mj1sr-0001xM-Vu
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:16:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mj1sq-0008Qj-CE
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:16:05 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u1so14505626wru.13
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=OxHhOSQdpd4YP/uZjU5sUoinDF8XXR/wB3Sw4OSMQYw=;
 b=MhltAZVD5s15Lgd/O+HyJCCMbS/SpRY6VW4gkdCw4umKOt71ue+smzcDjFBoneKE7h
 Qiqczt8z6FqO0AhkuC6E61WLICuCdXGipJ8al8OtyIfpylVkYxhTFwU6eJdC7iip46Az
 eSIA3I9Xl8G90vRY+R514KQShfpyquIftMAzoNQyibvYhZVserJMHSxkSYb8CRyLgIaj
 mOi/2slst77b4n/9E9NilRelNvUFA/TZ373DFHWrcA+A4eCu/NLJjZBkA6jpm6kVtF/R
 Z7ILPA2MXyf3hByw18TB9R5gZZi9XxSXWD3u+f9GzbApZKRG3OW/c3/BVeYf3NLGnV3N
 hgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=OxHhOSQdpd4YP/uZjU5sUoinDF8XXR/wB3Sw4OSMQYw=;
 b=UzwZkzepvJ6IAcS4s8R2049eZvN7RjDJgvgLhtV1hzByoiN7tavfMLRjqfPWZJOoLf
 jR6l2/HwtzwqwocCBVxj1DN8DCi3ehrlkFMSwiUM25enaI+4fZXKY+WVgHT80HcNXxwx
 1Rve+J17ow3BxVlctn56pU6/so1tL690TF1KCmzWT0u317OKs+ae69d64tKKQ/kXjInh
 /5rKWukI+qRVoPnOtZQ2RXjJNChygR9Q1noCyo22PIuZJ3D9M1KEP5M0xas/yATPRkin
 ktWsoAaGETqFZ9QNKwAUKjVYBIXA2Py+UyvIIF2AiungLEIzQ3D43TfPDB/plMRyqdWu
 nkyw==
X-Gm-Message-State: AOAM53257vbevp7Ew84nlK6D54qDLGqAmsJzBjR0jsEUUwcwAbnLksQl
 fu0UX+mCnxvRX4/Y0TmNXHHOTA==
X-Google-Smtp-Source: ABdhPJykaZ6QkYUcNegKcZ5IqMLEIpHerlRMe1GikZzrU0Dfcx6f/EME/HSyaf7ITn+rT2Fk4X6UrA==
X-Received: by 2002:a05:6000:2af:: with SMTP id
 l15mr77401576wry.296.1636128962845; 
 Fri, 05 Nov 2021 09:16:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f15sm9092610wmg.30.2021.11.05.09.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 09:16:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CF11F1FF96;
 Fri,  5 Nov 2021 16:15:56 +0000 (GMT)
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <20210115130828.23968-22-alex.bennee@linaro.org>
 <540354a8-bcba-aa82-814d-7f11dc75f5bf@suse.de> <874kjdugip.fsf@linaro.org>
 <8cb88b76-caa3-ba26-b288-4d87b06f56ec@suse.de> <871regvs0w.fsf@linaro.org>
 <CAFEAcA9FKA9k3ePEVALXnRcfd4ygybMrmpD=ZjV1A==at+w9Uw@mail.gmail.com>
 <3c1521e5-5182-18f3-b5bf-9340745ec92f@linaro.org>
 <e7c11bc8-e7ba-8192-e4ba-887c38f27b15@linaro.org>
 <1b2ee804-6360-c77f-45f2-8fe39e39f9d9@linaro.org>
User-agent: mu4e 1.7.4; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Luis Machado <luis.machado@linaro.org>
Subject: Re: [PULL 21/30] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
Date: Fri, 05 Nov 2021 16:15:39 +0000
In-reply-to: <1b2ee804-6360-c77f-45f2-8fe39e39f9d9@linaro.org>
Message-ID: <87v916h937.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Luis Machado <luis.machado@linaro.org> writes:

> On 11/4/21 6:03 PM, Luis Machado wrote:
>> On 10/4/21 3:44 PM, Luis Machado wrote:
>>> Hi,
>>>
>>> On 9/21/21 10:55 AM, Peter Maydell wrote:
>>>> On Tue, 19 Jan 2021 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> wrote:
>>>>>
>>>>>
>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>
>>>>>> On 1/19/21 3:50 PM, Alex Benn=C3=A9e wrote:
>>>>>>>
>>>>>>> Claudio Fontana <cfontana@suse.de> writes:
>>>>>>>> qemu-system-aarch64: -gdb
>>>>>>>> unix:path=3D/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,server:
>>>>>>>> info: QEMU waiting for connection on:
>>>>>>>> disconnected:unix:/tmp/tmp9ru5tgk8qemu-gdbstub/gdbstub.socket,serv=
er
>>>>>>>> warning: while parsing target description (at line 47): Vector
>>>>>>>> "svevhf" references undefined type "ieee_half"
>>>>>>>> warning: Could not load XML target description; ignoring
>>>>>>>> qemu-system-aarch64: QEMU: Terminated via GDBstub
>>>>>>>>
>>>>>>>> Seems to indicate it is "ieee_half" -related?
>>>>
>>>>> So it looks like TDESC_TYPE_IEEE_HALF was only implemented in GDB 9.1
>>>>> and there is no probing possible during the gdbstub connection. I gue=
ss
>>>>> I can either go back to stubbing it out (which would break gdb's SVE
>>>>> understanding) or up our minimum GDB version check for running tests.
>>>>> That would mean less people test GDB (or at least until the distros
>>>>> catch up) but considering it was zero people not too long ago maybe
>>>>> that's acceptable?
>>>>
>>>> I just ran into this trying to connect qemu-aarch64 to the
>>>> Ubuntu gdb-multiarch. I don't care about SVE at all in this
>>>> case, but the 'max' CPU includes SVE by default, so we report
>>>> it to gdb even if the guest program being run doesn't use SVE at all.
>>>> This effectively means that usecases that used to work no longer do :-(
>>>>
>>>> Luis: do we really have to report to gdb all the possible
>>>> data types that might be in SVE vector registers? Won't
>>>> gdb autogenerate pseudoregisters the way it does with
>>>> Neon d0..d31 ?
>>>>
>>>> thanks
>>>> -- PMM
>>>>
>>>
>>> I'll check what can be done here.
>> Apologies. I got sidetracked with a few other things. I'm getting
>> back to this one.
>> I'm guessing the less painful solution would be for QEMU to report a
>> more compact XML description for SVE, supported by the oldest GDB we
>> would like to validate things on, and leave it to GDB (newer
>> releases) to add whatever pseudo-registers it deems appropriate.
>
> Is it only the ieee_half type that is causing issues here? Or are
> there other types?

That was the only one I noticed - which makes sense as it's a fairly new
type.


--=20
Alex Benn=C3=A9e

