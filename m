Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0565472C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 21:34:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8SEx-0001r6-HE; Thu, 22 Dec 2022 15:32:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p8SEv-0001qy-S1
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:32:29 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p8SEt-0001a8-Vn
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 15:32:29 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bs20so685147wrb.3
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 12:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6zrMlZfdXCKaannbLy+wdLLM2ypQDvDGrlwSWVf2wts=;
 b=DuagJmm1x7QU5RD8QuC7TWOSR2zJg4fYrJW6sB9aadZpto17lPJOq6mdAmjB8nLi+5
 4ukG0YnPoKiHAKRUxty4BLsUOVgnnoaSMRF2s4XXTJRmYUEpQaCexYTBy8BX4MUlR995
 ogusUVc7Swkso07VBGxOszyvGBHQ1lq+KfcDFkre+BI0SkUgbO879ZMwjQoV/rJlRH9L
 JqTGSyAaS4yaK33HehuMeZX7oao6vGBo9zyG7IhqHFWxCCe+xaqVLV/NX7kN03PkY0i6
 m2haA9jB/k4cTc6RUy73KhMHwfcS3dMR3DibA9+P2vo9mlCz5GXrISAhmhL06q4CpbE9
 drEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6zrMlZfdXCKaannbLy+wdLLM2ypQDvDGrlwSWVf2wts=;
 b=PQVoWcaVOMX+v7de/fpB4Bt7ioM2gFmOxbnflSxuqt0DO8xaXIM1FhRi1tXKWkHBV8
 DormYY5K/YZ99ud73gtoipScHYszmh039UKBAfAyMsiZQzLbWRL9ml33z/eYePPLoPs2
 cJXcZuhV2/A82XxJruIuu2zl0OnNa9SY086Jl08I7tyX7j6M6hHzPkGEzavdIp9KTLkI
 aEXbRolN+lbR4i7f4H+JG30QMsVrSnKIVejMNmMtPOcWa38ZyGPMd991x1mv2TDBM2wb
 gxi5DxpkKWvV1dNT8llj+/IhCDMTYskIUDQILGeThMCnucQs4cKHMG+xUlLvPBpr8iIL
 Q+/A==
X-Gm-Message-State: AFqh2kowKifHkZ8mpI9PKX3l28xINclBrnhZl8tuePfy5+6ZgKfZYLe/
 vd27NUwIZ+6sc7hT5pFS7nhYzg==
X-Google-Smtp-Source: AMrXdXthM7BK7GeOcplAvG+HpvDfuEMbw5uiUXWEDrdcRXjSfh7n3QRn/EGJE71TuqzTye35c2/NZQ==
X-Received: by 2002:a5d:61ce:0:b0:242:fd7:285c with SMTP id
 q14-20020a5d61ce000000b002420fd7285cmr4393398wrv.48.1671741144721; 
 Thu, 22 Dec 2022 12:32:24 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a5d53c1000000b00241e8d00b79sm1628075wrw.54.2022.12.22.12.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 12:32:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC3EA1FFB7;
 Thu, 22 Dec 2022 20:32:23 +0000 (GMT)
References: <20221221144019.2149905-1-alex.bennee@linaro.org>
 <CAFEAcA82JV9B-kuW-fZVAHv=VCs7H5KWqG=XYAhjzmK+9wmCyg@mail.gmail.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PULL 0/6] testing updates
Date: Thu, 22 Dec 2022 20:31:53 +0000
In-reply-to: <CAFEAcA82JV9B-kuW-fZVAHv=VCs7H5KWqG=XYAhjzmK+9wmCyg@mail.gmail.com>
Message-ID: <87lemzxjqg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

> On Wed, 21 Dec 2022 at 14:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit 8540a1f69578afb3b37866b1ce5bec46a9f6e=
fbc:
>>
>>   Merge tag 'hppa-fixes-pull-request' of
>> https://github.com/hdeller/qemu-hppa into staging (2022-12-20
>> 15:32:27 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-211222-1
>>
>> for you to fetch changes up to 7a8ec48480c116db93e0d91688be1dcf34147795:
>>
>>   gitlab-ci: Disable docs and GUIs for the build-tci and
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
> 'build-user-hexagon' job needs 'hexagon-cross-container' job, but
> 'hexagon-cross-container' is not in any previous stage

Ahh and doesn't show up on my run:

  https://gitlab.com/stsquad/qemu/-/pipelines/728840940

I guess because it is qemu-project only.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

