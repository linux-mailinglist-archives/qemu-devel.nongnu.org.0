Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DD44216A4
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 20:37:29 +0200 (CEST)
Received: from localhost ([::1]:45500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXSq7-0000sx-3v
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 14:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXSlN-0006jy-2F
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXSlH-0008Kx-Fr
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 14:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633372344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rg2tbWuTNk0rA9TsXvNwdIA0x9+PWX60+yajSQwVTN8=;
 b=F0fxuB+wHiAPwRtJv+4l8Vtrc/+LamNGc8Qu9kl0p2Cr8BNyHKBzpEq9MOz76YIfxRzBK0
 I3neDXqJyMaMO5BUg7mKlmd33TYBQGcXkcNWslA/hpZI+QsonpOyZ740Ddy9gPSJtC7OX0
 5XLyBF5vMney5OfKxOPpkX7YZkWTWUs=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-trKuHvVCM36r3abQ_oItSg-1; Mon, 04 Oct 2021 14:32:22 -0400
X-MC-Unique: trKuHvVCM36r3abQ_oItSg-1
Received: by mail-ua1-f70.google.com with SMTP id
 c18-20020ab04852000000b002c9ff3ffa97so2143300uad.4
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 11:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rg2tbWuTNk0rA9TsXvNwdIA0x9+PWX60+yajSQwVTN8=;
 b=0WpCMuZUmUWSxBh7oJ/sPZ86vDzdCWjOs6Qg4vuaaDPurpifb6X/plZia3ZWFqStOW
 W9kZ0JODu3YAeZJS17w3HE3032WLislkBBUGmU5G1Xx5Q532YBZ4nqkS+bdfmCnd7bTJ
 Sf0lx38eSFpBDk0mq9Nbgggzgf7RDAuToNuG1OxCor/yOpkQY4lzBzy9SKAHBgiSB+qN
 lNtH2Kz+a9g17sMGKdQXqrN9jcgbTQat6DgBDZ4euabYvP6bhk08y2g/hQiq33Zgwthn
 S0DRzUgkKJW9Ob+7r+o8iUQu58kXb3+QqjP+kuT2vz0fj+ZEb6xsZ4UKwaglvmOygxzm
 /pZA==
X-Gm-Message-State: AOAM530aZKG35XUF80nU3j20TgvgaRx18VcxSRPiW018QOvmxdWbwCzC
 Ur3cc+jtWKbxjavvCXFsTZ9VSapgf3gzUc+tQTNHWUazIsiy7MRDgZlIMRbCCOrxARnOcTKtpeh
 p+21BM0y1DjHYOjpR2LEihUBkeshvoL0=
X-Received: by 2002:ab0:5e9a:: with SMTP id y26mr8084587uag.87.1633372341982; 
 Mon, 04 Oct 2021 11:32:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrBP1qdmRdPUrgZsLl60bjGYXk5y4/4goRT9nyrWCACkuMHHfyONPUlVt1FdZwcS11nHPrEsAWpZGqIwjtxA0=
X-Received: by 2002:ab0:5e9a:: with SMTP id y26mr8084559uag.87.1633372341716; 
 Mon, 04 Oct 2021 11:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-13-jsnow@redhat.com>
 <e885ae38-5e31-8a89-96d2-10ffab69e373@redhat.com>
 <CAFn=p-aaU8OK99R8u21SGb0kyOz=RtNy_aZoYnLwoOu6d4WE6A@mail.gmail.com>
 <CAFn=p-bTtRWdLhMuaQdH=pSy26KytrfXcidO4RePBunXxwUbSA@mail.gmail.com>
 <372c86ac-0061-2d9a-b366-72260d91bd75@redhat.com>
In-Reply-To: <372c86ac-0061-2d9a-b366-72260d91bd75@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 4 Oct 2021 14:32:10 -0400
Message-ID: <CAFn=p-bLmHQRK9UT6H2F4C46tjZe6HnO=cYJJdB7z-j1uChk-Q@mail.gmail.com>
Subject: Re: [PATCH 12/15] iotests: Disable AQMP logging under non-debug modes
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000036dfba05cd8b22d6"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000036dfba05cd8b22d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2021 at 6:12 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 18.09.21 04:14, John Snow wrote:
> >
> >
> > On Fri, Sep 17, 2021 at 8:58 PM John Snow <jsnow@redhat.com
> > <mailto:jsnow@redhat.com>> wrote:
> >
> >
> >
> >     On Fri, Sep 17, 2021 at 10:30 AM Hanna Reitz <hreitz@redhat.com
> >     <mailto:hreitz@redhat.com>> wrote:
> >
> >         On 17.09.21 07:40, John Snow wrote:
> >         > Disable the aqmp logger, which likes to (at the moment)
> >         print out
> >         > intermediate warnings and errors that cause session
> >         termination; disable
> >         > them so they don't interfere with the job output.
> >         >
> >         > Leave any "CRITICAL" warnings enabled though, those are ones
> >         that we
> >         > should never see, no matter what.
> >
> >         I mean, looks OK to me, but from what I understand (i.e. little=
),
> >         qmp_client doesn=E2=80=99t log CRITICAL messages, at least I ca=
n=E2=80=99t see
> >         any. Only
> >         ERRORs.
> >
> >
> >     There's *one* critical message in protocol.py, used for a
> >     circumstance that I *think* should be impossible. I do not think I
> >     currently use any WARNING level statements.
> >
> >         I guess I=E2=80=99m missing some CRITICAL messages in external
> >         functions called
> >         from qmp_client.py, but shouldn=E2=80=99t we still keep ERRORs?
> >
> >
> >     ...Mayyyyyybe?
> >
> >     The errors logged by AQMP are *almost always* raised as Exceptions
> >     somewhere else, eventually. Sometimes when we encounter them in
> >     one context, we need to save them and then re-raise them in a
> >     different execution context. There's one good exception to this:
> >     My pal, EOFError.
> >
> >     If the reader context encounters EOF, it raises EOFError and this
> >     causes a disconnect to be scheduled asynchronously. *Any*
> >     Exception that causes a disconnect to be scheduled asynchronously
> >     is dutifully logged as an ERROR. At this point in the code, we
> >     don't really know if the user of the library considers this an
> >     "error" yet or not. I've waffled a lot on how exactly to treat
> >     this circumstance. ...Hm, I guess that's really the only case
> >     where I have an error that really ought to be suppressed. I
> >     suppose what I will do here is: if the exception happens to be an
> >     EOFError I will drop the severity of the log message down to INFO.
> >     I don't know why it takes being challenged on this stuff to start
> >     thinking clearly about it, but here we are. Thank you for your
> >     feedback :~)
> >
> >     --js
> >
> >
> > Oh, CI testing reminds me of why I am a liar here.
> >
> > the mirror-top-perms test intentionally expects not to be able to
> > connect, but we're treated to these two additional lines of output:
> >
> > +ERROR:qemu.aqmp.qmp_client.qemub-2536319:Negotiation failed: EOFError
> > +ERROR:qemu.aqmp.qmp_client.qemub-2536319:Failed to establish session:
> > EOFError
> >
> > Uh. I guess a temporary suppression in mirror-top-perms, then ...?
>
> Sounds right to me, if that=E2=80=99s simple enough.
>
> (By the way, I understand it right that you want to lower the severity
> of EOFErrors to INFO only on disconnect, right?  Which is why they=E2=80=
=99re
> still logged as ERRORs here, because they aren=E2=80=99t occurring on dis=
connects?)
>
>
More or less, yeah.

