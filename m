Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A276A3692C7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:11:02 +0200 (CEST)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZvaH-0005vY-NQ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZvWl-0002ug-As
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:07:23 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZvWj-0003Xg-DC
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:07:22 -0400
Received: by mail-ej1-x636.google.com with SMTP id w23so58025487ejb.9
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 06:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=e790JLBnMxt/oVZ0YsKdVPSiF5S0lbwSRlViD++sUL8=;
 b=IZSaeOitOrf948TPNrxC0BOxf7aUhCcWE2Qd2cPUJZtdrgJ8vEAi3MFrMMUFnlREHz
 tuH35y56M/XbKMaC1gJFqIT7yt4Nn+vlysvyr14vVW+4PpTn+PuBR8h/QwrXhm2usZx3
 W8lqzLX6aWt28UKchvx6aQDkRwSNk+K7CM/eeDvDedebMlqwezB5uX58V5DlOBID7+qf
 USo6+AJRwNd+8LsqTj+c8qaqzdbuktRu8QrhwZTAGl0fge/lqK4b6Lx2fRsqeCZS8vcB
 ZqhF7sw70aAffQ+RK52NH05Ip5741DW1Jv1WWx1H+CCEPe4nXon2rqDkjoHiFNR53TAo
 6HVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=e790JLBnMxt/oVZ0YsKdVPSiF5S0lbwSRlViD++sUL8=;
 b=aUogC1qbinrZRAfqMTFADdi7GLxgSNY8PZjah99gfuq8k9O+gu80ldGwJvy6SP2rJs
 XCnttjJ9ofCHUhhaQ97dmLYtAWwQWwHNNsRneH6ZhxC+dtWh0kCbKH0iXQvA9yLU+8Al
 oqoZLt5SoPey1xnE7Gfltvlg2il1iCo0zB2v34lwQ7186FrhbXEk87PXsRJz44CvBITW
 kSeDPV0KOoKRAG0VtMt5q5vHHI9a3Y0n35S5od76a4JGRD1zpHYSpneOqYKzirqpF+7z
 p92hnOjm88qNk5nJTyAzxkPEn7b56uC/V6exlr1a6z40Tmq8Lcgd5qM1NCY8IPxi+jQ2
 ZgXw==
X-Gm-Message-State: AOAM533/8y4On6R5N6Due5mc9EuTtOfv6rYIHUql/q6/5/U5wi6ES3pE
 2+r06udiHoeWTh4xyxCNlZJ0LbRf0NEvlOED9GJy7A==
X-Google-Smtp-Source: ABdhPJxStgzSOo21LVuoZ+fS3xIXfh9VlCGwT+1jk7frcBf+7xHq1Dh3PzkceV3s7+jG4V/DyN2nvfiV+cU1hGr2lzk=
X-Received: by 2002:a17:906:8303:: with SMTP id
 j3mr4115941ejx.85.1619183239799; 
 Fri, 23 Apr 2021 06:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210422154427.13038-1-alex.bennee@linaro.org>
 <20210423142209.03032dc5.cohuck@redhat.com>
In-Reply-To: <20210423142209.03032dc5.cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 14:06:24 +0100
Message-ID: <CAFEAcA80L=xum=9m+2TLiP09OrjuRG4VghfxK8A42Y+0+EUB2g@mail.gmail.com>
Subject: Re: [PATCH] target/s390x: fix s390_probe_access to check
 PAGE_WRITE_ORG for writeability
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 13:22, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Thu, 22 Apr 2021 16:44:27 +0100
> Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> > We can remove PAGE_WRITE when (internally) marking a page read-only
> > because it contains translated code. This can get confused when we are
> > executing signal return code on signal stacks.
> >
> > Fixes: e56552cf07 ("target/s390x: Implement the MVPG condition-code-opt=
ion bit")
> > Found-by: Richard Henderson <richard.henderson@linaro.org>
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Cornelia Huck <cohuck@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: Laurent Vivier <laurent@vivier.eu>
> > ---
> >  target/s390x/mem_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
> > index 12e84a4285..f6a7d29273 100644
> > --- a/target/s390x/mem_helper.c
> > +++ b/target/s390x/mem_helper.c
> > @@ -145,7 +145,7 @@ static int s390_probe_access(CPUArchState *env, tar=
get_ulong addr, int size,
> >
> >  #if defined(CONFIG_USER_ONLY)
> >      flags =3D page_get_flags(addr);
> > -    if (!(flags & (access_type =3D=3D MMU_DATA_LOAD ?  PAGE_READ : PAG=
E_WRITE))) {
> > +    if (!(flags & (access_type =3D=3D MMU_DATA_LOAD ?  PAGE_READ : PAG=
E_WRITE_ORG))) {
> >          env->__excp_addr =3D addr;
> >          flags =3D (flags & PAGE_VALID) ? PGM_PROTECTION : PGM_ADDRESSI=
NG;
> >          if (nonfault) {
>
> What's the verdict on this one? I plan to queue this to s390-next; but
> if we end up doing an -rc5, it might qualify as a regression fix.

What's your opinion? I think we do need an rc5 for the network backend
hotplug crash. I don't want to open the doors for lots of new fixes
just because we've got another rc, but on the other hand this one
does look like it's a pretty small and safe fix, and letting intermittent
crash bugs out into the wild seems like it could lead to a lot of
annoying re-investigation of the same bug if it's reported by users
later... So I kind of lean towards putting it in rc5.

thanks
-- PMM

