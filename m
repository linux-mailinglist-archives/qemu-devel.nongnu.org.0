Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F9B4D1A80
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 15:28:44 +0100 (CET)
Received: from localhost ([::1]:60394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRapO-00041a-TA
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 09:28:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nRany-0002a3-St
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:27:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nRanv-0003ax-1z
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 09:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646749629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S6h9CJHMrzhFjpeDd9M/dq/WFIPLdwS1irof2xeg2/Y=;
 b=FVmNZSUA5GVaFrFAJrZdYxUbAEDqp4zeL8G0ie3XgQyHQt0ZWT6z3V0sfX3Zdb7ydqPdRQ
 GIQ5qcmWHnbYkH9+GJ6ouEXMyVsRRubFbQDgixzzWZgDpHk7g0sUrNNXhHXynkrqDlmS6h
 yn4+LIc9eVBqs4QF1oUofzgJMUoCpA8=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-ZHj_s6M0M7mAKKD-ESTAaQ-1; Tue, 08 Mar 2022 09:27:08 -0500
X-MC-Unique: ZHj_s6M0M7mAKKD-ESTAaQ-1
Received: by mail-yb1-f199.google.com with SMTP id
 b18-20020a25fa12000000b0062412a8200eso16450264ybe.22
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 06:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S6h9CJHMrzhFjpeDd9M/dq/WFIPLdwS1irof2xeg2/Y=;
 b=7fq2n/gLh4XW7gh0Vrtf5lrGZXjAzh9hg7VUyDOn8hIpkUiFxc+G7Fv71j9apNWsGz
 gN2O+rvIlhvpstyLdiC9Od1tvZSkPDW6ZitUKlfLmrW8L5qZ8MTd7XdL81wvyuswU1yZ
 fJw46kZIFX2J4KBr1DDwFOK/n447DflqjlDJCoIdlW1uUPrjVEchImt0oI8+UmDSCNOs
 Wuyh53oQACTBWRPV48psEu7YBKmLanIs9auZKlalGLr0Sr16GnXDvbGL4JzYO5eMqMyE
 Ta/V+92Qf/QV75b5oSaolcf5DZhmUEht3u6HEqGkMiN0CsQr3DZ9x3C/LJBnpO01377E
 Xtfw==
X-Gm-Message-State: AOAM533l+ZD3cV1QBk6wnsAgJsJaqsL0ShwGjk7PdlPVe+FTeg8XhI0z
 M2E6DNNHaz/tyBHOf43whJAnkh54Cz5+uNl6MVBxsOm+Bpj+6ARogiglj92cbb+CnGkj33f6TRK
 IJZKXqAoKB62fbUJ2i4c96jxbfuKMplg=
X-Received: by 2002:a0d:d481:0:b0:2db:d981:bfe9 with SMTP id
 w123-20020a0dd481000000b002dbd981bfe9mr13394971ywd.15.1646749627823; 
 Tue, 08 Mar 2022 06:27:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw34RM6hUKOnnJqTIu5avgKYsRqhEKdW6PLc4BpKhzepR/NacnWkDvYTTCj1ggO527DjalAYOzS4/psgsch6rA=
X-Received: by 2002:a0d:d481:0:b0:2db:d981:bfe9 with SMTP id
 w123-20020a0dd481000000b002dbd981bfe9mr13394959ywd.15.1646749627617; Tue, 08
 Mar 2022 06:27:07 -0800 (PST)
MIME-Version: 1.0
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
 <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
 <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
 <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
 <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
 <CAMxuvaxU56M9AvS9XfZWVBNYSORBTqWmZf3yteK8KfVcdh9Ltw@mail.gmail.com>
 <f06f3b30-eb9d-17c7-3bac-ee2a31c158f2@gmail.com>
In-Reply-To: <f06f3b30-eb9d-17c7-3bac-ee2a31c158f2@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 8 Mar 2022 18:26:56 +0400
Message-ID: <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Mar 7, 2022 at 4:49 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>

(taking notes, mostly for myself)

> > Could you provide a failing test case or a more concrete suggestion on
> > what to do instead? I am all ears :)
> >
> > thanks
> >
>
> Let me describe a more concrete case. Think that egl-headless and vnc
> are enabled. The guest devices are serial virtio-gpu-gl. vnc selects
> serial at first.

(I am not sure how you would select serial first, but let's assume you did)

>
> vnc uses register_displaychangelistener and console_select to switch
> consoles.
>
> displaychangelistener_display_console does the actual switching, and
> calls dpy_gfx_switch and dpy_gfx_update if con->scanout.kind is
> SCANOUT_SURFACE. It calls dpy_gl_scanout_texture or
> dpy_gl_scanout_dmabuf if con->scanout.kind is SCANOUT_TEXTURE or
> SCANOUT_DMABUF. It works for a OpenGL display, but it doesn't vnc in
> combination with egl-headless.

(hmm, what doesn't work? With this patch, the DisplaySurface is always
switched, no matter what con->scanout.kind is)

>
> virtio-gpu-gl starts scanning out texture. It would happen in the
> following sequence:
> 1. virtio-gpu-gl calls qemu_console_resize. con->scanout.kind will be
> SCANOUT_SURFACE.
> 2. qemu_console_resize calls dpy_gfx_switch, delivering DisplaySurface
> to egl-headless. con->scanout.kind will be SCANOUT_TEXTURE.

(qemu_console_resize calls dpy_gfx_replace_surface. con.scanout.kind
is still SCANOUT_SURFACE)

(It calls displaychangelistener_gfx_switch() which will call
egl_gfx_switch() and update the current surface)

> 3. virtio-gpu-gl calls dpy_gl_scanout_texture. egl-headless starts
> rendering the texture to the DisplaySurface.

(now con.scanout.kind becomes SCANOUT_TEXTURE)

>
> In the end, the DisplaySurface will have the image rendered, and
> con->scanout.kind will be SCANOUT_TEXTURE.

(so far it works as expected, right?)



>
> Now vnc switches to virtio-gpu-gl.
>
> 4. vnc calls console_select
> 5. displaychangelistener_display_console finds con->scanout.kind is
> SCANOUT_TEXTURE so it tries to scanout texture, but vnc is not an OpenGL
> display. It essentially becomes no-op and the display would be blank.
>
> This patch will change it to call dpy_gfx_switch but not to call
> dpy_gfx_update.

Alright, I think I see what you mean. egl-headless is associated with
a specific con, and thus is not involved during vnc console switching.

However, dpy_gfx_switch on vnc is not a no-op. It updates the surface,
resize the client and mark the area dirty. Because the con.surface is
kept updated by egl-headless, the client gets the updated content.
Iow, it still works.

If we always called dpy_gfx_update() during
displaychangelistener_display_console(), it would mean for the
listener to display the surface content, even when the scanout kind is
set for a texture. Or we need to change the behaviour of
dpy_gfx_update() to depend on the current scanout kind.

Imho, it's acceptable in the current proposed form, since there is no
apparent bug (unless I miss something). However, I can try to
formulate a FIXME comment and add some documentation around the gfx
callback to improve the situation.

thanks


