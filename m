Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F6835E845
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:26:51 +0200 (CEST)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQYc-0008JS-6U
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWQPH-0001ac-Ix
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 17:17:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lWQPD-00015u-CN
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 17:17:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618348625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kwEj9Pm31OEKK5FV08L4xYAJcbIWD7HkfQPGDvgtKzo=;
 b=BA96A6hgzOa6ucR+xqWREtfDnp+FO6UaCiAv7BVoAWkfq96T92c2gcWmOHhBl0ybesZxbH
 j5vH98ha6qCfqH2AmXnnipgs7gaVfIctkGd2+Fi+506506JHj6u1C6NtIEoMWFppYqo05f
 wf18wHBDYAn138H7C/tuzclZHSdP5s4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-96IEo59gPFeamGMjYDR5ZA-1; Tue, 13 Apr 2021 17:17:02 -0400
X-MC-Unique: 96IEo59gPFeamGMjYDR5ZA-1
Received: by mail-pj1-f71.google.com with SMTP id
 oc5-20020a17090b1c05b029014c095a5149so7457157pjb.2
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 14:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kwEj9Pm31OEKK5FV08L4xYAJcbIWD7HkfQPGDvgtKzo=;
 b=mMWEkEhYLHt12gejJfmOfYIfj/vcZAOmJOu9pWhyzY4jJdGz1bDPwuIKRsLJH/jskx
 hksEQ7m3FrUo5LCFQ9QUf8Y5THQhsOYuzSDK5+BdcypMAigJO/G0MgShdWOmR0tBjbgF
 bFrdHsDcIorE4ulc6/9PL+bi5tJ7xHN0UxnCAcEgaAq8IT0X3Qz7qJHOiDDGNJO2H9NF
 9FeIQcMzvhUcWxRxD3STDxyF8joQF7t2RQ3gmICwN+74WzpWJ3fe0AzE4Q2THrgoK+c2
 lPBckb3PdwB7DWiGGaBM06fJrOE2PJDhasvWvVyTMpsyWk6Ix0Lqrc7p/oRUYM60DGT2
 O0Ug==
X-Gm-Message-State: AOAM530CetTEzZdzCi/s8UOvE8HRSNpditxC2orPM2aHfWPxPvM/RK6v
 SnEkqL//U9haSgjauOpBs5yLt6MAp8tZD3JweWqQW2c2vZprMxMDwKJSoAz+0zha/N6wmBtXkdH
 35fgYIMUqjIbaeJBB7ZdW6emEVSh9My8=
X-Received: by 2002:aa7:8584:0:b029:24b:7946:cb83 with SMTP id
 w4-20020aa785840000b029024b7946cb83mr13732160pfn.59.1618348621519; 
 Tue, 13 Apr 2021 14:17:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzX/mjYP/Oe0mX2xuFsHQdRu+2JPK1PSAaFGvjLztd9Akh6wYIV0UUd5ucbuf0qC1aRo34xQlpP0hhBVFYG2Fo=
X-Received: by 2002:aa7:8584:0:b029:24b:7946:cb83 with SMTP id
 w4-20020aa785840000b029024b7946cb83mr13732136pfn.59.1618348621174; Tue, 13
 Apr 2021 14:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210331150527.14857-1-pbonzini@redhat.com>
 <YHXF3A/Nd2AcpazN@redhat.com>
In-Reply-To: <YHXF3A/Nd2AcpazN@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Apr 2021 23:16:48 +0200
Message-ID: <CABgObfY=_3DMy=Nhhz4b0KVxzqTmun=dZ+y7o4Y+5T0vdN2kiA@mail.gmail.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b031fd05bfe1263a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Maydell, Peter" <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Graf, Alexander" <agraf@csgraf.de>,
 "Hajnoczi, Stefan" <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 afaerber <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b031fd05bfe1263a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mar 13 apr 2021, 18:25 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> Since this was derived from the Fedora CoC, you might be interested to
> know that Fedora is currently revisiting its CoC:
>
>
> https://communityblog.fedoraproject.org/policy-proposal-new-code-of-condu=
ct/
>
> The first comment on that post from mattdm gives clarity as to why they
> feel the need to revisit it


Interesting, thanks. Indeed the changes that I brought over from the
Contributor Covenant (and that were also there, albeit more verbosely, in
the Django code of conduct) have the purpose of making the text more
specific in case "being excellent to each other" just isn't enough. We also
have the separate conflict resolution guide that covers the third point
that Matt made in his post.

Having some confirmation that those things *were* missing from the current
Fedora CoC is good. In fact in the meanwhile I found a few other cases
(such as the Microsoft open source code of conduct,
https://opensource.microsoft.com/codeofconduct/) that merged a less
prescriptive text ultimately derived from Fedora with parts of the
Contributor Covenant, so it looks like others have had the same idea in the
past.

Paolo

>

--000000000000b031fd05bfe1263a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Il mar 13 apr 2021, 18:25 Daniel P. Berrang=C3=A9 &lt;<a href=
=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; ha scritto:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Since this was derived from the Fedora=
 CoC, you might be interested to<br>
know that Fedora is currently revisiting its CoC:<br>
<br>
=C2=A0 <a href=3D"https://communityblog.fedoraproject.org/policy-proposal-n=
ew-code-of-conduct/" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//communityblog.fedoraproject.org/policy-proposal-new-code-of-conduct/</a><=
br>
<br>
The first comment on that post from mattdm gives clarity as to why they<br>
feel the need to revisit it</blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Interesting, thanks. Indeed the changes that I broug=
ht over from the Contributor Covenant (and that were also there, albeit mor=
e verbosely, in the Django code of conduct) have the purpose of making the =
text more specific in case &quot;being excellent to each other&quot; just i=
sn&#39;t enough. We also have the separate conflict resolution guide that c=
overs the third point that Matt made in his post.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Having some confirmation that those things *were*=
 missing from the current Fedora CoC is good. In fact in the meanwhile I fo=
und a few other cases (such as the Microsoft open source code of conduct, <=
a href=3D"https://opensource.microsoft.com/codeofconduct/">https://opensour=
ce.microsoft.com/codeofconduct/</a>) that merged a less prescriptive text u=
ltimately derived from Fedora with parts of the Contributor Covenant, so it=
 looks like others have had the same idea in the past.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000b031fd05bfe1263a--


