Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C34905D6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 11:21:28 +0100 (CET)
Received: from localhost ([::1]:59370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9P8i-0001EA-2O
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 05:21:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9P6E-00009D-Dd
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:18:54 -0500
Received: from [2a00:1450:4864:20::529] (port=45052
 helo=mail-ed1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n9P6C-0004Wp-Kz
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 05:18:54 -0500
Received: by mail-ed1-x529.google.com with SMTP id f21so6339910eds.11
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 02:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zmC/IS08RRE6f5nbFaa6dAbmvrETTbfPxKQXetAubas=;
 b=aPVDWEne5N0M86vfR1P8lpzwb7BdE4OVEdGCWL+E9ucd1N1o+X/VC6eqjheN1a3+5S
 /QL0ZVrIectKZOqkqAal8o3Xhfek5vEbxoxQ0Jy9LPgCb1UoHcoaeMc2VRjzyvppTru6
 SxjET8QSfo8nGgMwHk8zJWxFUsHfKlFu1WMf0dqcK7/KW0xrahQWU8yFNOKNoJVhK7Qu
 OcYmfuTkfxRi3S2BwW2IhtQm7xH8VBEKv4BLelsj2JoeLWbiyX8EKx888cQik+ncu1cY
 4NLzhmh5Me8pMEVDfYfkHPEe+7zVJvXuGYayAClVZoDRIHH/+Ujk+0RKUmjQh0XlHTLb
 BzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zmC/IS08RRE6f5nbFaa6dAbmvrETTbfPxKQXetAubas=;
 b=SwQrWJEEZBOTJQm/9Cs+HP66hbznJxCc7Lkdzw2jZATpmo2Y82AIDyoEKeuXpFX2dg
 4oXHNH1CrrrsdgCsxpNzWUprfkr4XQTOUnXnNNQ+Paplz1J/lZissgiXY2Tl2FiSgTiL
 fjr8HvEV+Ra9HLb9D8c9wVsjur+6jYv8AXfb5CovuYh1ZsCFXcK9x0jQpr3x3f9imqSq
 8exugu3eSwVjcJ/ep6iWeoJpqSV5S2erUbeUSNMpK6Bp71K6c57LgeZxojkJx8aMnMCf
 WokGyFm2zK87CS72DDWUSqS/4jANY1wuu6OvqJvV1vkF9FCpMoaBIwY8Ge+4AcNrIPqH
 SrIQ==
X-Gm-Message-State: AOAM532LF6zbXAKcFVd9M+S3S0QFOgYtAx5hZdLKflC+zVZKnR42AxDy
 v6XozVccE1dPdVqIWT13Oi58CQ==
X-Google-Smtp-Source: ABdhPJwoc1+2N+EPdbOVu+AKrxQQqProewE5Yo/9KPqI7LKIXb9SlHHZJbSTd3wigMqDcJetOzbP8g==
X-Received: by 2002:a05:6402:f02:: with SMTP id
 i2mr20300207eda.97.1642414731212; 
 Mon, 17 Jan 2022 02:18:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ed9sm642889edb.76.2022.01.17.02.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 02:18:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9B6A11FFB7;
 Mon, 17 Jan 2022 10:18:49 +0000 (GMT)
References: <cover.1641987128.git.viresh.kumar@linaro.org>
 <5390324a748194a21bc99b1538e19761a8c64092.1641987128.git.viresh.kumar@linaro.org>
 <87zgny8l59.fsf@linaro.org> <20220117063840.lyg24ikcavis645b@vireshk-i7>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] hw/virtio: add boilerplate for vhost-user-gpio device
Date: Mon, 17 Jan 2022 10:17:41 +0000
In-reply-to: <20220117063840.lyg24ikcavis645b@vireshk-i7>
Message-ID: <87wniyacmu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::529
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: stratos-dev@op-lists.linaro.org,
 Vincent Guittot <vincent.guittot@linaro.org>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Viresh Kumar <viresh.kumar@linaro.org> writes:

> On 14-01-22, 14:06, Alex Benn=C3=A9e wrote:
>>=20
>> Viresh Kumar <viresh.kumar@linaro.org> writes:
>>=20
>> > This creates the QEMU side of the vhost-user-gpio device which connects
>> > to the remote daemon. It is based of vhost-user-i2c code.
>> >
>> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
>> <snip>
>> > +++ b/include/hw/virtio/vhost-user-gpio.h
>> > @@ -0,0 +1,35 @@
>> > +/*
>> > + * Vhost-user GPIO virtio device
>> > + *
>> > + * Copyright (c) 2021 Viresh Kumar <viresh.kumar@linaro.org>
>> > + *
>> > + * SPDX-License-Identifier: GPL-2.0-or-later
>> > + */
>> > +
>> > +#ifndef _QEMU_VHOST_USER_GPIO_H
>> > +#define _QEMU_VHOST_USER_GPIO_H
>> > +
>> > +#include "hw/virtio/virtio.h"
>> > +#include "hw/virtio/vhost.h"
>> > +#include "hw/virtio/vhost-user.h"
>> > +#include "standard-headers/linux/virtio_gpio.h"
>>=20
>> Hmm this fails:
>>=20
>>   In file included from ../../hw/virtio/vhost-user-gpio.c:13:
>>   /home/alex/lsrc/qemu.git/include/hw/virtio/vhost-user-gpio.h:15:10: fa=
tal error: standard-headers/linux/virtio_gpio.h: No such file or directory
>>      15 | #include "standard-headers/linux/virtio_gpio.h"
>>         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>   compilation terminated.
>>=20
>> The usual solution is to create a patch that imports the headers using:
>>=20
>>   ./scripts/update-linux-headers.sh
>>=20
>> either from the current mainline (or your own tree if the feature is in
>> flight) and mark the patch clearly as not for merging.
>
> I have that patch with me and I planned to mention it in the cover-letter=
, but
> completely failed while sending it.
>
> Should I resend this with the NOT-TO-BE-APPLIED patch now ? Everything is=
 in
> mainline, so the committer just needs to run
> scripts/update-linux-headers.sh.

If it's a released version of mainline even better because you can just
include the patch generated from a clean release and it can get merged.

--=20
Alex Benn=C3=A9e