When an EOFError causes the reader coroutine to halt (because it can't read
the next message), I decided (in v2) to drop that one particular logging
message down to "INFO", because it might -- or might not be -- an expected
occurrence from the point of view of whoever is managing the QMP
connection. Maybe it was expected (The test used qemu-guest-agent or
something else to make the guest shutdown, taking QEMU down with it without
the knowledge of the QMP library layer) or maybe it was unexpected (the QMP
remote really just disappeared from us on a whim). There's no way to know,
so it probably isn't right to consider it an error.

In the connection case, I left it as an ERROR because the caller asked us
to connect to an endpoint and we were unable to, which feels unambiguous.
It will be ultimately reported via Exceptions as qemu.aqmp.ConnectError,
with additional information available in fields of that exception object.
Even though the exception is reported to the caller, I decided to log the
occurrence anyway, because I felt like it should be the job of the library
to make a good log and not the caller's responsibility to catch the
exception and then log it themselves.

That does leave us with this atypical case though: the caller is
intentionally causing problems :)

(Well, atypical for a user of the library who is using it to make a tool
they expect to work. Quite a typical case for tests in the abstract, though
we only seem to have precisely one usage of this pattern in iotests so far.=
)


> > In most other cases I rather imagine we do want to see this kind of
> > output to help give more information about how things have failed --
> > they ARE errors. We just happen to not care about them right here.
>
> Well, in fact we do expect them here, so we could even log them, but
> first I don=E2=80=99t know whether they=E2=80=99re stable enough for that=
, and second
> this would break the =E2=80=9Cchoose the AQMP or legacy QMP back-end via =
an
> environment variable=E2=80=9D thing.
>
>
Yeah, that's the other half of it, I came to realize. Just logging the
expected failure feels the most idiomatic, but it requires a new logging
filter (I have to filter out the PID from the logger name to make it work
consistently) and breaks the ability to switch.

