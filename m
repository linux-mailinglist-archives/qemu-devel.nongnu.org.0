Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB616A1D52
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 15:16:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVYqV-0002qV-Aq; Fri, 24 Feb 2023 09:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVYqS-0002ob-Ps
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:14:45 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVYqJ-0005i9-8q
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 09:14:38 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so1815664wmq.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 06:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dE9vGuD/RtNseUVFnd+idJdHHXjB14+94/Sp3bdEh0U=;
 b=qwwubZOfe2O61E8ZBBLLoxgHSocjwoK1QaMBzPjHGExPgxDE/iHu0GrKUX9GKpxqDE
 NWfsbqu+oBjLcnonlPMXGnbYVq2Y+D368HA921NEa3rmUsnmV+2w47IFl4W13KOMS3oH
 XUkdNX5Aei0GXcfY9JWnynoAsWeuq5PnFMJvTn68oG9X+mv+PEH4BXbgyfDVv8GG+y6n
 q0I+WxTJBpRMMBrsd27sBoR58S3atR/TuKT8jMuUF/e52Q9bylVXxuLu93Ia+MT7dVXm
 rDT7ziVXI3kE3bCLTU3egU+NmXf9LCKMJ3uUMVKWf9x6UPrHgLn+rZ94BYAMPL2UZ4oW
 TYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dE9vGuD/RtNseUVFnd+idJdHHXjB14+94/Sp3bdEh0U=;
 b=ThjdIEGiHSHGNWgZ5ZaxoZ+0fBNSHfdRHGVSdN5izKFnvF478hvDvWbk3JaESP+Pmj
 eHH011rROZckxRW+8bDiAqGzkLXtnt4Ss2DMWimu9u0i/gYu07UYqH6Wk1bxFYAV9cfg
 6SnCz6SFAILkcJBjLQxu+dCGsF+IbjLoDDlN/JPS/fx43VfYQx6LxpA+8G+bsJA1q/GC
 FvjU63YTy4dhTrbuZWFuARPxcuRKSVMAk80ocKVvF9VxO/i6umZrWnCB0v3qSagcmU4S
 CKPRnPNvEXHg0ji6YFlik3WdDYuzbPlf1+xgq8/mZmRrpv/ujFiQux/EiD/977vaoAmb
 FcLA==
X-Gm-Message-State: AO0yUKURzDR/1BcGxwj/88H72ouEvEhoNm8V1ce7HBzyDrRv/F7bBrja
 IevFvxBrMD5h4sbo/6n+JAPzvQ==
X-Google-Smtp-Source: AK7set83QXmTxutVuwO7JPGXWg+xVNMg5BEuSNPSzWq4582PA+2Soc2uM1QHkIdnl1qTTXA90Ow3gA==
X-Received: by 2002:a05:600c:4da2:b0:3e2:19b0:887d with SMTP id
 v34-20020a05600c4da200b003e219b0887dmr12855028wmp.25.1677248072181; 
 Fri, 24 Feb 2023 06:14:32 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a5d4b08000000b002be5bdbe40csm13556462wrq.27.2023.02.24.06.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 06:14:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 41AE31FFB7;
 Fri, 24 Feb 2023 14:14:31 +0000 (GMT)
References: <CAFEAcA83u_ENxDj3GJKa-xv6eLJGJPr_9FRDKAqm3qACyhrTgg@mail.gmail.com>
 <20230223152836.dpn4z5fy6jg44wqi@hetzy.fluff.org>
 <Y/eHLCKcdYk0V4Tt@redhat.com> <Y/fkf3Cya1NOopQA@invalid>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Eldon Stegall <eldon-qemu@eldondev.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Ben Dooks
 <qemu@ben.fluff.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: out of CI pipeline minutes again
Date: Fri, 24 Feb 2023 14:07:54 +0000
In-reply-to: <Y/fkf3Cya1NOopQA@invalid>
Message-ID: <87leknnoag.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


Eldon Stegall <eldon-qemu@eldondev.com> writes:

> On Thu, Feb 23, 2023 at 03:33:00PM +0000, Daniel P. Berrang=C3=A9 wrote:
>> IIUC, we already have available compute resources from a couple of
>> sources we could put into service. The main issue is someone to
>> actually configure them to act as runners *and* maintain their
>> operation indefinitely going forward. The sysadmin problem is
>> what made/makes gitlab's shared runners so incredibly appealing.
>
> Hello,
>
> I would like to do this, but the path to contribute in this way isn't cle=
ar to
> me at this moment. I made it as far as creating a GitLab fork of QEMU, an=
d then
> attempting to create a merge request from my branch in order to test the =
GitLab
> runner I have provisioned. Not having previously tried to contribute via
> GitLab, I was a bit stymied that it is not even possibly to create a merge
> request unless I am a member of the project? I clicked a button to request
> access.

We don't process merge requests and shouldn't need them to run CI. By
default a pushed branch won't trigger testing so we document a way to
tweak your GIT config to set the QEMU_CI environment so:

  git push-ci-now -f gitlab

will trigger the testing. See:

  https://qemu.readthedocs.io/en/latest/devel/ci.html#custom-ci-cd-variables

>
> Alex's plan from last month sounds feasible:
>=20=20
>  - provisioning scripts in scripts/ci/setup (if existing not already=20
>  good enough)=20
>  - tweak to handle multiple runner instances (or more -j on the build)=20
>  - changes to .gitlab-ci.d/ so we can use those machines while keeping=20
>  ability to run on shared runners for those outside the project=20
>
> Daniel, you pointed out the importance of reproducibility, and thus the
> use of the two-step process, build-docker, and then test-in-docker, so it
> seems that only docker and the gitlab agent would be strong requirements =
for
> running the jobs?

Yeah the current provisioning scripts install packages to the host. We'd
like to avoid that and use the runner inside our docker images rather
than polluting the host with setup. Although in practice some hosts pull
double duty and developers want to be able to replicate the setup when
chasing CI errors so will likely install the packages anyway.

>
> I feel like the greatest win for this would be to at least host the
> cirrus-run jobs on a dedicated runner because the machine seems to
> simply be burning double minutes until the cirrus job is complete, so I
> would expect the GitLab runner requirements for those jobs to be low?
>
> If there are some other steps that I should take to contribute in this
> capacity, please let me know.
>
> Maybe I could send a patch to tag cirrus jobs in the same way that the
> s390x jobs are currently tagged, so that we could run those separately?
>
> Thanks,
> Eldon


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

