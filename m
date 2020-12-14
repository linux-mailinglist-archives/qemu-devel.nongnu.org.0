Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A5D2DA24D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 22:08:58 +0100 (CET)
Received: from localhost ([::1]:43314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kov5V-0001Cb-5P
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 16:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kov4S-0000nm-8g
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:07:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kov4Q-0003pQ-Nk
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:07:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607980070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BnZRx2MrKZ7zwXGIqf6fqmqdH0H9ztxUEPRuzcdaJok=;
 b=FTD4XbA/qebaLK/ApyLmjEnsud8VTlvMdo0YOasxVsgTWqmJSlJTc1IRkNwHKD9zrlo27s
 HAeezIgt+w4i78IjMvvh2RHqVOHgccXaajFMuBTYtb0B3gK8FDvmN0k0yvSTypdoX7sDD+
 LcCncamCKvH5VNg0dx0aIPn/A/Njaa8=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-XABEUqqfN_mQ6NIddj2dDA-1; Mon, 14 Dec 2020 16:07:46 -0500
X-MC-Unique: XABEUqqfN_mQ6NIddj2dDA-1
Received: by mail-pl1-f199.google.com with SMTP id y10so9156816pll.20
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 13:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnZRx2MrKZ7zwXGIqf6fqmqdH0H9ztxUEPRuzcdaJok=;
 b=YP0mUAo66wCsomc2Ir5YtkWslKPyS8X9l0ZCohSxtvWOoxHScbo3diwZizJGz0uhmH
 qk/E7PApMlc3iSIlojb2df/QbnNZHAlFkG6677btCWDrSCmJIZo/EqRVFs9PqAXLigrR
 h+R6KuNQVahqjr6D6OKDpvoPvYcGavO7DIjnOMET8o+E9+3AXoZRvUubceOairZLJZaY
 ud9vjAvi2y+NNL5JuHb3zGr3qMDA5wkbnqE2Xh3SuQINWYwPOfQYowW5R3ZyEC4LhuIl
 XfjY3UXQc9Y7KZksJAumkvK+YLp1mMbc+Xs6sK8HROJ71KJ7UUyHbDRdypEBCBWq1ndj
 Fd4g==
X-Gm-Message-State: AOAM531v66uvThx7XKMdmZ7OprjxR3qHqNKKCJhzfJFcO+FWhzThgzYf
 RwvLxSGuCk/TUHIre/v+LUnpg72TWNYOpO7wmoEkfLl92kJieaVzGEe9pn0ERwjDdaZIuG7ES5G
 EIzx1UlUBmgbp0P84DvwSTiUvRFvi67I=
X-Received: by 2002:a63:3247:: with SMTP id y68mr26292473pgy.10.1607980065162; 
 Mon, 14 Dec 2020 13:07:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrBTqnNuzr/0j9oDWQtqyrOV7BLvJD8t9gvEICs3wW7UUJkGjW02apSvP1kTKYZjIyK3VxmCD0ZZa8VwlX4EA=
X-Received: by 2002:a63:3247:: with SMTP id y68mr26292459pgy.10.1607980064902; 
 Mon, 14 Dec 2020 13:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20201212090834.1126274-1-marcandre.lureau@redhat.com>
 <c222007a-63af-2cc1-cae4-c2ca7fb58ccd@redhat.com>
 <CAJ+F1C+rDQDPNN5e4EVG4h1ovoGYDqRVSAShPeFSis0RfEE2hA@mail.gmail.com>
 <CAJ+F1CJq3oqB8uqSw6FDBB3zNfzw6G_xsp44UnrTquvbeivUPQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CJq3oqB8uqSw6FDBB3zNfzw6G_xsp44UnrTquvbeivUPQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 14 Dec 2020 22:07:33 +0100
Message-ID: <CABgObfb87xuGfLjtW2TKCj5DixDq6FFr_rKmwzrS1W=Lmj1C9Q@mail.gmail.com>
Subject: Re: [PATCH] libvhost-user: add a link-static option
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000093244705b67308ce"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000093244705b67308ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 14 dic 2020, 21:48 Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.co=
m> ha
scritto:

> Adding:
>  meson.override_dependency('glib-2.0', dependency('glib-2.0', static:
> enable_static))
>
> just before the "vhost_user =3D not_found..." works. Is that what you had=
 in
> mind?
>

Why not "meson.override_dependency('glib-2.0', glib)", either there before
the vhost_user assignmeny or in meson.build where glib is assigned to?

Thanks,

Paolo

>
>
>> --
>> Marc-Andr=C3=A9 Lureau
>>
>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--00000000000093244705b67308ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 14 dic 2020, 21:48 Marc-Andr=C3=A9 Lureau &lt;<=
a href=3D"mailto:marcandre.lureau@gmail.com">marcandre.lureau@gmail.com</a>=
&gt; ha scritto:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div =
class=3D"gmail_quote"><div>Adding:<br></div><div>=C2=A0meson.override_depen=
dency(&#39;glib-2.0&#39;, dependency(&#39;glib-2.0&#39;, static: enable_sta=
tic))</div><div><br></div><div>just before the &quot;vhost_user =3D not_fou=
nd...&quot; works. Is that what you had in mind?</div></div></div></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Why not &quot=
;meson.override_dependency(&#39;glib-2.0&#39;, glib)&quot;, either there be=
fore the vhost_user assignmeny or in meson.build where glib is assigned to?=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><br>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lur=
eau<br></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div></div></div>

--00000000000093244705b67308ce--