So I suppose "for now" just disabling the logger output for a critical
section and leaving a comment that states that once we're feeling confident
about the new library (maybe after the next release when everything has
really gone through the testing wash cycle) we can remove the suppression
and just log the errors the normal way.


> > The only thing I don't exactly like about this is that it requires
> > some knowledge by the caller to know to disable it. It makes writing
> > negative tests a bit more annoying because the library leans so
> > heavily on yelling loudly when it encounters problems.
>
> Yeah.  I=E2=80=99m afraid I don=E2=80=99t have a good idea on how to conv=
ey test writers
> how to suppress these errors, even if it were a simple one-liner (like
> `self.vm_b.set_log_threshold(logging.CRITICAL)`)...
>
> We could start an =E2=80=9Ciotests tips and tricks=E2=80=9D document, but=
 do we want to?
>
> Hanna
>
>
Hm, not just yet. More chances for un-checked stuff to bitrot. There's only
this one caller that poses a problem here, so it's probably not going to be
too difficult to just update tests to expect the error logs.

V2 soon. I already respun it, but it's been a week, so I will need to scrub
it down with a good proof-reading pass. Thanks for your patience, and I
hope you enjoyed your PTO :~)

--js

--00000000000036dfba05cd8b22d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 4, 2021 at 6:12 AM Hanna =
Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 18.09.21=
 04:14, John Snow wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Sep 17, 2021 at 8:58 PM John Snow &lt;<a href=3D"mailto:jsnow@=
redhat.com" target=3D"_blank">jsnow@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow=
@redhat.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Fri, Sep 17, 2021 at 10:30 AM Hanna Reitz &lt;<a=
 href=3D"mailto:hreitz@redhat.com" target=3D"_blank">hreitz@redhat.com</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hreitz@redhat.com" tar=
get=3D"_blank">hreitz@redhat.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 17.09.21 07:40, John Snow wrote:<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Disable the aqmp logger, which l=
ikes to (at the moment)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print out<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; intermediate warnings and errors=
 that cause session<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0termination; disable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; them so they don&#39;t interfere=
 with the job output.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Leave any &quot;CRITICAL&quot; w=
arnings enabled though, those are ones<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0that we<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; should never see, no matter what=
.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I mean, looks OK to me, but from what=
 I understand (i.e. little),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qmp_client doesn=E2=80=99t log CRITIC=
