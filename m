Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A84FC0B7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:30:00 +0200 (CEST)
Received: from localhost ([::1]:42354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndvzK-0006qY-10
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ndvrs-0005CD-Jh
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:22:17 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ndvrq-0004z0-4t
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:22:15 -0400
Received: by mail-wr1-x430.google.com with SMTP id s28so7628101wrb.5
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=zdbnT7Rq8oTQDkQClsnTdHRrbDo72Eqi93aCSp6bjUg=;
 b=p0YpsCDFFxRir8x/JljNHiGo+twJiCrnRchMeZugO/qJBX+pdAm0GFKfZkrifkVo07
 /nTUoPymG/HHilWz1CAd5A5eSgg8oikZP3P5DdC/cSd3gaOEEKACX/tKoZbunroCCJwu
 INnqAeJbjOo67rSGi9D8otSiULB1EVk9z7xxfvUooDgJc6cEi+Gx2uuo3MaCP9zd3fc6
 Sd7ZxsGTs7ONMdQS8H1pDnJ/o/5siSf9BiYGAfqApvXFEKW7uFpjRZdvCmBNnG1sWQOk
 aAKH+0bLFyoCgaGJb62cbeB/tNH310q7SIFZ1v+BkOxu3JSBbfPfRBDXx43fQhnDZ6us
 bZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=zdbnT7Rq8oTQDkQClsnTdHRrbDo72Eqi93aCSp6bjUg=;
 b=Z/gGykp8ObDf7sSr90/NSDoKYinf78iUMbfZBhzkJb9YInQX98mIlLR/lf0RT8dvvk
 pZ5swsZfFHcz0i1pOO3/Bt8dr3Em05CBSNY0gz3khM7hU6uQvn8s7w3yyuj6+4ttmVO7
 W4GKrmM1dYgsSDhQljnbOf4i77npJo2zjFKhYjUmgYE9RimSlhi4KXMKMdt/8yLCb+fk
 wmZdEww/IT2M4qqtigdlamVC0uRaoE5DiLcJtiPruLcmn4KsVel6ONQNQO9nndwB/5A2
 8NylZ1DWwQn0mGWhdCPnS/lFatPrBNcL8vHVj/LgAjp+ezMIeiaqlB0A9MW59Bs06fDt
 TRAQ==
X-Gm-Message-State: AOAM532yOZqueHZHpRLk1ydDEPcu7ZK6fL6hT7CeiDb3VGmcuwbFsRQA
 KJv1KBOXU6Eg8YuUbwzCZAYqbw==
X-Google-Smtp-Source: ABdhPJxgq/QsfGtjIlevpQ6mCQtkx2X4QRMy/5pf6J6GLtpKxFazCs6fcmIZQIqY4pPfd7W3gaeQ6A==
X-Received: by 2002:a05:6000:170a:b0:205:8a7f:c0c6 with SMTP id
 n10-20020a056000170a00b002058a7fc0c6mr25875839wrc.702.1649690532187; 
 Mon, 11 Apr 2022 08:22:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a05600c511d00b0038e3532b23csm18279701wms.15.2022.04.11.08.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:22:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8F3E51FFB7;
 Mon, 11 Apr 2022 16:22:10 +0100 (BST)
References: <CANW9uyuNovUDh7EpRni_f_pQBZv4g4E2QFWxaNW6amh9h-yanw@mail.gmail.com>
 <CAFEAcA9UsOqNhCu+o71YCMr6Og5as7Ht+LD3XLiujkKjSygc1g@mail.gmail.com>
 <CANW9uyt5UDNrygX_TS9FBDb5pJdJLkHAtHqDFEoyg1U0Mgz0Ug@mail.gmail.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Itaru Kitayama <itaru.kitayama@gmail.com>
Subject: Re: Procedures adding new CPUs in sbsa-ref
Date: Mon, 11 Apr 2022 16:16:54 +0100
In-reply-to: <CANW9uyt5UDNrygX_TS9FBDb5pJdJLkHAtHqDFEoyg1U0Mgz0Ug@mail.gmail.com>
Message-ID: <87a6cr1w7x.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Itaru Kitayama <itaru.kitayama@gmail.com> writes:

> Good point; however per the SBSA specification, DEN0029F, there's the
> PE architecture requirement at
> each level from 1 to 7, so now I am wondering whether supporting
> cortex-a57 and a72 are good enough to
> set up a fully SBSA level 7 compliant "board" in QMEU.

Not currently - we are working on cortex-a76/neoverse-n1 which will
provide a v8.2 baseline for sbsa-ref. See:

  Subject: [PATCH 00/16] target/arm: Implement features Debugv8p4, RAS, IESB
  Date: Fri,  8 Apr 2022 17:07:26 -0700
  Message-Id: <20220409000742.293691-1-richard.henderson@linaro.org>

and:

  Subject: [PATCH 0/7] target/arm: More trivial features, A76, N1
  Date: Sat,  9 Apr 2022 22:57:18 -0700
  Message-Id: <20220410055725.380246-1-richard.henderson@linaro.org>

which are stepping stones to those concrete models. Please review if you
can.=20

> Also, the 'max'
> is there, but does not boot.

Generally the firmware has to be built with the knowledge of what system
it is running on so will generally fall over if run on a different CPU
feature set. However I believe Leif had a firmware branch which attempts
to work with -cpu max by doing proper ID register probing before using
features. However -cpu max is very a moving feast which is why there is
a push for the concrete CPU types.

I believe there is a proposal for a versioned sbsa-ref model which will
step of the default CPU for higher levels.

>
> Itaru.
>
> On Sat, Apr 9, 2022 at 12:04 AM Peter Maydell <peter.maydell@linaro.org> =
wrote:
>>
>> On Fri, 8 Apr 2022 at 15:59, Itaru Kitayama <itaru.kitayama@gmail.com> w=
rote:
>> > I'd like to add a64fx cpu to the sbsa-ref board, if there's a quick an=
d dirty
>> > way of completing that, advice from the  maintainers is greatly apprec=
iated.
>>
>> I have cc'd the sbsa-ref maintainers (as listed in the MAINTAINERS file).
>>
>> However, I'm not sure why you want to add the a64fx CPU to this
>> board model? The sbsa-ref board is intended as a platform for
>> developing firmware that runs on Server Base System Architecture
>> hardware, so it deliberately doesn't have support for every CPU
>> type QEMU implements.
>>
>> thanks
>> -- PMM


--=20
Alex Benn=C3=A9e

