Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B83842535C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:46:20 +0200 (CEST)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSmx-00024I-4e
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mYSkQ-0000Gm-6m
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mYSkL-0006nm-6C
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633610615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Y76jGLsDNCJwC6apj0s1EkThbQ5RJJZweCHRgcxxzU=;
 b=Q5ypbS/wnRi4Jz3ixK4VQuNXSCmcUvRPg2f1t+DD2v52pSgO65cK1Pt5taR0B4KC1Vvq6H
 wKg39qRBreOuuBNfJn18mPoXMZ6JH2dRTpTM1bdm0aKPxb4U0jAKQABzxyR6sek25aRSuk
 vuf6XthRWFFfsdykEbqzn9g2/YLTHUA=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-x_-x5Cu9NbSESid65kun_g-1; Thu, 07 Oct 2021 08:43:32 -0400
X-MC-Unique: x_-x5Cu9NbSESid65kun_g-1
Received: by mail-ua1-f69.google.com with SMTP id
 b20-20020ab05f94000000b002ca067c0203so2935252uaj.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 05:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Y76jGLsDNCJwC6apj0s1EkThbQ5RJJZweCHRgcxxzU=;
 b=aeeDBSZh0yg+7Vnkk0scK6LlLOsJL3a2vl8/6nvnsEqatH2VERj64LBMeQbrantNbB
 svJHHIyx6ru2dD711kFVJZMUWXMi8So320jkVmU/LiI3kMD9+Yxgo34lU1SOorzu0fcW
 lD6N59U2eI5TSxt5NaVoL43SC9vs9TwrjLUWKLXoBtBVTRFu64SYVkZV+xJyQCgUmjKO
 TbUqV5hn9AsJ8N2cWUSk2v++7LfFx+OUzjGA/JeV+/xzCNS3gw8qzCtUltS4RL7q+CwX
 YFcdiS+hZwbiOypRcj7aqF3fxw+NbVhMyfP/yGcyQmZ3f+OisnhgOGO/+i52hCfWDh5u
 0x8A==
X-Gm-Message-State: AOAM533Xl+Aj1odRM+Nwh0CUA5boCRTrDT0s12+KGwTghSzFbIQB8N1N
 +Wn6wm5MwqvwYRClSlhYnqDeQ88wabPF48rlDzkqT9cEusOB45VmfxeaXG3pVJcyjKPr9lm4ov5
 14w5efaR+PZZnJlhZIwLBPTEB8BfcwXk=
X-Received: by 2002:ab0:1111:: with SMTP id e17mr4078541uab.128.1633610611618; 
 Thu, 07 Oct 2021 05:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8jXJD1DRbUjMTtujGfc7qhBZtg5x4fT/3c3SSWhLJtPnzuS/YLx6DFwy20tYshcyMSMXwvgLyWuUcPnrgiXE=
X-Received: by 2002:ab0:1111:: with SMTP id e17mr4078478uab.128.1633610611090; 
 Thu, 07 Oct 2021 05:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFn=p-axq90h+UGa_R2a=LZzXTcjsua3O8xnNvonvFD4ZjwmBQ@mail.gmail.com>
 <YVMeUbGdnsTpwSbD@redhat.com>
 <CAFn=p-ZG6SAVDz-cOtviekvMvibw+ukhYmSOqH7UTrcH-9fCNA@mail.gmail.com>
 <87ee97y3q5.fsf@dusky.pond.sub.org> <YV7Fh2DihM65rgnN@redhat.com>