AL messages, at least I can=E2=80=99t see<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0any. Only<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ERRORs.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0There&#39;s *one* critical message in protocol.py, =
used for a<br>
&gt;=C2=A0 =C2=A0 =C2=A0circumstance that I *think* should be impossible. I=
 do not think I<br>
&gt;=C2=A0 =C2=A0 =C2=A0currently use any WARNING level statements.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I guess I=E2=80=99m missing some CRIT=
ICAL messages in external<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0functions called<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from qmp_client.py, but shouldn=E2=80=
=99t we still keep ERRORs?<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0...Mayyyyyybe?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The errors logged by AQMP are *almost always* raise=
d as Exceptions<br>
&gt;=C2=A0 =C2=A0 =C2=A0somewhere else, eventually. Sometimes when we encou=
nter them in<br>
&gt;=C2=A0 =C2=A0 =C2=A0one context, we need to save them and then re-raise=
 them in a<br>
&gt;=C2=A0 =C2=A0 =C2=A0different execution context. There&#39;s one good e=
xception to this:<br>
&gt;=C2=A0 =C2=A0 =C2=A0My pal, EOFError.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0If the reader context encounters EOF, it raises EOF=
Error and this<br>
&gt;=C2=A0 =C2=A0 =C2=A0causes a disconnect to be scheduled asynchronously.=
 *Any*<br>
&gt;=C2=A0 =C2=A0 =C2=A0Exception that causes a disconnect to be scheduled =
asynchronously<br>
&gt;=C2=A0 =C2=A0 =C2=A0is dutifully logged as an ERROR. At this point in t=
he code, we<br>
&gt;=C2=A0 =C2=A0 =C2=A0don&#39;t really know if the user of the library co=
nsiders this an<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;error&quot; yet or not. I&#39;ve waffled a lo=
t on how exactly to treat<br>
&gt;=C2=A0 =C2=A0 =C2=A0this circumstance. ...Hm, I guess that&#39;s really=
 the only case<br>
&gt;=C2=A0 =C2=A0 =C2=A0where I have an error that really ought to be suppr=
essed. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0suppose what I will do here is: if the exception ha=
ppens to be an<br>
&gt;=C2=A0 =C2=A0 =C2=A0EOFError I will drop the severity of the log messag=
e down to INFO.<br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t know why it takes being challenged on t=
his stuff to start<br>
&gt;=C2=A0 =C2=A0 =C2=A0thinking clearly about it, but here we are. Thank y=
ou for your<br>
&gt;=C2=A0 =C2=A0 =C2=A0feedback :~)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--js<br>
&gt;<br>
&gt;<br>
&gt; Oh, CI testing reminds me of why I am a liar here.<br>
&gt;<br>
&gt; the mirror-top-perms test intentionally expects not to be able to <br>
&gt; connect, but we&#39;re treated to these two additional lines of output=
:<br>
&gt;<br>
&gt; +ERROR:qemu.aqmp.qmp_client.qemub-2536319:Negotiation failed: EOFError=
<br>
&gt; +ERROR:qemu.aqmp.qmp_client.qemub-2536319:Failed to establish session:=
 <br>
