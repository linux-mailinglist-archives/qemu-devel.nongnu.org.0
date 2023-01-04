Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC3065E040
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:54:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDCAH-0000yo-Sq; Wed, 04 Jan 2023 17:23:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDCA6-0000tX-FP
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:23:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pDCA3-0005ia-H0
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 17:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672870970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yatFbGWYhWXAWmm3WYG+ZK4NE72aRuQWnliaZceC1L8=;
 b=YFkvkwawhgPHyoK7wDo3e6Wbe230qDGctlQbvcbMQM/MixXJP3wddITaX8UOLIpOuERxsc
 /+vuPomSDO7vtcuo8bva3v75SuPzPtEaFoa1sXDS1I0aPe+Oh3ymx29HINB6MzV/SbmBEy
 McYTmKhtG61GtJa2NCCysSHYKwBqXZM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-308-y0HGtVeUMOirVTzT4JrPkg-1; Wed, 04 Jan 2023 17:22:48 -0500
X-MC-Unique: y0HGtVeUMOirVTzT4JrPkg-1
Received: by mail-lf1-f72.google.com with SMTP id
 cf15-20020a056512280f00b004a28ba148bbso12304208lfb.22
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 14:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yatFbGWYhWXAWmm3WYG+ZK4NE72aRuQWnliaZceC1L8=;
 b=0OY53Oyhysqx/njTi1QEbs9FtVqXpTais8dsLGx2w4ggoXkICfhHABZe03g2Z+dGoZ
 E3mGL5MzCP2W5BnS1EZmbHd1keASquYXqcj1Cz/6j880NkByBsNcN0Nc1K7/Aw/yUxnL
 gXUCED6t0xbw+AkemxjyYkGlY6OgcvAITisJWlsqlK3CaEtCZoXEtfhDKMABXaqyZVUz
 OCLqtN2+b3yzZPUtGOFALOuE7YxjNZbHo93T0HDLCrIJc4Fe+rurhhHHcHzyhSQI2qhk
 74xkqmkuJOLC0RLc6q7mJJrmH9bNGhRc6eUnm57Wulc97Dra9fDUL2on/+akIULqgX/c
 DGNg==
X-Gm-Message-State: AFqh2krff/Pf2k3BEMILZ698qGTyG8DBu4eKl2hKRgziWj+FltnVwj9F
 K2jFQoAWQWVhrpF+QNYu0UVEPMn4LaUBGKILA0sm1nhwkKSoSlC/A3BNCI7tTLFIiiXxxGNxfzn
 czOrw181ZvSGHARQQYZeWSiQUMpcLqSc=
X-Received: by 2002:a05:651c:12c3:b0:27f:d313:80f4 with SMTP id
 3-20020a05651c12c300b0027fd31380f4mr1174388lje.223.1672870967362; 
 Wed, 04 Jan 2023 14:22:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtwTipZqeq7nQtH4rxw2ZzGrauUt6QcS7rDWyCGhxgeHnsvT1uKgJprtk8ap/8BHTEWnmlXnL8cVe064ynjm0E=
X-Received: by 2002:a05:651c:12c3:b0:27f:d313:80f4 with SMTP id
 3-20020a05651c12c300b0027fd31380f4mr1174382lje.223.1672870967094; Wed, 04 Jan
 2023 14:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20221201133756.77216-1-thuth@redhat.com>
 <87edsvi3dx.fsf@linaro.org>
In-Reply-To: <87edsvi3dx.fsf@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 4 Jan 2023 17:22:35 -0500
Message-ID: <CAFn=p-ZFhooNAAKB1rhp6rc=i9eacpkryD2JtDgHeMpNGhyF1A@mail.gmail.com>
Subject: Re: [PATCH] .gitlab/issue_templates: Move suggestions into comments
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Dec 19, 2022 at 2:45 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Thomas Huth <thuth@redhat.com> writes:
>
> > Many users forget to remove the suggestions from the bug template
> > when creating a new issue. So when searching for strings like "s390x"
> > or "Windows", you get a lot of unrelated issues in the results.
> > Thus let's move the suggestions into HTML comments - so they will
> > still show up in the markdown when editing the bug, while being
> > hidden/ignored in the final text or in the search queries.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
>
> Queued to testing/next, thanks.
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

Remember to update the default template in the gitlab dashboard. I
don't believe I have the permission, or I'd just take care of it
myself.

--js


