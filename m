Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAED41F53A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 20:57:38 +0200 (CEST)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWNiy-00011z-SU
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 14:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mWNh4-0000Bk-IN
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 14:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mWNh0-0006xA-CQ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 14:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633114532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I8/95pGUFW4XMGmRBztQ+fhhXEIGU38wQT0ajK8lbF8=;
 b=WyvWnrgc7bMy9T2lcw+7ejjjEoEQQCcpUqtcPF58XtSBX5THDMsuwGNS3W+NLbxMXrunMO
 ACrdqMA/K1fidtMg9YONSACk3elY54zjf+vmKaKGwd5ScyDAEattpa4KoN4Ws8VOr1ulbY
 NVxMZUDXXr4Gr0k6eEjqB7GA622aAVI=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-2gcTLnqfNX2ZwZnH-4w12Q-1; Fri, 01 Oct 2021 14:55:31 -0400
X-MC-Unique: 2gcTLnqfNX2ZwZnH-4w12Q-1
Received: by mail-ua1-f72.google.com with SMTP id
 63-20020a9f2445000000b002c4023afb53so5130652uaq.17
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 11:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I8/95pGUFW4XMGmRBztQ+fhhXEIGU38wQT0ajK8lbF8=;
 b=ccpvilwAZn2bK1qwXoQIhRgeZBnL7j05PmOcypyALYZ/LoakyqGn92aw8HQpY3UA/C
 yYPqxffHOTAPeHBZRHIoFmwmW0pT2wet70iLqGYXjIz6kfDfzH+ZoU3gPBuEka5Yoi5q
 aVQp6whhtosl2CQSOUWcSn3zaYNOzxMR3sNUzk5pHaTgEtBejM5sPxcec5iOq0+dbcO5
 3m85p1sY0bGPDXFgpjxF+fuxr2yFdj9FBvpsZ+aEgjpNYVRnZsyrrQgFDrJhbZK2eTT+
 HytGkf3kF5EEohKlFEn0ahvUr1KVXBGMkkK4qnqInQn10zpDRGvImgotC4OmgATP4p2O
 h82g==
X-Gm-Message-State: AOAM533u0yKDAZOxPmYZKsa7U5KBJb1C58/BSum70JziBfCcIXrfDAhE
 PCH75j0Psuv1zNzuxUed80HSrvPE5gVTm7RVU37oPHlpiwNr+AsZ/wvJuOl7FoM4oAzdNHw4w0y
 YHqT+MumY8X+TnZ+XwXErS4DI8IQTHYA=
X-Received: by 2002:ab0:5684:: with SMTP id a4mr11891511uab.79.1633114530852; 
 Fri, 01 Oct 2021 11:55:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRqjQ1ykoji7mls102mZHNIeXcV42SJYKIEYdW9Kwkg0z7oFMgbTUEj4eSmAi1HPhx8wb18o5MHZPfGD1J84A=
X-Received: by 2002:ab0:5684:: with SMTP id a4mr11891488uab.79.1633114530680; 
 Fri, 01 Oct 2021 11:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210930205716.1148693-1-jsnow@redhat.com>
 <20210930205716.1148693-4-jsnow@redhat.com>
 <87h7e0vnr9.fsf@dusky.pond.sub.org>
In-Reply-To: <87h7e0vnr9.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Date: Fri, 1 Oct 2021 14:55:20 -0400
Message-ID: <CAFn=p-YWF3PyZw=EUgFrym5EqSFDPmYJnoHh84msmJfiY2tzfQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] qapi/parser: fix unused check_args_section
 arguments
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007aa4b805cd4f1b0d"
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
Cc: Michael Roth <michael.roth@amd.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007aa4b805cd4f1b0d
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 10:11 AM Markus Armbruster <armbru@redhat.com> wrote:

> John Snow <jsnow@redhat.com> writes:
>
> > Pylint informs us we're not using these arguments. Oops, it's
> > right. Correct the error message and remove the remaining unused
> > parameter.
> >
> > Fix test output now that the error message is improved.
> > Fixes: e151941d1b
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> In v3, the blank line was where it belongs:
>
>   Fix test output now that the error message is improved.
>
>   Fixes: e151941d1b
>   Signed-off-by: John Snow <jsnow@redhat.com>
>
> The change looks accidental.  Can tidy up in my tree.
>

Yes please, thank you :)

--0000000000007aa4b805cd4f1b0d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 1, 2021 at 10:11 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redha=
t.com</a>&gt; writes:<br>
<br>
&gt; Pylint informs us we&#39;re not using these arguments. Oops, it&#39;s<=
br>
&gt; right. Correct the error message and remove the remaining unused<br>
&gt; parameter.<br>
&gt;<br>
&gt; Fix test output now that the error message is improved.<br>
&gt; Fixes: e151941d1b<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
In v3, the blank line was where it belongs:<br>
<br>
=C2=A0 Fix test output now that the error message is improved.<br>
<br>
=C2=A0 Fixes: e151941d1b<br>
=C2=A0 Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" tar=
get=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
The change looks accidental.=C2=A0 Can tidy up in my tree.<br></blockquote>=
<div><br></div><div>Yes please, thank you :) <br></div></div></div>

--0000000000007aa4b805cd4f1b0d--


