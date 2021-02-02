Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D492C30CA19
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:41:00 +0100 (CET)
Received: from localhost ([::1]:48326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70bj-0007ob-De
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l70aH-000751-Ls
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 13:39:29 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l70aF-0000UU-Bf
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 13:39:29 -0500
Received: by mail-wm1-x32e.google.com with SMTP id u14so3161025wmq.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 10:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=aGpHnHe9/HcfdFp0RWpjuCnz0xS1onu+ISkYwki9bl0=;
 b=fViE70j3C776S5NzQ8jd9wXgIKzSOioxYcDio+XRz4AZ9Pp4UHwwrTgIEdlTsV86zS
 AC5L8HeKyZgsTABUctf87Ilj9Arb4o9Q+Coz8c8APqx/0efeyyVqi24nShE2mrDTUAOx
 slKlBgxrqWzpjNjreXK/+kHuwwmJxMllX1kRxGG1qLdplae+Qlbvymnb660UyQCxvgRx
 ga6gvjgWbQdldYA9wJHYQXkyrngV443gL6kIXxcw1/i9rRhbABNFl1h9TgYCrk8e+teX
 Uq660nlH2/jsb4XoVQpKHpG4mdq/Ac70P5semtnhF0KirCmEBWOHIN3v9XNb9+6WuC17
 WRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=aGpHnHe9/HcfdFp0RWpjuCnz0xS1onu+ISkYwki9bl0=;
 b=Yg0MJB8i0Pg+vJVU+j+KhAyqdzF4xl6/013/Kky/VbAGavADON3uVicomoxvvKT3YP
 4hkeocMB5F07/1oDc/WUqBDt5xSqDVXkVYCDaVtEAUAhFRLVv5QHBLJX7VHjSggrjX9K
 JCa7fxa5GuQxfS3NkrrvrQqBVo2/ZAYE4goVpI99uJsFEF853k6eHW4PcafA/lRL3Z9y
 PYYpLUWNUswda0FvPziXZ8WtZ7wrGALqpmi6eE/oz/tDmpUEERgGy5X3MgNmbwBI3udQ
 /Qm366zp1/jLwlIH9cIplZ6T3xJgB1+Bz56dzI9hFpDxENXqF6B+cgLeL/DNxdqk8MjD
 in/Q==
X-Gm-Message-State: AOAM533T4YjNjXoSTVA5XCbKQIv6KXXPpINXiKqj/r7kYdKCUcapxoP9
 O62aiQVg8/0tZ3DAQ6oAsvXO6A==
X-Google-Smtp-Source: ABdhPJwq6Ae2bSbRlRgdHsEW2cJxxZFfJTw0lkz77jvOUwpIFjkwXsDNLZ9NkW3NsOa6Ujnk8iFneQ==
X-Received: by 2002:a1c:7e15:: with SMTP id z21mr4838774wmc.27.1612291165544; 
 Tue, 02 Feb 2021 10:39:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k6sm34491187wro.27.2021.02.02.10.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 10:39:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 957031FF7E;
 Tue,  2 Feb 2021 18:39:23 +0000 (GMT)
References: <20210202134001.25738-1-alex.bennee@linaro.org>
 <20210202134001.25738-12-alex.bennee@linaro.org>
 <15438de7-ad2a-b0c3-3d35-1e78c6b1ce13@amsat.org>
 <CAAdtpL7EttPLAJaFWRpvM93n342MyaAREpEtxr6-dmnfmu=wZg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v1 11/15] tests/tcg: Replace /bin/true by true (required
 on macOS)
Date: Tue, 02 Feb 2021 18:34:58 +0000
In-reply-to: <CAAdtpL7EttPLAJaFWRpvM93n342MyaAREpEtxr6-dmnfmu=wZg@mail.gmail.com>
Message-ID: <87zh0ms49w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On Tue, Feb 2, 2021 at 3:23 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>> On 2/2/21 2:39 PM, Alex Benn=C3=A9e wrote:
>> > From: Stefan Weil <sw@weilnetz.de>
>> >
>> > /bin/true is missing on macOS, but simply "true" is available as a she=
ll builtin.
>> >
>> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>
>> Reviewed ... :
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777004.html
>> ... before Peter:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg777010.html
>>
>> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> His tag is and mine isn't... Is it possible this is a b4 bug when
>> names use UTF-8 encoding?
>
> FWIW the version I'm using works:
>
> $ b4 --version
> 0.5.2

Same here... the only thing I can think of was I applied it old style
and your email hadn't been indexed yet (I have Peter's rb in my
review.org). I do generally use b4 to apply series now (as I will this
one when I roll). Sometimes however individual patches get applied
directly if I don't see anything in my email.

It would be nice if b4 could run on across an existing git tree to see
if things can be applied based on tags that may have arrived in the
interim. I think there is a potential race there while a series is
prepared.

> $ b4 am 20210128135627.2067003-1-sw@weilnetz.de
> Looking up https://lore.kernel.org/r/20210128135627.2067003-1-sw%40weilne=
tz.de
> Grabbing thread from lore.kernel.org/qemu-devel
> Analyzing 4 messages in the thread
> ---
> Writing ./20210128_sw_tests_tcg_replace_bin_true_by_true_required_on_maco=
s.mbx
>  [PATCH] tests/tcg: Replace /bin/true by true (required on macOS)
>    + Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>    + Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Total patches: 1
> ---
> Link: https://lore.kernel.org/r/20210128135627.2067003-1-sw@weilnetz.de
> Base: not found
>       git am ./20210128_sw_tests_tcg_replace_bin_true_by_true_required_on=
_macos.mbx
>
>> Again:
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Message-Id: <20210128135627.2067003-1-sw@weilnetz.de>
>> > ---
>> >  tests/tcg/Makefile.qemu | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)


--=20
Alex Benn=C3=A9e

