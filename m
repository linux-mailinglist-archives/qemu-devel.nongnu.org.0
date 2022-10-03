Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AD55F2CED
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 11:09:58 +0200 (CEST)
Received: from localhost ([::1]:34940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofHSX-0006G8-QE
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 05:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofHI7-0008JD-BS
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:59:14 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofHI5-0004fl-66
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 04:59:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id r6so15680712wru.8
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 01:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=JThvYATJrWpCwfDS9WoUgB2+9kE/soYcc7/LUqrOhjU=;
 b=Z7GG7TPlu4cHKaGuAmxzQuOPQL7O0VBlI32kBw+j8rs7I29yxMA9jKO8kQMEoU6LT3
 uWLhEoRRt76A/R7GumgQF83hK4adp7ceLnf6noJ0MGB+ajYB2/51iQu1WhcdvatrShyE
 E6vtg4wPrk0HskI3G7BqXxIR5sqQpWBfQq3SwBkOWcu20y2l4O7MjJ5fvLmxPwftSUpg
 4HbS7lK+O7dgpHTUN6AuJ7MWGgPL9t5tXH7hbg3AZ/fopz8nfVXehH3rrXVZxbdr6B9X
 l4RZaLguB34DCLQJ5oftUWG9eot0dgBZ6IdFnyj6MkjALYhFMwL4quNOZvS+UUstI8WF
 AoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=JThvYATJrWpCwfDS9WoUgB2+9kE/soYcc7/LUqrOhjU=;
 b=asME2rnXCsu3SvthfLJR4AQN0RyOJ7Pa6xFc4aC5Rl730p0ZwEdukrdFugphNWKvqQ
 WDbfbai4NnZo3xjisss/qxQAVr1I61/WUHt2m+M1w/6t0qLT13SiCKGR3fJdj/lnR/HZ
 Xz7vCdltHOKip1WQxsFDrDefkIvC1APIO2X3yYXO2DTuls/adIj4hVODqb9yI8eRH568
 cmFLMYaVoba03fXYB5X5Z/yrJF5jdEalQ2aMx9ZuS/RwjFtRvUfRafyX4aEU2cv5BO1T
 5lDE6JN72YYLOPdMCfNmImaCiu1PgJhpwRWQxnrXw52JEN79YO57Vxxt4GVEi+1JEDgC
 /LGQ==
X-Gm-Message-State: ACrzQf0lAtaEWkmQUueB8EaNid6snQB3rKmKz7Rbnd9U9FBDfnf+mGG2
 a0tE18H2VU8MDCgZXBqL2oxA46FAFTaTWg==
X-Google-Smtp-Source: AMsMyM7/frmdEwzCSM26CsA8VzN6/psm0uruzLXnZaMc6EtjqH6fVTqOPvp8z4W6V40I7KwwAX9qwA==
X-Received: by 2002:a5d:598a:0:b0:22a:f5f9:1fa0 with SMTP id
 n10-20020a5d598a000000b0022af5f91fa0mr12854463wri.711.1664787547826; 
 Mon, 03 Oct 2022 01:59:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bh14-20020a05600c3d0e00b003b47575d304sm14707946wmb.32.2022.10.03.01.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 01:59:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4F7191FFB7;
 Mon,  3 Oct 2022 09:59:06 +0100 (BST)
References: <a7da7e40-6f7b-79a4-709b-da0e71def650@redhat.com>
 <93033078-221d-23d2-23e7-13eab59cd439@amsat.org>
 <CACGkMEsQSn_GOBcs64JEDUHt3T7XOBL3LLM7yvqwwR5xvvD2dg@mail.gmail.com>
 <a25c238b-dabd-bf20-9aee-7cda4e422536@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?= <f4bug@amsat.org>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, QEMU
 Developers <qemu-devel@nongnu.org>, "Daniel P. Berrange"
 <berrange@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-discuss@nongnu.org
Subject: Re: If your networking is failing after updating to the latest git
 version of QEMU...
Date: Mon, 03 Oct 2022 09:58:03 +0100
In-reply-to: <a25c238b-dabd-bf20-9aee-7cda4e422536@redhat.com>
Message-ID: <87o7utnuzp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> On 29/09/2022 04.32, Jason Wang wrote:
>> On Thu, Sep 29, 2022 at 1:06 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
>>>
>>> On 28/9/22 10:27, Thomas Huth wrote:
>>>>
>>>> ... it might have happened due to the removal of the "slirp" submodule
>>>> from the git repository. For example if you see an error message like =
this:
>>>>
>>>>    Parameter 'type' expects a netdev backend type
>>>>
>>>> this likely means that the "user" mode backend type is not available in
>>>> your binary anymore. To fix it, simply install "libslirp-devel" (or
>>>> libslirp-dev or however it is called) from your OS distribution and
>>>> recompile.
>>>
>>> Thanks for the hint Thomas. I'm afraid many developers will miss your
>>> email.
>>>
>>> Jason, Marc-Andr=C3=A9, could we improve the buildsys check or display
>>> a more helpful information from the code instead?
>> It looks to me we need to improve the build.
>
> I'm not sure there is anything to improve in the build system -
> configure/meson.build are just doing what they should: Pick the
> default value for "slirp" if the user did not explicitly specify
> "--enable-slirp".

Shouldn't it be the other way round and fail to configure unless the
user explicitly calls --disable-slirp?

>
> But the error message is not very helpful. It should rather say
> something like (partly suggested by Daniel in IRC yesterday already):
>
>  Type 'user' is not a supported netdev backend by this QEMU build.
>  Please check the spelling or whether it has been enabled at
> compilation time.
>
> ... or something like this.
>
> Someone interested to write a patch?
>
>  Thomas


--=20
Alex Benn=C3=A9e

