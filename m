Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2C7508B99
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:08:57 +0200 (CEST)
Received: from localhost ([::1]:58182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBwu-0007aw-8l
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhBkX-0004z8-SE
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:56:09 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhBkV-0002hY-VP
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:56:09 -0400
Received: by mail-ed1-x536.google.com with SMTP id g20so2645164edw.6
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vFvi/IMI6APyLhuzHP8Oz81yewix/ABe1UroHV+zohw=;
 b=sWSHi86IM1GMDqDn5vtDkPXpirA6AmcFATBQrGh4/v4rTLSNTST/1AtcohAN2r/Dmz
 sqnwtGo+1D0t11q68Px++vO8UFcvBfNOX/7V0XHl7r72ugGgeELWC++PrkP0MRTAC2as
 MbFJclzrm0DEbL3uzOHKdNV5pW9oSVk307mQTGVj5ru4oSamEZ8DtE8siGm1QVyRIq0h
 ZTGo55pmy0tsqd2LNjXBWW4cDiEj4vYbDOfAijjJ3hFtDwmwvQTjuYJW+y/ZM6QyOrp5
 Hf0AalAgsO/Z5wHETinYRSSG/j7W8Pld0dUCklyLVpfN86pb2ntSP/acIA3e+NI6/qpO
 14GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vFvi/IMI6APyLhuzHP8Oz81yewix/ABe1UroHV+zohw=;
 b=QDk0gI1+UtoK+ml4DuOLFNlCTzb1oyAa9CkAhiGagfqyjmFne9eWcgDuJXbTWQUZSk
 01X09EgRkuzs3MqunwEdZAlH+fVl4TDfnxiquICfA2mrySFXDJRYdKWQ5ayAw1V+KKkT
 Z0nM4Y0ad8VdXmy8cYwByIhO07NlzsjQmZt3LkbEPhbwzYVUtUat7NxD/0smJpL/y+ii
 jeuxIXi4cQbbpoNcF3/+/R+umEIxorv5G5bK6roWCn8t2CF1dtyCrcww1DV7T8tiAV82
 AewG+2cLX95BBg/sNqYzqjpXBXdzuPvx0UPFaPDCcR+XzV6htmjZhrgm9JkE+PzpxojP
 MK1A==
X-Gm-Message-State: AOAM532oVQQpZ8GUpKHt+yCiUF+03tdC/E1+UZr1PfH0BXh6JGecuBNe
 amrovZjnIRIYd7M1Abzsz/S3JA==
X-Google-Smtp-Source: ABdhPJwk5zWIAxgNCCTfAEeebUcA+qEa1ppu54FUZBKcwXTPurV+E6+jiKfhNGnylU2xRloASN1wvA==
X-Received: by 2002:a05:6402:27d4:b0:423:fb6b:644c with SMTP id
 c20-20020a05640227d400b00423fb6b644cmr10670439ede.409.1650466565219; 
 Wed, 20 Apr 2022 07:56:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a1709062bd900b006e8766b7907sm6815507ejg.223.2022.04.20.07.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 07:56:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9FF541FFB7;
 Wed, 20 Apr 2022 15:56:03 +0100 (BST)
References: <20220419091020.3008144-1-alex.bennee@linaro.org>
 <20220419091020.3008144-23-alex.bennee@linaro.org>
 <278f05c9-db1e-4990-4fa7-66f080e07dda@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v1 22/25] tests/tcg: add float_convd test
Date: Wed, 20 Apr 2022 15:55:28 +0100
In-reply-to: <278f05c9-db1e-4990-4fa7-66f080e07dda@linaro.org>
Message-ID: <878rrzx0qk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 Eduardo Habkost <eduardo@habkost.net>, "open
 list:ARM TCG CPUs" <qemu-arm@nongnu.org>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/19/22 02:10, Alex Benn=C3=A9e wrote:
>> This is a simple transliteration of the float_convs test but this time
>> working with doubles. I'm used it to test the handling of vector
>> registers in gdbstub but wasn't able to find a non-ugly way to
>> automate it.
>> Signed-off-by: Alex Benn=C3=A9e<alex.bennee@linaro.org>
>> ---
>>   tests/tcg/multiarch/float_convd.c | 106 ++++
>>   tests/tcg/aarch64/float_convd.ref | 988 ++++++++++++++++++++++++++++++
>>   tests/tcg/arm/float_convd.ref     | 988 ++++++++++++++++++++++++++++++
>>   tests/tcg/i386/float_convd.conf   | 988 ++++++++++++++++++++++++++++++
>>   tests/tcg/x86_64/float_convd.ref  | 988 ++++++++++++++++++++++++++++++
>>   5 files changed, 4058 insertions(+)
>>   create mode 100644 tests/tcg/multiarch/float_convd.c
>>   create mode 100644 tests/tcg/aarch64/float_convd.ref
>>   create mode 100644 tests/tcg/arm/float_convd.ref
>>   create mode 100644 tests/tcg/i386/float_convd.conf
>>   create mode 100644 tests/tcg/x86_64/float_convd.ref
>
> Is it worth adjusting the current file to float_conv.c.inc, with
> #define FLOAT {float,double} in float_conv{s,d}.c before #include?
>
> But I suppose this is ok as-is.

I did consider pushing more into libs/float_helpers.c but the whole test fi=
le
is fairly simple as is.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~


--=20
Alex Benn=C3=A9e

