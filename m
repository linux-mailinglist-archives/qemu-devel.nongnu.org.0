Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58D7310F1A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 18:51:10 +0100 (CET)
Received: from localhost ([::1]:53784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l85G9-0004Jy-Qq
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 12:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l84QY-0003pr-V3
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:57:50 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l84QX-0002o7-Ak
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 11:57:50 -0500
Received: by mail-wr1-x435.google.com with SMTP id c4so8399593wru.9
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=W/jCiVEU+k27KuGXFQGaveJ1uFlREiG+UnBrAbFr4Iw=;
 b=qqVaUdtahfbTgZLFfkbjVvZwpT0UFRvFLNp/ic077YuCLc3TUJu8Ov3M1e4F71fUOt
 EIHCx0uzHfKOo+x7AeeUi99VgUbAwSJRbYOULnKH6cvmDt5oGKE0wuxspPneWB4zbAHG
 Jer+86JHVMhwmkUVR9uOxzm/Za3w42b+VkRLLd1nZ/XfD+Soiw9tfz1PUlyYCbI6Kr5c
 8/jGe2Wkve+TgrV6syWw1fflYd2K7cnm/GnTT/FfF7DUFsw59NL7o/U8CdYbWDp2hqzH
 vLfuVkajYiqvk3KqMQS3Bdgd8khJg5Skb5M2ZP8isv++yOlusfOWfWG1UX1vnNIKvpc/
 lArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=W/jCiVEU+k27KuGXFQGaveJ1uFlREiG+UnBrAbFr4Iw=;
 b=NzjzCvopQ4Hr+BqJbN1WcX0XrxGpoDgCxdz5ZFtNwSv/0Rli70ikXoMdOJWYVOa23M
 rF6xoNJTyPixh0iCf+c/DI3pNkBmEUKfV2nXszkHsGQJdTmIxm1eCvUhEdmo7w3YCyAi
 mju8lPyiJiTQfUBI2YKr+vYqkZvGTizcfk7dgw98N5ALl9vC82b1/r2S45jn39H47gu5
 oI45Mapbk9Xh34CRSfnpkY/XgSqHUuK19Z63tO8/32bb1vFap6niVGMztsfInBDnL4XD
 3fSeH9NzSp9b0kqoxGk+bH0bSXcimL1aZ55Gi+suOd4TknWD2gwBaPahlv30/Oy55BnG
 dReA==
X-Gm-Message-State: AOAM531//A3haqXYHY8aynCXaRs7kvH4/OhPZD0mOva2B327p7nrIT5C
 doJOlahEN+pJhsvRQKFFW2fS4A==
X-Google-Smtp-Source: ABdhPJzvFO8fDFgCJ5wZeg2lesBA3Ppdj307tN/qYfmcfx+I3lrgV3h1cNa249dXjlh6Gtj98jOYRQ==
X-Received: by 2002:adf:f189:: with SMTP id h9mr6246540wro.286.1612544267802; 
 Fri, 05 Feb 2021 08:57:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w14sm13035275wro.86.2021.02.05.08.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 08:57:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD0421FF7E;
 Fri,  5 Feb 2021 16:57:45 +0000 (GMT)
References: <YBTRSK4/F5KLH+FZ@strawberry.localdomain>
 <YBxnlZFkp7YA9PXL@strawberry.localdomain> <871rdupw3h.fsf@linaro.org>
 <YB1VljlPQPRRZUvc@strawberry.localdomain> <87v9b6o8bu.fsf@linaro.org>
 <YB1nf/M613d0B+Pm@strawberry.localdomain>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: Detecting Faulting Instructions From Plugins
Date: Fri, 05 Feb 2021 16:41:50 +0000
In-reply-to: <YB1nf/M613d0B+Pm@strawberry.localdomain>
Message-ID: <87pn1eo3jq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: cota@braap.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Aaron Lindsay <aaron@os.amperecomputing.com> writes:

> On Feb 05 15:03, Alex Benn=C3=A9e wrote:
>> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>> > Assuming you're right that TCG is detecting "a io_readx/io_writex when
>> > ->can_do_io is not true", could we detect this case when it occurs and
>> > omit the instruction callbacks for the re-translation of the single
>> > instruction (allow the initial callback to stand instead of trying to
>> > turn back time, in a way, to prevent it)? Maybe there would have be so=
me
>> > bookkeeping in the plugin infrastructure side rather than entirely
>> > omitting the callbacks when re-translating, in case that translation g=
ot
>> > re-used in a case which didn't hit the same behavior and shouldn't be
>> > skipped?
>>=20
>> They are happening in two separate phases. The translation phase has no
>> idea what the runtime condition will be. Once we get to runtime it's too
>> late - and we trigger a new translation phase.
>
> I believe I understand why we can't catch the initial translation. To
> make sure I'm communicating well, my current understanding is that the
> timeline for this case goes something like:
>
> 1) translate large block of instructions, including ldr
> 2) attempt to execute ldr, calling instruction callback
> 3) notice that access is to IO, trigger re-translation of single
>    ldr instruction
> 4) execute block with single ldr instruction to completion, calling both
>    instruction and memory callbacks
>
> I was wondering if it would be possible to inform the re-translation in
> step 3 that it's for a re-translated IO access so that it could
> ultimately cause the second of the duplicate instruction callbacks to be
> omitted during execution in 4.

Currently we invalidate the previous TB and save the new TB in the
translation cache before restarting the execution loop so the new TB
gets picked up. However we could certainly have a different mechanism
which ensures the next block is not cached. I think if we extend CFLAGS
down to gen_intermediate_code and translator_loop we could ask it not to
instrument that block. It wouldn't be the most efficient solution but
then again this is icount so...

Richard,

What do you think?


>
> -Aaron


--=20
Alex Benn=C3=A9e