In-Reply-To: <YV7Fh2DihM65rgnN@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 7 Oct 2021 08:43:20 -0400
Message-ID: <CAFn=p-YRJNEApUUU3btkDJbhx=OSRyFyxbANUGZJy+n8QmS1Kw@mail.gmail.com>
Subject: Re: QAPI sync meeting
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000002cf9a705cdc29cd9"
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002cf9a705cdc29cd9
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 7, 2021 at 6:02 AM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 29.09.2021 um 14:18 hat Markus Armbruster geschrieben:
> > > I'm proposing a one-off here just for some initial discussion and
> planning.
> > > (We didn't have a QAPI BoF at KVM Forum and I'd like something similar
> > > now.) I don't expect we'll really "finish" plotting out a roadmap in a
> > > single 60 minute meeting, but it will probably give us good, targeted
> > > discussions on the ML to follow. If more meetings are desired to
> discuss
> > > specific topics, I'm not against scheduling them as-needed.
> >
> > Let's have one now, and then more as needed.
> >
> > Jumping into the meeting unprepared, then spending half of the alloted
> > time listening to people explaining where they want to take QAPI seems
> > like a bad use of our time.  Better: write it up and post it, so we can
> > all read before we meet.  Do not reply, except perhaps to ask for
> > clarification.  Discuss in the meeting.
> >
> > I can see such posts from Marc-Andre, Kevin, and Daniel.  Some of them
> > could use a bit more detail, perhaps.
>
> To be a bit more specific and give more details about what I'm currently
> working on:
>
> * The larger theme is command line QAPIfication, with the eventual goals
>   of having introspection and a config file.
>
> * Support for member aliases: This provides a way to bridge much of the
>   gap between command line and QMP syntax. Markus tells me that it's
>   unclear yet whether we want this in both QMP and CLI (unlikely for
>   now), just CLI or not at all.
>
>   First posted in November 2020, latest version is v4:
>   https://patchew.org/QEMU/20210917161320.201086-1-kwolf@redhat.com/
>
>   * Does anyone apart from myself have additional uses for aliases that
>     should be considered in the evaluation of the feature?
>
>   * -chardev: I have patches that QAPIfy the option based on aliases,
>     getting rid of the old handwritten parser that is inconsistent with
>     QMP in non-obvious ways and replacing it with translation to QMP
>     (both using aliases and a little C code) that makes the differences
>     obvious.
>
>     First posted in November 2020, more details in the cover letter:
>     https://patchew.org/QEMU/20201112175905.404472-1-kwolf@redhat.com/
>
>     Later versions (not yet posted as a series because I'm waiting for
>     aliases) also make -chardev accept JSON syntax, which is what
>     libvirt really wants to use.
>
>   * Came up during the discussion of the patches:
>     Maybe we should actually start defining some command line options in
>     the schema now, even if many options will still have to defer to the
>     old parsing code. But it would be a start, could set an example for
>     any new options and provides a clear path to incrementally convert
>     everything. If we don't even start, we're sure to never finish it.
>
> * -object: First part is done, we have a full QAPI schema of all
>   user-creatable objects. object-add and --object in tools go through
>   pure QAPI paths. System emulator -object is still based on QemuOpts
>   because of compatibility concerns with list hacks (affects one single
>   property of one object), but JSON syntax has been added that goes
>   straight to QAPI.
>
>   Next part is actual integration of QOM with QAPI so that the
>   configuration isn't duplicated between QOM code and the schema, but
>   user-creatable QOM classes are defined and QOM boilerplate is
>   generated from the schema. I've started looking into this, but still
>   in an early stage.
>
> * -device/device-add: This is in a terrible state all around. Even QMP
>   device-add is based on QemuOpts, and libvirt makes use of this by
>   passes everything as strings instead of the proper types.
>
>   Peter Krempa is working on using the proper types in libvirt.
>
>   I sent patches to at least add a JSON variant for the command line
>   option -device which is a non-QemuOpts code path. It also tried to fix
>   device-add to be type safe, but until libvirt is fixed, we must stay
>   bug compatible. So for this and other reasons this is not ready yet
>   and needs a v2.
>   https://patchew.org/QEMU/20210924090427.9218-1-kwolf@redhat.com/
>
>   Full QAPIfication with a schema and introspection will still take a
>   while. The QOM/QAPI integration work mentioned above is a dependency
>   there. A schema like for object-add, with a big union of all possible
>   devices, just doesn't scale.
>
>   Having JSON CLI and a non-QemuOpts QMP command allow us to make the
>   traditional syntax unstable (HMP-like support) and should be very
>   helpful when we eventually do get to do proper QAPIfication.
>
>   * Should we have a general rule that for command line options that
>     accept both JSON and a human format, only JSON is considered a
>     stable API and the human format works more like HMP?
>
> Also one non-technical topic that may or may not be worth discussing:
>
> * Patches to QAPI tend to take a long time to be merged (or rejected).
>   This is understandable as a lot of things are going on and QAPI is an
>   external interface with compatibility promises, so we need to be
>   careful. Can we still still do anything to improve the situation? For
>   example, can the load be spread across more people?
>
> Kevin
>
>
I'll drop by and leave an extremely crude summary here; I had a monster
headache all day yesterday that has still not left me, my apologies for
this being a bit close to the wire:

My main motivators for QAPI are:

(1) A QEMU config file that is ultimately backed by the same schema as QMP.

