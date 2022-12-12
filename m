Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D29D64A8CE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 21:39:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4pYK-0006ej-NE; Mon, 12 Dec 2022 15:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4pYJ-0006eU-0e
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:37:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4pYH-0004Xi-8I
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 15:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670877448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tr0JRau9lX1AWnYMjoxiJI1z7dOOsO8O9wXUofs+FMQ=;
 b=btVaUk530NhzirGym7UIwsJqEnTXMdNwrMFW2LfrLD20GrGkKDh/XF5zxIwH5wRkiGmrEb
 XmoL3LTv5CytLClKZpkVK4DBmG+BZwYbfU8CSZb+EimXVPqZ9akIv+fYXya8g2p0Csozak
 X7rq2yGRTdRGKWO3DN051T8Q7WSH2v0=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-ISIU7TjPOESPSy8lZydh0g-1; Mon, 12 Dec 2022 15:37:25 -0500
X-MC-Unique: ISIU7TjPOESPSy8lZydh0g-1
Received: by mail-vk1-f197.google.com with SMTP id
 20-20020a1f0214000000b003bdd1978614so396093vkc.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 12:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tr0JRau9lX1AWnYMjoxiJI1z7dOOsO8O9wXUofs+FMQ=;
 b=VwqUYRMPWbIMzMfBkcwIw8pjiqefFjU2DAREo7LuXTkMcNRAm4Gl2VergP1H6EVJba
 1Z7iiWHG3CxScJMj+6TGIj8QFXjt4olhXYWkfEgKAYot7haYJdh4X8c/ld5UlBeakHg5
 yRdZGV4jGl/KEXrCKuDzVkzmPNFzRN0k04TVeXgwV6hKEFN6gJv7HbM3KrEd+rJD38v2
 K2TYpb759oRakHl3SOu5nTx3i/dsXwPmO89yLfYj8dRn0Qr8FnWS+NPiVUgg2W03aGCK
 tdtJmnZjBATBZSutWZFSppJ97A7Ehdze8j8sITtDf8D4xgeow0WnVQQOzWSqHLHlF2kQ
 yX1Q==
X-Gm-Message-State: ANoB5pndKq77Hby8Ky2nO86c5j+0wEqLwwZFur5ZaqefdHg/O1wtAlet
 D1Roo1L9yeJCpcTwhRDyZ5P/klZ7yj2ALRLxhzvxVafh1Xg5/3zIHp4l4TjaO9PNhmgNdpS3Tdq
 M+KKjXyKq3jSAN4W2nau+E6IMavsrSy0=
X-Received: by 2002:a05:6102:3fa1:b0:3a6:aae4:cab6 with SMTP id
 o33-20020a0561023fa100b003a6aae4cab6mr53630443vsv.27.1670877445272; 
 Mon, 12 Dec 2022 12:37:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7gJIjKKSESKdTekiYuu6NLAP3i6VQOIJu5WILmbigxoffm66SpIz9oYlAPjqwzW6pdbv+6HcwVqUoKjnb4HK8=
X-Received: by 2002:a05:6102:3fa1:b0:3a6:aae4:cab6 with SMTP id
 o33-20020a0561023fa100b003a6aae4cab6mr53630440vsv.27.1670877445033; Mon, 12
 Dec 2022 12:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-22-pbonzini@redhat.com>
 <CAJ+F1CLgpt_mcGn59jcCt+Sn-xs4rHJ30USUJyLPCkjrsZk9dA@mail.gmail.com>
In-Reply-To: <CAJ+F1CLgpt_mcGn59jcCt+Sn-xs4rHJ30USUJyLPCkjrsZk9dA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 12 Dec 2022 21:37:13 +0100
Message-ID: <CABgObfb=8qDjkoBTci=P492p7DG_O2-9jeQJbSmCbx05mmxw=g@mail.gmail.com>
Subject: Re: [PATCH 21/30] build: move sanitizer tests to meson
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000093318a05efa77816"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000093318a05efa77816
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 12 dic 2022, 13:16 Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.co=
m> ha
scritto:

> +if get_option('sanitizers')
> +  if cc.has_argument('-fsanitize=3Daddress')
> +    qemu_cflags =3D ['-fsanitize=3Daddress'] + qemu_cflags
> +    qemu_ldflags =3D ['-fsanitize=3Daddress'] + qemu_ldflags

why not the +=3D syntax? same below


Configure puts it at the beginning of QEMU_CFLAGS and I didn't want to
change it.

Paolo

--00000000000093318a05efa77816
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"ltr">Il lun 12 dic 2022, 13:16 Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marcandre.lure=
au@gmail.com</a>&gt; ha scritto:</div><blockquote style=3D"min-width:150px;=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">&gt; +if get_option(&#39;sanitizers&#39;)<br>&gt; +=C2=A0 if cc.has_=
argument(&#39;-fsanitize=3Daddress&#39;)<br>&gt; +=C2=A0 =C2=A0 qemu_cflags=
 =3D [&#39;-fsanitize=3Daddress&#39;] + qemu_cflags<br>&gt; +=C2=A0 =C2=A0 =
qemu_ldflags =3D [&#39;-fsanitize=3Daddress&#39;] + qemu_ldflags<br><br>why=
 not the +=3D syntax? same below</blockquote><br><div class=3D"gmail_quote"=
 dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">Configure puts it at th=
e beginning of QEMU_CFLAGS and I didn&#39;t want to change it.</div><div di=
r=3D"ltr" class=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_at=
tr">Paolo=C2=A0</div></div></div>

--00000000000093318a05efa77816--


