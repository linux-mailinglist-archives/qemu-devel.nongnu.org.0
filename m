Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F2242400C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 16:26:32 +0200 (CEST)
Received: from localhost ([::1]:34726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY7sM-0000YS-SO
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 10:26:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mY7qS-00089F-9e
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:24:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mY7qP-0007n8-8z
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 10:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633530267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VjJ8zrF9NH1qVhpxJahFLXn0PsFzr27ehYmerNKzqmI=;
 b=CJUU4Y6SraZbcvsaRsZN5WLDGt7DwiN3N6ravkJ3HWu3G6b2vehiCMcIYMkwSTE3zNHKu2
 Nc3yo/bPF0r/ssjyNlGZKi8BOtcraH5H+4ubSiI1q6V4l+Ip+6Rj4OatWSu35umF9J8LN8
 ZNGTHtBeb5QqLYdTsT6nHs9IlZX0FtU=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-DvvEYxPuPHC-nhLv24OrXw-1; Wed, 06 Oct 2021 10:24:25 -0400
X-MC-Unique: DvvEYxPuPHC-nhLv24OrXw-1
Received: by mail-ua1-f71.google.com with SMTP id
 o4-20020ab05944000000b002c9c4d839d1so1440456uad.13
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 07:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VjJ8zrF9NH1qVhpxJahFLXn0PsFzr27ehYmerNKzqmI=;
 b=DfIwgv+fQLvbll7IgaZl3aJrLMC12xEIHlj/Jsp7Scplyh+/lwKiJ++msR1Iq1KAm+
 LWFcI2hr0Py1yglMk/dscVZ5E2W2Ms1HlyOZcFrg8KWFd+JawsTVavX2qxPVLrKBIr27
 PFgv54VriKQ3VvYYjAvfeOIh1AtsEOGIJ7KBoaSFypHlSOUsq68ksgUjSwzk3YXk4RVJ
 ej7tWf9OQgfnY78opUYs6F/DVXXlC/Imd89oY7ALeUBiI5CPhKKV8HARJkAWaRaY0WV9
 rT80myoUVkF2vzMwuBIrJA2DuwvlLIJQ07atYkn3OCFtiEgPFDebneQ7DbALFhD+f/Yq
 /oVA==
X-Gm-Message-State: AOAM533GRLZfi8B5gZ17qHXrDrZTfk97SdEoXp3FyjtM2JaMWvVChFgs
 r39pLvx8vk+ffWpeY1QiMorlZCtTq1RDC1e8uQA1lV4cDh5PgLhzbEVhXUO9uyrXrNIxtxcygLw
 nA42cm0lSWjnaEJbw2BWU4wkNKXrOvjg=
X-Received: by 2002:a67:e10f:: with SMTP id d15mr5964887vsl.40.1633530264663; 
 Wed, 06 Oct 2021 07:24:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx2AZSOg+3WmMZYRKWRJF725QtYxOUwPEa+uUTIFMFyyyxis1mG4bFJ/SxvkZz+MUbKaULLXXymKfI/N4/LtA=
X-Received: by 2002:a67:e10f:: with SMTP id d15mr5964860vsl.40.1633530264447; 
 Wed, 06 Oct 2021 07:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-16-jsnow@redhat.com>
 <aea93f68-68ff-b1d0-4966-869c89e7f707@redhat.com>
In-Reply-To: <aea93f68-68ff-b1d0-4966-869c89e7f707@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 6 Oct 2021 10:24:13 -0400
Message-ID: <CAFn=p-YT_QNNyWc5D5GKoBZncgX-C4a6wULnNerKURL7chTGzw@mail.gmail.com>
Subject: Re: [PATCH v2 15/17] python/aqmp: Create sync QMP wrapper for iotests
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000024846705cdafe7d8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000024846705cdafe7d8
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 6:13 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 23/09/21 02:49, John Snow wrote:
> > This is a wrapper around the async QMPClient that mimics the old,
> > synchronous QEMUMonitorProtocol class. It is designed to be
> > interchangeable with the old implementation.
> >
> > It does not, however, attempt to mimic Exception compatibility.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Acked-by: Hanna Reitz <hreitz@redhat.com>
>
> I don't like the name (of course).  qemu-iotests shows that there is a
> use for sync wrappers so, with similar reasoning to patch 16, there's no
> need to scare people away.  Why not just qemu.aqmp.sync?
>
> Paolo
>
>
I had plans at one point to make a sync.py, but with an interface that
matched async QMP itself more closely. I spent some time trying to research
how to make a "magic" sync wrapper around async QMP, and hit a few trouble
spots. I've still got the patch, but I felt some pressure to try and switch
iotests over as fast as possible to get more trial-by-fire time this
release cycle. I named them "sync.py" and "legacy.py" in my branch
accordingly. Of course, I made a beeline straight for the iotests version,
so now it looks odd. I may yet try to clean up the other version, possibly
converting legacy.py to work in terms of sync.py, and then converting users
in iotests so that I can drop legacy.py.

(Mayyyybe. I am not heavily committed to any one particular approach here,
other than being very motivated to get AQMP tested widely a good bit before
rc0 to have a chance to smooth over any lingering problems that might
exist.)

Thanks for taking a look! I am more than happy to stage 1-9 myself, but I
will wait for Hanna's approval on 10-14 in particular.

--js

--00000000000024846705cdafe7d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 6, 2021 at 6:13 AM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 23=
/09/21 02:49, John Snow wrote:<br>
&gt; This is a wrapper around the async QMPClient that mimics the old,<br>
&gt; synchronous QEMUMonitorProtocol class. It is designed to be<br>
&gt; interchangeable with the old implementation.<br>
&gt; <br>
&gt; It does not, however, attempt to mimic Exception compatibility.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; Acked-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=
=3D"_blank">hreitz@redhat.com</a>&gt;<br>
<br>
I don&#39;t like the name (of course).=C2=A0 qemu-iotests shows that there =
is a <br>
use for sync wrappers so, with similar reasoning to patch 16, there&#39;s n=
o <br>
need to scare people away.=C2=A0 Why not just qemu.aqmp.sync?<br>
<br>
Paolo<br>
<br></blockquote><div><br></div><div>I had plans at one point to make a syn=
c.py, but with an interface that matched async QMP itself more closely. I s=
pent some time trying to research how to make a &quot;magic&quot; sync wrap=
per around async QMP, and hit a few trouble spots. I&#39;ve still got the p=
atch, but I felt some pressure to try and switch iotests over as fast as po=
ssible to get more trial-by-fire time this release cycle. I named them &quo=
t;sync.py&quot; and &quot;legacy.py&quot; in my branch accordingly. Of cour=
se, I made a beeline straight for the iotests version, so now it looks odd.=
 I may yet try to clean up the other version, possibly converting legacy.py=
 to work in terms of sync.py, and then converting users in iotests so that =
I can drop legacy.py.</div><div><br></div><div>(Mayyyybe. I am not heavily =
committed to any one particular approach here, other than being very motiva=
ted to get AQMP tested widely a good bit before rc0 to have a chance to smo=
oth over any lingering problems that might exist.)<br></div><div><br></div>=
<div>Thanks for taking a look! I am more than happy to stage 1-9 myself, bu=
t I will wait for Hanna&#39;s approval on 10-14 in particular.</div><div><b=
r></div><div>--js<br></div><div></div></div></div>

--00000000000024846705cdafe7d8--