Ideally, this config file would have intellisense syntax support in e.g.
pycharm/vscode. There is a large repository of "config file schemas" online
used for auto-complete and intellisense for various YAML/JSON configuration
files. I started researching this option around last year, for KVM Forum. I
began by giving a presentation on the state of the CLI as it existed at the
time, and submitted a demo that involved a very crudely hacked up
"x-configure" QMP command that re-routed to the CLI parser. It worked only
because I was fairly aggressive about removing a good number of CLI
arguments.

I consider this important for ease-of-use and discoverability reasons.

(2) The unification of QAPI and QDEV

There are numerous spots in the API where we stub out to an 'Any' type,
because the actual type information is in qdev or open-coded in various
device functions. In order to support the above goal, I see the unification
of the two dynamic systems as necessary for producing significantly
improved static schema that will facilitate users in discovering and using
QEMU's features.

This goal serves primarily as reinforcement for the first.

(3) The generation of an improved QAPI index in the Sphinx ReST docs.

At present, we do not have cross-references for QMP commands, events,
enums, structs, arguments, etc. I wrote a prototype "QAPI Domain" plugin
for Sphinx earlier this year, but there is work remaining to integrate it
to the current QAPIDoc class in the QAPI generator. In essence, I have a
"new" syntax that works to accomplish this goal, but I don't have a
translator from the old to new syntax yet. I also do not have much of the
error checking that we'd want to enforce layout, style, etc.

This will help further bolster the discoverability and ease of use for our
API. It will allow me to write ReST documents that natively cross-reference
the exact commands and structures I am talking about elsewhere in the docs.
It will allow me to reference QMP command documentation from Python
docstrings, for instance, which would be very nice for a Python SDK ...

(4) Libraries and SDKs for Python, Golang, and rust.

I've been working on the Python angle here, because we already have all of
the pieces for a python library. I want to package them and release them on
PyPI as developer tooling and "advanced user" tooling. Not something meant
to replace libvirt, but instead just well-supported, minimalist FOSS
tooling that allows you to drive and experiment with cutting-edge features
of QEMU. The intended audience is power users and developers of other
software that consumes QEMU. I have noticed many projects that wind up
relying on QEMU tend to reimplement the same code (sometimes poorly) over
and over again -- I want to provide a bit more first class support to our
API.

To this end, I've spent the last year cleaning up our Python code quite a
bit, including adding documentation and static typing to the QAPI generator
itself, in the hopes that this will facilitate adding new languages and
generators. I've also recently checked in a new version of the python QMP
library; if it tests well this release cycle I am hoping to release it on
PyPI this year.

--0000000000002cf9a705cdc29cd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 6:02 AM Kevin =
Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 29.09.2021 =
um 14:18 hat Markus Armbruster geschrieben:<br>
&gt; &gt; I&#39;m proposing a one-off here just for some initial discussion=
 and planning.<br>
&gt; &gt; (We didn&#39;t have a QAPI BoF at KVM Forum and I&#39;d like some=
thing similar<br>
&gt; &gt; now.) I don&#39;t expect we&#39;ll really &quot;finish&quot; plot=
ting out a roadmap in a<br>
&gt; &gt; single 60 minute meeting, but it will probably give us good, targ=
eted<br>
&gt; &gt; discussions on the ML to follow. If more meetings are desired to =
discuss<br>
&gt; &gt; specific topics, I&#39;m not against scheduling them as-needed.<b=
r>
&gt; <br>
&gt; Let&#39;s have one now, and then more as needed.<br>
&gt; <br>
&gt; Jumping into the meeting unprepared, then spending half of the alloted=
<br>
&gt; time listening to people explaining where they want to take QAPI seems=
<br>
&gt; like a bad use of our time.=C2=A0 Better: write it up and post it, so =
we can<br>
&gt; all read before we meet.=C2=A0 Do not reply, except perhaps to ask for=
<br>
&gt; clarification.=C2=A0 Discuss in the meeting.<br>
&gt; <br>
&gt; I can see such posts from Marc-Andre, Kevin, and Daniel.=C2=A0 Some of=
 them<br>
