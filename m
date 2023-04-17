Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1976E4506
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 12:19:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poLvh-0003Cs-Ib; Mon, 17 Apr 2023 06:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poLvc-0003CY-JP
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 06:17:45 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poLva-0005J5-1y
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 06:17:44 -0400
Received: by mail-wm1-x330.google.com with SMTP id r15so3954867wmo.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 03:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681726659; x=1684318659;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2KHC9emzYTGjtVb9rh+vaWiooEXRjml6A7L0pmU9p6w=;
 b=RSue0qblD9i5sZvjIkrfAPw6RZVCVOHRTymdqBPbVKHCcdFZRcisITTZ4c5m/9MITi
 RU1RZAupPl0aa5vWBYaM6N4hNlC8gY1uM8pOBuq4yQlW1czS8JnGsBwiYGvAfkDlECCc
 HJo4/tCoZpXVMSvP0gHLixsXzsXFmO48VOe4Kp7NRMv4AXQ0Op+/sR3pCQhsK988TvlM
 OUww65Z0ePuiIpVTly66/bivWMxRvMiuwgNviO0kHdIpJs/pHi2fmXI8dbomvCKwP7mE
 ueol/muzNF/DhRBU+kYBW+UEAqxOWKhwoX0Nnyo/yzCucHPa1NIQ8yORiy2910mVrNQN
 KDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681726659; x=1684318659;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2KHC9emzYTGjtVb9rh+vaWiooEXRjml6A7L0pmU9p6w=;
 b=CZT4BvT8CiYDW/2yt+4arayFVMnmFP7gCz1lLSGewyLFnimsehOAK/gs+tHr+XCIli
 jAK3yYzm61Q50cEMsZ9Hr1h2pr8xKHPZL1tyvWbU/9jpF8D1SH6BFBurInLS8Qo7RJ1e
 3Fgdzj+NwlJrK2wMHdtpbHnGHdAERMZGtJOLN1Lz3qXdMNawrD8CzqL0Z5sdzR+D88XY
 yzorN1tY+NJ5NsMje3aLnpL2Cb/AumcFeC3sMmHLMv43hdy6sYgZ8SOfg5XlXQL9in6b
 4KGxg9zDHsAc2/yvHNSUtywZY7yoQw6Vkl+exSDPz+e/3RHaRC57Nl8hFnXZGcyyuVb/
 hgkA==
X-Gm-Message-State: AAQBX9clGXuJaaWmzHjBWJoPUJAiV/8/sI0KUZnyKX6B2XnTui/fZjGP
 odmxaKNwcTjpgs1qqhWik67kJu2dMm2Ukt0PaWI=
X-Google-Smtp-Source: AKy350aYtLdlkI5aCKf8ah4IAkiHeqprsl0EdceOooCODebQ9sHSY7Jc2g93LT5HwTzXz2h7wNl9Vg==
X-Received: by 2002:a7b:cb8b:0:b0:3f1:74c7:c7cb with SMTP id
 m11-20020a7bcb8b000000b003f174c7c7cbmr844248wmi.16.1681726659546; 
 Mon, 17 Apr 2023 03:17:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a7bcbd5000000b003ede3e54ed7sm11553848wmi.6.2023.04.17.03.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 03:17:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B16651FFB7;
 Mon, 17 Apr 2023 11:17:38 +0100 (BST)
References: <CAFEAcA8gecpvfUj9uz+HBRspskZsxJTdD2Yz3M3uOKcFJbpv-Q@mail.gmail.com>
 <CAFEAcA-PMX4M9BkaDp9Kd2N_3ffMAW8iM8Ub2e9EtkVteth1hQ@mail.gmail.com>
 <dda6039e-2826-c32f-b0ec-d5988808a1a1@redhat.com>
User-agent: mu4e 1.11.2; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: netdev-socket test hang (s390 host, mips64el guest, backtrace)
Date: Mon, 17 Apr 2023 11:16:11 +0100
In-reply-to: <dda6039e-2826-c32f-b0ec-d5988808a1a1@redhat.com>
Message-ID: <87cz4295j1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


Laurent Vivier <lvivier@redhat.com> writes:

> Hi Peter,
>
> On 4/13/23 14:05, Peter Maydell wrote:
>> On Thu, 13 Apr 2023 at 11:50, Peter Maydell <peter.maydell@linaro.org> w=
rote:
>>>
>>> I just found a hung netdev-socket test on our s390 CI runner.
>>> Looks like a deadlock, no processes using CPU.
>>> Here's the backtrace; looks like both QEMU processes are sat
>>> idle but the test process is sat waiting forever for something
>>> in test_stream_inet_reconnect(). Any ideas?
>> May well not be related, but I think there's a race condition
>> in this test's inet_get_free_port() code. The code tries
>> to find a free port number by creating a socket, looking
>> at what port it is bound to, and then closing the socket.
>> If there are several copies of this test running at once
>> (as is plausible in a 'make -j8' setup), then you can
>> get an interleaving:
>>   test 1                       test 2
>>     find a port number
>>     close the socket
>>                                find a port number
>>                                (get the same number as test 1)
>>                                close the socket
>>     use port number for test
>>                                use port number for test
>>                                (fail because of test 1)
>>=20
>
> I don't see an easy way to avoid to race, but perhaps we can change
> the test to use unix socket rather than inet one? In this case we can
> use an unique name.

We could use a lock file that would stop the test clashing with itself
(although another process on the machine could still race for the
socket). The unix socket would be easier but wouldn't we loose test
coverage or do we not care about the exact details for this test?

>
> Thanks,
> Laurent


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

