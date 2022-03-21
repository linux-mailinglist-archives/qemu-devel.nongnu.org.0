Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200BC4E2EA0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:59:13 +0100 (CET)
Received: from localhost ([::1]:44682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLN9-0007sU-Q7
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:59:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWLLa-0006mr-6H
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:57:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWLLV-0001wz-O8
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647881847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZdmYds06cXJ0Y+t815TzoNhW3lwCFbDSC0puq3bJ/Ow=;
 b=QFp0m7z6vepDdVQfiKRCQIfMbQJd7tkcBAMcQRB5ou8ORVBLknx4W3awLWByqUSwLFs7il
 3dW6HO4h4tq/by7bsIYM1MjkrBUSvwU15tJ8OxZ+OVkOEYidfIimMOi1kzkhiMZP25nw+N
 8qecjD0/wHWCXe2dey7a6g2lTI9G9BI=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-Td_ObUVTN-ybr2Wb65cwOA-1; Mon, 21 Mar 2022 12:57:25 -0400
X-MC-Unique: Td_ObUVTN-ybr2Wb65cwOA-1
Received: by mail-ua1-f70.google.com with SMTP id
 s13-20020a056130020d00b0034dfb85694dso6431522uac.2
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZdmYds06cXJ0Y+t815TzoNhW3lwCFbDSC0puq3bJ/Ow=;
 b=n/eQ8B8dz3o6FurG0mA8dfdgaSdysirdsMN6N6yP6NB7ebceNtHVfI9cU7gSf1L36c
 S3hQWMZS+QJuE7cmbrP/HtFDQe1wzGNcMeplkIek4x2rPzzehpV+Repczep5H5hDvHwe
 jpKU/L5APi78YyXBH5rUKs6wEyFM7FkV175RXDGifSQqdRMrN8q0vaSU16SreOxavUpi
 3UzzILcuTC+Zk8FvOtZ+jOf8QBRkJiWAP0k/E4dtxUZE/HaVXmuU0NvAKcWtYwkOj5qj
 +hsnrZ/Xq+Ybd5HT7FAWgL0AcDzEg0qYE+ZYS8Zh/t2dfNSHdA0dQAXj6DuEdlA/NXx+
 lU7A==
X-Gm-Message-State: AOAM530CVT5XNV70w2qAhr8xn0dWF7FF5WOG8Js9lTwxcmJS8REQGUGy
 XaWPpOYsFeEGx5/XFrIZi62xXotFeJ8VvnXWj3YGHjPG0/pnz5aCC4yO2MZi6IXHZ9ioB7PFS+U
 I9vdjp1ov/Ao2ra+PD4naSTuyFF+08Fg=
X-Received: by 2002:a05:6122:a11:b0:33f:c7d:8040 with SMTP id
 17-20020a0561220a1100b0033f0c7d8040mr2282375vkn.1.1647881843903; 
 Mon, 21 Mar 2022 09:57:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXJHP6lJc5no5ays7z3slxlpLodc/jPZuOYyGK0UkddKIuX2NSp36D9BtLYDfvyq0DQGV8ObV0bBGWhZWsNNQ=
X-Received: by 2002:a05:6122:a11:b0:33f:c7d:8040 with SMTP id
 17-20020a0561220a1100b0033f0c7d8040mr2282364vkn.1.1647881843659; Mon, 21 Mar
 2022 09:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-7-jsnow@redhat.com>
 <20220321152902.tasnzpwo7b4ufqaa@redhat.com>
In-Reply-To: <20220321152902.tasnzpwo7b4ufqaa@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 21 Mar 2022 12:57:13 -0400
Message-ID: <CAFn=p-bU6aemFpu_HvbzDmCrWfpmVVQuujS8HbZ1gKiFow9xhQ@mail.gmail.com>
Subject: Re: [PATCH 06/15] iotests: rebase qemu_io() on top of qemu_tool()
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ec6c7005dabd6327"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ec6c7005dabd6327
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022, 11:29 AM Eric Blake <eblake@redhat.com> wrote:

> On Fri, Mar 18, 2022 at 04:36:46PM -0400, John Snow wrote:
> > Rework qemu_io() to be analogous to qemu_img(); a function that requires
> > a return code of zero by default unless disabled explicitly.
> >
> > Tests that use qemu_io():
> > 030 040 041 044 055 056 093 124 129 132 136 148 149 151 152 163 165 205
> > 209 219 236 245 248 254 255 257 260 264 280 298 300 302 304
> > image-fleecing migrate-bitmaps-postcopy-test migrate-bitmaps-test
> > migrate-during-backup migration-permissions
> >
> > Test that use qemu_io_log():
> > 242 245 255 274 303 307 nbd-reconnect-on-open
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > ---
> >
> > Note: This breaks several tests at this point. I'll be fixing each
> > broken test one by one in the subsequent commits. We can squash them all
> > on merge to avoid test regressions.
> >
> > (Seems like a way to have your cake and eat it too with regards to
> > maintaining bisectability while also having nice mailing list patches.)
>
> Interesting approach; it does appear to have made reviewing a bit
> easier, so thanks for trying it.
>
> I'll withhold actual R-b until the last squashed patch, but so far, I
> haven't seen anything that causes me grief other than the lack of
> bisectability that you already have documented how it will be
> addressed.  [less wordy - this patch is incomplete, as advertised, but
> looks good]
>

Meta chat about QEMU patch process:

I have to admit that I often "work backwards" and I prototype things by
just making a function behave like how I want it to, and then I try and
measure how many things broke post-hoc and use that to decide if the
refactoring is even tractable.

Often the slowest part of writing a series for me is breaking apart the
"WIP" commit into a series of smaller steps that don't break the bisect.

Sometimes this even involves a complete rewrite of an intermediate data
structure to handle the in-between step.

It feels like a lot of work just to delete it several commits later,
sometimes. I realize giant merge commits are tough to backport, but
sometimes I really just get stumped on how to not create twice as much work
for myself just to arrive at an end point I've already arrived at.

Of course, making things like this reviewable is a primary concern too.

I'm not sure I'm an advocate of the squash-on-merge school of thought
entirely, but maybe it's not so bad to use it sparingly, sometimes. I find
keeping mini-commits separate can sometimes help me iterate on the design
of a series quicker, too.

In this case, I did try to position fixes that would work independently of
the switch ahead of the pivot, but I couldn't quite get everything. Most of
what's left is really just cases where the return type matters.

Eh.

This is definitely "Software Engineering" and not "Computer Science".

Thanks for taking a look.


> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--000000000000ec6c7005dabd6327
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Mar 21, 2022, 11:29 AM Eric Blake &lt;<a href=
=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On Fri, Mar 18, 2022 at 04:36:46PM -0400, John =
Snow wrote:<br>
&gt; Rework qemu_io() to be analogous to qemu_img(); a function that requir=
es<br>
&gt; a return code of zero by default unless disabled explicitly.<br>
&gt; <br>
&gt; Tests that use qemu_io():<br>
&gt; 030 040 041 044 055 056 093 124 129 132 136 148 149 151 152 163 165 20=
5<br>
&gt; 209 219 236 245 248 254 255 257 260 264 280 298 300 302 304<br>
&gt; image-fleecing migrate-bitmaps-postcopy-test migrate-bitmaps-test<br>
&gt; migrate-during-backup migration-permissions<br>
&gt; <br>
&gt; Test that use qemu_io_log():<br>
&gt; 242 245 255 274 303 307 nbd-reconnect-on-open<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; <br>
&gt; Note: This breaks several tests at this point. I&#39;ll be fixing each=
<br>
&gt; broken test one by one in the subsequent commits. We can squash them a=
ll<br>
&gt; on merge to avoid test regressions.<br>
&gt; <br>
&gt; (Seems like a way to have your cake and eat it too with regards to<br>
&gt; maintaining bisectability while also having nice mailing list patches.=
)<br>
<br>
Interesting approach; it does appear to have made reviewing a bit<br>
easier, so thanks for trying it.<br>
<br>
I&#39;ll withhold actual R-b until the last squashed patch, but so far, I<b=
r>
haven&#39;t seen anything that causes me grief other than the lack of<br>
bisectability that you already have documented how it will be<br>
addressed.=C2=A0 [less wordy - this patch is incomplete, as advertised, but=
<br>
looks good]<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Meta chat about QEMU patch process:</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">I have to admit that I often &quot;work backwards&qu=
ot; and I prototype things by just making a function behave like how I want=
 it to, and then I try and measure how many things broke post-hoc and use t=
hat to decide if the refactoring is even tractable.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Often the slowest part of writing a series for =
me is breaking apart the &quot;WIP&quot; commit into a series of smaller st=
eps that don&#39;t break the bisect.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Sometimes this even involves a complete rewrite of an intermed=
iate data structure to handle the in-between step.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">It feels like a lot of work just to delete it se=
veral commits later, sometimes. I realize giant merge commits are tough to =
backport, but sometimes I really just get stumped on how to not create twic=
e as much work for myself just to arrive at an end point I&#39;ve already a=
rrived at.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Of course, ma=
king things like this reviewable is a primary concern too.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I&#39;m not sure I&#39;m an advocate of =
the squash-on-merge school of thought entirely, but maybe it&#39;s not so b=
ad to use it sparingly, sometimes. I find keeping mini-commits separate can=
 sometimes help me iterate on the design of a series quicker, too.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">In this case, I did try to posit=
ion fixes that would work independently of the switch ahead of the pivot, b=
ut I couldn&#39;t quite get everything. Most of what&#39;s left is really j=
ust cases where the return type matters.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Eh.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thi=
s is definitely &quot;Software Engineering&quot; and not &quot;Computer Sci=
ence&quot;.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks for t=
aking a look.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D=
"noreferrer noreferrer" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div></div></div>

--000000000000ec6c7005dabd6327--


