Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C4D6A807D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:57:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXgbv-0002x1-42; Thu, 02 Mar 2023 05:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXgbt-0002wf-JT
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:56:29 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXgbs-0003S1-2z
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:56:29 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so2414718pjg.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 02:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677754586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8V6Gv52EFbJxSc99PiFzx3Sz6UMpbQYI6j/4tH31vE=;
 b=c8/hMbRRUVbRJ3ySy5euBf6QePF8fIyICJSCuoqtX8miauueoUYEUr4Pat+EWPxaRv
 dxle1Mlp1H/cR/gUiNIx2QhCav1fV2EeqlfJc+yJCf2JXKU80R2Kf1Ug3H2BI2VDDplh
 eELbA3mYh4pQlNFzCtsv9nLknANMoYzg1aXKEx3q8xLNxV4SJcWfKCLzVDPEpfL5oNz9
 OO2fia7fEu5uqdlqjAYKmAf2oRXP3W5McYxuemljlps4vLMkkln2h6x8DLEcih7R0n5g
 lHUJYTeQbpzkHMhTyfMJVdS6PG7c4SoRlndYQGywm+G4ITWxl92HKES8MkQbz2BGFw45
 CbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677754586;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+8V6Gv52EFbJxSc99PiFzx3Sz6UMpbQYI6j/4tH31vE=;
 b=BvgoFOvV3rFA7vp8APyBXn+jsG03h/zW6rbhq8Fb/5Q/Yq054Q2CYlHcI1D+BmCh3Q
 aYcUy7pIppYsE6yEHwZerAKHKUlh9Xm4VV4YtlQdjvOD/3JT6GxTjjxqdfs/t4Waq1At
 JZ4tvJuWwgVkToqBeVePZQyeWJ2o9ihM/mw/SRjR1xIs7gaKz4CNqD1oaFZwL27bfZyy
 9GCeqTuTLgM+A5JFb83g0NX7sFRmN1n3vPSTomw7LXnHIDW0bI5tu6ElJLIfe30IH8Eh
 3E2scuVZqkdOi00a9neeZcNHrw1sPsVSiqyOI3J5Py7rvI6tm2hcO+lOICIUr6WEEXam
 A+mQ==
X-Gm-Message-State: AO0yUKVTisEwGELHwi2bIUmMAAfXU1mi+TYSgX51ehXGo2OxcX0VB57y
 cMvu1YSNmrtuIz3JDdw3AjRJ59HiQsaQzg5ryIZTRw==
X-Google-Smtp-Source: AK7set9G0vhanyZizoEhGS8T/tCN2yraXmM18RaGIyfLXucQZPmrORB4Qbd1uh1fk4V93ZYbNZqHnBn2Scz5an7A56Y=
X-Received: by 2002:a17:90a:4a09:b0:233:be3d:8a42 with SMTP id
 e9-20020a17090a4a0900b00233be3d8a42mr3901840pjh.0.1677754586273; Thu, 02 Mar
 2023 02:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
 <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
 <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
In-Reply-To: <CAHDbmO19_HT7ZgtdvWfzp-BEn3uyhw7NKAW9f9adSHoaZ1mEug@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2023 10:56:15 +0000
Message-ID: <CAFEAcA-Pve7oOuDmP=BDSt5Smdn8MUg2y47Y6PL3YMXwg=Q4Sw@mail.gmail.com>
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado,
 windows)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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

On Wed, 1 Mar 2023 at 19:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> From the other thread:
>
> I think the underlying config needs updating:
>
>   .git/modules/tests/fp/berkeley-testfloat-3/config
>
> I'm surprised the git config for submodules doesn't carry the metadata.

Yeah, in my local repo that I merge stuff with that file
does still have a github URL:
url =3D git://github.com/cota/berkeley-testfloat-3

So I guess my questions are:
 (1) why hasn't this been a problem up til now ?
 (2) does this mean that if I merge this then everybody will
     need to manually go in and update this file somehow
     to be able to pull the updated qemu master ?

thanks
-- PMM

