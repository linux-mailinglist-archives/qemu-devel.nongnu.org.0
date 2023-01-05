Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E3765E76A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:12:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMHC-00008c-E9; Thu, 05 Jan 2023 04:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDMHA-00008C-Qq
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:11:04 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDMH8-0006Px-V4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:11:04 -0500
Received: by mail-wr1-x433.google.com with SMTP id d4so27483617wrw.6
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQwEVL5C2wjCrhsqMyEW7r3dgdtymoG7j4D3HBCa5IY=;
 b=GF/0RTF6JVo9rl15Wp7fcZR5zYxdnFdJOwTSl0uwoUJ8RcfTwiepxAHv3bF8vRIy2o
 8C/yfao5cfQMLlLMyn9fQTXAEBKQF0YStrnLk1zHXZ5yKYt227wcg/y44JMi03n3/pol
 kirsTn6+Ak99MSv8KuQrwuk1roZ0FC41seHVOJUj4Cntl5xY4TYqvGJ9xCm70RRhktXY
 Xqla+OslrdBogfGfiIcXTh+jBKYqH1l0vT826g/l1LHocKlGr5BhKXOeiDDsqr+B1dqU
 Q267MBuuQVVVnaUaT28GWiNu/L+1YQera2cWeDDbDZtNjkAg77lWIBKJB3W1IiS5w7wX
 Hf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=xQwEVL5C2wjCrhsqMyEW7r3dgdtymoG7j4D3HBCa5IY=;
 b=C924FdDOcW/HVBslpSExD0BfTnxm9m+y2NgJm+M9ESg+uS6d+eP6apNxgsdjQGGynE
 UyoyMT1cyxm6GBUsj9R8ebdNAYtSFwmUElRqi4QwgCD5t/Lcw+qKYjmXYO2FJmAGEjiD
 8nISS70Nh7wRv+bfWAHnlnSKWWwpu0/3jg7cNINlBnc+cv+CIOQwm+2zOBrq6HuzpPHh
 uf/Bz+6xlUf8ShGOuK996xz6cZmPefF3wFCTCQe9T7/OnevFPeFKYeptzvVfQAI5+qFx
 eDOPgfxHwjsoKfRAhBaSiDfYaeoxBG0jgpUZc5ODCkeiNW5vkdig02rV2NvZg3YnakdZ
 sbFw==
X-Gm-Message-State: AFqh2kp8ASUjfuYsitGWtyDN25kyiY7DdaGHJstrzYKHk+vCyRc3AOrq
 +Dj/LBBn6VeEELqV0oUsW5S6BQ==
X-Google-Smtp-Source: AMrXdXuM8wQyT9dYelhXW2k++8I+ILCjFgOUObD+hwM0XYJnEBfzfJQHJ4yl10SeyR0n1Y80CDm8FA==
X-Received: by 2002:a5d:6509:0:b0:27c:73d7:775d with SMTP id
 x9-20020a5d6509000000b0027c73d7775dmr25392111wru.60.1672909861474; 
 Thu, 05 Jan 2023 01:11:01 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfc787000000b002238ea5750csm43696940wrg.72.2023.01.05.01.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:11:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 43A3C1FFB7;
 Thu,  5 Jan 2023 09:11:00 +0000 (GMT)
References: <20221230000221.2764875-1-richard.henderson@linaro.org>
 <20221230000221.2764875-48-richard.henderson@linaro.org>
 <3a43a0d5-acc3-cdec-4328-57fde042cfb0@linaro.org>
 <9376b5cb-10e5-30b7-ad6f-9ff1aae9685e@linaro.org>
 <8ba170da-3ffa-ffe9-edae-fbfa82c116cf@linaro.org>
User-agent: mu4e 1.9.11; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 47/47] tests/tcg/multiarch: add vma-pthread.c
Date: Thu, 05 Jan 2023 09:10:17 +0000
In-reply-to: <8ba170da-3ffa-ffe9-edae-fbfa82c116cf@linaro.org>
Message-ID: <87r0w9pcrf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/4/23 16:37, Richard Henderson wrote:
>> On 1/4/23 16:26, Richard Henderson wrote:
>>> =C2=A0From the failures I see on the gitlab merge job, I think I need to
>>> resubmit with this new test adjusted to loop less,
>>>
>>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < 50000; i++) {
>>>
>>> here.
>>>
>>> The failing jobs are --enable-debug, and take about 115 seconds to
>>> run manually on our aarch64 test host, exceeding the 90 second
>>> timeout.
>>>
>>> I'll cut this down to 10000 loops and double-check times before resubmi=
tting.
>> Hmm.=C2=A0 Even this only reduced the runtime to 98 seconds.
>
> Bah.  The testcase didn't rebuild as expected.  Building from clean,
> the 10k loop completes in 20 seconds with optimization disabled.
>
> I do wonder what the build time / test time trade-off is here, and
> whether we should be doing much -O0 testing in CI...

I think the main argument for --enable-debug is less about the -O0 and
more about the extra asserts. Can we have -O3 with --enable-debug-tcg?

>
>
> r~


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

