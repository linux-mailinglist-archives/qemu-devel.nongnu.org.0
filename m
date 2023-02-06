Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E2768C261
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 17:00:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP3uH-000797-AR; Mon, 06 Feb 2023 10:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pP3uE-00078i-UO
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:59:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pP3uC-0003JE-M2
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 10:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675699182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qOHQ8MayGUMN8tRb4q6RQSqx1cJewwqUH8YTVCYCUuM=;
 b=aOZAaN2KfY9aObLK6HF6OfhNCVrM1zG/wLFJuE/3uV2/+9DSKeZuU6We2QZak9BDYtugxF
 igwIRgKeVESL4Pkm4igST/oj878NlWVxpijLrWGT6cX4qh85iVjLwLTMmOe2sONbfRTfwj
 izqNh0N9fIWZGrE56Hrn3A+5oHo3Va4=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-ZFglp7CAOGqigxwTibgitA-1; Mon, 06 Feb 2023 10:59:41 -0500
X-MC-Unique: ZFglp7CAOGqigxwTibgitA-1
Received: by mail-pg1-f200.google.com with SMTP id
 127-20020a630685000000b004ec5996dcc0so5276736pgg.8
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 07:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qOHQ8MayGUMN8tRb4q6RQSqx1cJewwqUH8YTVCYCUuM=;
 b=CsAGXRTk99osm/n2enXEW1AcrDfQsGY0w97swEqiqTb51tck7bFa8N1Pt5DrMxQBTn
 Q7rFO08SNs2u1U3NOt7zmx++P9Ig99+bRp1L7NfAd1ewx6imkkpEsqPl0dccSq4BD2kJ
 6h+U80ovYedzIlMO+Iq+BzwUMwjRGGQTQT8akg6jXmKA6HicArE+Sg9V3k2yulZiHdv7
 sa6lbpFekHszbyRDzQjadCafd5Hi18cDgIW8JOU+ZhfomsPN87bFtaKNQCQEIf2Z4wxG
 Alx36BPxfV0rUK7nzJYUVFPpuEsNm3Cqj9l9E9JT86EJAhlwSgbgXNYieh5TrzCKt2zE
 RZoQ==
X-Gm-Message-State: AO0yUKW3AGRKDQyT7c7RlhkcyeHI/1SGvLoBONBb4vvg9UQxMZgcHkSS
 /BtEKEWJjAaT9l2bmBtLbnoUgvzlb01nYMhtZcyjM4rFiSRKhALXcUI9pJiZbNL04rZjH51tbeJ
 yDBPN0cz4qvFfwVwnQ8HH8QZakF4VodU=
X-Received: by 2002:aa7:858e:0:b0:593:e802:e41d with SMTP id
 w14-20020aa7858e000000b00593e802e41dmr4609254pfn.31.1675699179908; 
 Mon, 06 Feb 2023 07:59:39 -0800 (PST)
X-Google-Smtp-Source: AK7set92pKWz0QJ1Nfm3RigQwVcLf4DetDlR6WElByfuXd+UKkJl80bMZJ1ja4N/r/AflMdkF2cadbuqsPW/k/nQejc=
X-Received: by 2002:aa7:858e:0:b0:593:e802:e41d with SMTP id
 w14-20020aa7858e000000b00593e802e41dmr4609247pfn.31.1675699179518; Mon, 06
 Feb 2023 07:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20230203184733.523522-1-jsnow@redhat.com>
 <20230203184733.523522-5-jsnow@redhat.com>
 <87o7q97jfl.fsf@pond.sub.org>
In-Reply-To: <87o7q97jfl.fsf@pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Mon, 6 Feb 2023 10:59:28 -0500
Message-ID: <CAFn=p-bk-YQ-HwKVdQ44nxeE=0kMr8z0VDTcJV6=0_W7mu3X6w@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] qapi: update pylint configuration
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000058920e05f40a1ebe"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--00000000000058920e05f40a1ebe
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 4, 2023, 6:34 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > Newer versions of pylint disable the "no-self-use" message by
> > default. Older versions don't, though. If we leave the suppressions in,
> > pylint yelps about useless options. Just tell pylint to shush.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  scripts/qapi/pylintrc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
> > index a7246282030..90546df5345 100644
> > --- a/scripts/qapi/pylintrc
> > +++ b/scripts/qapi/pylintrc
> > @@ -23,6 +23,7 @@ disable=fixme,
> >          too-many-statements,
> >          too-many-instance-attributes,
> >          consider-using-f-string,
> > +        useless-option-value,
> >
> >  [REPORTS]
>
> Pylint docs[*] explains this is "used when a value for an option that is
> now deleted from pylint is encountered."  Switching that off makes sense
> when you have to deal with a range of versions.  Occasional garbage
> collection of old options is advised :)
>

Indeed.

For the purposes of CI and repeatability (and maintainer happiness), it'd
be nice to just enforce specific, explicit versions.

For the purposes of developer happiness, I'm willing to accept *some* pain
in supporting a range of versions for the tools.

I'm anticipating re-evaluating suppressions and workarounds when 3.6 gets
dropped.

--js


> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
>
> [*]
> https://pylint.pycqa.org/en/latest/user_guide/messages/refactor/useless-option-value.html
>
>

--00000000000058920e05f40a1ebe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Feb 4, 2023, 6:34 AM Markus Armbruster &lt;<a =
href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">John Snow &lt;<a href=3D"mailto:jsnow@redha=
t.com" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; writes=
:<br>
<br>
&gt; Newer versions of pylint disable the &quot;no-self-use&quot; message b=
y<br>
&gt; default. Older versions don&#39;t, though. If we leave the suppression=
s in,<br>
&gt; pylint yelps about useless options. Just tell pylint to shush.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/qapi/pylintrc | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc<br>
&gt; index a7246282030..90546df5345 100644<br>
&gt; --- a/scripts/qapi/pylintrc<br>
&gt; +++ b/scripts/qapi/pylintrc<br>
&gt; @@ -23,6 +23,7 @@ disable=3Dfixme,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 too-many-statements,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 too-many-instance-attributes,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 consider-using-f-string,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 useless-option-value,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 [REPORTS]<br>
<br>
Pylint docs[*] explains this is &quot;used when a value for an option that =
is<br>
now deleted from pylint is encountered.&quot;=C2=A0 Switching that off make=
s sense<br>
when you have to deal with a range of versions.=C2=A0 Occasional garbage<br=
>
collection of old options is advised :)<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Indeed.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">For the purposes of CI and repeatability (and mainta=
iner happiness), it&#39;d be nice to just enforce specific, explicit versio=
ns.</div><div dir=3D"auto"><br></div><div dir=3D"auto">For the purposes of =
developer happiness, I&#39;m willing to accept *some* pain in supporting a =
range of versions for the tools.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I&#39;m anticipating re-evaluating suppressions and workarounds w=
hen 3.6 gets dropped.</div><div dir=3D"auto"><br></div><div dir=3D"auto">--=
js</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br>
Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">armbru@redhat.com</a>&gt;<br>
<br>
<br>
[*] <a href=3D"https://pylint.pycqa.org/en/latest/user_guide/messages/refac=
tor/useless-option-value.html" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">https://pylint.pycqa.org/en/latest/user_guide/messages/refactor/useless=
-option-value.html</a><br>
<br>
</blockquote></div></div></div>

--00000000000058920e05f40a1ebe--


