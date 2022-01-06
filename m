Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B81E9486707
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:47:56 +0100 (CET)
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Uzb-0006mU-AV
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5Uxa-00040M-4m
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:45:50 -0500
Received: from [2a00:1450:4864:20::42c] (port=40554
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n5UxY-0006HS-Ax
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:45:49 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l10so5584236wrh.7
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 07:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pEazYAoRMEwL4YV9glyOqPPutbLmy69RG6P/hJ4o3J0=;
 b=rTztsQdpWoMe57cr7FTbB3CtTigGVP6eFZ+t1FmIrhvDjjkZ4Bg92DVNa9N9Q10IsI
 YDqG5x07tD0GmYtMDfDxfpoTIWM+2qPEqw+qOV01EjiER+eOq98IzS0jXYOAp+3u4ohl
 67mw41g1iwfmsvRMAgEbytsk+rfEvxmWKQJnaRmCoWIhNjTWHgQHXOlvgU1l9dcTfG54
 Mw9JNyfzN57Vu1R035wN+haX9WSUbJYGNLxU/27csbIKj3pIZmFG8VktQeAzxsqgIyEG
 k4NUMV2l3Oai5OvTu5M2oWe7LvNXE/CQfAzbV26+TUdDb8nhf8pDS1u4dPCfv6In6Olg
 d5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pEazYAoRMEwL4YV9glyOqPPutbLmy69RG6P/hJ4o3J0=;
 b=fTD1CHl6e535f43SOmZ9VoY+OtQX0N52Ml8BgqpnQHnpqcGO6/pvP+AuWfA46robN8
 SJZUko/Qyl4jYFJlZiiUW8jIGkL/htmIdzo0EddoEd+cTlSOJEe62y5YbAw8+yeXz5sG
 hQDih1s3HeRM1k2jxk2jSBLEBMe9VGKKSSR9/MLxc0iqQeueju8RcfhBBR4FBcAoy9aW
 sOWFbKXnqTHBJcjtlDsR2jqHVzL59FgPzySxyVS3nqYCBFTASYg7nDPypQImkzULUsCB
 u7+asj8fuHye6w7frSrWH9DatKCLd2Bkl23gm9ligjXpoDmv3HNLqxxJlW1GCexEXgxN
 r4Sw==
X-Gm-Message-State: AOAM531TdLI9W5rmW3Wu4JLEmQQFMLHoSQ0FVxSfcQkEQeBcF0JxV8hl
 A2GVlNCJN9m9JcV54hPOHmcPXA==
X-Google-Smtp-Source: ABdhPJztdCQ82+C2fnV3K2yzH9DZCFfMViAqAhGrFFxH7rO1JEoDGSixF5ozKvaNJaDiHenKm1TPJw==
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr51725499wrw.430.1641483946377; 
 Thu, 06 Jan 2022 07:45:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g8sm1991344wmh.17.2022.01.06.07.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 07:45:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A40131FFB7;
 Thu,  6 Jan 2022 15:45:44 +0000 (GMT)
References: <87czl6jb79.fsf@linaro.org>
 <fbc66bb0-2c15-d789-bbaa-f9c3ba6f81e4@amsat.org>
 <87r19lj3l3.fsf@linaro.org>
 <CAFEAcA9XX26RHmNM59Zc13dwvhv83bAnomLp7Yj45Wmf16W66w@mail.gmail.com>
 <87iluxhrdc.fsf@linaro.org>
 <CAFEAcA_yg=FVCadEa7BBaudvyoZ+VgAppG5cT=T4MoKmYhGaQA@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Trying to understand QOM object creation and property linking
Date: Thu, 06 Jan 2022 15:44:26 +0000
In-reply-to: <CAFEAcA_yg=FVCadEa7BBaudvyoZ+VgAppG5cT=T4MoKmYhGaQA@mail.gmail.com>
Message-ID: <87a6g8j2af.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 6 Jan 2022 at 14:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Wed, 5 Jan 2022 at 21:05, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> >> Can't be added as a subregion to the container...
>> >>
>> >>   qemu-system-arm: ../../softmmu/memory.c:2538: memory_region_add_sub=
region_common: Assertion `!subregion->container' failed.
>> >
>> > This assert means you tried to add the same MemoryRegion
>> > as a subregion of more than one parent MR.
>>
>> Right - that is probably something we should make (more?) explicitly
>> clear in the Memory API docs.
>
> The doc comment does document the requirement:
>  * [...] A region
>  * may only be added once as a subregion (unless removed with
>  * memory_region_del_subregion()); use memory_region_init_alias() if you
>  * want a region to be a subregion in multiple locations.
>
> One of the deficiencies of C assert() is the lack of an
> explanatory text message to go along with the raw expression.
>
>> > You can either:
>> >  * pass all the CPUs the same container as their "memory" link,
>> >    if they all see the same view of the world
>>
>> This should be the case - I don't think the different cores have any
>> particular different view of the world. The use of the two 4kb banks I
>> think is purely convention.
>>
>> However trying for a single container shared between both cores fails
>> because armv7m_realize adds it's board_memory to another container:
>>
>>     memory_region_add_subregion_overlap(&s->container, 0, s->board_memor=
y, -1);
>
> Yeah, that trick only works for the real CPU object, not for
> passing to SoC or SoC-like objects.

Hmm I wonder if I should be instantiating the underlying CPU object?
AIUI the cores are cortex-m0+ so I assume that comes with the gic/irq
wiring up that armv7m does?

--=20
Alex Benn=C3=A9e

