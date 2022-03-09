Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF17C4D2A91
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:23:32 +0100 (CET)
Received: from localhost ([::1]:50074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRrbX-0006PX-Tq
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:23:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRrZK-0005Gw-GG
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:21:14 -0500
Received: from [2607:f8b0:4864:20::636] (port=45895
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRrZI-0004GA-Kh
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:21:14 -0500
Received: by mail-pl1-x636.google.com with SMTP id q13so1296947plk.12
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 00:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=K2nkwm+3ShGY83PKX5Hf/ZsnGwJMpQ/1RV5i3OUWqc0=;
 b=hOkbdaJBZV6aJ0XxBnFvZHoQX5peRoLrnhJ+SaEiaLPYZpzy0lB7fapLBSx63oNc54
 0ti2Sf/Sf52JukCuJFVcEGJGYvbfGWdejaqmbptpfbVC4SYV87uW08Z4E06bjJUPxVcG
 +ss8WeznhLn1wpXcnUdrBvmYl1KheU8Wckt5Y4IZfyXqoTn2P/+P2lDrJXjPdgieLQuP
 A6+sQ7TbgveDugH6JnYBEkvwF61Rue6x3jKASnlw6KwvMegVrXXfhDwZW7EsTP7DwjiO
 yZd6YXinHFRfI+Uon+XvEDLCdRdh3PoGkz2DXUV/XvFJX2Ah9OrDEENxYD1CEDsjeWd3
 MpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K2nkwm+3ShGY83PKX5Hf/ZsnGwJMpQ/1RV5i3OUWqc0=;
 b=u0JmSosvz+4JqxAYaOi7hU/71LCO0lJbJmb3QwT3U81i+9lYLronCYvE3M+/BggRgc
 n5hZB+9fLi3WiO0sUup2+xBOYPKJlZOgNPwSmA0kirwJDwr2X2sQ8Xdjz3jFvubpRvOV
 gy4p5++l+pL1Tdk4cl99OHj0siIbGqGbC5OvPxs8kUwN+0E4UzYJxtg234O8zyx3rau9
 man5lHK1CIRcP71wTUZlMTgqCPoeO5e4P7InBb/eKM3Ckv1OWJWy8K6ieU1hqcscuQZS
 gYunyjUcZ/AT6Tc/nZ9V0h/F7H1JjIXKvuffn2NeGdNJPY5IjcX+weLbgl/8qQizdVn6
 ZHcQ==
X-Gm-Message-State: AOAM530zwjwVNbnW4/vQPFSckO77ar5HQ7byrxeF4TQBpjn6IHHH6qX9
 f+nql4sZwNWSUbeX5l0if9Q=
X-Google-Smtp-Source: ABdhPJwGoQVc7HkfXQZH40zhrLv4ePIAyIdDy/CM8fmgaRIUrqFudBlVu1xEWHkPn6QJ9zWGwD9ztw==
X-Received: by 2002:a17:902:d890:b0:151:6b8b:db0a with SMTP id
 b16-20020a170902d89000b001516b8bdb0amr21736137plz.15.1646814071063; 
 Wed, 09 Mar 2022 00:21:11 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a639411000000b0038011819be9sm1578693pge.41.2022.03.09.00.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 00:21:10 -0800 (PST)
Message-ID: <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
Date: Wed, 9 Mar 2022 17:21:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
 <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
 <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
 <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
 <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
 <CAMxuvaxU56M9AvS9XfZWVBNYSORBTqWmZf3yteK8KfVcdh9Ltw@mail.gmail.com>
 <f06f3b30-eb9d-17c7-3bac-ee2a31c158f2@gmail.com>
 <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
 <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
 <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 2022/03/09 17:11, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Mar 9, 2022 at 12:05 PM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>> wrote:
> 
>     On 2022/03/09 17:02, Marc-André Lureau wrote:
>      > Hi
>      >
>      > On Tue, Mar 8, 2022 at 6:43 PM Akihiko Odaki
>     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
>      > <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>> wrote:
>      >
>      >     On 2022/03/08 23:26, Marc-André Lureau wrote:
>      >      > Hi
>      >      >
>      >      > On Mon, Mar 7, 2022 at 4:49 PM Akihiko Odaki
>      >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
>     <mailto:akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>>>
>     wrote:
>      >      >>
>      >      >
>      >      > (taking notes, mostly for myself)
>      >      >
>      >      >>> Could you provide a failing test case or a more concrete
>      >     suggestion on
>      >      >>> what to do instead? I am all ears :)
>      >      >>>
>      >      >>> thanks
>      >      >>>
>      >      >>
>      >      >> Let me describe a more concrete case. Think that egl-headless
>      >     and vnc
>      >      >> are enabled. The guest devices are serial virtio-gpu-gl.
>     vnc selects
>      >      >> serial at first.
>      >      >
>      >      > (I am not sure how you would select serial first, but let's
>      >     assume you did)
>      >      >
>      >      >>
>      >      >> vnc uses register_displaychangelistener and
>     console_select to switch
>      >      >> consoles.
>      >      >>
>      >      >> displaychangelistener_display_console does the actual
>     switching, and
>      >      >> calls dpy_gfx_switch and dpy_gfx_update if
>     con->scanout.kind is
>      >      >> SCANOUT_SURFACE. It calls dpy_gl_scanout_texture or
>      >      >> dpy_gl_scanout_dmabuf if con->scanout.kind is
>     SCANOUT_TEXTURE or
>      >      >> SCANOUT_DMABUF. It works for a OpenGL display, but it
>     doesn't vnc in
>      >      >> combination with egl-headless.
>      >      >
>      >      > (hmm, what doesn't work? With this patch, the
>     DisplaySurface is
>      >     always
>      >      > switched, no matter what con->scanout.kind is)
>      >      >
>      >      >>
>      >      >> virtio-gpu-gl starts scanning out texture. It would
>     happen in the
>      >      >> following sequence:
>      >      >> 1. virtio-gpu-gl calls qemu_console_resize. con->scanout.kind
>      >     will be
>      >      >> SCANOUT_SURFACE.
>      >      >> 2. qemu_console_resize calls dpy_gfx_switch, delivering
>      >     DisplaySurface
>      >      >> to egl-headless. con->scanout.kind will be SCANOUT_TEXTURE.
>      >      >
>      >      > (qemu_console_resize calls dpy_gfx_replace_surface.
>     con.scanout.kind
>      >      > is still SCANOUT_SURFACE)
>      >      >
>      >      > (It calls displaychangelistener_gfx_switch() which will call
>      >      > egl_gfx_switch() and update the current surface)
>      >      >
>      >      >> 3. virtio-gpu-gl calls dpy_gl_scanout_texture.
>     egl-headless starts
>      >      >> rendering the texture to the DisplaySurface.
>      >      >
>      >      > (now con.scanout.kind becomes SCANOUT_TEXTURE)
>      >      >
>      >      >>
>      >      >> In the end, the DisplaySurface will have the image
>     rendered, and
>      >      >> con->scanout.kind will be SCANOUT_TEXTURE.
>      >      >
>      >      > (so far it works as expected, right?)
>      >      >
>      >      >
>      >      >
>      >      >>
>      >      >> Now vnc switches to virtio-gpu-gl.
>      >      >>
>      >      >> 4. vnc calls console_select
>      >      >> 5. displaychangelistener_display_console finds
>     con->scanout.kind is
>      >      >> SCANOUT_TEXTURE so it tries to scanout texture, but vnc
>     is not
>      >     an OpenGL
>      >      >> display. It essentially becomes no-op and the display
>     would be
>      >     blank.
>      >      >>
>      >      >> This patch will change it to call dpy_gfx_switch but not
>     to call
>      >      >> dpy_gfx_update.
>      >      >
>      >      > Alright, I think I see what you mean. egl-headless is
>     associated with
>      >      > a specific con, and thus is not involved during vnc console
>      >     switching.
>      >      >
>      >      > However, dpy_gfx_switch on vnc is not a no-op. It updates the
>      >     surface,
>      >      > resize the client and mark the area dirty. Because the
>     con.surface is
>      >      > kept updated by egl-headless, the client gets the updated
>     content.
>      >      > Iow, it still works.
>      >      >
>      >      > If we always called dpy_gfx_update() during
>      >      > displaychangelistener_display_console(), it would mean for the
>      >      > listener to display the surface content, even when the scanout
>      >     kind is
>      >      > set for a texture. Or we need to change the behaviour of
>      >      > dpy_gfx_update() to depend on the current scanout kind.
>      >
>      >     vnc has to display the surface content so dpy_gfx_update
>     should be
>      >     called for vnc, but not for OpenGL displays.
>      >
>      >
>      > VNC already marks the whole surface as dirty during
>     vnc_dpy_switch().
>      > This is like calling dpy_gfx_update().
> 
>     Then why does it call dpy_gfx_update for SCANOUT_SURFACE first
>     place? It
>     shouldn't call the function if it is not required to display the
>     surface
>     content.
> 
> 
> This is a pre-existing discrepancy. vnc handles switch with an implicit 
> update. Imho, we need to improve the code so that updates/display become 
> explicit.
> 
> But this is extra, not necessary to fix the regressions you pointed out. 
> I'd rather not mix concerns, and proceed step by step.
> 
> -- 
> Marc-André Lureau

If it is expected that dpy_gfx_update is required, it should call 
dpy_gfx_update. I agree it is not a right timing to fix vnc to remove 
the implicit update as it is pre-existing.
However the lack of dpy_gfx_update call is a regression and should be fixed.

Regards,
Akihiko Odaki

