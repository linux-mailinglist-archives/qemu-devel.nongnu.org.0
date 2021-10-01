Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C5B41F5B8
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 21:27:16 +0200 (CEST)
Received: from localhost ([::1]:54374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWOBe-0004wu-U7
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 15:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mWO9B-0003r6-Js
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 15:24:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mWO97-0005Cm-Ai
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 15:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633116276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BaHOBomeMkN88EGhbSaLQfe3MHEzxnFP4w8FCRrInek=;
 b=MREfXX51M+4EYAgmvzktvlbnhf9UJnwQCyL3PjJ4gAp7XwpFSRPjmX/L5A7SQ5tMLS2RS3
 K1DohkL3E56yJFDdxYARvBU6HuFYZF5lE4edebLSEUEijFj4XotM3+MhQdsiNSpZ4bwqX0
 1cQIVQ5/0w5qmjPgxuqwIPqICqUaPeA=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-EOwYaH_MNOKEPdoD5PgSsw-1; Fri, 01 Oct 2021 15:24:34 -0400
X-MC-Unique: EOwYaH_MNOKEPdoD5PgSsw-1
Received: by mail-ua1-f71.google.com with SMTP id
 c19-20020ab03493000000b002ba380b6ef5so5174323uar.12
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 12:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BaHOBomeMkN88EGhbSaLQfe3MHEzxnFP4w8FCRrInek=;
 b=e8M1Em8ZwUlbtp3l7n1rooOw9C+SxBtmNlGdcVALH01uNRlXhmf88mmjogAMRCHGHM
 ErnlmvMxPCNWOPdIJ8J0F8K/wudSGj1T8RPxTiq5i7KhJ2Cp5CrYBuV6r4otxCKsjkjX
 jMU0Q25VeMqMIVxGmhgTkmxzJ9dHu0GqmXtDMarjPbpC5ExIstMaGraZfFl3cDxGRhGb
 LA0iPUhFamMrZEY/X8zJh3h9dKnuGBdS9kYQhQXaS1iThQKiIPZbYsH7yuchbxyub2+C
 xtHlgcWOh/cY8QmKPdhgaC2pKfEtjsCd1HiJUwrRAb6oxvYC60eWV78qXLXoCdMlvmT+
 SQCQ==
X-Gm-Message-State: AOAM531d090/I9w7fCERERWKZ7WujxH/FQUqIskKEc9SJ7RAwNBpDj+8
 NXm/q5twDEbtTHPeUxamNecPKfx0jFCmLklRUmAmORUaP9v+OX6Q1cPtcZRgmuXm0ij9Z78A8fA
 Pji1CoPz9FDLZNKtzdk/tzksDBWyNVb0=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr5979979vsp.59.1633116273796; 
 Fri, 01 Oct 2021 12:24:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNt/icwmd0OINF0gXonJsAoyOo78yUpO9EySlA/gQ3GbXjMc3Tn1rcU70lsaWcSI8o8gp+lBlUGse/lDMS6Xo=
X-Received: by 2002:a67:ec94:: with SMTP id h20mr5979952vsp.59.1633116273614; 
 Fri, 01 Oct 2021 12:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-bYOvg17MQ-NBDyBv_vqPgFH9MaxTO6yyKWpp1hZY4U+Q@mail.gmail.com>
 <YVbFEDOgo4Onb15L@redhat.com>
In-Reply-To: <YVbFEDOgo4Onb15L@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 1 Oct 2021 15:24:22 -0400
Message-ID: <CAFn=p-apU9KHN9zJGfLH2MwxE_npZQT27H7SjFfki1QqjoJGNw@mail.gmail.com>
Subject: Re: Running 297 from GitLab CI
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005db2f605cd4f83da"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005db2f605cd4f83da
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 4:21 AM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 30.09.2021 um 23:28 hat John Snow geschrieben:
> > Hiya, I was talking this over with Hanna in review to '[PATCH v3 00/16]
> > python/iotests: Run iotest linters during Python CI' [1] and I have some
> > doubt about what you'd personally like to see happen, here.
> >
> > In a nutshell, I split out 'linters.py' from 297 and keep all of the
> > iotest-bits in 297 and all of the generic "run the linters" bits in
> > linters.py, then I run linters.py from the GitLab python CI jobs.
> >
> > I did this so that iotest #297 would continue to work exactly as it had,
> > but trying to serve "two masters" in the form of two test suites means
> some
> > non-beautiful design decisions. Hanna suggested we just outright drop
> test
> > 297 to possibly improve the factoring of the tests.
> >
> > I don't want to do that unless you give it the go-ahead, though. I wanted
> > to hear your feelings on if we still want to keep 297 around or not.
>
> My basic requirement is that the checks are run somewhere in my local
> testing before I prepare a pull request. This means it could be done by
> iotests in any test that runs for -raw or -qcow2, or in 'make check'.
>
> So if you have a replacement somewhere in 'make check', dropping 297 is
> fine with me. If I have to run something entirely different, you may
> need to invest a bit more effort to convince me. ;-)
>
>
I love a good set of solid criteria ;-)

