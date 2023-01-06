Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE52B65FE7F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 11:03:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDjYJ-0008Du-IX; Fri, 06 Jan 2023 05:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pDjXx-0008DE-Uh
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:02:02 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pDjXv-0006ys-IK
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:01:57 -0500
Received: by mail-ej1-x633.google.com with SMTP id x22so2374395ejs.11
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 02:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q1/jJICPgMXz6Kb0LW8gtrtrs9itsk8EqVtVRmFo1ks=;
 b=qU1o/EaCNdE7e85aerUe/kbLA7xxqORf1meLVuYz9P0QWjHMYDDy7thxalbGb+So6Q
 5F+EXc8+ORkLPAuaq2jUR6G7jKVCSSJLnZq1RqaYx/v3R/QLDRUO8F9cn3xH721/Z8qU
 tIZ5zFPeQti4RBY49n/bj+aCM2OSJiKvsWZ67aQClJzXnrL6Ex0dyzw6Q1KTxWNzXzxz
 u1YcLJmbJsK14+lbIcxCFW1x+Q5THskUqBmKtgee2ym0IWd2x56t7h5C3g1+4ESle++b
 KOHrktoy4WCg1ZTzmCtuw/70vqryyG3a9VwP5NvQr6johLw/Pk0pPiuHN7yLzaHH6GdF
 Kj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q1/jJICPgMXz6Kb0LW8gtrtrs9itsk8EqVtVRmFo1ks=;
 b=xv6DUZ54kQBc7eq9iHy4diy0E3nSmvIwJpLdE0q4Zmx+PghwUKONbQdncTSSMcI2tH
 ixOaPE0DMN2CSBRcBQ3rTg1K7F2kXtLYzCkl7HPKv3gZ66HMYFWyq07ElSOQaeIQLnQN
 nFEP4KXHVZIuxpJBbSyyJ6jxPEnVJa+30ujNHbfuLTzJOshla8J07dZl2aHa6lLE18gw
 sT4shYdW4VpD+2z2pfLN2EbSjs62aZFWSBa/uc56p6QWY4sCPuR4T8dOAEc27g2Bf8/y
 Un0dNsY5g37AU7pSeK8TlS7MetmZ+p7APLoPbDEyJA9F9LA5rIZsBMWGKk6EHwvVWaqx
 eswg==
X-Gm-Message-State: AFqh2krDaNxVLHHdNKdxoyT8Omn7cVqiZ5ouxLSWN1SyMGPsvvhT5Hq5
 lhl/B5NZy8yDRkWwAZ4d3xFAeU28aii+sDBsjdA=
X-Google-Smtp-Source: AMrXdXvwUWuk0plwwo/GLD+dpw/vdHq7JNwStEsYFp91EE6oaDTaX1zrFG/r7cYk3bn3NaKQp/nPtM4mBZV8PmK4Rqg=
X-Received: by 2002:a17:907:a08d:b0:846:8c9a:68a3 with SMTP id
 hu13-20020a170907a08d00b008468c9a68a3mr2772730ejc.217.1672999312872; Fri, 06
 Jan 2023 02:01:52 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_FuURPMDso7+ws0fe33mm+9aAHGByc65YbbN6dEuZWMA@mail.gmail.com>
 <ae141ea8-8bfa-b941-b4aa-80bf1b5150b9@linaro.org>
 <35f6af53-3071-6f26-9038-218a2aae1728@redhat.com>
In-Reply-To: <35f6af53-3071-6f26-9038-218a2aae1728@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 6 Jan 2023 18:01:41 +0800
Message-ID: <CAEUhbmVY2G_5fnLehR+tikV+oOt-m_EHoLUH4=HxxZfYFRwOfw@mail.gmail.com>
Subject: Re: can we reduce the time taken for the msys2 jobs?
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Jan 3, 2023 at 6:40 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 16/12/2022 17.23, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 16/12/22 15:55, Peter Maydell wrote:
> >> The msys2-32bit job currently seems to run into the 70 minute CI timeo=
ut
> >> quite frequently. This successful pass took 61 minutes:
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3479763757
> >> so I don't think it's a "time limit is fine but job has intermittent
> >> hang" situation.
> >>
> >> msys2-64bit also is quite close to the timeout, eg this job
> >> https://gitlab.com/qemu-project/qemu/-/jobs/3482192864
> >> took 61 minutes.
> >
> > The 64-bit variant is building WHPX.
> >
> >> Can we cut down or split up these CI jobs?
>
> The Windows jobs are terribly slow, yes, and we've discussed that a coupl=
e
> of times before with no satisfying solution, e.g.:
>
>
> https://lore.kernel.org/qemu-devel/e80726cc-633d-435c-7a2a-5cae43624282@r=
edhat.com/
>
> ... so we currently settled on not running the qtests in the 64-bit job
> since that would take too long.
>
> I also don't have a real good idea how to improve the situation ... we co=
uld
> switch to even simpler targets (e.g. s390x-softmmu should compile faster =
and
> run less tests than ppc64-softmmu, I think), or would it be still OK to b=
ump
> the timeout to 80 minutes here? (90 minutes, like it has been discussed l=
ast
> year is already very borderline, but I think 80 minutes might still be OK=
,
> especially since those jobs don't wait for another job from the container
> stage?)
>
> > We can add --disable-tools to the slower.
>
> For the 32-bit job, this would further decrease the test scope ... should=
 be
> OK as a last resort, I guess.
>
> > What I don't understand is why the docker image is rebuilt, it should
> > be pulled from the registry.
>
> I think those Windows jobs are still quite a bit special ... e.g. until s=
ome
> months ago, the "timeout" setting was also not working at all IIRC.
>

I am not sure if:

1. Create a Windows docker container build job to include all MSYS2
build prerequisites
2. Change MSYS2 job to depend on the Windows docker job, and remove
all the build prerequisites preparation

would save us some time?

Regards,
Bin

