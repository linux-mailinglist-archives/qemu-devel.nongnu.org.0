Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1F387AA6
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:06:28 +0200 (CEST)
Received: from localhost ([::1]:51118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0Md-00007G-OL
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lj0LT-0007Sp-RK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:05:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lj0LR-0004pw-MZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:05:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a4so10419433wrr.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vVkM021sA5EyshKtj7oKsd9vyKk4G8AphL19O80/EZI=;
 b=eR8CkmijlMjYu/wPkZ4IBhvYoRxTzvQkUIkyDLVaWBQGJ54DSWC+7aAfZw4rvSnpgi
 rnsRoQdDuY/wU/p6P1DZXMX4cHS9O06bQxTd0AcbqGmftN7M9YksDIUo+dypojHDyitd
 ajPtuVlM6QWmzCxD6Wrb7tc+ZJFPM1W7wVIiorz8zcxdI4mSIMObSpvKmRfb/7vbu+u7
 wz2g1+pSpwXY3BoWeG/UMwYnVFgvYnQYr1bgqoS/8rY1aq7XewHjPRh/JLIKs3PcnyEZ
 woK1m9w+WfXcHBfkWfBAwH2l2LU7nn56Bvhi3wg02eOW28ZvOjuG+2CvgiySytArYByu
 XtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vVkM021sA5EyshKtj7oKsd9vyKk4G8AphL19O80/EZI=;
 b=nzxfpOLztXr8i1IRHKgq10w91hDMfSs//omAkNkrK6rM9Z/GQXX89qd5V/S0B7p8uk
 Ns0Tbh4yPefIKhdXNcr3RSKoNC1VtPunFHSG9aFy+TrKyDvEKAMJ+gpccszwj3UnAfvD
 Ohiytk6gKH6cBp1B0dM015Xs6RaKGp2tFCuU1Z3z2CdPwh30QfDlm2RDWIyEVpJ28ABf
 +1+ICPFmwS9W3+43w8cop6i58gxbkTOMOwECnVJs8gK3ejTG0OfBKjJ32zEerHdxYq4j
 zFrWQbreYc1yVs9pvPQVyD/mG7TuOM5DcZqYCqW3i6JDG12XlmQNHbx8M7f42Zncji+d
 UFlA==
X-Gm-Message-State: AOAM533V8lp/t5gpHGQSFyfztxgXHzztixug3xXNOqRoqfpyJVmtCVfP
 NeTsCs0POCF37/3wl1Gg81a13Q==
X-Google-Smtp-Source: ABdhPJx8ObeNlG8NSh52ftxK/EKZvFXyW48a/q/DKjmCSBpJwzffUbn5hF6pwSWHKG7/FSwUsk2+Cg==
X-Received: by 2002:adf:e40b:: with SMTP id g11mr7248293wrm.174.1621346711908; 
 Tue, 18 May 2021 07:05:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm1839267wmc.41.2021.05.18.07.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 07:05:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 387C11FF7E;
 Tue, 18 May 2021 15:05:10 +0100 (BST)
References: <466cf154-cabf-2e8f-021f-a82cf7b88b31@suse.de>
 <20be5f7e-f475-4f3c-0fca-fff1750c08fe@suse.de>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: latest GOOD state of series i386 cleanup, arm cleanup, s390
 cleanup
Date: Tue, 18 May 2021 15:02:48 +0100
In-reply-to: <20be5f7e-f475-4f3c-0fca-fff1750c08fe@suse.de>
Message-ID: <87tun0cf3d.fsf@linaro.org>
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
Cc: Liang Yan <lyan@suse.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?M?= =?utf-8?Q?athieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Al Cho <ACho@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 5/17/21 11:53 AM, Claudio Fontana wrote:
>> Hello all,
>>=20
>> due to my inactivity for a few weeks coupled likely with the upstream pr=
ocesses around qemu-6.0 now the series:
>>=20
>> 1) i386 cleanup
>> 2) arm cleanup and experimental kvm-only build
>> 3) s390 cleanup
>>=20
>> have become stale and hard to rebase on latest master.
>> This effect is compounded by the fact that lots of broken tests in
>> master have been added.

Which tests are these? I know master suffers a bit from occasional
falling red but to my knowledge everything should be green (at least
from my last PR anyway ;-).

>>=20
>> In the interest of not losing work,
>> I provide here the latest known good state of these series:
>>=20
>> For the i386 cleanup:
>> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603386
>>=20
>> Tests started breaking horribly since about 1/2 weeks.

The pipeline only shows one failed test (checkpatch) which is an
allowfail I believe. /me is confused.

>> The latest version of the cleanup is reachable here:
>>=20
>> https://github.com/qemu/qemu.git branch "i386_cleanup_9"
>>=20
>> In my understanding, Paolo has now picked up this one.
>>=20
>> For the ARM cleanup and experimental kvm-only build:
>>=20
>> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603376
>>=20
>> https://github.com/qemu/qemu.git branch "arm_cleanup_v15"
>>=20
>> Again here tests started misbehaving in the same timeframe.
>>=20
>> The state of ARM cleanup is still experimental, maybe Liang or Philippe =
you can adopt this one?
>>=20
>> For the s390x cleanup:
>>=20
>> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603379
>>=20
>> https://github.com/qemu/qemu.git branch "s390_cleanup_v1"
>>=20
>> Al, can you take this one to the finish line?
>>=20
>> Thanks,
>>=20
>> Claudio
>>=20
>
> Adding also Alex Bennee in Cc:
>
> Thanks,
>
> Claudio


--=20
Alex Benn=C3=A9e

