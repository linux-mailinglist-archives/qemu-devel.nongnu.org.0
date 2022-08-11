Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A8658FE69
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 16:35:06 +0200 (CEST)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9H7-0008Pi-BI
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 10:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9EC-0006hH-5q
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 10:32:07 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9E8-0007HN-71
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 10:32:03 -0400
Received: by mail-ed1-x532.google.com with SMTP id t5so23146006edc.11
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 07:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=0RqX4MfNSB0P4w4oruTNY5fGHJvxfdAf1CDQapSDhAY=;
 b=XZddJGaadAPMxhXJZ0xDuA+aPotWwlb6bnc5kdWoanrnY7CZTjnudtX3Hrvfad198w
 qGCEmQAx/IRqumn7n/2tYqkVLcVaQt0p5H7RP+nneYEF7LS67s3/Eb6NXampL6Qu5slE
 m8OlcpE5O0b3cVIoCFjSbBZZSA/qtQGfE2UgpekNWW5gdFHYBOBR/B6Dm3ygASvRGC/Y
 LOe/s+XIAE9T0edxJRKsnw24tC2quQQ3qzEox+8hlWe/WfIfldOlw5a0/yclurmtwmqb
 94l9cCxJX/HnwM5Us9+xPaVUTxbxNAdBEhUv12mhUE0ek6nG6m2QmfPycfy12xo78ZHi
 p9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=0RqX4MfNSB0P4w4oruTNY5fGHJvxfdAf1CDQapSDhAY=;
 b=sNFmXrxYKwbOXeGp9gXXNzeLg/fx2DQnY3U4VUzLVOhRXgaJHzcEqD+3eGw46m/e/v
 x3lrv/NXqpEZEUGsfCu6yozfJvKG8iRjboKkZYJ6cnbOOzLU3FllkI72t54CjRNowTHs
 nTfsQmuvTlOP7cPOb7gEy8gC2Pj8X4Abw32h0VtQ91EWRmZJpvERFtj1JMeI5KNIZ8iE
 981NkaLcZ00RsCYd44f45BMRVvgFYNXPfKa997lnaN5vnAJfctjqX0NBLRyRsuSn8u8N
 Z/iB/ntfZkcJRjKS42nl6gAeXfNFKJ0k6wmPYuCLIk+jVWtCkg7DB3b63XYRXknmbfyJ
 bWFw==
X-Gm-Message-State: ACgBeo11HWEAkeNwXoroO7S/ujV34EjLeROdg1uN0Cadl88Io+8QQbIn
 /NzobIrdRYjPg5hP1exFbbuh2Q==
X-Google-Smtp-Source: AA6agR42NQ1XVcakD6St+cwoc4hGT9HNzr/7zVzv7v9/PniaPWWQcJvCqXgzK35BNx7qVOyr+P1X/w==
X-Received: by 2002:a05:6402:27cf:b0:43f:f6a:3286 with SMTP id
 c15-20020a05640227cf00b0043f0f6a3286mr28470267ede.1.1660228318270; 
 Thu, 11 Aug 2022 07:31:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a170906305900b007317f00a6d9sm3506978ejd.208.2022.08.11.07.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 07:31:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7315D1FFB7;
 Thu, 11 Aug 2022 15:31:57 +0100 (BST)
References: <20220811114315.3065951-1-alex.bennee@linaro.org>
 <CAFn=p-a2zUPHv-XJa3VHDPZUwnkPZ4pgS4Y53oP9T4kGZp7r5Q@mail.gmail.com>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: apply a band aid to aspeed-evb login
Date: Thu, 11 Aug 2022 15:30:47 +0100
In-reply-to: <CAFn=p-a2zUPHv-XJa3VHDPZUwnkPZ4pgS4Y53oP9T4kGZp7r5Q@mail.gmail.com>
Message-ID: <87v8qyj1gi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


John Snow <jsnow@redhat.com> writes:

> On Thu, Aug 11, 2022 at 7:43 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>> This is really a limitation of the underlying console code which
>> doesn't allow us to detect the login: and following "#" prompts
>> because it reads input line wise. By adding a small delay we ensure
>> that the login prompt has appeared so we don't accidentally spaff the
>> shell commands to a confused getty in the guest.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: C=C3=A9dric Le Goater <clg@kaod.org>
>> Cc: John Snow <jsnow@redhat.com>
>> ---
>>  tests/avocado/machine_aspeed.py | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_asp=
eed.py
>> index c54da0fd8f..65d38f4efa 100644
>> --- a/tests/avocado/machine_aspeed.py
>> +++ b/tests/avocado/machine_aspeed.py
>> @@ -101,7 +101,9 @@ def do_test_arm_aspeed_buidroot_start(self, image, c=
pu_id):
>>          self.wait_for_console_pattern('Starting kernel ...')
>>          self.wait_for_console_pattern('Booting Linux on physical CPU ' =
+ cpu_id)
>>          self.wait_for_console_pattern('lease of 10.0.2.15')
>> +        # the line before login:
>>          self.wait_for_console_pattern('Aspeed EVB')
>> +        time.sleep(0.1)
>>          exec_command(self, 'root')
>>          time.sleep(0.1)
>>
>> --
>> 2.30.2
>>
>
> Augh. Sorry my hunch was wrong. I wasn't aware of this problem.
>
> Is ... this 0.1 second sleep really sufficient? I guess it's better
> than not having it, and I can't reasonably ask for something more
> thorough.

We could still do with fixing _console_interaction() so we can handle
waiting for prompts without newlines in them. I had a go but it just got
messy.

>
> Acked-by: John Snow <jsnow@redhat.com>


--=20
Alex Benn=C3=A9e