Understood! At the moment it *would* require a separate invocation. The
Python tests that run under CI generally set up their own environments to
ensure they'll run with minimum fuss or intervention from humans, though
there is an invocation in that Makefile that performs no environment setup
whatsoever -- but since no automated test uses it, it's not really a big
problem if your environment is "wrong" for that one. (But that also makes
it useless for make check!) It's similar to how iotest 297 does not really
check to see what version of pylint or mypy you might have, so sometimes
that test fails if your environment isn't suitable. But that one isn't part
of 'make check' either, so this feels like a bridge we've never crossed
anywhere in the whole source tree.

I have so far abstained from introducing such a step into 'make check'
because it might require some additional engineering to ensure that I get
the temporary directories all correct, tolerate the different types of
builds we do, uses the correct Python interpreter for all steps, etc.

So for now I'll propose leaving 297 as-is for convenience, but I will start
working towards finding the right way to include those tests from 'make
check'. I think there's no barrier (other than subjectively, beauty) to
leaving both avenues in for running the test for the time being. Maybe I
will find a way to convince Hanna to accept the interim solution as "well,
not THAT ugly."

Thanks for your input!

--js

--0000000000005db2f605cd4f83da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1, 2021 at 4:21 AM Kevin =
Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 30.09.2021 =
um 23:28 hat John Snow geschrieben:<br>
&gt; Hiya, I was talking this over with Hanna in review to &#39;[PATCH v3 0=
0/16]<br>
&gt; python/iotests: Run iotest linters during Python CI&#39; [1] and I hav=
e some<br>
&gt; doubt about what you&#39;d personally like to see happen, here.<br>
&gt; <br>
&gt; In a nutshell, I split out &#39;linters.py&#39; from 297 and keep all =
of the<br>
&gt; iotest-bits in 297 and all of the generic &quot;run the linters&quot; =
bits in<br>
&gt; linters.py, then I run linters.py from the GitLab python CI jobs.<br>
&gt; <br>
&gt; I did this so that iotest #297 would continue to work exactly as it ha=
d,<br>
&gt; but trying to serve &quot;two masters&quot; in the form of two test su=
ites means some<br>
&gt; non-beautiful design decisions. Hanna suggested we just outright drop =
test<br>
&gt; 297 to possibly improve the factoring of the tests.<br>
&gt; <br>
&gt; I don&#39;t want to do that unless you give it the go-ahead, though. I=
 wanted<br>
&gt; to hear your feelings on if we still want to keep 297 around or not.<b=
r>
<br>
My basic requirement is that the checks are run somewhere in my local<br>
testing before I prepare a pull request. This means it could be done by<br>
iotests in any test that runs for -raw or -qcow2, or in &#39;make check&#39=
;.<br>
<br>
So if you have a replacement somewhere in &#39;make check&#39;, dropping 29=
7 is<br>
fine with me. If I have to run something entirely different, you may<br>
need to invest a bit more effort to convince me. ;-)<br>
<br></blockquote><div><br></div><div>I love a good set of solid criteria ;-=
)<br></div><div>=C2=A0</div><div>Understood! At the moment it *would* requi=
re a separate invocation. The Python tests that run under CI generally set =
up their own environments to ensure they&#39;ll run with minimum fuss or in=
tervention from humans, though there is an invocation in that Makefile that=
 performs no environment setup whatsoever -- but since no automated test us=
es it, it&#39;s not really a big problem if your environment is &quot;wrong=
&quot; for that one. (But that also makes it useless for make check!) It&#3=
9;s similar to how iotest 297 does not really check to see what version of =
pylint or mypy you might have, so sometimes that test fails if your environ=
ment isn&#39;t suitable. But that one isn&#39;t part of &#39;make check&#39=
; either, so this feels like a bridge we&#39;ve never crossed anywhere in t=
he whole source tree.<br></div><div><br></div><div>I have so far abstained =
from introducing such a step into &#39;make check&#39; because it might req=
uire some additional engineering to ensure that I get the temporary directo=
ries all correct, tolerate the different types of builds we do, uses the co=
rrect Python interpreter for all steps, etc.</div><div><br></div><div>So fo=
r now I&#39;ll propose leaving 297 as-is for convenience, but I will start =
working towards finding the right way to include those tests from &#39;make=
 check&#39;. I think there&#39;s no barrier (other than subjectively, beaut=
y) to leaving both avenues in for running the test for the time being. Mayb=
e I will find a way to convince Hanna to accept the interim solution as &qu=
ot;well, not THAT ugly.&quot;<br><br></div><div>Thanks for your input!<br><=
br></div><div>--js<br></div></div></div>

--0000000000005db2f605cd4f83da--


