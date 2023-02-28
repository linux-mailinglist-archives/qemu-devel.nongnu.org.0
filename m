Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60786A5A7E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:02:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX0X6-00061P-Tb; Tue, 28 Feb 2023 09:00:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX0WW-00060X-Rb
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:00:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX0WU-0006VR-VB
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:00:08 -0500
Received: by mail-wr1-x436.google.com with SMTP id bx12so6697564wrb.11
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 06:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5XHPOO5AmBdeuWk2upLIm8pTw3a2KlqLPN369Tzca6I=;
 b=mJxk34+p+js/ajqeJVMVu/fiD0nQGu4Rqm2fn0I2IZniYJYAH+DfvxQ7wiPH3qA859
 GhJuiZTk9lWTQ+75nDhoY/N7DJr1CkAz3Ew7beUzRE7SzjLSAmcGGavWdxHAQVFsq/UP
 lofeiIK95O9SUXG1xHEK3yGOnR1WFggqUWgbkQRfHWseLqRkac8IkNMJSNaV6Pmj7tuF
 Hfokf+h9JEiiVPRNi/lb3rZpW9WWC/n1YsTiGGCvBV86FoTE6oyiXKulCTrl8/iVAXdb
 xihLnUyltUvopcmcz/11A8bWuO7C1JLWXMnwpRyHxzR1qnpL6yn3jD+GarqV1J2DRKiP
 dOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5XHPOO5AmBdeuWk2upLIm8pTw3a2KlqLPN369Tzca6I=;
 b=GEq+sLOGtCDQccDm4HuM8BSOzPygy3gl/J/ovGn6XpHSTgnkIz+Sdv/5NH8ZOPujDg
 XBmyKbqRaCKW2bonwcUdIuF1o4x2m0hgAhLhGhYPhJP8PP/r/c+VAY3L6NQuaKLFp1Jc
 jV7nL2XHPq4CsPf6KYhJtZCSx4mCB9yR+Bb+xUciuRI6foyDgfrBEn7K/9JV6mhL8wrt
 oVO5OeZhsl6mL6cuRLjUTAa51AdhRK2LRUEG15fJAHsHIP3kGPI8UlH4fQ6CddL8TteV
 QddWAx8qyIwtJP0hqPLOf+/GrH5VNN5UsdPyGHSHddUxFBAvRGBEQuE0g+uaSRajogx0
 vocQ==
X-Gm-Message-State: AO0yUKVmYn6S64OGogw9EdC85Zb1e+9mH8DP1oP3ZbICBXbibGitJ1tD
 XMdZY5tg0cFx3rUxFqUZjtN7+A==
X-Google-Smtp-Source: AK7set+/9MZ+G6xCQvPVUFfOJuZAk6w2mo5VdhXL4z5WlTXtQVpdixLJ6H3mqzaxhMEJdGEcEYGqew==
X-Received: by 2002:adf:ffcb:0:b0:2c7:4865:f21e with SMTP id
 x11-20020adfffcb000000b002c74865f21emr1873446wrs.44.1677592805010; 
 Tue, 28 Feb 2023 06:00:05 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a5d4ec8000000b002c704271b05sm9927071wrv.66.2023.02.28.06.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 06:00:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3D4751FFB7;
 Tue, 28 Feb 2023 14:00:04 +0000 (GMT)
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
 <Y/36fmORLIjpldXn@redhat.com>
 <791f2eca-1ab4-8f94-a810-1772f4fa49a6@linaro.org>
 <Y/4C74k7QTuIwz7v@redhat.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 Li-Wen Hsu <lwhsu@freebsd.org>, Thomas Huth <thuth@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal
 <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>, Ed Maste
 <emaste@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>, Aurelien
 Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, John Snow
 <jsnow@redhat.com>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>, Bandan
 Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Date: Tue, 28 Feb 2023 13:57:28 +0000
In-reply-to: <Y/4C74k7QTuIwz7v@redhat.com>
Message-ID: <87cz5tgaaj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Feb 28, 2023 at 02:29:12PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On 28/2/23 13:58, Daniel P. Berrang=C3=A9 wrote:
>> > On Tue, Feb 28, 2023 at 12:58:54PM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:
>> > > On 24/2/23 19:08, Alex Benn=C3=A9e wrote:
>> > > > This series attempts to remove our dependence on the docker.py scr=
ipt
>> > > > and build things directly with the appropriate tool. I've been
>> > > > noodling around with how we build images on gitlab to see if they =
can
>> > > > cache better because the normal case should be we don't need to
>> > > > rebuild everything if the upstream distro hasn't updated its packa=
ge
>> > > > list.
>> > > >=20
>> > > > Anyway what do people think?
>> > >=20
>> > > Removing dind limitation is interesting.
>> > >=20
>> > > Unrelated, can we tag registry.gitlab.com/qemu-project's
>> > > docker images along with releases?
>> >=20
>> > Can you elaborate on this ?
>> >=20
>> > We're only using the images for CI purposes and they must always refle=
ct
>> > the current state of git master. We're using a fixed docker tag 'lates=
t',
>> > as that avoids the container registry growing arbitrarily large.
>> >=20
>> > Our CI rules should prevent the pipelines running on stable branches,
>> > so we shouldn't need container tags for stable.
>>=20
>> I'm not suggesting keeping jobs to build, but doing a snapshot of the
>> released containers.
>>=20
>> I.e. when we release 8.0, we should tag qemu/fedora:v8.0 and never touch
>> it again. This is useful when bisecting pre-v8, but also to build pre-v8
>> and do performance comparison. One shouldn't have to upgrade such
>> container (in particular when package mirror disappear), since it
>> already contains all we need.
>
> The main risk with this is the impact on our storage quota. With the
> OSS Program membership IIUC we get Ultimate level features which
> is 250 GB of storage, across git repos, pipeline cache/artifacts/logs,
> container registry.
>
> Currently they have no way to enforce that since their accounting of
> usage is not accurate enough. They're working on fixing that so at
> somepoint we'll be subject to the 250 GB limit.
>
> What I don't know is how much storage we're currently using across
> the /qemu-project namespace, and what extra is implied by taking
> a snapshot of our container registry 3 times a year. I'm expecting
> it to probably be in the high 10's of GB though for the container
> registry.

Currently we are using:

86.6 Gb of artefacts
28.5 Gb of containers
220 Mb of file uploads
24.8Mb of git repo

We could probably cut down a lot of usage of artefacts by either not
building full fat ones with debug symbols and passing between layers or
tweaking the build system to prevent re-building of object files if the
final binary is present in the file system.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