&gt; could use a bit more detail, perhaps.<br>
<br>
To be a bit more specific and give more details about what I&#39;m currentl=
y<br>
working on:<br>
<br>
* The larger theme is command line QAPIfication, with the eventual goals<br=
>
=C2=A0 of having introspection and a config file.<br>
<br>
* Support for member aliases: This provides a way to bridge much of the<br>
=C2=A0 gap between command line and QMP syntax. Markus tells me that it&#39=
;s<br>
=C2=A0 unclear yet whether we want this in both QMP and CLI (unlikely for<b=
r>
=C2=A0 now), just CLI or not at all.<br>
<br>
=C2=A0 First posted in November 2020, latest version is v4:<br>
=C2=A0 <a href=3D"https://patchew.org/QEMU/20210917161320.201086-1-kwolf@re=
dhat.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20=
210917161320.201086-1-kwolf@redhat.com/</a><br>
<br>
=C2=A0 * Does anyone apart from myself have additional uses for aliases tha=
t<br>
=C2=A0 =C2=A0 should be considered in the evaluation of the feature?<br>
<br>
=C2=A0 * -chardev: I have patches that QAPIfy the option based on aliases,<=
br>
=C2=A0 =C2=A0 getting rid of the old handwritten parser that is inconsisten=
t with<br>
=C2=A0 =C2=A0 QMP in non-obvious ways and replacing it with translation to =
QMP<br>
=C2=A0 =C2=A0 (both using aliases and a little C code) that makes the diffe=
rences<br>
=C2=A0 =C2=A0 obvious.<br>
<br>
=C2=A0 =C2=A0 First posted in November 2020, more details in the cover lett=
er:<br>
=C2=A0 =C2=A0 <a href=3D"https://patchew.org/QEMU/20201112175905.404472-1-k=
wolf@redhat.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/=
QEMU/20201112175905.404472-1-kwolf@redhat.com/</a><br>
<br>
=C2=A0 =C2=A0 Later versions (not yet posted as a series because I&#39;m wa=
iting for<br>
=C2=A0 =C2=A0 aliases) also make -chardev accept JSON syntax, which is what=
<br>
=C2=A0 =C2=A0 libvirt really wants to use.<br>
<br>
=C2=A0 * Came up during the discussion of the patches:<br>
=C2=A0 =C2=A0 Maybe we should actually start defining some command line opt=
ions in<br>
=C2=A0 =C2=A0 the schema now, even if many options will still have to defer=
 to the<br>
=C2=A0 =C2=A0 old parsing code. But it would be a start, could set an examp=
le for<br>
=C2=A0 =C2=A0 any new options and provides a clear path to incrementally co=
nvert<br>
=C2=A0 =C2=A0 everything. If we don&#39;t even start, we&#39;re sure to nev=
er finish it.<br>
<br>
* -object: First part is done, we have a full QAPI schema of all<br>
=C2=A0 user-creatable objects. object-add and --object in tools go through<=
br>
=C2=A0 pure QAPI paths. System emulator -object is still based on QemuOpts<=
br>
=C2=A0 because of compatibility concerns with list hacks (affects one singl=
e<br>
=C2=A0 property of one object), but JSON syntax has been added that goes<br=
>
=C2=A0 straight to QAPI.<br>
<br>
=C2=A0 Next part is actual integration of QOM with QAPI so that the<br>
=C2=A0 configuration isn&#39;t duplicated between QOM code and the schema, =
but<br>
=C2=A0 user-creatable QOM classes are defined and QOM boilerplate is<br>
=C2=A0 generated from the schema. I&#39;ve started looking into this, but s=
till<br>
=C2=A0 in an early stage.<br>
<br>
* -device/device-add: This is in a terrible state all around. Even QMP<br>
=C2=A0 device-add is based on QemuOpts, and libvirt makes use of this by<br=
>
=C2=A0 passes everything as strings instead of the proper types.<br>
<br>
=C2=A0 Peter Krempa is working on using the proper types in libvirt.<br>
<br>
=C2=A0 I sent patches to at least add a JSON variant for the command line<b=
r>
=C2=A0 option -device which is a non-QemuOpts code path. It also tried to f=
ix<br>
=C2=A0 device-add to be type safe, but until libvirt is fixed, we must stay=
<br>
=C2=A0 bug compatible. So for this and other reasons this is not ready yet<=
br>
=C2=A0 and needs a v2.<br>
=C2=A0 <a href=3D"https://patchew.org/QEMU/20210924090427.9218-1-kwolf@redh=
at.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/2021=
0924090427.9218-1-kwolf@redhat.com/</a><br>
<br>
=C2=A0 Full QAPIfication with a schema and introspection will still take a<=
br>
=C2=A0 while. The QOM/QAPI integration work mentioned above is a dependency=
<br>
=C2=A0 there. A schema like for object-add, with a big union of all possibl=
e<br>
=C2=A0 devices, just doesn&#39;t scale.<br>
<br>
=C2=A0 Having JSON CLI and a non-QemuOpts QMP command allow us to make the<=
br>
=C2=A0 traditional syntax unstable (HMP-like support) and should be very<br=
>
=C2=A0 helpful when we eventually do get to do proper QAPIfication.<br>
<br>
=C2=A0 * Should we have a general rule that for command line options that<b=
r>
=C2=A0 =C2=A0 accept both JSON and a human format, only JSON is considered =
a<br>
=C2=A0 =C2=A0 stable API and the human format works more like HMP?<br>
<br>
Also one non-technical topic that may or may not be worth discussing:<br>
<br>
* Patches to QAPI tend to take a long time to be merged (or rejected).<br>
=C2=A0 This is understandable as a lot of things are going on and QAPI is a=
n<br>
=C2=A0 external interface with compatibility promises, so we need to be<br>
=C2=A0 careful. Can we still still do anything to improve the situation? Fo=
r<br>
=C2=A0 example, can the load be spread across more people?<br>
<br>
Kevin<br>
<br></blockquote><div><br></div><div>I&#39;ll drop by and leave an extremel=
y crude summary here; I had a monster headache all day yesterday that has s=
till not left me, my apologies for this being a bit close to the wire:<br><=
/div><div><br></div><div>My main motivators for QAPI are:</div><div><br></d=
iv><div>(1) A QEMU config file that is ultimately backed by the same schema=
 as QMP.</div><div><br></div><div>Ideally, this config file would have inte=
