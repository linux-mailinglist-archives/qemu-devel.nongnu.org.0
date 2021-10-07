Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB653425874
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:51:57 +0200 (CEST)
Received: from localhost ([::1]:56204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWcf-0005zw-0o
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mYWLf-0008Iw-HW
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mYWLc-00038U-EI
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633624459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9YmHL30ZVhVfHYGZ2B5KZWremm1v34xMHQFk5YopLo8=;
 b=ijJE++ZgNvh9BCVg8ws0MCeTOqt/qamLJn0UMbt8k8E4p5/GO3QdNBGA/bKfwYI8ys4ap8
 Z2AvzY16tjESoY2y9ko0y5OVrZA+dxxst4bx3n1NMjtTA90gdbqfCghrNGDShUI4QP1iPO
 gElo9JD+Pep7tSvlFSJgYzTVucXcYxc=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-BfmSWzddMcehJVDrAQ_68A-1; Thu, 07 Oct 2021 12:34:18 -0400
X-MC-Unique: BfmSWzddMcehJVDrAQ_68A-1
Received: by mail-ua1-f72.google.com with SMTP id
 o4-20020ab05944000000b002c9c4d839d1so3228158uad.13
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9YmHL30ZVhVfHYGZ2B5KZWremm1v34xMHQFk5YopLo8=;
 b=qwSN0qbXcNNyIyNLeO3cuBEKpVp/3ew35kq3TLc6uxwFxeQqlUjNUoZ3bo5yy/YoYy
 R2SWy6C0FYqU2DYOlUnJl+hrh1JztnhJs2PAt7TVkZhBB2m5fxkkNbII12g0z05ivdMR
 yAyJOkyQO+eveZ4c6+79jlKYSodLCf5i0FegPvYsufopgdoYRb6KNtpDpkP/JRlAweEp
 jc8RHrzi1UOJ2/JKVipQDdmLIuAdaBo0PhZKt8r2hXerqPmBF3ACOM7wNnKGx0uvxBWU
 78LDh22HjY6POHeZb7fI4Qej9HdDHyaQZ5guVQ06fRHPXJNn29yBkP0bussHXwIlaSfb
 4y7g==
X-Gm-Message-State: AOAM531LQXPohvLUEdbV0V2/YwQ5tPC9NfBf/XHF+x2wU6oyxnLCk86w
 CNAEnIiUcQA1MBqYCj51bqcLq0RwybZ7FYaub1YNF3BTPEnEs3YDdYSEr0oRs67JHymlMcJxraD
 IpY/f1WJbo2ab1hiT9iwvxG5sOuqljnY=
X-Received: by 2002:a1f:e946:: with SMTP id g67mr4778569vkh.10.1633624456920; 
 Thu, 07 Oct 2021 09:34:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlZh9Z7KM91MV2O+f/YsDk8IrNuVBr8smJKoUXsUeLXnk13C3KsN3K5TggnVlD/MGjypALTYnBTzbgbwxlZjI=
X-Received: by 2002:a1f:e946:: with SMTP id g67mr4778373vkh.10.1633624455246; 
 Thu, 07 Oct 2021 09:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210923004938.3999963-1-jsnow@redhat.com>
 <20210923004938.3999963-13-jsnow@redhat.com>
 <20211007150751.at6pwvncgwk5koaz@redhat.com>
In-Reply-To: <20211007150751.at6pwvncgwk5koaz@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 7 Oct 2021 12:34:04 -0400
Message-ID: <CAFn=p-Zq1TRMd1of0yUU0XuysOKyS2gR8MwxQNu_PVrrGm=+WA@mail.gmail.com>
Subject: Re: [PATCH v2 12/17] python/machine: Handle QMP errors on close more
 meticulously
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005a0a8505cdc5d5f7"
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

--0000000000005a0a8505cdc5d5f7
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 7, 2021 at 11:08 AM Eric Blake <eblake@redhat.com> wrote:

> On Wed, Sep 22, 2021 at 08:49:33PM -0400, John Snow wrote:
> > To use the AQMP backend, Machine just needs to be a little more diligent
> > about what happens when closing a QMP connection. The operation is no
> > longer a freebie in the async world; it may return errors encountered in
> > the async bottom half on incoming message receipt, etc.
> >
> > (AQMP's disconnect, ultimately, serves as the quiescence point where all
> > async contexts are gathered together, and any final errors reported at
> > that point.)
> >
> > Because async QMP continues to check for messages asynchronously, it's
> > almost certainly likely that the loop will have exited due to EOF after
> > issuing the last 'quit' command. That error will ultimately be bubbled
> > up when attempting to close the QMP connection. The manager class here
> > then is free to discard it -- if it was expected.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> >
> > ---
> >
> > Yes, I regret that this class has become quite a dumping ground for
> > complexity around the exit path. It's in need of a refactor to help
> > separate out the exception handling and cleanup mechanisms from the
> > VM-related stuff, but it's not a priority to do that just yet -- but
> > it's on the list.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> This second S-o-b won't matter.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>

Sorry, it's a bug with git-publish I've just not invested time into fixing.
It happens when I use a '---' to add an additional note for reviewers.
git-publish likes to add the second line because it doesn't "see" the first
one anymore. It's harmless, ultimately, but ... it sure does make me look
like I have no idea what I'm doing ;)

--js

--0000000000005a0a8505cdc5d5f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 11:08 AM Eric =
Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Sep=
 22, 2021 at 08:49:33PM -0400, John Snow wrote:<br>
&gt; To use the AQMP backend, Machine just needs to be a little more dilige=
nt<br>
&gt; about what happens when closing a QMP connection. The operation is no<=
br>
&gt; longer a freebie in the async world; it may return errors encountered =
in<br>
&gt; the async bottom half on incoming message receipt, etc.<br>
&gt; <br>
&gt; (AQMP&#39;s disconnect, ultimately, serves as the quiescence point whe=
re all<br>
&gt; async contexts are gathered together, and any final errors reported at=
<br>
&gt; that point.)<br>
&gt; <br>
&gt; Because async QMP continues to check for messages asynchronously, it&#=
39;s<br>
&gt; almost certainly likely that the loop will have exited due to EOF afte=
r<br>
&gt; issuing the last &#39;quit&#39; command. That error will ultimately be=
 bubbled<br>
&gt; up when attempting to close the QMP connection. The manager class here=
<br>
&gt; then is free to discard it -- if it was expected.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; <br>
&gt; ---<br>
&gt; <br>
&gt; Yes, I regret that this class has become quite a dumping ground for<br=
>
&gt; complexity around the exit path. It&#39;s in need of a refactor to hel=
p<br>
&gt; separate out the exception handling and cleanup mechanisms from the<br=
>
&gt; VM-related stuff, but it&#39;s not a priority to do that just yet -- b=
ut<br>
&gt; it&#39;s on the list.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
This second S-o-b won&#39;t matter.<br>
<br>
Reviewed-by: Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"=
_blank">eblake@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Sorry=
, it&#39;s a bug with git-publish I&#39;ve just not invested time into fixi=
ng. It happens when I use a &#39;---&#39; to add an additional note for rev=
iewers. git-publish likes to add the second line because it doesn&#39;t &qu=
ot;see&quot; the first one anymore. It&#39;s harmless, ultimately, but ... =
it sure does make me look like I have no idea what I&#39;m doing ;)</div><d=
iv><br></div><div>--js<br></div></div></div>

--0000000000005a0a8505cdc5d5f7--


