Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A176EE63A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 18:59:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prLzK-0001MG-KE; Tue, 25 Apr 2023 12:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1prLzB-0001LI-Jy
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1prLz9-0004RA-A8
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 12:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682441866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HRUBzRoMGHrux8prZRtEz1GTudbuPtHdNfYybMw4t0g=;
 b=F5gRdZntxMkuUtiyQhNyAYt5ETbZ2LGerDVit7No8OcwAJnNZVjABKhnRu5vMjNPTLKLLu
 ljc4gmWBhVryTAtqU9PkLFHaO7Up/qUWiOfkuAMTvEKUw9QaNaUDctkixACB+BirFkYkH+
 7ftxs1zngeoLw2TetOkHydAon/Oq/xE=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-436-OrFmW_XaOr2KW4ar3zC-dg-1; Tue, 25 Apr 2023 12:57:44 -0400
X-MC-Unique: OrFmW_XaOr2KW4ar3zC-dg-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-51f10b8b27dso3584078a12.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 09:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682441864; x=1685033864;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HRUBzRoMGHrux8prZRtEz1GTudbuPtHdNfYybMw4t0g=;
 b=as6JYjKu8B2hgOxfjZ6ZkGA5yzhUmis6lvGQzsSQ0/OFow88VIqLl2B9fj3GpVS4In
 IDTDXrxXjg/jPunXOpQ3qP8LkD23egPAHQxm4/9AiqVIFvyA5fvMVV082+VaQLgWa6BP
 omFaaOTqSdYytFSvcRIXD3QRmIkBu+jTpYoHg5rQ/IjtZQDyWxy6DnLG4HMPUmaU3jJ2
 Mh25BPtfP2JD9bKvUN5q6HSAG6aVnkC4OubCfSSMykMi9xqmvPXo+baNfJA1qQqGGLQN
 4q6vitAP5FCPUhEd4E/ZnA+vO/CTiWpsdKX/TMlWlUHhcIkKD3yiiyjaL9nn5XgL1Mab
 bTMg==
X-Gm-Message-State: AAQBX9c3+R2ZY+yXTWdwrFSM/b5+Or2Xv1T9lvsTitK5p++U0EIv/Kpi
 KNEM6ZvUuilct02Ql470sOdCs42ln+irbLQOr9jl8CvIBV5sFadVIub160MPFoNzKEpQBKGZnZe
 lGjgZr3+AOVXB/sG3d6CK3eYIw7Yi0FY=
X-Received: by 2002:a17:90b:1494:b0:23c:fa83:2a7d with SMTP id
 js20-20020a17090b149400b0023cfa832a7dmr18207669pjb.12.1682441863837; 
 Tue, 25 Apr 2023 09:57:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350bSCrQ14sVYY2sp57mStmSqtqFuGHDV8lsdntQjuFS1cxSCwPvuVvKKtBB5BHRtrHaWfm/QuT5KXQlEOznSbdQ=
X-Received: by 2002:a17:90b:1494:b0:23c:fa83:2a7d with SMTP id
 js20-20020a17090b149400b0023cfa832a7dmr18207654pjb.12.1682441863521; Tue, 25
 Apr 2023 09:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <20230424200248.1183394-12-jsnow@redhat.com>
 <ZEgDjbHhHxNZ83fu@redhat.com>
In-Reply-To: <ZEgDjbHhHxNZ83fu@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 25 Apr 2023 12:57:32 -0400
Message-ID: <CAFn=p-aHL-bxvszkPB4MmZQGh0xOq619X12q7WNQVUJwf8L4rw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 11/20] tests/vm: add py310-expat to NetBSD
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>, 
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a1875a05fa2c05d7"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000a1875a05fa2c05d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 25, 2023, 12:45 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
>
wrote:

> On Mon, Apr 24, 2023 at 04:02:39PM -0400, John Snow wrote:
> > NetBSD cannot successfully run "ensurepip" without access to the pyexpa=
t
> > module, which NetBSD debundles. Like the Debian patch, it would be
> > strictly faster long term to install pip/setuptools, and I recommend
> > developers at their workstations take that approach instead.
>
> This sounds a bit like a NetBSD packaging bug surely ?  If we've got
> ensurepip installed and it doesn't work due to missing expat I would
> have though NetBSD should add a dependancy.
>

Yes, I agree - though I think NetBSD doesn't unbundle ensurepip, so there
might be nothing to add a dependency against ... and I assume they split
out pyexpat for a reason.

I can report it, anyway. It should at least fail more gracefully than it
does.


> None the less, we'll need a fix in QEMU until that's addressed.
>
> >
> > For the purposes of a throwaway VM, there's not really a speed
> > difference for who is responsible for installing pip; us (needs
> > py310-pip) or Python (needs py310-expat).
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/vm/netbsd | 1 +
> >  1 file changed, 1 insertion(+)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--000000000000a1875a05fa2c05d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 25, 2023, 12:45 PM Daniel P. Berrang=C3=A9=
 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Mon, Apr 24, 2023 at 04:02:3=
9PM -0400, John Snow wrote:<br>
&gt; NetBSD cannot successfully run &quot;ensurepip&quot; without access to=
 the pyexpat<br>
&gt; module, which NetBSD debundles. Like the Debian patch, it would be<br>
&gt; strictly faster long term to install pip/setuptools, and I recommend<b=
r>
&gt; developers at their workstations take that approach instead.<br>
<br>
This sounds a bit like a NetBSD packaging bug surely ?=C2=A0 If we&#39;ve g=
ot<br>
ensurepip installed and it doesn&#39;t work due to missing expat I would<br=
>
have though NetBSD should add a dependancy.<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Yes, I agree - though I think Ne=
tBSD doesn&#39;t unbundle ensurepip, so there might be nothing to add a dep=
endency against ... and I assume they split out pyexpat for a reason.</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">I can report it, anyway. It s=
hould at least fail more gracefully than it does.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
None the less, we&#39;ll need a fix in QEMU until that&#39;s addressed.<br>=
<br>
&gt; <br>
&gt; For the purposes of a throwaway VM, there&#39;s not really a speed<br>
&gt; difference for who is responsible for installing pip; us (needs<br>
&gt; py310-pip) or Python (needs py310-expat).<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/vm/netbsd | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" target=3D"_blank" rel=3D"noreferrer">berrange@redhat.com</a>&gt;<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--000000000000a1875a05fa2c05d7--