llisense syntax support in e.g. pycharm/vscode. There is a large repository=
 of &quot;config file schemas&quot; online used for auto-complete and intel=
lisense for various YAML/JSON configuration files. I started researching th=
is option around last year, for KVM Forum. I began by giving a presentation=
 on the state of the CLI as it existed at the time, and submitted a demo th=
at involved a very crudely hacked up &quot;x-configure&quot; QMP command th=
at re-routed to the CLI parser. It worked only because I was fairly aggress=
ive about removing a good number of CLI arguments.</div><div><br></div><div=
>I consider this important for ease-of-use and discoverability reasons.<br>=
</div><div><br></div><div>(2) The unification of QAPI and QDEV</div><div><b=
r></div><div>There are numerous spots in the API where we stub out to an &#=
39;Any&#39; type, because the actual type information is in qdev or open-co=
ded in various device functions. In order to support the above goal, I see =
the unification of the two dynamic systems as necessary for producing signi=
ficantly improved static schema that will facilitate users in discovering a=
nd using QEMU&#39;s features.</div><div><br></div><div>This goal serves pri=
marily as reinforcement for the first.<br></div><div><br></div><div>(3) The=
 generation of an improved QAPI index in the Sphinx ReST docs.</div><div><b=
r></div><div>At present, we do not have cross-references for QMP commands, =
events, enums, structs, arguments, etc. I wrote a prototype &quot;QAPI Doma=
in&quot; plugin for Sphinx earlier this year, but there is work remaining t=
o integrate it to the current QAPIDoc class in the QAPI generator. In essen=
ce, I have a &quot;new&quot; syntax that works to accomplish this goal, but=
 I don&#39;t have a translator from the old to new syntax yet. I also do no=
t have much of the error checking that we&#39;d want to enforce layout, sty=
le, etc.</div><div><br></div><div>This will help further bolster the discov=
erability and ease of use for our API. It will allow me to write ReST docum=
ents that natively cross-reference the exact commands and structures I am t=
alking about elsewhere in the docs. It will allow me to reference QMP comma=
nd documentation from Python docstrings, for instance, which would be very =
nice for a Python SDK ...<br></div><div><br></div><div>(4) Libraries and SD=
Ks for Python, Golang, and rust.</div><div><br></div><div>I&#39;ve been wor=
king on the Python angle here, because we already have all of the pieces fo=
r a python library. I want to package them and release them on PyPI as deve=
loper tooling and &quot;advanced user&quot; tooling. Not something meant to=
 replace libvirt, but instead just well-supported, minimalist FOSS tooling =
that allows you to drive and experiment with cutting-edge features of QEMU.=
 The intended audience is power users and developers of other software that=
 consumes QEMU. I have noticed many projects that wind up relying on QEMU t=
end to reimplement the same code (sometimes poorly) over and over again -- =
I want to provide a bit more first class support to our API.</div><div><br>=
</div><div>To this end, I&#39;ve spent the last year cleaning up our Python=
 code quite a bit, including adding documentation and static typing to the =
QAPI generator itself, in the hopes that this will facilitate adding new la=
nguages and generators. I&#39;ve also recently checked in a new version of =
the python QMP library; if it tests well this release cycle I am hoping to =
release it on PyPI this year.</div><div><br></div><div><br></div></div></di=
v>

--0000000000002cf9a705cdc29cd9--


