Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88A542410A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:14:37 +0200 (CEST)
Received: from localhost ([::1]:46154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8cu-0005Zi-IP
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mY8ao-0004VY-SH
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:12:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mY8al-0000nV-Ug
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633533138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gMqkshiveGLey9h8iWTQeAvcE0rp8v6xZ9FszZpK4ac=;
 b=al5VgjwEMQyMHd148To8BJ2NRT5bJmX7aWyTjpsdVdgo+jyzprRTTt55CfAvJEHd4zP9pa
 oJSnD4/rE1aNOz8YkWHuBkLehFbAt1h79tGou1kjMxrFhLeir4ekC0uWkuJMGT02ii6J3N
 scW0hDumqTa8sjUub8PG2u0/US+i2Eg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-F1kAYqb7P_OoFhPrDNhK1A-1; Wed, 06 Oct 2021 11:12:15 -0400
X-MC-Unique: F1kAYqb7P_OoFhPrDNhK1A-1
Received: by mail-ua1-f69.google.com with SMTP id
 u17-20020ab069d1000000b002ca4a5dd6c1so483813uaq.6
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gMqkshiveGLey9h8iWTQeAvcE0rp8v6xZ9FszZpK4ac=;
 b=7QO2Ad4G18T7ySMAdsQxClV6S9ybe8RK/hxHm8DYq4vL0sqX1ZFVGO+7h7mADpq+Qq
 CRMHswGKaf9w0BZbKhD6Um4OLord/ua5rpDeo41S7H5We8m3zCnNh7shC7GV8SRzxPfG
 oVhmB51FT/9y4xRvPQUYKyufhIAVRgUn4YuWubzWHcgujEXRLOgOctM1T0O0VMW4CZ9w
 B3bpkS7FsW0P1eG/b8e/uqBYZ4YLN1zLkbwA+bGEUCr8CNQqp0fN5Ecp13MsCL7JYJxa
 g9MBuu2EPZFkBPJbxxLSpM/FQl1YdKkgIVpMI7CwPQ2gv4jiemYxLbG1UMGfgWpqzgTC
 aSNw==
X-Gm-Message-State: AOAM533cGKO73fb1ZJbh6KbY/CYboRz4sFMyDIuAlxbLHTxphay35M5z
 /nLcAEmLiMxobo4CyokQHOAIrw4jOmNfRh+c+6TvrxXX++7dsUQS7/LkOj2Xi6LnTKhBzycu9CQ
 av6/O+N8AoesqnNmQPGDrB6jr0JKO/9U=
X-Received: by 2002:a67:f685:: with SMTP id n5mr25191678vso.31.1633533135317; 
 Wed, 06 Oct 2021 08:12:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8MBac7FKw6cPO0DK9FM1/6qjteA5Ooy9lLkS5S6I9DfDBOhHegpCkJUtvhJooqH0UaQ7KPsIxJZdamOH9nvg=
X-Received: by 2002:a67:f685:: with SMTP id n5mr25191660vso.31.1633533135164; 
 Wed, 06 Oct 2021 08:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-16-jsnow@redhat.com>
 <aea93f68-68ff-b1d0-4966-869c89e7f707@redhat.com>
 <CAFn=p-YT_QNNyWc5D5GKoBZncgX-C4a6wULnNerKURL7chTGzw@mail.gmail.com>
 <1b31dc76-c124-be62-340e-00bc85e4c819@redhat.com>
In-Reply-To: <1b31dc76-c124-be62-340e-00bc85e4c819@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 6 Oct 2021 11:12:04 -0400
Message-ID: <CAFn=p-YO0Xs_AAXzDfKb+KeAZYtt4jnLNVtV9zfycdm-XTknHg@mail.gmail.com>
Subject: Re: [PATCH v2 15/17] python/aqmp: Create sync QMP wrapper for iotests
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000402ae905cdb09281"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

--000000000000402ae905cdb09281
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 10:32 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 06/10/21 16:24, John Snow wrote:
> >
> > I had plans at one point to make a sync.py, but with an interface that
> > matched async QMP itself more closely. I spent some time trying to
> > research how to make a "magic" sync wrapper around async QMP, and hit a
> > few trouble spots. I've still got the patch, but I felt some pressure to
> > try and switch iotests over as fast as possible to get more
> > trial-by-fire time this release cycle. I named them "sync.py" and
> > "legacy.py" in my branch accordingly. Of course, I made a beeline
> > straight for the iotests version, so now it looks odd. I may yet try to
> > clean up the other version, possibly converting legacy.py to work in
> > terms of sync.py, and then converting users in iotests so that I can
> > drop legacy.py.
>
> Got it.  So maybe aqmp.qmp_next or aqmp.qmp_experimental?  What I mean
> is, it's all but legacy. :)
>
>
Mmm, yeah I guess I meant "legacy interface" and not "legacy
implementation" ;)

I could do 'compat.py' for the iotests-compatible interface and 'sync.py'
for the "modern" one?

--js

--000000000000402ae905cdb09281
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 6, 2021 at 10:32 AM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 0=
6/10/21 16:24, John Snow wrote:<br>
&gt; <br>
&gt; I had plans at one point to make a sync.py, but with an interface that=
 <br>
&gt; matched async QMP itself more closely. I spent some time trying to <br=
>
&gt; research how to make a &quot;magic&quot; sync wrapper around async QMP=
, and hit a <br>
&gt; few trouble spots. I&#39;ve still got the patch, but I felt some press=
ure to <br>
&gt; try and switch iotests over as fast as possible to get more <br>
&gt; trial-by-fire time this release cycle. I named them &quot;sync.py&quot=
; and <br>
&gt; &quot;legacy.py&quot; in my branch accordingly. Of course, I made a be=
eline <br>
&gt; straight for the iotests version, so now it looks odd. I may yet try t=
o <br>
&gt; clean up the other version, possibly converting legacy.py to work in <=
br>
&gt; terms of sync.py, and then converting users in iotests so that I can <=
br>
&gt; drop legacy.py.<br>
<br>
Got it.=C2=A0 So maybe aqmp.qmp_next or aqmp.qmp_experimental?=C2=A0 What I=
 mean <br>
is, it&#39;s all but legacy. :)<br>
<br></blockquote><div><br></div><div>Mmm, yeah I guess I meant &quot;legacy=
 interface&quot; and not &quot;legacy implementation&quot; ;)</div><div><br=
></div><div>I could do &#39;compat.py&#39; for the iotests-compatible inter=
face and &#39;sync.py&#39; for the &quot;modern&quot; one?</div><div><br></=
div><div>--js<br></div></div></div>

--000000000000402ae905cdb09281--


