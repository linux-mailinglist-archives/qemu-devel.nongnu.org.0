Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E921341BC1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:50:42 +0100 (CET)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDeL-0002Gi-DE
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lNDcg-0001OJ-GK
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:49:00 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lNDce-00066D-IW
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:48:58 -0400
Received: by mail-ej1-x635.google.com with SMTP id l4so9206742ejc.10
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 04:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hq2Wg6J/MmQ58PuZdvK3p13rZmXLASurBjbSxmhqeg0=;
 b=D4KXD4cqm7Ox1gb905S+SPuo4din0KmuCB8WGYS6E/ORltDcJY+nP5iz3SZt/eaCCn
 UjONHNZSNHWeGTR6RjcN2HEh/piEhrbC+Uu6zD2f/iTV5i+fblzoWNXPmQNTt91ruQ6G
 fZnQaW5fU9VX34dI8Z0Xql0uBdw9X2Qn9k+QBOgBXtLAWsvrJomSPnYiXfmA1xdp6Y+z
 jxm1YlA6YVYRtdomCBcmqJkhcLDCl+g6Lx84jN+D8oGCqfy9/GmDRGsCRE6PyhVz7KV2
 4HsJjlDW+dUnaA2/o3OFjd5j++32FjsJofhvZxWh1YymZc1wpPVn9CD1vvogz9H2n4Gv
 KW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hq2Wg6J/MmQ58PuZdvK3p13rZmXLASurBjbSxmhqeg0=;
 b=oZAqd0bnMA1xvk5te5V4IPCUqpUm6nwZ1DKdJrk3WKee0gfn5HS9XWpYhpYuZNbavp
 mqsvlavILU/DtBrDdzuonIzyovDB9ql575wtvDtZDDxd1AAXg21oPqV6Z1bSE//3CB0H
 WxwF0zUT0MrW0GooogUgM7Lic7GmqZ9+mrX6HoRMPllkXMFXajca2Lf5+FeR+61UsMOU
 RNMdGIpiUg+Ujepa2gRy+OLcZpF1FcxvvoWlPeqzo1k0BrdsrfdsKBebIaeOOiBRVt8J
 TakPXbNHhR8eYEx/DBpprv7fOfWDF5o85axWRaczBOkgXFxM2G7NcO9F8916AsQtmvcJ
 UPrA==
X-Gm-Message-State: AOAM532Kvgg3hit5wNfZWExOQTg4Rw5lVQ5faJvZnhVjy5e3Bt/RpmSg
 9WyLWddmB/JeGuzyDSUxaevg518TrSVV0lRPnRY=
X-Google-Smtp-Source: ABdhPJwuxPk1EsZ3m/oShTw3TiiAmKs+sLr24MpUbRje9ys0LV85EUPLXwoLg4TvTYqixG6p8fM7oBD7kx3YoX5uYn4=
X-Received: by 2002:a17:906:4e99:: with SMTP id
 v25mr3821958eju.532.1616154534092; 
 Fri, 19 Mar 2021 04:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210319112147.4138943-1-kraxel@redhat.com>
In-Reply-To: <20210319112147.4138943-1-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 19 Mar 2021 15:48:42 +0400
Message-ID: <CAJ+F1C+FPAwLxCtZG+Fhnizqy7KU2ttdr0w72WWoS+mprthgwA@mail.gmail.com>
Subject: Re: [PATCH 00/15] virtio-gpu: split into two devices.
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e8210c05bde24cf8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Tina Zhang <tina.zhang@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, QEMU <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e8210c05bde24cf8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gerd

On Fri, Mar 19, 2021 at 3:22 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Currently we have one virtio-gpu device.  Problem with this approach is
> that if you compile a full-featured qemu you'll get a virtio-gpu device
> which depends on opengl and virgl, so these dependencies must be
> installed and the libraries will be loaded into memory even if you don't
> use virgl.  Also the code is cluttered with #ifdefs and a bit messy.
>
> This patch series splits the virtio-gpu device into two:
>
>  (1) virtio-gpu-device becomes the non-virgl device, same as
>      virtio-gpu-device,virgl=3Doff today.
>  (2) virtio-gpu-gl-device is the new virgl device, same as
>      virtio-gpu-device,virgl=3Don today.
>
> When compiling qemu without virglrenderer support virtio-gpu-device
> behavior doesn't change.
>

Nice!
We are post 6.0 soft freeze. I suppose you target those changes for 6.1?

--=20
Marc-Andr=C3=A9 Lureau

--000000000000e8210c05bde24cf8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Gerd<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 19, 2021 at 3:22 P=
M Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">=
kraxel@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Currently we have one virtio-gpu device.=C2=A0 Problem wit=
h this approach is<br>
that if you compile a full-featured qemu you&#39;ll get a virtio-gpu device=
<br>
which depends on opengl and virgl, so these dependencies must be<br>
installed and the libraries will be loaded into memory even if you don&#39;=
t<br>
use virgl.=C2=A0 Also the code is cluttered with #ifdefs and a bit messy.<b=
r>
<br>
This patch series splits the virtio-gpu device into two:<br>
<br>
=C2=A0(1) virtio-gpu-device becomes the non-virgl device, same as<br>
=C2=A0 =C2=A0 =C2=A0virtio-gpu-device,virgl=3Doff today.<br>
=C2=A0(2) virtio-gpu-gl-device is the new virgl device, same as<br>
=C2=A0 =C2=A0 =C2=A0virtio-gpu-device,virgl=3Don today.<br>
<br>
When compiling qemu without virglrenderer support virtio-gpu-device<br>
behavior doesn&#39;t change.<br></blockquote><div><br></div><div>Nice!<br><=
/div><div>We are post 6.0 soft freeze. I suppose you target those changes f=
or 6.1?</div></div><br>-- <br><div dir=3D"ltr">Marc-Andr=C3=A9 Lureau<br></=
div></div>

--000000000000e8210c05bde24cf8--

