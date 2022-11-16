Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6FA62B6AE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 10:39:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovErV-00063o-4N; Wed, 16 Nov 2022 04:37:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovErS-00063F-UP
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 04:37:38 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovErR-0000xI-7g
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 04:37:38 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 i186-20020a1c3bc3000000b003cfe29a5733so1150346wma.3
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 01:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PZW+5Ke+CwxA0DCybCtoc2LvmQGOeL5vAYExQl0VMD8=;
 b=QX9jcX7yFxlJLYDqUCHlHI3nPpAxYXmoDxPYQXUdlNAtGfC9c7Wr8CIfOFBEjoop4F
 ua1N92HmKXciYXIeNplA2xrPDvbLtmITLW/54xKTvPnPoFMsLcSR2LEKNxOIEy5JO8nw
 V5yMBqyKucjDA1kCMiCeLk6ZCfn/42ljXv+uVZBPGmFl5QjDeeufBi6m/qnsT87INsOx
 zQZrUGDXx00GxWgzvrTQnMBdnQsXuPSCLMBryqOpkjsea3loK4WFZSWV4pufmP63pfhb
 o0CUolAteVa0b57qvvCNHUQ8ipqtFvqaWrlgKruAW9rf0YF8E5I42sipSrsylqtXzniZ
 +IyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PZW+5Ke+CwxA0DCybCtoc2LvmQGOeL5vAYExQl0VMD8=;
 b=3wjuxyi39YU7J7o/87K2+l/KAljaoRw8hZLyQAbAXqbFCORVTq4dBe+HmtvxUfrJqI
 JuCwdB+PZUmLm4pJayhtpz+HduIX0FyLmcQ9Kbq186a4CfQFW7UIhjIiVwT+doG4zB8j
 OhH+InQFUMj5Ii61oMV5W9fHL7ybNExOxgOUbgOdh+vfjY66WLcYHRDgwDqt6aY5WLPj
 TjgzGvaIUlf4GPU0ALn9Gy3UGCo8RH/MNYJISXOmoygYCfJ5/VoauOpqUmKRCBb40p96
 FH6AW17bRksv9xER+o75keQB68VU2a41AjZsDgE6nGj3PXtmyIi9bA9/Hcu3ofJUbLg/
 iLHA==
X-Gm-Message-State: ANoB5pkQfBAkDy3R1HjMrqyPQvZ/9qPSpKuoePCpyFoPmfk8cjZJqr5+
 Z9NI70HDMUt/yktX/02Y41XznQ==
X-Google-Smtp-Source: AA0mqf7554d0jlQ2+oHbwcio2NJUjlRYr3JvpGuKhaOdJ1/9kR40UkUA3RhB0njlHwpCYFLLn2nuUA==
X-Received: by 2002:a1c:7308:0:b0:3cf:cf89:90f with SMTP id
 d8-20020a1c7308000000b003cfcf89090fmr1524968wmb.186.1668591455410; 
 Wed, 16 Nov 2022 01:37:35 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c205300b003b497138093sm1349154wmg.47.2022.11.16.01.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 01:37:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EE3E71FFB7;
 Wed, 16 Nov 2022 09:37:33 +0000 (GMT)
References: <20221115212759.3095751-1-jsnow@redhat.com>
 <874juzal7m.fsf@linaro.org>
 <CAARzgwziPg+u17FjWLmXDU9W6jAAMf9nHO-WrSpytUoea1xkxw@mail.gmail.com>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Wainer dos
 Santos Moschetta <wainersm@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?= <philmd@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] tests/avocado: configure acpi-bits to use avocado timeout
Date: Wed, 16 Nov 2022 09:36:05 +0000
In-reply-to: <CAARzgwziPg+u17FjWLmXDU9W6jAAMf9nHO-WrSpytUoea1xkxw@mail.gmail.com>
Message-ID: <87zgcr8cki.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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


Ani Sinha <ani@anisinha.ca> writes:

> On Wed, Nov 16, 2022 at 4:17 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>
>>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > Instead of using a hardcoded timeout, just rely on Avocado's built-in
>> > test case timeout. This helps avoid timeout issues on machines where 60
>> > seconds is not sufficient.
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>> > ---
>> >  tests/avocado/acpi-bits.py | 10 ++--------
>> >  1 file changed, 2 insertions(+), 8 deletions(-)
>> >
>> > diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
>> > index 8745a58a766..ac13e22dc93 100644
>> > --- a/tests/avocado/acpi-bits.py
>> > +++ b/tests/avocado/acpi-bits.py
>> > @@ -385,12 +385,6 @@ def test_acpi_smbios_bits(self):
>> >          self._vm.launch()
>> >          # biosbits has been configured to run all the specified test =
suites
>> >          # in batch mode and then automatically initiate a vm shutdown.
>> > -        # sleep for maximum of one minute
>> > -        max_sleep_time =3D time.monotonic() + 60
>> > -        while self._vm.is_running() and time.monotonic() < max_sleep_=
time:
>> > -            time.sleep(1)
>> > -
>> > -        self.assertFalse(time.monotonic() > max_sleep_time,
>> > -                         'The VM seems to have failed to shutdown in =
time')
>> > -
>>
>> We might want some wait for consoles as well depending on what is output
>> during the run.
>
> actually I think you won't get anything on the console since grub is
> not configured to use the serial console.  I tried "-serial stdio" a
> while back without any output.

Grub is certainly capable of serial output but I think the grub.cfg
needs changes to support that. It would definitely be an improvement if
we could enable serial output because currently the test is totally mute
while running which is unlike every other test in avocado.

>
>>
>>
>> > +        # Rely on avocado's unit test timeout.
>> > +        self._vm.wait(timeout=3DNone)
>> >          self.parse_log()
>>
>>
>> --
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

