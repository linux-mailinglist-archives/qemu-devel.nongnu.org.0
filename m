Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB803B85A4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:00:05 +0200 (CEST)
Received: from localhost ([::1]:45990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybh6-0005Gr-N5
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lybg2-0004Ce-3w
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:58:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lybfy-0008BN-0M
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:58:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625065132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HjNcKFGw8o1ttRLdP7wqL+EEEYNUTvmVKcyLYhbaGtI=;
 b=bVxNjAIVeMoHI41AkoDEstTalhKMCdJ1MXv0VdbNgjdkQQbOGVNyCOrd5EmKOrWBUjlzbX
 4ZAiQlmq+83ZelexZRBxe5ICxei3SGwBX66G7t7DgIdSdivpM98Q9vX62Q50az3AJxTKyj
 kVvTT5okqBU4br9bE2VP2RGSk0qPfTI=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-g26j4vxaOqiB8gLdiivGvA-1; Wed, 30 Jun 2021 10:58:49 -0400
X-MC-Unique: g26j4vxaOqiB8gLdiivGvA-1
Received: by mail-oi1-f200.google.com with SMTP id
 l189-20020acabbc60000b02901f566a77bb8so1072589oif.7
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HjNcKFGw8o1ttRLdP7wqL+EEEYNUTvmVKcyLYhbaGtI=;
 b=DdnQGctfuXnpJPtfVs8ZdJkIXzDxladpI/xRAMYH6D/dTBQ5QwpqmsVc7VuO8x0bY/
 IdEGXx/EtMMVpZ50GMNeltKRKIC1tvKkh4CWq64aQybETytr2LZPySALUwwJryvWIyQG
 SqnM5gVFacEbEN1KZkusTdYJTLqqIxQdkxKhFxzAAga8CQ0/vgRkfOWltTOT8uimjOJ1
 OX7tbDVUVNWEx8oopcBN7/7nSbdsCVCIpp4kNclLJZ02QMXbxerJeuYtv8ufyn6sHcO6
 9jvpN3/mORA63ENZ69/g1hTWWV6uIMxAM1BheHeQ7mx4MFn0xZRNPOaQRuEUXUrHEJNx
 +CvQ==
X-Gm-Message-State: AOAM532bf1bqhPksJ90lnqW/BI/jc5bkvHgoPeQdafWUqRwPvelQuC8z
 nDesY3lTKzi2B0IHrT30IgZKhKqCucAlaH1gpLY8zJmsGK2nabhh1FBlPrZn8cZP9Fflq26TbZT
 vqas4OleVN9TPHdHC6rQNS5IFWqKeNRk=
X-Received: by 2002:aca:2212:: with SMTP id b18mr18695600oic.52.1625065128362; 
 Wed, 30 Jun 2021 07:58:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGqI3vlj7el0g902O6RmPBmdz/iW7mK3bdHtI968IHL4dxCq1M+i6YJIC2AX69VvXj0DKcj/ehx847JOwbvcE=
X-Received: by 2002:aca:2212:: with SMTP id b18mr18695594oic.52.1625065128207; 
 Wed, 30 Jun 2021 07:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-12-jsnow@redhat.com>
 <CAKJDGDYrqaQpj+NH7p7WvnW1zzo3R3DQHhev33=ddcPAkga0NA@mail.gmail.com>
In-Reply-To: <CAKJDGDYrqaQpj+NH7p7WvnW1zzo3R3DQHhev33=ddcPAkga0NA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 30 Jun 2021 10:58:37 -0400
Message-ID: <CAFn=p-aTMNMfcT_i57ZHoiG+TNEmXWME2KKnJvKPQQZ5F3H69g@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] python: add 'make check-dev' invocation
To: Willian Rampazzo <wrampazz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b435d305c5fcf5d9"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b435d305c5fcf5d9
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 30, 2021 at 10:41 AM Willian Rampazzo <wrampazz@redhat.com>
wrote:

> On Tue, Jun 29, 2021 at 6:43 PM John Snow <jsnow@redhat.com> wrote:
> >
> > This is a *third* way to run the Python tests. Unlike the first two
> > (check-pipenv, check-tox), this version does not require any specific
> > interpreter version -- making it a lot easier to tell people to run it
> > as a quick smoketest prior to submission to GitLab CI.
> >
> > Summary:
> >
> >   Checked via GitLab CI:
> >     - check-pipenv: tests our oldest python & dependencies
> >     - check-tox: tests newest dependencies on all non-EOL python versions
> >   Executed only incidentally:
> >     - check-dev: tests newest dependencies on whichever python version
> >
> > ('make check' does not set up any environment at all, it just runs the
> > tests in your current environment. All four invocations perform the
> > exact same tests, just in different execution environments.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/Makefile | 35 +++++++++++++++++++++++++++++++++--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> >
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>
>
Thanks. I am squashing in a hotfix here to add .dev-venv to .gitignore,
too. Not worth an entire respin for that.
(Assuming that's gonna be A-OK with both of you.)

--000000000000b435d305c5fcf5d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 30, 2021 at 10:41 AM Will=
ian Rampazzo &lt;<a href=3D"mailto:wrampazz@redhat.com">wrampazz@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Tue, Jun 29, 2021 at 6:43 PM John Snow &lt;<a href=3D"mailto:jsnow@redha=
t.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This is a *third* way to run the Python tests. Unlike the first two<br=
>
&gt; (check-pipenv, check-tox), this version does not require any specific<=
br>
&gt; interpreter version -- making it a lot easier to tell people to run it=
<br>
&gt; as a quick smoketest prior to submission to GitLab CI.<br>
&gt;<br>
&gt; Summary:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Checked via GitLab CI:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- check-pipenv: tests our oldest python &amp; depen=
dencies<br>
&gt;=C2=A0 =C2=A0 =C2=A0- check-tox: tests newest dependencies on all non-E=
OL python versions<br>
&gt;=C2=A0 =C2=A0Executed only incidentally:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- check-dev: tests newest dependencies on whichever=
 python version<br>
&gt;<br>
&gt; (&#39;make check&#39; does not set up any environment at all, it just =
runs the<br>
&gt; tests in your current environment. All four invocations perform the<br=
>
&gt; exact same tests, just in different execution environments.)<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 python/Makefile | 35 +++++++++++++++++++++++++++++++++--<br>
&gt;=C2=A0 1 file changed, 33 insertions(+), 2 deletions(-)<br>
&gt;<br>
<br>
Reviewed-by: Willian Rampazzo &lt;<a href=3D"mailto:willianr@redhat.com" ta=
rget=3D"_blank">willianr@redhat.com</a>&gt;<br><br></blockquote><div><br></=
div><div>Thanks. I am squashing in a hotfix here to add .dev-venv to .gitig=
nore, too. Not worth an entire respin for that.<br></div><div>(Assuming tha=
t&#39;s gonna be A-OK with both of you.)<br></div><div><br></div></div></di=
v>

--000000000000b435d305c5fcf5d9--


