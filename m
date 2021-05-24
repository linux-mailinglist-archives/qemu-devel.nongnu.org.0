Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AF538EBEA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 17:07:45 +0200 (CEST)
Received: from localhost ([::1]:41004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llCBD-0004Yw-RB
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 11:07:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llC9a-0002Xs-DP
 for qemu-devel@nongnu.org; Mon, 24 May 2021 11:06:02 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llC9X-0001aB-H6
 for qemu-devel@nongnu.org; Mon, 24 May 2021 11:06:02 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so11161061wmg.3
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=I05yhBV9ynOvZ5J2F4KlaSEK5GpniAPOeG4I8C5yDqU=;
 b=maDVmZgA7Mc0EYfrLepEcpfaSBv0Aq87aEJIqn0q74Dj0pbmoBZw4SGYIlpWusSjXW
 KIRCpAhgTUvqEl2UKbEePLidt9+IMFRDv+yV8sKLeiNuyRL+FL7o/VoPyTotId4TwTTf
 MVqum4oVy+rMFXYJ6uAsfv0x1BwawTpieMa5Ll44r67URh3q2Y4LulCqn2EX2cZ9RBEv
 9kmFDSwmUgQ9KFjtzRpTq2oYnzrZx1pQUJtVCMFORea4kBjkkbCTqxTgkmhitfos2ntv
 Gx2f+CceXvFDAeHiKhFtqOTQqfeT/dSsbwtRIABuHg4I8mSSxGfeoMzMr8zh+qAER1af
 NL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=I05yhBV9ynOvZ5J2F4KlaSEK5GpniAPOeG4I8C5yDqU=;
 b=gr6r5OdOTXmgqzTaXzZPfwcrhCCBfDFv1wJLjonY9ywYCJz8Rl2eCwV1WZADYVJmY4
 0Z2ayfBUINBiI3OLc3QmkX6eAWs5DyJnXqTMqy5XvfBFRdBzmwgVnFEtQ0XmAkzvBYgo
 azqPVDW00Wg09DGKNCtmljjMOmfM+pMhmMDWShJSVLk6hcJn5bOeY/9t1vOygCDfuqVj
 i4TTh1DLcl1lD1q1GrPqH1PbDa9AmyVEsrfgc55QhXIKcuufbVD9RwoYq7UoohUzmQhg
 KKV8Bz5Tzz3cwQBJMnIjX4DoP585Fcpc3N4sJD+fdYZfUGXxhKlfjdyAb/4vKBNMqPvv
 Kk7A==
X-Gm-Message-State: AOAM531Pge5zy+czfMTWOV5q5JH+K6431zPTtPbuAMymPW8oCV3yaxqp
 M2j/lq0OZY2E85O2N383v1g/qQ==
X-Google-Smtp-Source: ABdhPJwHKTIW+diyMfMceQjlpVw9XUzjG4mudWzTtOd6HHlcOeexZsNy8HveHZjCuCe8SsC1kI7l3Q==
X-Received: by 2002:a05:600c:224d:: with SMTP id
 a13mr18008939wmm.183.1621868757888; 
 Mon, 24 May 2021 08:05:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a123sm8284725wmd.2.2021.05.24.08.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 08:05:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 590AE1FF7E;
 Mon, 24 May 2021 16:05:56 +0100 (BST)
References: <20210520151924.5063-1-alex.bennee@linaro.org>
 <eb50c468-83d2-516f-adaa-ec7941ab0f8a@linaro.org>
 <YKu86ptxc4FomsuI@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH] gitlab: add special rule for the hexagon container
Date: Mon, 24 May 2021 16:04:37 +0100
In-reply-to: <YKu86ptxc4FomsuI@redhat.com>
Message-ID: <87lf8441ez.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, f4bug@amsat.org,
 Willian Rampazzo <willianr@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, May 24, 2021 at 07:35:59AM -0700, Richard Henderson wrote:
>> On 5/20/21 8:19 AM, Alex Benn=C3=A9e wrote:
>> > The hexagon container is always manually built but of course not
>> > everyone will be building it themselves and pushing to their
>> > registries. We still need to create a "local" registry copy for the
>> > actual gitlab tests to run. We don't build it in this case, just pull
>> > it across from the upstream registry. We disable this rule from
>> > running on the qemu-project itself so it doesn't accidentally wipe out
>> > our master copy.
>> >=20
>> > Fixes: 910c40ee94 ("gitlab: add build-user-hexagon test")
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Cc: Cornelia Huck <cohuck@redhat.com>
>> > ---
>>=20
>> I get
>>=20
>> Found errors in your .gitlab-ci.yml:
>> jobs:build-user-hexagon:needs config uses invalid types: bridge
>
> Bizarre message, but the problem looks like this:
>
>
>> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> > index f718b61fa7..a04cca9db0 100644
>> > --- a/.gitlab-ci.yml
>> > +++ b/.gitlab-ci.yml
>> > @@ -421,6 +421,8 @@ build-user-static:
>> >   # declared. The image is manually uploaded.
>> >   build-user-hexagon:
>> >     extends: .native_build_job_template
>> > +  needs:
>> > +    hob: hexagon-cross-container
>
> Indent and syntax is wrong - should be
>
>    needs:
>      - job: hexagon-cross-container
>
> with indent at same level as 'extends'

This is why v2 was posted fairly quickly :-/

Also in the rolled up series I posted on Thursday:

  Subject: [PATCH  v1 0/8] various misc fixes (gitlab, gdbstub, plugins)
  Date: Thu, 20 May 2021 18:42:55 +0100
  Message-Id: <20210520174303.12310-1-alex.bennee@linaro.org>

>
>> >     variables:
>> >       IMAGE: debian-hexagon-cross
>> >       TARGETS: hexagon-linux-user
>> >=20
>>=20
>>=20
>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

