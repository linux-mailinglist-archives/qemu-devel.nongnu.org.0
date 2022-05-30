Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFDD537618
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 09:55:51 +0200 (CEST)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvaFi-0005qa-KO
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 03:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nva21-0005LB-HC
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:41:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nva1z-0000af-Ra
 for qemu-devel@nongnu.org; Mon, 30 May 2022 03:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653896497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9VBz60qg83ayunsgVRq8oTrQ1PkrDFbaQua8UDO6Vk=;
 b=SkhliRBEeeSQVIl8Q5dEfV+yDUUQUAqDc4Oj9JrlTbdTCaOBYeHTtJIxexkvL80D1bN8CV
 w82atRHaonIaK0Qyr0gaigY1GCufjtb4sgqjp3cTq0pe4acnWgo/zMTwvzqX5PoAeV1J1n
 GtPvkK0TeGutSX4JqOeWIh45yd9Cuz8=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-VRZ1A97BNKS-Wq6wQ6_hQA-1; Mon, 30 May 2022 03:41:35 -0400
X-MC-Unique: VRZ1A97BNKS-Wq6wQ6_hQA-1
Received: by mail-yb1-f199.google.com with SMTP id
 m9-20020a056902004900b0064fb755258dso9115871ybh.13
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 00:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=D9VBz60qg83ayunsgVRq8oTrQ1PkrDFbaQua8UDO6Vk=;
 b=j9wa1HgTzSwP8el+bfmTZ0C/lHsDJXInFSAWW5luvYqGz28f7e8Rh7TCnmuceblacS
 zbKhFWi3TzsZUTRjXmCnj+rfZPBJcgrI/nKcmvLYNFR6YFqk32e5MxfV2qPQBtjVAbwW
 AEI7GeZ9G0L+dFg6+tvw5tv60Mt9Ft0FtwelhNQVM46fyzze04dFIsXEawda0I37+OhX
 cGpGgBkwu0hHEz4HLVu4kVpStRRkfOcDkzBkfvTgVa+Hz/foOvpIK3oFA9SshwirVnEi
 KdDEkf7bvSsObYeHgBcAWUs9iaWsYX2mgBpcIjcuU+ftn4+rCViaSYYjU0+Ze9K2FIu+
 /E7A==
X-Gm-Message-State: AOAM532IUUsZ0YPjdP4gSj5FpzsGFN8qDyKsdmvEPCSRnvmrOsLUjUvr
 FMbLa9tBpvpvN71G8eKo8ZZ7p3PFey95CMSBDrItqWZWgusbZex2N2sKU6I117LYPuz02I+CvBn
 Vg8Jw77DO4ApwzxvjRxC9zfouSLf4zQE=
X-Received: by 2002:a25:8b04:0:b0:65c:ef98:aa48 with SMTP id
 i4-20020a258b04000000b0065cef98aa48mr2378724ybl.87.1653896495264; 
 Mon, 30 May 2022 00:41:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8MalYw0wWnKhexhUql5RHvLj7RHzzDik3OhtfLotCBh8pQdbdr1BjuEcKeonqpOEadm8PVpvnUSlTsK+u74k=
X-Received: by 2002:a25:8b04:0:b0:65c:ef98:aa48 with SMTP id
 i4-20020a258b04000000b0065cef98aa48mr2378715ybl.87.1653896495097; Mon, 30 May
 2022 00:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220525173411.612224-1-marcandre.lureau@redhat.com>
 <dd2d12c3-b574-8182-4456-3c5f0196f674@redhat.com>
In-Reply-To: <dd2d12c3-b574-8182-4456-3c5f0196f674@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 30 May 2022 09:41:24 +0200
Message-ID: <CAMxuvax7BODYorTnCzk3cB=CrJ33tdZrcf3psj+JmJoOfOG=-w@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: add meson JUnit test result into report
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 "P. Berrange, Daniel" <berrange@redhat.com>,
 =?UTF-8?B?TWF0aGlldS1EYXVkw6ksIFBoaWxpcHBl?= <f4bug@amsat.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi

On Mon, May 30, 2022 at 8:32 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 25/05/2022 19.34, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Could you please provide a patch description? (What's the benefit of this
> patch? Why is testlog.txt not sufficient?)

It allows the gitlab UI to show the test results in different ways,
see doc: https://docs.gitlab.com/ee/ci/unit_test_reports.html#how-it-works

Currently, it only reports avocado test results
(.avocado_test_job_template), ex from last run:
https://gitlab.com/qemu-project/qemu/-/pipelines/550786617/test_report

With this change, the qemu/meson tests are also covered.

>
>   Thanks,
>    Thomas
>
>
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   .gitlab-ci.d/buildtest-template.yml | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildte=
st-template.yml
> > index dc6d67aacf..b381345dbc 100644
> > --- a/.gitlab-ci.d/buildtest-template.yml
> > +++ b/.gitlab-ci.d/buildtest-template.yml
> > @@ -44,6 +44,8 @@
> >       expire_in: 7 days
> >       paths:
> >         - build/meson-logs/testlog.txt
> > +    reports:
> > +      junit: build/meson-logs/testlog.junit.xml
> >
> >   .avocado_test_job_template:
> >     extends: .common_test_job_template
>


