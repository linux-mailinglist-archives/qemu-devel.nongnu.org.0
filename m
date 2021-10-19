Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB77433DE5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:55:39 +0200 (CEST)
Received: from localhost ([::1]:58198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mctKs-0005Nx-IA
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcsgp-0003ch-5J
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 13:14:15 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcsgn-0001OQ-JL
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 13:14:14 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 63-20020a1c0042000000b0030d60716239so4108581wma.4
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 10:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BNvILEezEt4p48UW2jDnCuiqB0oAWo53d3AM8dyl/WE=;
 b=YxY0MXqOrpB/T3lD4JSo2fnHGkX0oHydgEh1rSoXlLW/a1LpQWp3OF7holucx83Xit
 mqrTHAtoy+znJpOK5qHUTiZ/QVo4jtVhkWGudVKJE3Vk7aZqT/rsI1cj7rUM7pJB35ml
 GP3Ruep19dqgLdY0C7RtkdGHhADM4di1XH1JdybRa+jQMWmsyDHWbFzFiit+q5jS9c5L
 BTsJ9zm+SagbV9fvmjVaiRKRDoGur+wkbUhlRf40Zl6ERZOqXIeh212ipM148j2tNzD9
 7P9GTZbOqgdu08lsbaC2DSD8bvi0hw/YUwDNJYrCVJ7wmJ19OydQOkueQnMvNSb3oFGA
 BvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BNvILEezEt4p48UW2jDnCuiqB0oAWo53d3AM8dyl/WE=;
 b=DN2GcvnIiVLoUMnTA0Ga6MxyavhhlVIvs6r49izE2Zyohj448kwHz58wyxsc9FK419
 Vq39Q3EmtJ6WV6gB4jbjvEUvkInFShTer2kPDajw29NhCquqC47eGbkNBmYPf6O+ezZF
 eruuKZ0aCIqwHU52Zf6Tf4TuYopZRSbRl8Ut+1Dcachp65wIryqUnqxntRVBKmZp0KSR
 izHfqNmznHHlCnIuWE7AAlodb4+mHuAuCNefMkrKgGr/opgEDRaGUbfe57ZTElW5MdoN
 8JERzP/lqXowuic57faynVsfOYB0ED3//BpZWrXG/teTibtJ76jIMv9C6Vp+I3hFiKI4
 nk6A==
X-Gm-Message-State: AOAM531Xj4XmpEeRz/RTctkJ/c5CU4o0+sbKXagmW9Md+jCA8hp0F6aK
 +Rq/yqJQLc9Yf6bkOApMGi8B+UAzMoY=
X-Google-Smtp-Source: ABdhPJwYuBRfPFr/3ucHBGyuHKf9w2ZE/Us5F9ATfu+xFlcTRO6pnAESj+uPqCNwktmDeSbQGOKiCQ==
X-Received: by 2002:a7b:c08b:: with SMTP id r11mr7357915wmh.167.1634663652079; 
 Tue, 19 Oct 2021 10:14:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n7sm10098764wrp.17.2021.10.19.10.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 10:14:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C5F541FF96;
 Tue, 19 Oct 2021 18:14:10 +0100 (BST)
References: <20210930095111.23205-1-pavel@labath.sk>
 <9b435ae3-27f3-4838-421e-f40ac58a7905@labath.sk>
 <87czo6th1k.fsf@linaro.org>
 <18ff3adb-6777-730b-ecdb-a99addd9109f@labath.sk>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Labath <pavel@labath.sk>
Subject: Re: [PATCH] gdbstub: Switch to the thread receiving a signal
Date: Tue, 19 Oct 2021 18:13:36 +0100
In-reply-to: <18ff3adb-6777-730b-ecdb-a99addd9109f@labath.sk>
Message-ID: <87k0i9vswt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Labath <pavel@labath.sk> writes:

> On 15/10/2021 17:59, Alex Benn=C3=A9e wrote:
>> Pavel Labath <pavel@labath.sk> writes:
>>=20
>>> Ping.
>>>
>>> (This is my first qemu patch, so please let me know if I am doing
>>> something wrong.)
>> Apologies it slipped though the cracks. I shall have a look on
>> Monday.
>>=20
>
> I don't want to impose, but did this get buried over the weekend by
> any chance?

I had a quick look over and made some comments. I haven't been able to
replicate the test manually so far but I might have broken tooling so I
need to dig into that.

>
> regards,
> pl


--=20
Alex Benn=C3=A9e

