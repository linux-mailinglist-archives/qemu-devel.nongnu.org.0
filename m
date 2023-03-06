Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085286ABBC4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 11:20:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ7wb-0002Ya-Ch; Mon, 06 Mar 2023 05:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZ7wV-0002Xk-9X
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:19:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pZ7wT-0003Bv-NK
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 05:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678097980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Icif6+aEl3k8uK/CrI5QyeO4FQ9QwG1qyfVWF0j21UE=;
 b=MFpwoKfy6APDXDQCicvk7UK0plw5MjNk0SzdPX6Saed2I3CQDKCTrX6aSqPVIeLVU+xXrs
 JP0sG1TKFdz+bVUcHKP3/uACfNk8BD1WlrFkjesDtdSZym6GgyRhVzu/+tFxWZ8HLb3AXP
 WZ6RWCKWOY8JL15S3kmkYjz6DB29dqw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-lun68XmHMlOCzKPabKRcYQ-1; Mon, 06 Mar 2023 05:19:38 -0500
X-MC-Unique: lun68XmHMlOCzKPabKRcYQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 da22-20020a056402177600b004c60694083eso13012020edb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 02:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Icif6+aEl3k8uK/CrI5QyeO4FQ9QwG1qyfVWF0j21UE=;
 b=v/SYkFl7gBf3R9at1iy7GcNRkiaYFu9U+5qughrsxDY3QFK8bLZHoIY/KwTjxUPm4T
 z0UR5bRi8fTLt14aNh53PB2MyjtGGXpZzLu6bFZH1tdcRbvK83tignMvpRDU7acqBEQ6
 2jjLvKH9mGp66lsundwAQhDN8SxbcfkhhmTwTdWeoSzm7+7SEOc2PBHJFvxFViga+7k6
 9ksRdWhNO+G9WoaMeloxt8GRAvw7lwop84kAC2YbrC/EX/z4gdvFPA6+holKfKnDOHVy
 lDEdZukFs+orlBTQdt1iWmPh6EGq14NWg5uEb6s2DCHUx4CkoNzZkb+WdDw3vKydpYvY
 63QA==
X-Gm-Message-State: AO0yUKXiRzBMMnb6B43wWXfIHMoznTVnN83OZw13ob8nokxHllXc67l0
 RavyCQaZduVKFXWPbB5PUihg3LshWevupjL1ibYRcYYtey5DGlfNMGdOCUySHRJhSmRitcUCW7E
 3nd4Ws9znI3MNbsEkzgV2kCywxiC5JEE=
X-Received: by 2002:a17:906:64d:b0:8d1:57cf:ef3c with SMTP id
 t13-20020a170906064d00b008d157cfef3cmr4622848ejb.2.1678097977708; 
 Mon, 06 Mar 2023 02:19:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/g2yqAdKNHcjPwJIH6cSrHh6gif+tt48+1m7/DZN7SqKhIX18HvJ/vxBSzP2X+I3hJJQG0tBk/WK6mtaqo7Rc=
X-Received: by 2002:a17:906:64d:b0:8d1:57cf:ef3c with SMTP id
 t13-20020a170906064d00b008d157cfef3cmr4622832ejb.2.1678097977443; Mon, 06 Mar
 2023 02:19:37 -0800 (PST)
MIME-Version: 1.0
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
 <ZAW7DcpRDcGF2VQx@redhat.com>
In-Reply-To: <ZAW7DcpRDcGF2VQx@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 6 Mar 2023 14:19:25 +0400
Message-ID: <CAMxuvazE-=uUQZ73spaYBC1ZvyucGNiSdqc3FY1Xrp3Uese2jQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add meson wrap fallback for slirp & dtc
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d81b6505f638a1a9"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000d81b6505f638a1a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Mar 6, 2023 at 2:06=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com>
wrote:

> On Thu, Mar 02, 2023 at 05:18:44PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > Meson "wrap" is a mechanism to build dependencies that doesn't rely on
> git
> > submodules and integrate external dependencies as subproject()s.
> >
> > This offers developpers a simpler way to build QEMU with missing system
> > dependencies (ex, libslirp in my case), but also simplify the fallback
> build
> > definition of dtc/libfdt.
>
> Do we actually need this facility though ? We've already determined
> that every platform we need has libslirp now, and IIUC Thomas determined
> recently that dtc is also available everywhere we need it to be.
>

The main benefit is for developers: you have the source code of
QEMU-related projects with the source tree. Code navigation, debugging, or
various build tests are easier (compilation flags, static build etc). You
don't have to "pollute" your system with (what could be) QEMU-specific
libraries.


> So why would we want to continue to special case these two libraries,
> out of all the many many many other libraries we also have deps on.
>

They are more often updated, or developped with QEMU? For the reasons I
listed, I would welcome more wrapped subprojects.

--000000000000d81b6505f638a1a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 6, 2023 at 2:06=E2=80=
=AFPM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">be=
rrange@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Thu, Mar 02, 2023 at 05:18:44PM +0400, <a href=3D"mailt=
o:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.co=
m</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; Meson &quot;wrap&quot; is a mechanism to build dependencies that doesn=
&#39;t rely on git<br>
&gt; submodules and integrate external dependencies as subproject()s.<br>
&gt; <br>
&gt; This offers developpers a simpler way to build QEMU with missing syste=
m<br>
&gt; dependencies (ex, libslirp in my case), but also simplify the fallback=
 build<br>
&gt; definition of dtc/libfdt.<br>
<br>
Do we actually need this facility though ? We&#39;ve already determined<br>
that every platform we need has libslirp now, and IIUC Thomas determined<br=
>
recently that dtc is also available everywhere we need it to be.<br></block=
quote><div><br></div><div>The main benefit is for developers: you have the =
source code of QEMU-related projects with the source tree. Code navigation,=
 debugging, or various build tests are easier (compilation flags, static bu=
ild etc). You don&#39;t have to &quot;pollute&quot; your system with (what =
could be) QEMU-specific libraries.<br></div><div><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
So why would we want to continue to special case these two libraries,<br>
out of all the many many many other libraries we also have deps on.<br></bl=
ockquote><div><br></div><div>They are more often updated, or developped wit=
h QEMU? For the reasons I listed, I would welcome more wrapped subprojects.=
<br></div><div>=C2=A0</div></div></div>

--000000000000d81b6505f638a1a9--


