Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F4D6014EE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 19:25:33 +0200 (CEST)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okTrn-0006NE-Tt
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 13:25:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okTp9-0002Qa-2W
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:22:47 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:39935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1okTp5-0000YL-Et
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 13:22:44 -0400
Received: by mail-wr1-x436.google.com with SMTP id f11so19482199wrm.6
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 10:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TI9PQ/6dDEmJtpRjm2vn0qNQy63aCYO2l4eewjHRhY4=;
 b=zuikdnO6ug55xRsMmvbpl2c2v4spKk9t6v7TKWCZTPA8rHMBKsSde5SVb2KYyuDfax
 1+N3bw1cswYrGh8D8Y3TSZj7/ghSADeSQngYCs4Si7/rUE5DrGiCiMFtKHOX2MDTgknn
 wVgSuqbg/bCFJCIvEcD/WeJKPrrBCeKOitKP3rCvMds2Ijwd9TrzcEJDahonraqDeVFa
 pbO2/KwrF6uYWiGwJrGYS7+tZP+I/zj/UaN97wFN9NCiavVv38cawqIU42lYaOR1EzrQ
 bROcTHIcbek2NEW2GNq3MlzGrA9cmVIc3REbe+GdkFFZlIjvrVmqwUEAalOUvcEdiP4s
 borw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TI9PQ/6dDEmJtpRjm2vn0qNQy63aCYO2l4eewjHRhY4=;
 b=4eDrMqCKwK6lkpg49UAODy1u/HJ2XS4j+FwJBry/Is3DavQiED9eFYWnCpuxY4Xkom
 2SdD4YzqwNol7ASBJNO0Yn0v5Mj6YzKZKbms/9ol2dPTQBRDqutaw87q+3qlFI8O1ZQi
 /ibAIQ1xEww4piLOMUf6qmpW7ZbMnCxsxdKbowTARmHl+MKJkCLSygBkzHTe6S7lsPgj
 hF67LH+YEvFiQlNKnU6U2nPp+sVd0iH2To2jvWrvndZOvddiC/N2PdXrYGS/219tbjtO
 KKFRE83R7fxdXs0eVFwOOA9qAA6wGJ5e8xLFku1h0gay0l3YULqsopzzetPVe6RCRVzS
 9XKw==
X-Gm-Message-State: ACrzQf3AY0yX/wGzPoTZvj/Q/W0lgDqErB2MxUOa2p7cwenx0eoyQzX/
 if8cI7ngRgOoMlVfpVfsAIFUHQ==
X-Google-Smtp-Source: AMsMyM5bQcrjMYYk0KQTj/+rcC3h2BRg6rcdbmYgHDzD25/iCjHIBjyDKFxPwRCWQCFp3985XHo7iQ==
X-Received: by 2002:adf:b646:0:b0:221:76eb:b3ba with SMTP id
 i6-20020adfb646000000b0022176ebb3bamr6646545wre.237.1666027360935; 
 Mon, 17 Oct 2022 10:22:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm9003193wrs.53.2022.10.17.10.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 10:22:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ECA291FFB7;
 Mon, 17 Oct 2022 18:22:39 +0100 (BST)
References: <20221015211025.16781-1-chrisfriedt@gmail.com>
 <20221017134425.jbqvtccg5w4yej5g@mozz.bu.edu>
 <CAFEAcA8Cc+XtwcQz3bJom2=MgYZgLHw8SO6uqQQdVN4aqpq4Hg@mail.gmail.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alexander Bulekov <alxndr@bu.edu>, Chris Friedt <chrisfriedt@gmail.com>,
 cfriedt@meta.com, jslaby@suse.cz, qemu-devel@nongnu.org
Subject: Re: [v2] hw: misc: edu: fix 2 off-by-one errors
Date: Mon, 17 Oct 2022 18:21:28 +0100
In-reply-to: <CAFEAcA8Cc+XtwcQz3bJom2=MgYZgLHw8SO6uqQQdVN4aqpq4Hg@mail.gmail.com>
Message-ID: <87czaqe55s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 17 Oct 2022 at 14:50, Alexander Bulekov <alxndr@bu.edu> wrote:
>>
>> On 221015 1710, Chris Friedt wrote:
>> > From: Christopher Friedt <cfriedt@meta.com>
>> >
>> > In the case that size1 was zero, because of the explicit
>> > 'end1 > addr' check, the range check would fail and the error
>> > message would read as shown below. The correct comparison
>> > is 'end1 >=3D addr' (or 'addr <=3D end1').
>> >
>> > EDU: DMA range 0x40000-0x3ffff out of bounds (0x40000-0x40fff)!
>> >
>> > At the opposite end, in the case that size1 was 4096, within()
>> > would fail because of the non-inclusive check 'end1 < end2',
>> > which should have been 'end1 <=3D end2'. The error message would
>> > previously say
>> >
>> > EDU: DMA range 0x40000-0x40fff out of bounds (0x40000-0x40fff)!
>> >
>> > This change
>> > 1. renames local variables to be more less ambiguous
>> > 2. fixes the two off-by-one errors described above.
>> >
>> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1254
>> >
>> > Signed-off-by: Christopher Friedt <cfriedt@meta.com>
>>
>> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
>>
>> As a side-note, seems strange that edu_check_range will abort the entire
>> VM if the check fails, rather than handling the error more elegantly.
>
> Yes, this is bad for a device model, though we have a lot of
> older device models that still do it. The preferred pattern is:
>  * for situations which are "if this happens there is a
>    bug in QEMU itself", use assert. hw_error() is a kind of
>    assert that prints a bunch of guest register state: sometimes
>    you want that, but more often you just want normal assert()
>  * for situations where the guest has misprogrammed the device,
>    log that with qemu_log_mask(LOG_GUEST_ERROR, ...)
>    and continue with whatever the real hardware would do, or
>    some reasonable choice if the h/w spec is vague
>  * for situations where the guest is correct but is trying to
>    get the device to do something our model doesn't implement
>    yet, same as above but with LOG_UNIMP.
>
> Probably most hw_error() uses in the codebase should be
> replaced with one of the above options.

We should probably document this best practice somewhere in docs/devel
but I guess we really need a "guide to writing device emulation"
section.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