&gt; EOFError<br>
&gt;<br>
&gt; Uh. I guess a temporary suppression in mirror-top-perms, then ...?<br>
<br>
Sounds right to me, if that=E2=80=99s simple enough.<br>
<br></blockquote></div><div></div><div class=3D"gmail_quote"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
(By the way, I understand it right that you want to lower the severity <br>
of EOFErrors to INFO only on disconnect, right?=C2=A0 Which is why they=E2=
=80=99re <br>
still logged as ERRORs here, because they aren=E2=80=99t occurring on disco=
nnects?)<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">More or less, yeah.<br></div><div class=3D"gmail_quote"><br></d=
iv><div class=3D"gmail_quote">When an EOFError causes the reader coroutine =
to halt (because it can&#39;t read the next message), I decided (in v2) to =
drop that one particular logging message down to &quot;INFO&quot;, because =
it might -- or might not be -- an expected occurrence from the point of vie=
w of whoever is managing the QMP connection. Maybe it was expected (The tes=
t used qemu-guest-agent or something else to make the guest shutdown, takin=
g QEMU down with it without the knowledge of the QMP library layer) or mayb=
e it was unexpected (the QMP remote really just disappeared from us on a wh=
im). There&#39;s no way to know, so it probably isn&#39;t right to consider=
 it an error.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail=
_quote">In the connection case, I left it as an ERROR because the caller as=
ked us to connect to an endpoint and we were unable to, which feels unambig=
uous. It will be ultimately reported via Exceptions as qemu.aqmp.ConnectErr=
or, with additional information available in fields of that exception objec=
t. Even though the exception is reported to the caller, I decided to log th=
e occurrence anyway, because I felt like it should be the job of the librar=
y to make a good log and not the caller&#39;s responsibility to catch the e=
xception and then log it themselves.</div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">That does leave us with this atypical case t=
hough: the caller is intentionally causing problems :)</div><div class=3D"g=
mail_quote"><br></div><div class=3D"gmail_quote">(Well, atypical for a user=
 of the library who is using it to make a tool they expect to work. Quite a=
 typical case for tests in the abstract, though we only seem to have precis=
ely one usage of this pattern in iotests so far.)<br></div><div class=3D"gm=
ail_quote"></div>=C2=A0<div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt; In most other cases I rather imagine we do want to see this kind of <b=
r>
&gt; output to help give more information about how things have failed -- <=
br>
&gt; they ARE errors. We just happen to not care about them right here.<br>
<br>
Well, in fact we do expect them here, so we could even log them, but <br>
first I don=E2=80=99t know whether they=E2=80=99re stable enough for that, =
and second <br>
this would break the =E2=80=9Cchoose the AQMP or legacy QMP back-end via an=
 <br>
environment variable=E2=80=9D thing.<br>
<br></blockquote><div><br></div><div>Yeah, that&#39;s the other half of it,=
 I came to realize. Just logging the expected failure feels the most idioma=
tic, but it requires a new logging filter (I have to filter out the PID fro=
m the logger name to make it work consistently) and breaks the ability to s=
witch.</div><div><br></div><div>So I suppose &quot;for now&quot; just disab=
ling the logger output for a critical section and leaving a comment that st=
ates that once we&#39;re feeling confident about the new library (maybe aft=
er the next release when everything has really gone through the testing was=
h cycle) we can remove the suppression and just log the errors the normal w=
ay.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt; The only thing I don&#39;t exactly like about this is that it requires=
 <br>
&gt; some knowledge by the caller to know to disable it. It makes writing <=
br>
&gt; negative tests a bit more annoying because the library leans so <br>
&gt; heavily on yelling loudly when it encounters problems.<br>
<br>
Yeah.=C2=A0 I=E2=80=99m afraid I don=E2=80=99t have a good idea on how to c=
onvey test writers <br>
how to suppress these errors, even if it were a simple one-liner (like <br>
`self.vm_b.set_log_threshold(logging.CRITICAL)`)...<br>
<br>
We could start an =E2=80=9Ciotests tips and tricks=E2=80=9D document, but d=
o we want to?<br>
<br>
Hanna<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Hm, not just yet. More chances for un-checked stuff to bitrot. =
There&#39;s only this one caller that poses a problem here, so it&#39;s pro=
bably not going to be too difficult to just update tests to expect the erro=
r logs.<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_q=
uote">V2 soon. I already respun it, but it&#39;s been a week, so I will nee=
d to scrub it down with a good proof-reading pass. Thanks for your patience=
, and I hope you enjoyed your PTO :~)</div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">--js<br></div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote"><br></div></div>

--00000000000036dfba05cd8b22d6--


