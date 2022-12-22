Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD48D65472D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 21:34:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8SFR-0001vb-F2; Thu, 22 Dec 2022 15:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p8SFP-0001vB-Pe
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:32:59 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p8SFL-0001dH-Bj
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:32:56 -0500
Received: by mail-wr1-x432.google.com with SMTP id m14so2779090wrh.7
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 12:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ns8qYePuAMwS+uxbhfXvxjioF2sYl91qY5sHWfvbKM4=;
 b=S4QsGZlgBRNuBQCVP1xx9oiuED7BBWJHCb3I7PYZvMjZKfmXumKfsJlSwQtr7IZ1Gf
 qRvBYLCu8a4GsfizIom3XybcTZt5NTmYe0IsPgSj4cSsG05yqwxHbQjG+wquYqGEJQtu
 RRGM1jaEmHNtUvriuvABwySGuh/5v5fXQoGG0Epx3b4kypEqs6Wx8IXGFRDzlrh0Fr58
 GDsJ4dOArdfxgNVGCi15QtnqTxixIrQbUp6Z3uYv6otzFEmZWsXrQxARuhOBqmWoVrI1
 2l0xzqSZLTPsKenP8WqiAPQyWJ6Ik4JZ1b7H8LxmP8EWuQbilvSLAqMBHDk80oCM5WCE
 ofaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ns8qYePuAMwS+uxbhfXvxjioF2sYl91qY5sHWfvbKM4=;
 b=wsQmL3RYM6mzppvEGDQJj57Rh7Ja9892WmTUBB3+ShLDq53Pn9GdAH+KSc0L1rfDNG
 VBTUkpGahbcqJCozwyL2LzeK/61gCAWu0brVBlydTxllXkJgN72P9qVzoEiNrhPvXGOy
 6UyurzGPnSpsnSvo/pU3qfHjokdVdg6Y+vyOBFtU9NN1qEYupG9Q3yn8XAPrjGq1JB4v
 ez6TV9pdPtbCfgtsMAQ09wJrW9NWJ10k7KUdmm6+DRko9J4TETaDyYc1ROsgx2oPTmUj
 ws/fw7JvpdlgT4F9aS5gcn4ZgM07xB05zbOAhdOsiDJiUwVdgfL+oZcvVySCmJwIDLwP
 Ythw==
X-Gm-Message-State: AFqh2kpd8I6DS1EoOKtHdpnTe8cU6PW6CyzH7DQsDCjdMXZ2vMoohYzQ
 bpNlmpbYTGINgQnnuTWkayeshg==
X-Google-Smtp-Source: AMrXdXtgpEPQNy25fSF3KDvoB96LroABWcf810U1aJojuaisWinlJvzcAWf4LOAeJ994+sjtPudF/g==
X-Received: by 2002:a5d:4f86:0:b0:242:580f:5165 with SMTP id
 d6-20020a5d4f86000000b00242580f5165mr4374820wru.66.1671741173853; 
 Thu, 22 Dec 2022 12:32:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b00225307f43fbsm1371359wrx.44.2022.12.22.12.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 12:32:53 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1441C1FFB7;
 Thu, 22 Dec 2022 20:32:53 +0000 (GMT)
References: <20221221144019.2149905-1-alex.bennee@linaro.org>
 <CAFEAcA82JV9B-kuW-fZVAHv=VCs7H5KWqG=XYAhjzmK+9wmCyg@mail.gmail.com>
 <MWHPR0201MB3497AA0A5C77B9198A1EC3CAF4E89@MWHPR0201MB3497.namprd02.prod.outlook.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PULL 0/6] testing updates
Date: Thu, 22 Dec 2022 20:32:28 +0000
In-reply-to: <MWHPR0201MB3497AA0A5C77B9198A1EC3CAF4E89@MWHPR0201MB3497.namprd02.prod.outlook.com>
Message-ID: <87h6xnxjpm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


"Mukilan Thiyagarajan (QUIC)" <quic_mthiyaga@quicinc.com> writes:

> I believe the error is caused by the QEMU_JOB_ONLY_FORKS: 1 line
> which needs to be removed from the definition of hexagon-cross-container.
>
> Alex, Peter,=20
>
> Shall I raise a patch to remove this line? Should the patch be
> created against the testing/next branch?

Just show the patch here and I'll manually re-spin.

>
> Thanks,
> Mukilan
>
> -----Original Message-----
> From: qemu-devel-bounces+quic_mthiyaga=3Dquicinc.com@nongnu.org
> <qemu-devel-bounces+quic_mthiyaga=3Dquicinc.com@nongnu.org> On Behalf Of
> Peter Maydell
> Sent: Thursday, December 22, 2022 4:45 PM
> To: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: qemu-devel@nongnu.org
> Subject: Re: [PULL 0/6] testing updates
>
> WARNING: This email originated from outside of Qualcomm. Please be
> wary of any links or attachments, and do not enable macros.
>
> On Wed, 21 Dec 2022 at 14:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit 8540a1f69578afb3b37866b1ce5bec46a9f6e=
fbc:
>>
>>   Merge tag 'hppa-fixes-pull-request' of=20
>> https://github.com/hdeller/qemu-hppa into staging (2022-12-20 15:32:27=20
>> +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-211222-1
>>
>> for you to fetch changes up to 7a8ec48480c116db93e0d91688be1dcf34147795:
>>
>>   gitlab-ci: Disable docs and GUIs for the build-tci and=20
>> build-tcg-disabled jobs (2022-12-21 11:19:05 +0000)
>>
>> ----------------------------------------------------------------
>> testing updates:
>>
>>   - fix minor shell-ism that can break check-tcg
>>   - turn off verbose logging on custom runners
>>   - make configure echo call in CI
>>   - fix unused variable in linux-test
>>   - add binary compiler docker image for hexagon
>>   - disable doc and gui builds for tci and disable-tcg builds
>>
>
> Gitlab's CI marks this with a "yaml invalid" tag:
> https://gitlab.com/qemu-project/qemu/-/pipelines/729324088
>
> and the error:
> 'build-user-hexagon' job needs 'hexagon-cross-container' job, but 'hexago=
n-cross-container' is not in any previous stage
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

