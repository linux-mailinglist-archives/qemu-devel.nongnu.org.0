Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C418B6A6A53
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 10:59:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXJEQ-0004Gz-Er; Wed, 01 Mar 2023 04:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXJEO-0004Gb-Vk
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:58:40 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXJEL-000478-IG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:58:40 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so6961646wmq.1
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P7lH6Pdxj/NbdlU1Y8Q6AHzeidL8U9lv/92yiGtQciU=;
 b=XqGkZUKlZ2tekNlImDF5PYadES48yB6gy3T+mG4EPelA6Xw0TbhQR5mC50CCqOz3RO
 ZewdkaiTfBT8lImOZmSXCZo5DzT8hPpkkrNpnFiKPHuQ9FIgK07RxJUgeLo1Jskvjbs9
 6WKhIjfrMpXuRYj6aKRNMzxKNurlc4TSE4l0NKZeRzV0yz88uieZuQAssxP18ny9ZhB6
 oxICKRhXq75/NA1lW2iPOYxSGV/VpwHZ6orFGQxVL0bLQDRvV0+9RHEAyPEzo7aG7Z1X
 KRCul4amxoykE0zCoBGZyTN2QqwOIVxpGENeyZh3l2zYfndcVlBpSxCEtvujXkhID4lz
 Rs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P7lH6Pdxj/NbdlU1Y8Q6AHzeidL8U9lv/92yiGtQciU=;
 b=Muwfn7za4cof8uIZrOG3/PZIUZykiQcuCVkStQ7TdMkyaC8v2Wf7cYudzMYPDGrxpt
 /5rNYvKLZyXS+x5x4lz7xDeQ13zYUHXDqV2zNbuNHW3tg9N2auEpKHAvOsv3EWQKgZra
 utD60Z3N+7ULSmGgTsi2nKKRJC90Tgwq8JnhKSrTUf1q1ddw50r3fuaJhMiSOy8qyMKs
 j3I/d+ZQD0QOCGwIdvIQFuA6i4ARYMmDBXA+xua/n6VBWUiq2SMZdaupnwlsi+zoCt0i
 nn0grqL3OSmmpf9CSVojgQb+k2rDXu3CMPOkB4hsggSf+v0SqTTJ/tHAFSJi+afC/Vws
 p51w==
X-Gm-Message-State: AO0yUKUWhaabJ3+48VecBjYBQ4q1FOu1xNV5GZ6puCuHg+0xBOK+UEGE
 K+CASVlfq462rSltdA0PZPwphQ==
X-Google-Smtp-Source: AK7set8GvheQbr1f0t0dCBBvOjkevstIaHbBBGUsbYhUO0PIBr2XMIR8eS6hYWRzJA1rM5Dr+/edGQ==
X-Received: by 2002:a05:600c:540a:b0:3eb:fc6:79cf with SMTP id
 he10-20020a05600c540a00b003eb0fc679cfmr4802350wmb.6.1677664715904; 
 Wed, 01 Mar 2023 01:58:35 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a1c4b02000000b003e203681b26sm14811123wma.29.2023.03.01.01.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:58:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 316C71FFB7;
 Wed,  1 Mar 2023 09:58:35 +0000 (GMT)
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-25-alex.bennee@linaro.org>
 <72580c0e-353b-bb91-444e-b56d4c6ff7ba@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Peter Maydell <peter.maydell@linaro.org>, Kevin
 Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>, Alexander
 Bulekov <alxndr@bu.edu>, Aurelien Jarno <aurelien@aurel32.net>, Markus
 Armbruster <armbru@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz
 <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>, John Snow
 <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Laurent
 Vivier <lvivier@redhat.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH v3 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
Date: Wed, 01 Mar 2023 09:57:34 +0000
In-reply-to: <72580c0e-353b-bb91-444e-b56d4c6ff7ba@redhat.com>
Message-ID: <871qm8eqt0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Thomas Huth <thuth@redhat.com> writes:

> On 28/02/2023 20.06, Alex Benn=C3=A9e wrote:
>> This test is exceptionally heavyweight (nearly 330s) compared to the
>> two (both endians) TuxRun baseline tests which complete in under 160s.
>> The coverage is slightly reduced but a more directed test could make
>> up the difference.
>> tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:
>> Overall coverage rate:
>>    lines......: 9.6% (44110 of 458817 lines)
>>    functions..: 16.5% (6767 of 41054 functions)
>>    branches...: 6.0% (13395 of 222634 branches)
>> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:
>> Overall coverage rate:
>>    lines......: 11.6% (53408 of 458817 lines)
>>    functions..: 18.7% (7691 of 41054 functions)
>>    branches...: 7.9% (17692 of 224218 branches)
>> So lets skip for GITLAB_CI and also unless AVOCADO_TIMEOUT_EXPECTED
>> is
>> specified by the user.
>
> The explanation sounds somewhat implausible to me.
> AVOCADO_TIMEOUT_EXPECTED should be for jobs where we are not sure
> whether the job really finishes in time, e.g. when compiling QEMU with
> debug flags enabled, and not for jobs that simply run a little bit
> longer (in the latter case, it would be enough to simply bump the
> timeout setting a little bit if necessary). So did you check whether
> you really run into timeout issues here when compiling QEMU with debug
> flags?

Ahh I realise now that I was running into the timeout because it was a
gcov build. I'll drop the AVOACADO_TIMEOUT_EXPECTED bit for now.

>
> Anyway, if you add AVOCADO_TIMEOUT_EXPECTED, then I think you don't
> need GITLAB_CI anymore, since we certainly don't set
> AVOCADO_TIMEOUT_EXPECTED in the gitlab CI.
>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

