Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108983CF72B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 11:48:47 +0200 (CEST)
Received: from localhost ([::1]:35476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5mMo-0005W0-3K
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 05:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5mLj-0004pl-J6
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:47:39 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5mLh-0002h1-Vs
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 05:47:39 -0400
Received: by mail-wr1-x435.google.com with SMTP id d12so25260148wre.13
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 02:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Mr9bDqPpwJ1+s2Fz27WzD4klpYqT4yg4QDM5OSacWLU=;
 b=ZnVcpXezBq8DVLbwowsiQb1FMngIhwXEv1Aa7n498bQcbHJ3eTwxLs2c27X+beOP/7
 XS4LdIIM1R42zlCxiSJaA9VwQOiXsHuRa39aWwACMacDgc5amYx60T+yMzEkbP9f1Hze
 34BXGWU5pPxnbFQQM7QfxsORBUCY8ElKCtcnTfBZNuvwWCuuC8dDVbNQxXPxVkn+XEct
 LC/qC4dzeFbupOleuwQa7lWT/jaioW2Yv4g9ToNxkynaIk07B7B7Rv1EYbwdadgRXjSL
 JyFULkeq0hGFGD0fHvjS56KJwo1wgG3cDCf/zLrD51JWKL0ohmqd753q6Cxevwrbe6RL
 wRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Mr9bDqPpwJ1+s2Fz27WzD4klpYqT4yg4QDM5OSacWLU=;
 b=EFP7yh8Yv3+VOxEOG/ssPJqihcal3kYCIrApoEHwxBJIRH21R5ZlA94oex2JkagBjI
 VUGl/pOFxSgF7SXqTkBKuPH54gre0DpkAc3UhaoTe2ofnz7QctCphqEfNos+REW5C/6j
 U6eK/P4PEw8nuJceLr9ZF2lL5hKuFkCn73nryLPA325fnfgPQ3ZJ5kiL+EfjOWs818cL
 1D56EAnUXINJHDcKGmywfcaAnDXoM06l9rMHw2d4L2SDd9p3LQsxxC7T9ZYS4/mqOo6e
 fEdK4cpRIjMu+Au4j2L47GP8m3WBCyznOVoH7Dy2g8+MN/3sqWpZf3rvprZBVnFoxeHp
 G5pA==
X-Gm-Message-State: AOAM532LEy6X6FXsyMNey0mUkBBr9Izdc1exygjnED6ozQIRhEjt2yi1
 09SrS88Y0fbx6zmrfUoRO8lyZg==
X-Google-Smtp-Source: ABdhPJyYW24cANXBhQ4fQoMDFvlCf1x/X/ZoeZ0DT1i1WxXCCt8Gm+Eb1uFBosWnNiZ7Ot5VwB0iPQ==
X-Received: by 2002:a5d:6804:: with SMTP id w4mr34264310wru.417.1626774456294; 
 Tue, 20 Jul 2021 02:47:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q19sm1843507wmq.38.2021.07.20.02.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 02:47:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E384F1FF7E;
 Tue, 20 Jul 2021 10:47:34 +0100 (BST)
References: <20210719195002.6753-1-alex.bennee@linaro.org>
 <20210719195002.6753-2-alex.bennee@linaro.org>
 <CAFEAcA8VGYTc2jrdB+ET4xFODDv0SniTjnUAYr+4dgjSZEsmiA@mail.gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v1 1/2] hw/tricore: fix inclusion of tricore_testboard
Date: Tue, 20 Jul 2021 10:46:08 +0100
In-reply-to: <CAFEAcA8VGYTc2jrdB+ET4xFODDv0SniTjnUAYr+4dgjSZEsmiA@mail.gmail.com>
Message-ID: <87zguhmi4p.fsf@linaro.org>
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, f4bug@armsat.org,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 19 Jul 2021 at 20:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> We inadvertently added a symbol clash causing the build not to include
>> the testboard needed for check-tcg.
>>
>> Fixes: f4063f9c31 ("meson: Introduce target-specific Kconfig")
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  configs/devices/tricore-softmmu/default.mak | 1 +
>>  hw/tricore/Kconfig                          | 3 +--
>>  hw/tricore/meson.build                      | 4 ++--
>>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> as far as this fix goes (though maybe CONFIG_TRICORE_TESTBOARD would be b=
etter?)
>
> But I still don't understand and would like to know:
> (1) why doesn't CONFIG_TRICORE get set by Kconfig anyway, as
> f4063f9c31 claims to be doing?

It does (or should) thanks to meson:

  'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=3Dy'

> (2) what are the CONFIG_$ARCH flags for? Apart from this, we
> don't seem to be using any of them, as demonstrated by the fact
> that nothing else broke :-)

They need to be declared in Kconfig otherwise minikconf complains about
them not being defined when you pass it in. This is part of minikconf's
sanity checking code.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

