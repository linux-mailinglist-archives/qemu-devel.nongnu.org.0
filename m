Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E46C302B09
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:04:38 +0100 (CET)
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l47AD-0001MY-B9
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l46xl-0007tr-Tk
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:51:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l46xj-0005VO-0y
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611600701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=31z8rUW1BbY+eCyj72vjSbn9UJwnVVeCK5fU6N9ex7M=;
 b=A/h2F0ORSUrT9wHKaHks07oJ5Y69krvcV7Zj7n88AmmanIAk35P8hbd0MYvVPu58Axl/eb
 /6npD/FfWVCUWRtRd49sD9iW9fHJ1hjuS12M/8eqO4fB5DKLhqBr3bo1lDBoXfO3oaJCTn
 YcFJutKN6CqpZnlj9itMNCRY3ApFKw4=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-YjarSWHDPIuc7RIGMYTcdQ-1; Mon, 25 Jan 2021 13:51:37 -0500
X-MC-Unique: YjarSWHDPIuc7RIGMYTcdQ-1
Received: by mail-pl1-f199.google.com with SMTP id bg11so8188027plb.16
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 10:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=31z8rUW1BbY+eCyj72vjSbn9UJwnVVeCK5fU6N9ex7M=;
 b=S0mNuySFPN0Nr3vKSILYAB3OuDo976BTMKjyZveIuBlKi/udblu1ec4xpcgG4jQsV9
 JWUpVY5MhimWJTsmtvr67Yet8tN10bvC+R/GUARnHN6Vp+f/5PQnK8bQOLULJdeY39vJ
 LXcuZdUD+vnM8qScd1FGWZQEFJbOyJyXjj6pdVXPYpK9n91SFTlMkJRv5hAMzLa+a3Z6
 UOnekyE0rbzSAn1hS/HrblfaRnzZ07QL8S33ygVcHSQinDuOm6qxZ3MajbuyJUvg5NfG
 +K9sfXmglqH8I8hMZaqDpiOGc2/n2XQzACJt5bbVglnV5P0ETI3FD87tgPrVf8/gqMip
 AEnQ==
X-Gm-Message-State: AOAM530wzxO+yAsFEjJYndk1ytqHvH9DfJ578IorhwS1WJv7dQUyF1wj
 h6goKxKocSQN3V87pinjI+p70RA8lN1klX7Byd3ogaNgQrDdq+5dVh2s5HQz444EMBHSk0MF/9/
 /jyRFbEne5tQZDB6H/1cU4sxGzsjsEA4=
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aecf with SMTP id
 g3-20020a1709026b43b02900dffb48aecfmr2016750plt.67.1611600696637; 
 Mon, 25 Jan 2021 10:51:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZuKKoZ5yPHxhqhU+8Jxgz9JuKRBhSwRdzWovAARFdCryuejnPKP/xE7/GoLKr5Y23gWwSauX5ngYQanLdfa4=
X-Received: by 2002:a17:902:6b43:b029:df:fb48:aecf with SMTP id
 g3-20020a1709026b43b02900dffb48aecfmr2016709plt.67.1611600696012; Mon, 25 Jan
 2021 10:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20210122204441.2145197-1-philmd@redhat.com>
 <20210122204441.2145197-6-philmd@redhat.com>
 <20210125121529.GB7107@merkur.fritz.box>
In-Reply-To: <20210125121529.GB7107@merkur.fritz.box>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 25 Jan 2021 19:51:24 +0100
Message-ID: <CABgObfZqJqt0=cO6oRxx8N-ZwFNwDbbYuQ-=-67OyZ4KiL+-Ow@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] meson: Restrict block subsystem processing
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000001874b05b9be07e9"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000001874b05b9be07e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Another possibility is to place the if in block/meson.build, using
subdir_done() to stop the processing of the directory.

Paolo

Il lun 25 gen 2021, 13:15 Kevin Wolf <kwolf@redhat.com> ha scritto:

> Am 22.01.2021 um 21:44 hat Philippe Mathieu-Daud=C3=A9 geschrieben:
> > Avoid generating module_block.h and block-gen.c if we are
> > not going to use them.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> > Cc: qemu-block@nongnu.org
> > ---
> >  meson.build | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meson.build b/meson.build
> > index 61cbb89cd44..181f8795f5a 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1829,7 +1829,9 @@
> >
> >  subdir('nbd')
> >  subdir('scsi')
> > -subdir('block')
> > +if have_block
> > +  subdir('block')
> > +endif
> >
> >  blockdev_ss.add(files(
> >    'blockdev.c',
>
> It feels odd to have a random have_block check in the middle of a whole
> bunch of lines that all deal with block layer functionality, especially
> when unconditional ones depend on the conditional one. (nbd, scsi and
> blockdev.c present in the context here certainly all can't work without
> block)
>
> So should this if block become a bit longer and include all block layer
> related things nearby?
>
> If not, at least a comment explaining why we're doing this would be
> nice.
>
> Kevin
>
>

--00000000000001874b05b9be07e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Another possibility is to place the if in block/meson.bui=
ld, using subdir_done() to stop the processing of the directory.<div dir=3D=
"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il lun 25 gen 2021, 13:15 Kev=
in Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; ha=
 scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Am 22.01.2021 um 21:44 ha=
t Philippe Mathieu-Daud=C3=A9 geschrieben:<br>
&gt; Avoid generating module_block.h and block-gen.c if we are<br>
&gt; not going to use them.<br>
&gt; <br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philm=
d@redhat.com" target=3D"_blank" rel=3D"noreferrer">philmd@redhat.com</a>&gt=
;<br>
&gt; ---<br>
&gt; Cc: <a href=3D"mailto:qemu-block@nongnu.org" target=3D"_blank" rel=3D"=
noreferrer">qemu-block@nongnu.org</a><br>
&gt; ---<br>
&gt;=C2=A0 meson.build | 4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 61cbb89cd44..181f8795f5a 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -1829,7 +1829,9 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 subdir(&#39;nbd&#39;)<br>
&gt;=C2=A0 subdir(&#39;scsi&#39;)<br>
&gt; -subdir(&#39;block&#39;)<br>
&gt; +if have_block<br>
&gt; +=C2=A0 subdir(&#39;block&#39;)<br>
&gt; +endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 blockdev_ss.add(files(<br>
&gt;=C2=A0 =C2=A0 &#39;blockdev.c&#39;,<br>
<br>
It feels odd to have a random have_block check in the middle of a whole<br>
bunch of lines that all deal with block layer functionality, especially<br>
when unconditional ones depend on the conditional one. (nbd, scsi and<br>
blockdev.c present in the context here certainly all can&#39;t work without=
<br>
block)<br>
<br>
So should this if block become a bit longer and include all block layer<br>
related things nearby?<br>
<br>
If not, at least a comment explaining why we&#39;re doing this would be<br>
nice.<br>
<br>
Kevin<br>
<br>
</blockquote></div>

--00000000000001874b05b9be07e9--


