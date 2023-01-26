Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB4C67D6DE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 21:55:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9Fq-0008Qd-ID; Thu, 26 Jan 2023 15:53:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL9Fn-0008QK-Sr
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:53:52 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pL9Fm-0008O3-7o
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 15:53:51 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso2007965wmq.5
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 12:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OE9e4Y088ZwUckD3LWu7/6NCa3nqh1D+cVsnyz8JIr8=;
 b=BTHYgCAEFdFjUQCGEa6s4fHGLbkgy73NEAbQq0OF6y0pMwmRcVurEkUe0eWEXJoRbp
 bWxH7UaEi5wNBBfkm8AYfH2AKxHReHmCA2mIL0FzdscXg5IeityzPjknbvxK9invnwp9
 fXU1520k+gJD4SOnGO++QCWM4hQUW6Ej0B2hfVb7uOqLChqROiyR8uS8kiJox70Hq608
 sx5wZGRlzEOVoC85/DmVRmlY+ahmwQuQ75m9zOmWbEbLZ+y7ZvLKqSpia+B9cgHGr75j
 6p4KyLIAY4Urfbut2DBqpYHEhIM/K3nmdGJfqwboxXSgZ/7rdqvi/8hwnGAl6dm7MNLN
 RWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OE9e4Y088ZwUckD3LWu7/6NCa3nqh1D+cVsnyz8JIr8=;
 b=wW7Ytls9qaXrqlbFiN0LuT6PFzfOj/iT2r2e/zzxqJcZgk8+4S33R3R2jsuVI1xc+w
 Tpus9KiXkuW9bo24wZMPAcvwu6Gfld1OCkBpQy28clP/wYvYQ8aBX0GGb1M2DKyae5xD
 7bzk9ZUD4SsERR871X0PhVVo+jxqnvgxVjiwxdTk9dhPk+0SlzvT86043ZumF/W9wKn6
 n1WXVv9Q/hR29+zZ0z2ptLyi5W3ZIMGEpChLJj7bLv78o68O/1P1a9Hztduc6+rKcDz+
 wt0H2cPejazWwXduaIwWBXtsrS3JBh+82hri56kphT8PcbxUBF66Q3iktP74mWCX6Qcs
 wpYQ==
X-Gm-Message-State: AFqh2koKN+zbXLM7LnscxWbO1wmeX384spYbuBYOTRwzADT2GVMAhtQn
 kC3vMErdYNCJDaU91KDT1+XZmw==
X-Google-Smtp-Source: AMrXdXu+H7Ip0NjVvWiiJqYRHpKM1Lrr19d7B3C3P4S12ELDTIdcEwzv2bGxQz+3X8p1mjQIfku3Xg==
X-Received: by 2002:a05:600c:4687:b0:3db:2e06:4091 with SMTP id
 p7-20020a05600c468700b003db2e064091mr27285054wmo.37.1674766428509; 
 Thu, 26 Jan 2023 12:53:48 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y34-20020a05600c342200b003dc16dee9b1sm2322346wmp.15.2023.01.26.12.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 12:53:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32C591FFB7;
 Thu, 26 Jan 2023 20:53:47 +0000 (GMT)
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
 <87pmb1pfas.fsf@linaro.org> <Y9KPuOT3NEAjN740@redhat.com>
 <CAFEAcA95Vtn5smOmVTX+WbS9O1Z4WX4H_p6j5iFh338o=Xcp5Q@mail.gmail.com>
 <088a1c95-5332-d120-8917-1aa52c929da9@redhat.com>
User-agent: mu4e 1.9.16; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?Q?Daniel_P=2E_Berran?=
 =?utf-8?Q?g=C3=A9?=
 <berrange@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, Richard
 Henderson <richard.henderson@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: no more pullreq processing til February
Date: Thu, 26 Jan 2023 20:49:15 +0000
In-reply-to: <088a1c95-5332-d120-8917-1aa52c929da9@redhat.com>
Message-ID: <874jsdow4k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


Thomas Huth <thuth@redhat.com> writes:

> On 26/01/2023 15.41, Peter Maydell wrote:
>> On Thu, 26 Jan 2023 at 14:35, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>>> I'm confident we can rationalize our jobs, especially the cross
>>> compilation ones.
>>>
>>> For each non-x86 arch we've got two sets of jobs, one for system
>>> emulators and one for user emulators.
>>>
>>> IMHO the most interesting part of non-x86 testing is the TCG
>>> host target. We don't need 2 jobs to cover that, either system
>>> or user emulators would cover TCG build / test. Most of the rest
>>> of code is not heavily host arch dependant.
>> I'm not super enthusiastic about cutting this down.
>> I find the non-x86 testing is the most interesting part
>> of the CI -- most patch submitters and system submaintainers
>> have already done local compile-and-build with the common
>> x86_64 recent-distro target, so those parts pretty much
>> always succeed. The benefit of the auto CI is in keeping
>> the platforms that aren't so widely used by developers
>> working (both different-host-arch and different-OS).
>
> I mostly agree. Question is whether we really need all of them, e.g.
> do we really need both, the *-armel and the *-armhf jobs for both, the
> -user and the -system part? Or would it be still ok to e.g. only have
> a -armel-user and a -armhf-system job and drop the other two?

I suspect just the armhf target is good enough but as you say later...

> I think there are also other possibilities where we could cut down CI
> minutes, e.g.:
>
> - Avoid that some of the -softmmu targets get build multiple
>   times
>
> - Re-arrange the Avocodo jobs: We should maybe rather sort them
>   by target system instead of host distro to avoid that some
>   targets get tested twice here.

We can use tags to select groups of avocado tests I think.

> - Do we really need Linux-based clang jobs if we test Clang
>   compilation with macOS and FreeBSD, too?

Depends - is there any version drift between them?

> - Would it be OK to merge the merge the build-without-default-
>   devices and build-without-default-features jobs?

Sure

>
> And after all, I'd like to raise one question again: Could we finally
> stop supporting 32-bit hosts? ... that would really help to get rid of
> both, some CI minutes and some maintainer burden.

I'm totally down for that. Most distros have put 32 bit onto life
support haven't they?


>
>  Thomas


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

