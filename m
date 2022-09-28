Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A155EE0AA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:39:53 +0200 (CEST)
Received: from localhost ([::1]:37460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZA8-00086f-45
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odWAa-0002IT-Kt
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:28:08 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odWAY-00069s-A3
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 08:28:07 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r3-20020a05600c35c300b003b4b5f6c6bdso923178wmq.2
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 05:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=5VfD97tWBcr5iQaTGtb/AibnoTMM00QHMx9rgrO+rcw=;
 b=BHNR6CRIdHDql+GQF3J6dk2DhB3HjNiTwwqvkNJ1DraM5FerDfxTyYtMgBwSD1V7kn
 uJS8uKVqiUVrkY29TTJngc8XAChgqo+b9qU2atVMAayPRNO7Lj8LhLNzbhE+CHpDi3iu
 cetY1VLLB7RPlzsrW4ELtq/qWaBs4y/L8BRy5yNYm3nRzgdzfpmjk/ZMNwAcsXp/UodD
 wmIbMUcEMtxuombiOuNz4HAfMPriTwwJO4aDXg3j6rsilzHYn0iMB5/vG0IPJ7FzxAWZ
 pqaX/qFCdj605Znetrq4SNt5AYalrxj+3r31GY5YUizfaj6pubIkueRXTtvxRNTdaVj8
 RQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=5VfD97tWBcr5iQaTGtb/AibnoTMM00QHMx9rgrO+rcw=;
 b=ZnYkwNfUBcC0wL/HdFEEpNL0ORuhbOd++8UUGsYKhWu39dWnytVKjuXzpxhlWMIlCP
 zI3p6Jcgurmw8h8SIaNL8IfV933o0DV58xqzvNCQVgMuHCFT+oueSlIOxX8FL3RfQdRo
 fR+DqNZdE3VJsIjbfHUU+SC4GhsMXQyJC69sx+0JOBRy6b1Rj+FaloFLEB/0XRahQ0U7
 +nDzVuUNbWWyv/FsCFVS0Whu1ZQD3d3g0LJOLtUjzw3LMhWeWhVApAZpLjh3tmKG3FNY
 EWUwO13yfWNtjRcTbwhxD72D+Bq5v4TtUN4jb7tU0T6dkUz2wNjO2fgaE2P4PKg6PUrG
 hBEA==
X-Gm-Message-State: ACrzQf1qwlHgvFZN3U+YwkMLQ7ZrAqjSgF6JsyhKRxGtmeNtnBQzuCop
 KEXeegBQ5O2HVsqTKP6qbILPdg==
X-Google-Smtp-Source: AMsMyM6tyYvrT3EWjfNNk43SqlrN9qeOabsscIpD+lWKmV7lCiENeDfPiMZ6IxQUBtjDUv27BlWSOA==
X-Received: by 2002:a1c:f311:0:b0:3b5:18ca:fc5e with SMTP id
 q17-20020a1cf311000000b003b518cafc5emr6654995wmq.70.1664368084189; 
 Wed, 28 Sep 2022 05:28:04 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c190600b003a5f3f5883dsm1851190wmq.17.2022.09.28.05.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 05:28:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 53A9A1FFB7;
 Wed, 28 Sep 2022 13:28:02 +0100 (BST)
References: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
 <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
 <YzMcobeWVAnHUkNu@redhat.com>
 <CAJSP0QW_An5ypmsaXaVeHNKKzW0+x2Pmp8bQtPfVxPCqgAwFCA@mail.gmail.com>
 <YzM5i5QP7NQq4OHV@redhat.com>
 <dc108d7d-297b-5a84-68dd-12da3a0e68d0@redhat.com>
 <YzP2k5GBb1lKsqB8@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <f4bug@amsat.org>, Stefan Hajnoczi <stefanha@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: Should we maybe move Cirrus-CI jobs away from Gitlab again?
Date: Wed, 28 Sep 2022 13:27:06 +0100
In-reply-to: <YzP2k5GBb1lKsqB8@redhat.com>
Message-ID: <8735cb3cq5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Sep 27, 2022 at 08:40:44PM +0200, Thomas Huth wrote:
>> On 27/09/2022 19.57, Daniel P. Berrang=C3=A9 wrote:
>> > On Tue, Sep 27, 2022 at 01:36:20PM -0400, Stefan Hajnoczi wrote:
>> > > On Tue, 27 Sept 2022 at 11:54, Daniel P. Berrang=C3=A9 <berrange@red=
hat.com> wrote:
>> > > >=20
>> > > > On Tue, Sep 27, 2022 at 11:44:45AM -0400, Stefan Hajnoczi wrote:
>> > > > > On Tue, 27 Sept 2022 at 05:02, Thomas Huth <thuth@redhat.com> wr=
ote:
>> > > > > > now that Gitlab is giving us pressure on the amount of free CI=
 minutes, I
>> > > > > > wonder whether we should maybe move the Cirrus-CI jobs out of =
the gitlab-CI
>> > > > > > dashboard again? We could add the jobs to our .cirrus-ci.yml f=
ile instead,
>> > > > > > like we did it in former times...
>> > > > > >=20
>> > > > > > Big advantage would be of course that the time for those jobs =
would not
>> > > > > > count in the Gitlab-CI minutes anymore. Disadvantage is of cou=
rse that they
>> > > > > > do not show up in the gitlab-CI dashboard anymore, so there is=
 no more
>> > > > > > e-mail notification about failed jobs, and you have to push to=
 github, too,
>> > > > > > and finally check the results manually on cirrus-ci.com ...
>> > > > >=20
>> > > > > My understanding is that .gitlab-ci.d/cirrus.yml uses a GitLab C=
I job
>> > > > > to run the cirrus-run container image that forwards jobs to Cirr=
us-CI.
>> > > > > So GitLab CI resources are consumed waiting for Cirrus-CI to fin=
ish.
>> > > > >=20
>> > > > > This shouldn't affect gitlab.com/qemu-project where there are pr=
ivate
>> > > > > runners that do not consume GitLab CI minutes.
>> > > > >=20
>> > > > > Individual developers are affected though because they most like=
ly
>> > > > > rely on the GitLab shared runner minutes quota.
>> > > >=20
>> > > > NB, none of the jobs should ever be run automatically anymore in
>> > > > QEMU CI pipelines. It always requires the maintainer to set the
>> > > > env var when pushing to git, to explicitly create a pipeline.
>> > > > You can then selectively start each individual job as desired.
>> > >=20
>> > > Cirrus CI is not automatically started when pushing to a personal
>> > > GitLab repo? If starting it requires manual action anyway then I thi=
nk
>> > > nothing needs to be changed here.
>> >=20
>> > No pipeline at all is created unless you do
>> >=20
>> >    git push -o ci.variable=3DQEMU_CI=3D1 <your-fork-remote>
>> >=20
>> > that creates the pipeliune but doesn't run any jobs - they're manual
>> > start.
>>=20
>> Yes, sure, the jobs are not started automatically. But I *do* want to run
>> the jobs before sending pull requests - but since the gitlab-CI minutes =
are
>> now very limited, I'd like to avoid burning these minutes via gitlab and
>> start those jobs directly on cirrus-ci.com again. For that the jobs would
>> need to be moved to our .cirrus-ci.yml file again.
>
> We do need a better story for maintainers sending pull requests to have
> ability to run CI. We have 50+ jobs in the bujild stage of which the
> cirrus jobs are just 3 - removing the cirrus jobs won't make a difference
> to how quickly we run out of minutes if people try to run all of them.
>
> We need to define a much tighter minimalist set of recommended jobs to
> run.
>
> I believe that if QEMU joins the OSS program, then the forks of QEMU
> also benefit from a reduced cost factor for jobs they run, effectively
> giving you much higher CI quota

We shall find out soon enough. The code came through today so I've
applied it to the project which shows we are now on the "Ultimate" tier.

>
>> Well, maybe we could also have both, jobs via cirrus-run for those who w=
ant
>> to see them in their gitlab-CI dashboard, and via .cirrus-ci.yml for tho=
se
>> who want to avoid burning CI minutes on Gitlab. It's a little bit of
>> double-maintenance, but maybe acceptable?
>
> Key info about the jobs is in .gitlab-ci.d/cirrus/freebsd-12.vars which
> could be referenced from the cirrus-ci.yml to reduce duplication
>
> With regards,
> Daniel


--=20
Alex Benn=C3=A9e

