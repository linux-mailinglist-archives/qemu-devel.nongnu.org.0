Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55E84CFF43
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:56:41 +0100 (CET)
Received: from localhost ([::1]:40084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCun-0004MQ-18
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:56:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nRBsz-0005G8-Ed
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nRBsv-0003QX-Mb
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646653837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O+8DRlc7qaML/UBnPypIWyERMJ3Uvk4zrpOJ961VSmw=;
 b=AXI25ljdcr+UgwBlqwVfTCuXItnpVbqwtdGbd5xTs7AmN7AOZ6LsZNQEmyvfNKTfVp46h/
 +y0CUzykOC5fkxvt2pU5Dl+z5eUySA+fUxczBqglpOSVRxoB7LVzAAcRXCAodigx0lpMoI
 Wq95ZYUHFWtWNFZGOxmvggBwODfFq0Q=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-SHmcfNQzOVatXKyReJUKJA-1; Mon, 07 Mar 2022 06:50:36 -0500
X-MC-Unique: SHmcfNQzOVatXKyReJUKJA-1
Received: by mail-yb1-f198.google.com with SMTP id
 x11-20020a5b0f0b000000b0062277953037so13183438ybr.21
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 03:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O+8DRlc7qaML/UBnPypIWyERMJ3Uvk4zrpOJ961VSmw=;
 b=ky/pMWp+dXbJu2sRfBkakpR90e06ceqNcSjK9Mq7QIILV3BdnXmeTDk+87VBVPkK1C
 MSzFGYKsEYta75EhsROHAGeWkF7IEspARgHHjw45iYDJoK6W2BW8yViFWCyAhvRXJ+GY
 bjl3QOk/vDL7CfK69KyzGWp5t4Ye8nAVkdjZZcmOUJjMf4Aq5Vkw8cZywzq6AZHOGLCi
 mHKW014iz6yObU/oJfJUxYtWAQMHwBGP6P3yWu+M+SeM59uwIsiLV8+as4fRYB6SKSW5
 dEhuLbwX2y4lNsqGLynnRLt8bx6kfbQ6kZWDqU9FFkFDXOa4lQbiEfZ2DyoYI+pnTsQ7
 3aWQ==
X-Gm-Message-State: AOAM531TYHfXyBX+FF9SQEyFZOdib1U7tUNTuUcOnzAVbeONL48N85jn
 kKRi2cxl7/b2KvOUDJNTq8J/pWms3yj9QTbdRggqocFVKngktr2fA7/sz5xL0piMXng6ej7mCyt
 tM3CbtjhsB6HpctTCsjnolHL7HOWbasA=
X-Received: by 2002:a81:9285:0:b0:2dc:ae1c:5d5 with SMTP id
 j127-20020a819285000000b002dcae1c05d5mr4349631ywg.33.1646653835592; 
 Mon, 07 Mar 2022 03:50:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoQIWVDg1H/GdXjIi2t/eENRJpHf/wImvtduPX0wk9PE7j3gCxbSwFGzcQOLHycqRU4dTmrYRqJF7arfTbv/A=
X-Received: by 2002:a81:9285:0:b0:2dc:ae1c:5d5 with SMTP id
 j127-20020a819285000000b002dcae1c05d5mr4349622ywg.33.1646653835389; Mon, 07
 Mar 2022 03:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
 <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
 <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
In-Reply-To: <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 7 Mar 2022 15:50:24 +0400
Message-ID: <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Mar 7, 2022 at 2:35 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrot=
e:
>
> On 2022/03/07 19:19, Marc-Andr=C3=A9 Lureau wrote:
> > Hi Akihiko
> >
> > On Mon, Mar 7, 2022 at 12:09 PM Akihiko Odaki <akihiko.odaki@gmail.com>=
 wrote:
> >>
> >> On 2022/03/07 16:46, marcandre.lureau@redhat.com wrote:
> >>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>>
> >>> egl-headless depends on the backing surface to be set before texture =
are
> >>> set and updated. Display it (update=3Dtrue) iff the current scanout k=
ind
> >>> is SURFACE.
> >>
> >> egl-headless does not dynamically call register_displaychangelistener
> >> and has console associated (console_select would not affect egl-headle=
ss
> >> itself) so this should not be necessary.
> >
> > Could you help me understand, what should not be necessary?
>
> I read the description as it sets the backing surface for egl-headless
> when register_displaychangelistener or console_select is called. The
> change is not necessary.

Without it, gfx_switch is not called to set the new surface. Switching
console with VNC would fail (via ctrl+alt+num).

>
> >
> >> The remaining problem with egl-headless is that egl-headless renders t=
he
> >> image to DisplaySurface, and a non-OpenGL display (namely vnc) has to
> >> consume it instead of texture even when con->scanout.kind is
> >> SCANOUT_TEXTURE or SCANOUT_DMABUF.
> >
> > This is already happening, because egl-headless calls dpy_gfx_update().
>
> It is not called when register_displaychangelistener or console_select
> is called by non-OpenGL display consuming the DisplaySurface.

When displaychangelistener_display_console() is called with
con->scanount.kind =3D=3D SCANOUT_SURFACE, it calls gfx_update(update =3D=
=3D
TRUE), and thus calls gfx_update on the whole surface.


