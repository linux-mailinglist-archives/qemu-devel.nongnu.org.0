Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D2C339DD5
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 12:37:05 +0100 (CET)
Received: from localhost ([::1]:39148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL2Zr-000618-I1
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 06:37:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL2YX-00057d-AT
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 06:35:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lL2YS-0005IF-K1
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 06:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615635334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1SsFDbsZzQcuwgzRf3nJB7MyTBAPZ84Gxil0mnh6zEc=;
 b=G/G+C0uj6UXDc4XTypbJJ9NAoxsqxvA15Wd0UboVGXgu5j7YvXk46amPmg+Uli3cWhnGu3
 4nIAg+MRyDdqq+x5gK4zGG7cE1kV1iC8x7u4Jv8Dun+q5yPf0YXM5LadlF7hD71NCOVNT6
 iWq9fWKraZca/wiKKfdd4z6CpB2jxl0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-KxFzYmmkMyG3zkCAOpXa1Q-1; Sat, 13 Mar 2021 06:35:30 -0500
X-MC-Unique: KxFzYmmkMyG3zkCAOpXa1Q-1
Received: by mail-pl1-f197.google.com with SMTP id 42so14415241plb.10
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 03:35:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1SsFDbsZzQcuwgzRf3nJB7MyTBAPZ84Gxil0mnh6zEc=;
 b=OcDimGJ7NdSVjf1SAcd+gsHS3RbU2jfvUqlprMVK7OLiGKb950EcEo08GU+D/h7NwJ
 PwzZPW3HWPSbODQZL/rtlORmyWfgOSuLeZwLPmSSFMuoy7vqYOXos7KS+vSmUIfKkcay
 atkBRdpiDYPsyZ/MoutKl8uiC8zDIa5JkcsLiNkEH70LCdXwnMQ1zTYoYGWjl2e4qqmq
 bFq27ElBh4w+5DRQmY+7Z39g3p88q/oihvJ8iTlL8sxv3iwZX1ryJsREiFLVgDCtj6ka
 cZcPw2CHOoCcBNjudDI3SOYcC0W60tNCIlL/F5mXlk8txBAWPhZxc5ei97jSfkhFvt1G
 MxQQ==
X-Gm-Message-State: AOAM531JN5IFgLbGfvGXAr1mie7AFN7K36KYCgXMnSq/DieU+VU3cwww
 uNLptr7UD1iIrJK5xlAnW+bMLQiHc4tu05jyo6TMlV/MaskBqSUWtgoAt7vnJ09H9WPkhqrxnPL
 m87ZCjrMK85aL9+O7Kkzy9cNrXqOJTVo=
X-Received: by 2002:aa7:95b5:0:b029:1ef:272f:920c with SMTP id
 a21-20020aa795b50000b02901ef272f920cmr2617981pfk.21.1615635329188; 
 Sat, 13 Mar 2021 03:35:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5VU7lUU0ahYFNSJPP1PbWhlRst0zpNZOokOLpwnA3bFZm11WqqwUqiO8HrfZB2eP5QcWjFNDjlvkPQZLkda8=
X-Received: by 2002:aa7:95b5:0:b029:1ef:272f:920c with SMTP id
 a21-20020aa795b50000b02901ef272f920cmr2617967pfk.21.1615635328938; Sat, 13
 Mar 2021 03:35:28 -0800 (PST)
MIME-Version: 1.0
References: <SN6PR02MB4205EC1BAA236F9A8E34E605B86F9@SN6PR02MB4205.namprd02.prod.outlook.com>
 <216b5cca-e599-a7cb-aca5-1595e644477d@amsat.org>
In-Reply-To: <216b5cca-e599-a7cb-aca5-1595e644477d@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 13 Mar 2021 12:35:17 +0100
Message-ID: <CABgObfZboWr7SCkZGzxAdkc_0sHQj-n4o=jZ=S3iQJ2fS0f0mA@mail.gmail.com>
Subject: Re: gitlab outage?
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000de751405bd696931"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Brian Cain <bcain@quicinc.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000de751405bd696931
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The site works for me when logged in, and the members of the project are
alright, but I also cannot clone or fetch.

Paolo

Il sab 13 mar 2021, 12:23 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> ha
scritto:

> On 3/13/21 12:59 AM, Brian Cain wrote:
> > https://gitlab.com/qemu-project/ <https://gitlab.com/qemu-project/> ask=
s
> > for sign in and if I do sign in, I get a 404.  Is this expected?
>
> Confirmed:
>
> $ git clone https://gitlab.com/qemu-project/qemu.git
> Cloning into 'qemu'...
> Username for 'https://gitlab.com':
>
> Certainly not expected.
>
> > https://status.gitlab.com/ <https://status.gitlab.com/> describes
> > =E2=80=9Cshared runner degradation=E2=80=9D but that doesn=E2=80=99t so=
und like this problem.
>
> Indeed.
>
>

--000000000000de751405bd696931
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The site works for me when logged in, and the members of =
the project are alright, but I also cannot clone or fetch.<div dir=3D"auto"=
><br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">Il sab 13 mar 2021, 12:23 Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</=
a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 3/13/21 12:59=
 AM, Brian Cain wrote:<br>
&gt; <a href=3D"https://gitlab.com/qemu-project/" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://gitlab.com/qemu-project/</a> &lt;<a href=3D"=
https://gitlab.com/qemu-project/" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://gitlab.com/qemu-project/</a>&gt; asks<br>
&gt; for sign in and if I do sign in, I get a 404.=C2=A0 Is this expected?<=
br>
<br>
Confirmed:<br>
<br>
$ git clone <a href=3D"https://gitlab.com/qemu-project/qemu.git" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu.=
git</a><br>
Cloning into &#39;qemu&#39;...<br>
Username for &#39;<a href=3D"https://gitlab.com" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://gitlab.com</a>&#39;:<br>
<br>
Certainly not expected.<br>
<br>
&gt; <a href=3D"https://status.gitlab.com/" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://status.gitlab.com/</a> &lt;<a href=3D"https://stat=
us.gitlab.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://sta=
tus.gitlab.com/</a>&gt; describes<br>
&gt; =E2=80=9Cshared runner degradation=E2=80=9D but that doesn=E2=80=99t s=
ound like this problem.<br>
<br>
Indeed.<br>
<br>
</blockquote></div>

--000000000000de751405bd696931--


