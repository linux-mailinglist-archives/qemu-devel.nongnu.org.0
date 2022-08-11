Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51200590629
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 20:03:41 +0200 (CEST)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMCWy-0000J5-Ez
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 14:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oMCUD-0006GI-Ju
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 14:00:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oMCUB-00082Y-IE
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 14:00:49 -0400
Received: by mail-wr1-x42d.google.com with SMTP id z17so22158786wrq.4
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 11:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=eLkgpc9uNHYL3EPpmOqgdbcAm3800tlvwN2ZqySVMfs=;
 b=Z3n0UAUi7dlBZjUJhKUhtWKmWmSZaxUKNGhcILS9mW/8ZCPfNcju2TirxEccKs2fll
 MzFoXPV+ZVhU312oerleh3gm021UzmEgoXiVfOUdVC0LO8LraEOcq0Gc9ylDu3wBElgv
 okSsbFz48pM4CVVlRQLmOI8KfQWNzInnnAZaHDDv95DpBZ+r6fWxEmBp+XUILWVFsewC
 T517kmIs7y79ePC/3dABBYRsC7J6AiIOQvZO4frSC6PvMTOZZa6vkR9vmURAnRHm2Qn6
 q0nWAcq2hj2EcJrtbE3zIzUZqup9FvCbdLezMjsPjCoFSURaTuahDafcx5SjNthA7KsP
 /VMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=eLkgpc9uNHYL3EPpmOqgdbcAm3800tlvwN2ZqySVMfs=;
 b=UnwKfy+0Z+UIXt/efPiUZRN9+etNiC4QcEUIWA4QUxawuK+fX+GImJBH7TQ/1IGFle
 5/5LWAhys03KuQb8saED80vlbQsUH45jCVAkmAfd/rr6q8dpbPr+c9h36YsKWOjo2Ayh
 lLNKUxAFii7nhqpAtdj7hvj+L7hnndjIF2uVEEW4xllgJDMlQP9X4NW7VpxQCcGhNED4
 InYyvEbKu+RAacpJ/I5EG1qFvld7gOTvw8hdaH9+pGEWf1fdoRPUec0wdcHK3s94XnHk
 E/RdPJ+8rJJlr9UOhPFu1NaUg6hlY5xhunyPlJjMkkV+sjIReHQ0IanvB603s9FPRl4R
 36Wg==
X-Gm-Message-State: ACgBeo0su5aUMoQED6F2kWgnC6GmCASctRCtNI/LX0l8FrFlXOPn+hfX
 +4RGc9qpz/1qGiaTpSM4xTp2mg==
X-Google-Smtp-Source: AA6agR7Xe3Ln9FJxT2UCczcdxyU0Ncjp1I7wypToaFnW1XYSg/yMkBOII+tQhJzagnMJIjfoKy45ZA==
X-Received: by 2002:a05:6000:1241:b0:21e:f1e1:2ca2 with SMTP id
 j1-20020a056000124100b0021ef1e12ca2mr121011wrx.122.1660240844116; 
 Thu, 11 Aug 2022 11:00:44 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d14-20020adfe84e000000b0021badf3cb26sm24008333wrn.63.2022.08.11.11.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 11:00:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 089171FFB7;
 Thu, 11 Aug 2022 19:00:43 +0100 (BST)
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <CAFEAcA-aOZXGMv6Eb4z13+AyUUcOj6G9j+3JDWSkgbAyCpk2+Q@mail.gmail.com>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH for 7.1 v1 0/8] memory leaks and speed tweaks
Date: Thu, 11 Aug 2022 19:00:08 +0100
In-reply-to: <CAFEAcA-aOZXGMv6Eb4z13+AyUUcOj6G9j+3JDWSkgbAyCpk2+Q@mail.gmail.com>
Message-ID: <87mtcairsl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 11 Aug 2022 at 16:24, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Hi,
>>
>> I've been collecting a number of small fixes since the tree was
>> frozen. I've been mostly focusing on improving the reliability of the
>> avocado tests and seeing if there are any low hanging fruit for
>> improving the performance.
>
>> Alex Benn=C3=A9e (8):
>>   linux-user: un-parent OBJECT(cpu) when closing thread
>>   cpu: cache CPUClass in CPUState for hot code paths
>>   hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
>>   cputlb: used cached CPUClass in our hot-paths
>>   ssi: cache SSIPeripheralClass to avoid GET_CLASS()
>>   tests/avocado: add timeout to the aspeed tests
>>   tests/avocado: apply a band aid to aspeed-evb login
>>   accel/tcg: remove trace_vcpu_dstate TB checking
>
> Changes to tests/ is fine, and fixes for memory leaks
> also if they've been well tested, but stuff like the
> caching of class objects is really not 7.1 material
> at this point in the release cycle, I think.

No worries - I can drop the caching stuff for 7.1 but at least people
can test it ;-)

--=20
Alex Benn=C3=A9e

