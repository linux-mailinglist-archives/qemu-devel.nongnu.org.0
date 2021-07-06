Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D9E3BC7C1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:21:54 +0200 (CEST)
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gL3-0001jB-2J
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0gJb-0008CQ-Kb
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:20:24 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0gJY-00050M-7A
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 04:20:23 -0400
Received: by mail-wr1-x42c.google.com with SMTP id n9so7661828wrs.13
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=eWVBiF+rGj4hnRtof1Y8IOPeOajzLcKvDH9BNuyh4PM=;
 b=K4MXv6JpEJMAZSALI7eVzTtN7Z4qyqB0NdIYHC4iANxKWNIhELwKFPwdwYsXOOjF4b
 Ewt0Wj7e9U0uY3PCBWzE5nGkIOgoXow3ON4JGckDssknP6+nvE/cLu4c5FMEiv8N0pbX
 LWvuQkxMTVAqMSkaV5jHsWSdFoiYC4VAfIbiP02PikqWRL2UKCeLujdOX5xD4B93av6Q
 P0GQi/R55adQrFjtbd/aXw9gKk8qsqiKcmFjKUaRGgSYCtyteOLDT2pcc7guPIfsLGbr
 CUR/TLbQPDTUmbje9feWY/BgUd1LIGnfdBS78PS9qX7JJJcPSswi825guwDrMkVTCAPL
 bv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=eWVBiF+rGj4hnRtof1Y8IOPeOajzLcKvDH9BNuyh4PM=;
 b=lp1ZTdNrZVBHCgjXVhaX3tpYK6N6aMf/14GqHKBCwmr5D4mkK9bXc9oFIS6O67WcpM
 iKXeVPFNd0RkGLtXbIr0aj6sWZPWnoHp7FdSvFCAAZ80QBSjXl2Hp1em3h7XaDWlTu1K
 tqkPfT9SOV81RLPJv76wHIYZD5JlmrpiXHsJwDORHpVoTr7WrTeaH2leOn1N6PrCek1X
 WnaH4AOzgLe0yOg5zf+hmJXvYWwTOugKVrSGi+AuamCbU8VCjPjoAdPspds9TGoXyhwj
 WtiyEWsPGMoyvBvpAp9dVFqnQ+4alV/3gdJeGhVtjPJVQBp8mUEMZUHGl7dVmGw0qAJo
 M21w==
X-Gm-Message-State: AOAM531XJSKEUUV83JdIQEZ9JMB8SKYg6KU0chhKsYZiNuirAyBxl3r8
 sMZSovpc+IzNrQg/1sW+pcOWxA==
X-Google-Smtp-Source: ABdhPJwjWfROugXbNv9/ss+Per1gRIwXImGBEL9E/fHvzVu8o89kD02CJJuUibCFme/P7XQgusIBwg==
X-Received: by 2002:adf:ee10:: with SMTP id y16mr20237240wrn.99.1625559617968; 
 Tue, 06 Jul 2021 01:20:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o17sm2003230wmh.19.2021.07.06.01.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 01:20:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E09B21FF7E;
 Tue,  6 Jul 2021 09:20:15 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-12-berrange@redhat.com> <87wnq4tsi3.fsf@linaro.org>
 <YON8o+uZqdPmdb9s@redhat.com> <YON9ca/hOUubkdi9@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 11/22] tests/docker: expand centos8 package list
Date: Tue, 06 Jul 2021 09:20:00 +0100
In-reply-to: <YON9ca/hOUubkdi9@redhat.com>
Message-ID: <87tul7ua4g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Jul 05, 2021 at 10:41:55PM +0100, Daniel P. Berrang=C3=A9 wrote:
>> On Mon, Jul 05, 2021 at 09:27:56PM +0100, Alex Benn=C3=A9e wrote:
>> >=20
>> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>> >=20
>> > > This is the fully expanded list of build pre-requisites QEMU can
>> > > conceivably use in any scenario.
>> > >
>> > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> > > ---
>> > >  tests/docker/dockerfiles/centos8.docker | 68 ++++++++++++++++++++++=
+++
>> > >  1 file changed, 68 insertions(+)
>> > >
>> > > diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/=
dockerfiles/centos8.docker
>> > > index 5f1c57b4ad..4cc4c0c8a1 100644
>> > > --- a/tests/docker/dockerfiles/centos8.docker
>> > > +++ b/tests/docker/dockerfiles/centos8.docker
>> > > @@ -3,36 +3,104 @@ FROM docker.io/centos:8
>> > >  RUN dnf -y update
>> > >  ENV PACKAGES \
>> > >      SDL2-devel \
>> > > +    alsa-lib-devel \
>> > > +    bc \
>> > > +    brlapi-devel \
>> > >      bzip2 \
>> > >      bzip2-devel \
>> > > +    ca-certificates \
>> > > +    capstone-devel \
>> >=20
>> > CentOS8 doesn't seem to package capstone-devel or is it meant to come
>> > from somewhere else?
>>=20
>> It comes in via the EPEL repository, along with a few other of the
>> packages listed here. Take a look at this job, line 1385 onwards:
>>=20
>>   https://gitlab.com/berrange/qemu/-/jobs/1369975075
>
> Oh actually, this is a bisect issue in the series. The EPEL and
> advanced virt repos are only enabled in the later patch in the
> series that converts to lcitool auto-generation.
>
> IOW, this current patch should have gained:
>
>  RUN dnf install -y dnf-plugins-core && \
>    dnf config-manager --set-enabled powertools && \
> +  dnf install -y centos-release-advanced-virtualization && \
> +  dnf install -y epel-release && \
>    dnf install -y $PACKAGES

OK I'll revert my deletions and fix that up.

>
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

