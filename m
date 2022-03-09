Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8386B4D2D05
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:21:52 +0100 (CET)
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtS3-0005AO-Lf
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:21:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRtQi-0003gM-EM
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:20:28 -0500
Received: from [2607:f8b0:4864:20::102e] (port=56310
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRtQg-00060e-L3
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:20:28 -0500
Received: by mail-pj1-x102e.google.com with SMTP id e3so1762411pjm.5
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y/NtJKRNgESeyDm5pcQJRqAMUhQThTA9Vd19qfSJO/4=;
 b=pUaH1YqWFfM1HRYKwwJ0+O9IaEAUy9czrtfTHFlFq+vuZuDX2pT7Wtj+FsFeWuZ8eG
 ozVtR9wkvRCCMmkLZXQwPA2DZPlCCLNfblOVI9NfeJ8vU6LEWkfZbKPtcrCwJHplxRB8
 ccmo45c4iBZdJyyFCQIDyYePF/nDvZDbsFDAIeUOOLAl9DUTLa3FeysXCs098vdJ8mym
 K38whMl+SdkB3YR3/O5gPOC4upE+Gp1cJrtJfiVpVL20WSKMEPp6W4W7qGA3OZzNTQ9Z
 2A8aZHCJfievuNEN+/EvzB0GPyMMoaPZR3cXS4Wh9/dFRxEZ5zsElYES3fMnQnqE78cx
 yf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y/NtJKRNgESeyDm5pcQJRqAMUhQThTA9Vd19qfSJO/4=;
 b=0frcKpjqZb8Raufht8CuhE7Gv6+YZmElpNNWu51m04C2KFTRAHVwcVrGQzvcwzaM5F
 5W/ZEaAqcOI7xn1waoy19LXymj6ylLaS7XdfdhYn2YYQjP/A/g0fROMgEqDC6uHqq1ZL
 xxA4iPSil6nKDW8ZqO02AXO3jI+4gLo9sXE1+ENNvYN7M5uMvs5gB3HvKhHKPOH6x6tB
 AxP5S85AU5VpPYLaoEUjmvr/LS3M1xVPZ9TJx5sV+aPxjkZyeTTSk09lyA2jAIkrvB6y
 vyyXw00cgu4CmTdidtAXiIZ0nc+ecwpJkBTMyBWoLuFdIuANrtY2sXfCQg7hc5/ZXvTw
 iDKg==
X-Gm-Message-State: AOAM531/DxGLDcoUNfPdYwW/Q7ABBkekMw1pNquUieatojiZ+l6iQD9W
 HTus9pLIwDJ9u5kme5LEo4s=
X-Google-Smtp-Source: ABdhPJx9Kt5LY8JVhZ6K+6+JIuMDjFiGew8kfN5cMa6obO4cO/d9EBC/LQL4cDmgV81m7OoonLoG+A==
X-Received: by 2002:a17:90b:1e0a:b0:1bf:4d46:741c with SMTP id
 pg10-20020a17090b1e0a00b001bf4d46741cmr9546438pjb.116.1646821225309; 
 Wed, 09 Mar 2022 02:20:25 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 x29-20020aa79a5d000000b004f0ef1822d3sm2248910pfj.128.2022.03.09.02.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 02:20:24 -0800 (PST)
Message-ID: <07871c4c-58bf-b0db-b8b2-da6f0f9acfe2@gmail.com>
Date: Wed, 9 Mar 2022 19:20:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
 <1fa142fb-7988-db25-c283-a6b16278f628@gmail.com>
 <CAJ+F1CLDm9+myAJdNQdU2y64Fa-2+ew2oGih_cWim1=vO=sLMw@mail.gmail.com>
 <e1a9ab86-912b-2628-1e60-4aec4eac25d3@gmail.com>
 <CAJ+F1CKJHqA5DJv1WvY8q0k2rNW+ERFbFgMGKggMuMUJCPs5vg@mail.gmail.com>
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
 <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
 <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
 <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
 <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
 <20220309092605.5izvcbp6pougm6ye@sirius.home.kraxel.org>
 <5986332a-1f9c-01bf-e3e7-329cf2d04672@gmail.com>
 <CAJ+F1CJL_33rgpAG3s2TboxgzsgC1fEcDJ5Y=Cxc1Tbb6w0W6w@mail.gmail.com>
 <750d1ed6-9c02-bd1b-3988-eb44665e8e5a@gmail.com>
 <CAJ+F1CJiLdmrZbfQ0z_ObC0_GveAc4jqcj9JYN8uBCpAJUhJXA@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAJ+F1CJiLdmrZbfQ0z_ObC0_GveAc4jqcj9JYN8uBCpAJUhJXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102e.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/09 19:07, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Mar 9, 2022 at 2:01 PM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>> wrote:
> 
>     On 2022/03/09 18:53, Marc-André Lureau wrote:
>      > Hi
>      >
>      > On Wed, Mar 9, 2022 at 1:32 PM Akihiko Odaki
>     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
>      > <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>> wrote:
>      >
>      >     On 2022/03/09 18:26, Gerd Hoffmann wrote:
>      >      >    Hi,
>      >      >
>      >      >> dpy_gfx_switch and dpy_gfx_update need to be called to
>     finish the
>      >      >> initialization or switching of the non-OpenGL display.
>     However,
>      >     the proposed
>      >      >> patch only calls dpy_gfx_switch.
>      >      >>
>      >      >> vnc actually does not need dpy_gfx_update because the vnc
>      >     implementation of
>      >      >> dpy_gfx_switch implicitly does the work for
>     dpy_gfx_update, but
>      >     the model of
>      >      >> ui/console expects the two of dpy_gfx_switch and
>     dpy_gfx_update
>      >     is separated
>      >      >> and only calling dpy_gfx_switch violates the model.
>      >     dpy_gfx_update used to
>      >      >> be called even in such a case before and it is a regression.
>      >      >
>      >      > Well, no, the ->dpy_gfx_switch() callback is supposed to do
>      >     everything
>      >      > needed to bring the new surface to the screen.  vnc isn't
>     alone here,
>      >      > gtk for example does the same (see gd_switch()).
>      >      >
>      >
>      >
>      > If dpy_gfx_switch() implies a full dpy_gfx_update(), then we
>     would need
>      > another callback to just set the new surface. This would avoid
>      > intermediary and useless switches to 2d/surface when the scanout
>     is GL.
>      >
>      > For consistency, we should also declare that gl_scanout_texture and
>      > gl_scanout_dmabuf imply full update as well.
>      >
>      >      > Yes, typically this is roughly the same an explicit
>      >     dpy_gfx_update call
>      >      > would do.  So this could be changed if it helps making the
>     opengl
>      >     code
>      >      > paths less confusing, but that should be a separate patch
>     series and
>      >      > separate discussion.
>      >      >
>      >      > take care,
>      >      >    Gerd
>      >      >
>      >
>      >     Then ui/cocoa is probably wrong. I don't think it does the
>     update when
>      >     dpy_gfx_switch is called.
>      >
>      >     Please tell me if you think dpy_gfx_switch shouldn't do the
>     implicit
>      >     update in the future. I'll write a patch to do the update in
>     cocoa's
>      >     dpy_gfx_switch implementation otherwise.
>      >
>      >
>      > Can we ack this series first and iterate on top? It solves a
>     number of
>      > issues already and is a better starting point.
>      >
>      > thanks
>      >
>      > --
>      > Marc-André Lureau
> 
>     The call of dpy_gfx_update in displaychangelistener_display_console
>     should be removed. It would simplify the patch.
> 
>     Also it is still not shown that the series is a better alternative to:
>     https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/
>     <https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/>
> 
>     The series "ui/dbus: Share one listener for a console" has
>     significantly
>     less code than this series and therefore needs some reasoning for that.
> 
> 
> At this point, your change is much larger than the proposed fixes.

My change does not touch the common code except reverting and minimizes 
the risk of regression. It also results in the less code when applied to 
the tree.

> 
> I already discussed the rationale for the current design. To summarize:
> - dispatching DCL in the common code allows for greater reuse if an 
> alternative to dbus emerges, and should help making the code more dynamic
> - the GL context split also is a separation of concerns and should help 
> for alternatives to EGL
> - dbus code only handles dbus specifics

Let me summarize my counterargument:
- The suggested reuse case is not emerged yet.
- The GL context split is not aligned with the reality where the display 
knows the graphics accelerator where the window resides and the context 
should be created. The alternative to EGL can be introduced in a similar 
manner with ui/egl-context.c and ui/egl-helpers.c. If several context 
providers need to be supported, the selection should be passed as a 
parameter, just as the current code does for EGL rendernode.
- implementing the dispatching would allow dbus to share more things 
like e.g. textures converted from DisplaySurface and GunixFDList for 
DMA-BUF. They are not present in all displays and some are completely 
specific to dbus.

> 
> My understanding of your proposal is that you would rather see all this 
> done within the dbus code. I disagree for the reasons above. I may be 
> proven wrong, but so far, this works as expected minor the left-over and 
> regressions you pointed out that should be fixed. Going back to a 
> different design should be done in a next release if sufficiently motivated.

Reverting the dbus change is the safest option if it does not settle.

Regards,
Akuhiko Odaki

 > --
 > Marc-André Lureau

