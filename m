Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A6166CB2F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:11:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSzX-0001OR-LZ; Mon, 16 Jan 2023 12:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHSzW-0001OI-BW
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:09:50 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pHSzU-0000dS-Md
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 12:09:50 -0500
Received: by mail-wm1-x332.google.com with SMTP id l8so3345537wms.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 09:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXLOLfFJ1u9zBxIIf22HXYC+5/UVAL0ZPeCUAkRoiQs=;
 b=TSBNJVrBGe8GQSD5mysfOTy8N+aztgpMIhwkEJlIcXSlPe2qfwjXr+sUdUOvOF0vEu
 rcc6hbm6BgiuId9r2QlbMNcJ9yzoluOLNlzwKtu5xfW38TjYVjWnEAVB2LiujMMlOLE3
 9PIEoC15i7AOByQAOqLT9svLENxxILYSLMN7NZbuz1Xe+ahGsbU4ZWg3gKMp1Utd0fac
 upVoIRNNdEpI7wxpTdxlJVaK+inSQuvbUq9qf18om/zzJOjyEZ3OO6KydYBjexc3wCUP
 VYO+RX1rCVc4DGhm/X3mm2tDvR7CzVn5RLUR2ujdeP2aQjzPJblrYcieIhU5OdG4ymKs
 gnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JXLOLfFJ1u9zBxIIf22HXYC+5/UVAL0ZPeCUAkRoiQs=;
 b=DfkcZyJtaXtYfJEC9rABa08Tl8RYQaElI4MNyOW/28NWwdFuQJykg0gWTyztOZBWCq
 M//XbSjRlviTqXypzypbV5kOpd3Fiq+N9lK6U5wBjggjWUHBB3eLYeO7uXdKAI0KI358
 6ah1muux5Q3OvGKM6ia6ZEM9mxuhsA+ytq/5a0klaU6inD3+yFgJeJ8lDWdUPjtJIvz1
 F70xCCJNGwpBgbE/zeq4XeIgASQuRW9jDROKwCjFhJaBHO4m5EJ/o+49xUXhVuvrJBNN
 JYxyuhxMA88Q7q73TeUYg959WUuYU4HKgreReRr1tymf2W9NLYoCgEehCX0pcMF1s7dR
 zIPQ==
X-Gm-Message-State: AFqh2koZUkmGuEtAVs+frOQP+SPELCLelSfR0ZO50fe+WsCYDSRoqS6W
 br9s+LEN1QiKs9Z7Av5R7/3SuQ==
X-Google-Smtp-Source: AMrXdXtfxNFwHG0bKpwtiN+mziG3/v+eVlwxSxdt56yyr4hwP/uSZgZX4OBEFg76BwNXTQueDDvg3A==
X-Received: by 2002:a05:600c:a10:b0:3da:1d23:6e6a with SMTP id
 z16-20020a05600c0a1000b003da1d236e6amr152091wmp.40.1673888986789; 
 Mon, 16 Jan 2023 09:09:46 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003d34faca949sm34348920wmb.39.2023.01.16.09.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 09:09:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F1E981FFB7;
 Mon, 16 Jan 2023 17:09:44 +0000 (GMT)
References: <20221224151821.464455-1-richard.henderson@linaro.org>
 <20221224151821.464455-5-richard.henderson@linaro.org>
 <CAFEAcA_viCsMxSjcpFtxL+hj-n5TTff0npg1RjOnLUpwGu47DA@mail.gmail.com>
 <87pmbil5rn.fsf@linaro.org>
 <a2ebe5dd-29a2-4c94-f3da-9c7f5dc7979f@linaro.org>
 <CAFEAcA_sZ7QbkhOHYJt-DPxh-NS6XnBg8MNJh=oe8X6KmuAYjg@mail.gmail.com>
 <87bkmye8xx.fsf@linaro.org>
 <CAFEAcA-4rWe0tUJHtZz+SpZzccFApfZNmCzQS4BLcewSs9HUaQ@mail.gmail.com>
User-agent: mu4e 1.9.14; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson
 <richard.henderson@linaro.org>, iii@linux.ibm.com, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] tests/tcg/multiarch: add vma-pthread.c
Date: Mon, 16 Jan 2023 17:09:35 +0000
In-reply-to: <CAFEAcA-4rWe0tUJHtZz+SpZzccFApfZNmCzQS4BLcewSs9HUaQ@mail.gmail.com>
Message-ID: <877cxme78n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 16 Jan 2023 at 16:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Mon, 16 Jan 2023 at 12:40, Philippe Mathieu-Daud=C3=A9 <philmd@lina=
ro.org> wrote:
>> >>
>> >> On 13/1/23 18:10, Alex Benn=C3=A9e wrote:
>> > Yep. Could somebody write a patch to disable this test while
>> > we figure out why it's flaky, please?
>>
>> I don't think the test is flaky - I think it is triggering a race in
>> QEMU code. I have not however been able to replicate it in anything other
>> than CI.
>
> My definition of "flaky" here is "the CI fails randomly".
> Unless you have a patch to fix the underlying bug ready to
> go right now, please can we disable this so we don't keep
> getting CI failures trying to test merges?

Yes - just testing the patch now.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

