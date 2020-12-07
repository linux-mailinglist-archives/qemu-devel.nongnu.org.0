Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6942D1775
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 18:25:00 +0100 (CET)
Received: from localhost ([::1]:55666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmKFv-0008OW-G6
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 12:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmKEG-0007TE-TI
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:23:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kmKED-0006le-9i
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 12:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607361791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W+0Jzz2KD6rUzS47H6qfG6GR+PI6s4c+LgCBvaIrKNk=;
 b=c6hE3DKigXlXPGELcON9FdKvxLZFAYlXEbdrsV+qVEGf0+M8bu/mc1FWH9r8aRrVVzSYb0
 7KHgvQVQLdelUp8EIUT4Tcw2PKGxYt9zwdeZGHbwwwsxJcW4D9pRdN0UU3HlYSAZ/2UHRb
 z/TpMjd/t5uwgZ9iMEea/2oR83gng6Q=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-wrksEeKXP1qPifc9J291Kg-1; Mon, 07 Dec 2020 12:23:09 -0500
X-MC-Unique: wrksEeKXP1qPifc9J291Kg-1
Received: by mail-pg1-f198.google.com with SMTP id 1so9369458pgq.11
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 09:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W+0Jzz2KD6rUzS47H6qfG6GR+PI6s4c+LgCBvaIrKNk=;
 b=jElWAWyNFbtGSRYx7ig6qT0fMhvHTPCmICG9SMqXDJly0FeOiXfUmj7w1nNSS2BGF/
 X0m2+l4v5DrK6Ir1qKVMMBjhX5f41n7tC2/yZr/1uiqwFP7kNEoIAGhx88KWQphOCOM5
 AaZsyF002zE65IXQco04YRux/LbBYHb2wOIZxs9ddoLx2dXhf97OQYM0ABePniOSLCuz
 VGM9OzdedZ5+ttEFO9TdpFgfoGduKWF+a3SB0g2WA1fnoxVafp0IO3TAikj3W2yrXyJy
 ldqvIRuTaTIoW+jCBFJmEKvNrU/XqEQUckOEcUIMf7sBQku4bwpawJXd3khDUs5fiuj8
 iTqQ==
X-Gm-Message-State: AOAM533MHlbzXjmo5iETobplntPVGt34m6FQqF+zZA+yt2J5cpq6EHdW
 Hn+MzRpdyaKjpj6zGcTgw9uW56zn1aR5s83fbI9iny80ZhEdTILxLVTc0xdS+uGPliRdnnlXqwF
 D1NrG04bfBUY/NpBt8SypPpbpNfj0F8k=
X-Received: by 2002:a17:902:758c:b029:da:a6e1:e06 with SMTP id
 j12-20020a170902758cb02900daa6e10e06mr17188444pll.67.1607361788202; 
 Mon, 07 Dec 2020 09:23:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfIhWFab8/gURS9l1VYOz3AjBc7xrUz61UMEatSg2Az7rfxWKMBpzRxBD9pN4K29OSamTVjX6c26FFGAZLs/I=
X-Received: by 2002:a17:902:758c:b029:da:a6e1:e06 with SMTP id
 j12-20020a170902758cb02900daa6e10e06mr17188421pll.67.1607361787927; Mon, 07
 Dec 2020 09:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-12-pbonzini@redhat.com>
 <20201207172447.77d22d17@redhat.com>
 <853e64f9-9a37-5214-0111-b489dc82af44@redhat.com>
 <20201207175739.2f51f87e@redhat.com>
In-Reply-To: <20201207175739.2f51f87e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 7 Dec 2020 18:22:55 +0100
Message-ID: <CABgObfbdZdmWETOVr8=-19pSFc_b02zNKr4ZzbkHKT-qRTwNVg@mail.gmail.com>
Subject: Re: [PATCH 11/15] qtest: add a QOM object for qtest
To: Igor Mammedov <imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000065379805b5e3146b"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065379805b5e3146b
Content-Type: text/plain; charset="UTF-8"

Il lun 7 dic 2020, 17:57 Igor Mammedov <imammedo@redhat.com> ha scritto:

> On Mon, 7 Dec 2020 17:43:16 +0100
> Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> > On 07/12/20 17:24, Igor Mammedov wrote:
> > >> +void qtest_server_init(const char *qtest_chrdev, const char
> *qtest_log, Error **errp)
> > >> +{
> > >> +    Chardev *chr;
> > >> +
> > >> +    chr = qemu_chr_new("qtest", qtest_chrdev, NULL);
> > >> +
> > >> +    if (chr == NULL) {
> > >> +        error_setg(errp, "Failed to initialize device for qtest:
> \"%s\"",
> > >> +                   qtest_chrdev);
> > >> +        return;
> > >> +    }
> > >> +
> > >> +    qtest_server_start(chr, qtest_log, errp);
> > > why not create qtest object here instead of trying to preserve old way,
> > > or create it directly at the place that calls qtest_server_init()?
> >
> > Because I wasn't sure of where to put it in the QOM object tree.  So I
> > punted and left it for later.
>
> but you implicitly decided where it should be (with -object qtest),
> it goes to /objects.
> So I'd wouldn't put anywhere else to be consistent.
>

No, /objects is for stuff created with -object exclusively. I suppose I
could have the "well-known path" be /machine/qtest, and it would be either
a child (for -qtest) or a link to /objects/some-id (for -object qtest).
Should I implement that (as a separate patch on top of this one)?

Paolo



> >
> > Paolo
> >
>
>

--00000000000065379805b5e3146b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 7 dic 2020, 17:57 Igor Mammedov &lt;<a href=3D"=
mailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; ha scritto:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Mon, 7 Dec 2020 17:43:16 +0100<br>
Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" =
rel=3D"noreferrer">pbonzini@redhat.com</a>&gt; wrote:<br>
<br>
&gt; On 07/12/20 17:24, Igor Mammedov wrote:<br>
&gt; &gt;&gt; +void qtest_server_init(const char *qtest_chrdev, const char =
*qtest_log, Error **errp)<br>
&gt; &gt;&gt; +{<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 Chardev *chr;<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 chr =3D qemu_chr_new(&quot;qtest&quot;, qtest_=
chrdev, NULL);<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 if (chr =3D=3D NULL) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Failed to=
 initialize device for qtest: \&quot;%s\&quot;&quot;,<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qtest_chrdev);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 qtest_server_start(chr, qtest_log, errp);=C2=
=A0 <br>
&gt; &gt; why not create qtest object here instead of trying to preserve ol=
d way,<br>
&gt; &gt; or create it directly at the place that calls qtest_server_init()=
?=C2=A0 <br>
&gt; <br>
&gt; Because I wasn&#39;t sure of where to put it in the QOM object tree.=
=C2=A0 So I <br>
&gt; punted and left it for later.<br>
<br>
but you implicitly decided where it should be (with -object qtest),<br>
it goes to /objects.<br>
So I&#39;d wouldn&#39;t put anywhere else to be consistent.<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">No, /objects is =
for stuff created with -object exclusively. I suppose I could have the &quo=
t;well-known path&quot; be /machine/qtest, and it would be either a child (=
for -qtest) or a link to /objects/some-id (for -object qtest). Should I imp=
lement that (as a separate patch on top of this one)?</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--00000000000065379805b5e3146b--


