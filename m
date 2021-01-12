Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B492F32D0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:19:09 +0100 (CET)
Received: from localhost ([::1]:57622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKVo-0007gO-Cy
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzKU8-000704-Tc
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:17:24 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzKU7-0008NI-95
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:17:24 -0500
Received: by mail-wm1-x32f.google.com with SMTP id i63so2033281wma.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 06:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=D38Ksi++Tty/A5E38DPnAQNTqJ8XOQDTKRr1mmy1fAI=;
 b=dUDRI0YKngYpz3BXzF0rgk9BGLEnhyWjCZ40I9Lf4e/QQLt9CMXndrwP9Ko9srPeVt
 KASHcErnBiwONQvh7YPVaJgyIwW3uewI5z5OzgWVcvSeerg3V4G+8qVXOzZgvwjFX14R
 8KfhgJw5yTZC4wKAY5l3zj64MpHMk12Om0mwfrLXQZK1lNX0gHJg5yXoilvyZIJsTPLq
 CaV+P7rawnjKQqi4zyVmpfFPgq5572ZDC4ZWQetkxrAo6hDge/BifJm9KR8aW40P+h8q
 Ga21buvoezFZL4RmNsb1LPwmdwV+OpR8K7pspUjNJMZ+oone1d+BeDyD/Z+K1CIjklGp
 oqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=D38Ksi++Tty/A5E38DPnAQNTqJ8XOQDTKRr1mmy1fAI=;
 b=shQ6cw5oA2BLo9T1fuEySaeOXNvzMSjhIzXRmbgataaHyYQSE5NeRCZE9OFQhTwcfr
 aicxwi0Uz2/8L7Jm+XYQYPHQUBIQ/9s9mGE5c4Z2AAhAYu+87Pzes0x9tXmG3ZvyupfQ
 rUo7cBJn8oi9FlnFJVjBc0BEl/i1OBO7+5iVVqNwbRkEFCxDPwU6jCgqCmKH4Fb7snnD
 IjIOaCxiefR67Akob7H3KqfabTnvEqnaXoAla3jrBUwvmI1NU//1vEVPhozHNITwB+xE
 7A+igXodtixCf9x63kXaqWDcWQ19OkGpLYMIi5W5R999/zGtCm//2wPNOBPN+qr8E6G9
 niSw==
X-Gm-Message-State: AOAM531isZk0u17AzobxbCz1VgmYW7ggkY85rffzpbsmdyFdCq8jCG6j
 qpTMwrXDNmFfXlBNZ1PZ9SPrYg==
X-Google-Smtp-Source: ABdhPJz0V2xt7ZtAwZgq3cGIilKh79czTvv5/sca0q9CPnuJ/knrhIFhHJBW7bc3FEU5UytQi2WdUw==
X-Received: by 2002:a1c:7213:: with SMTP id n19mr3841609wmc.14.1610461041790; 
 Tue, 12 Jan 2021 06:17:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v189sm4402923wmg.14.2021.01.12.06.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:17:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B17AC1FF7E;
 Tue, 12 Jan 2021 14:17:19 +0000 (GMT)
References: <20210105100402.12350-1-alex.bennee@linaro.org>
 <20210112112556.GA6075@merkur.fritz.box>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] tests/iotests: drop test 312 from auto group
Date: Tue, 12 Jan 2021 14:16:04 +0000
In-reply-to: <20210112112556.GA6075@merkur.fritz.box>
Message-ID: <87pn2ame8g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, "open list:Block
 layer core" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Kevin Wolf <kwolf@redhat.com> writes:

> Am 05.01.2021 um 11:04 hat Alex Benn=C3=83=C2=A9e geschrieben:
>> The "auto" documentation states:
>>=20
>>   That means they should run with every QEMU binary (also non-x86)
>>=20
>> which is not the case as the check-system-fedora build which only
>> includes a rag tag group of rare and deprecated targets doesn't
>> support the virtio device required.
>>=20
>> Signed-off-by: Alex Benn=C3=83=C2=A9e <alex.bennee@linaro.org>
>
> I think the better solution would be to do something like in 192 so that
> the test is still run at least for one binary:
>
> if [ "$QEMU_DEFAULT_MACHINE" !=3D "pc" ]; then
>     _notrun "Requires a PC machine"
> fi

The fix is already in so feel free to revert and fix up properly. I
wasn't quite able to follow the logic of how the qemu-system binary is
chosen it seemed a little too much to chance.

>
> Kevin


--=20
Alex Benn=C3=A9e

