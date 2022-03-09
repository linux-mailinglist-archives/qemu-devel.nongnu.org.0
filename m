Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6113A4D2D82
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 11:55:52 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRtyx-0002JS-4e
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 05:55:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRtxN-0001Tz-8A
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:54:13 -0500
Received: from [2607:f8b0:4864:20::435] (port=42794
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRtxK-00031h-Qe
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 05:54:12 -0500
Received: by mail-pf1-x435.google.com with SMTP id g19so1891730pfc.9
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 02:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s1F28xayREPDt2uccRq0ZKQNg7PkV9KkYEhzYK2n3Fg=;
 b=KnBNYGyPhRom/V/SNkoEj4/2gVKCscItLY86ob6z5AT5WgW5Pm1m8YV36k0FpyC0fX
 B2xOzcU7T/wZQ6oxk6BWXECNKvhA3qKZhOgBrAVkAvxo3ns6sO6j/QUr/3W6iA+d5JhN
 n3Xru+GxwYBT/2OzgKS4UJpjScZdAy8wfOsDEgu/SkoxmKhblFp5EmGWqPp7Bvl1hvjy
 rO4AeSwoSJBWliaQHLL83BvC0aGGu0iLYOoqIrxpG4UV7ctg4k+BoJNWWk/ZWXQhEHZB
 RZ5VgHwhASKv6hPBxaacp0eIwue1w110+gGK1XwbOuFNJihnJdItZqK0yLywKpBoJJpM
 fhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s1F28xayREPDt2uccRq0ZKQNg7PkV9KkYEhzYK2n3Fg=;
 b=vu1z2+x52cBx2NXnY0SegEV707EtGn9/ISPyZ7PeQzqJIVqPEGyzTr92XL69guJf8f
 0oiDxoj5A7ZUAFmNd1h1bGrLsQqQdVkChb3Lc0iJH1QBi0Uk2JoTwtHrjUNtLd6fQ78d
 dcCl/1B2irVkTI4puSWIPA6aaEqzG+jzUSs32+svYxNu5MRu25EK6TlpwlcxexImKUck
 G4+Azto81Ngo9G7Hfv/uAP3yr30HthDBK2onyufUpfmolMdNqMI7pM7eBruM7bnks8kL
 QxKi+dCiP+SFWqWoQPZOB09ctk6lmjbXm54oNmYefoloC35oKLLvn5tIrsC4Frh/xW3h
 8hUA==
X-Gm-Message-State: AOAM531Ec/T+vHeofk3vJNEV6J1y+Cbx09M/aekQbs/gjEDGlT+f5i4x
 wHSXwpCtHsCj6KLxupRjsG8=
X-Google-Smtp-Source: ABdhPJwhPQhH2i599CMg7DQY94ap0QahjOU0KOYbMPNVM2zhuv9ZcSb6+oC4yLzmfhpy3fV7MpX8Yw==
X-Received: by 2002:a63:e716:0:b0:380:85d1:656c with SMTP id
 b22-20020a63e716000000b0038085d1656cmr8011160pgi.321.1646823249361; 
 Wed, 09 Mar 2022 02:54:09 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a63214a000000b003652f4ee81fsm2023265pgm.69.2022.03.09.02.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 02:54:08 -0800 (PST)
Message-ID: <255f81de-79d4-89a6-15f6-28eb2c05cb72@gmail.com>
Date: Wed, 9 Mar 2022 19:54:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <CAMxuvawuMvxWx7xtsf=PbWnu7UypNfVWf+Bufeqbi4J=SjsU9w@mail.gmail.com>
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
 <07871c4c-58bf-b0db-b8b2-da6f0f9acfe2@gmail.com>
 <CAJ+F1CK0mEZDLb45VpoLTTVLrsqdr5b=opzBfL0ZQ+pKvtNuGw@mail.gmail.com>
 <8963a1f3-ecbe-50e1-b1e5-922e4fe63b0e@gmail.com>
 <CAJ+F1C+ynbnfSbWC6Wf4eo9EpwnKH=ytKarYd-MtgMn_D=PLig@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAJ+F1C+ynbnfSbWC6Wf4eo9EpwnKH=ytKarYd-MtgMn_D=PLig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x435.google.com
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

On 2022/03/09 19:45, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Mar 9, 2022 at 2:38 PM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>> wrote:
> 
>     On 2022/03/09 19:27, Marc-André Lureau wrote:
>      > Hi
>      >
>      > On Wed, Mar 9, 2022 at 2:20 PM Akihiko Odaki
>     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
>      > <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>> wrote:
>      >
>      >     On 2022/03/09 19:07, Marc-André Lureau wrote:
>      >      > Hi
>      >      >
>      >      > On Wed, Mar 9, 2022 at 2:01 PM Akihiko Odaki
>      >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
>     <mailto:akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>>
>      >      > <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>
>      >     <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>>> wrote:
>      >      >
>      >      >     On 2022/03/09 18:53, Marc-André Lureau wrote:
>      >      >      > Hi
>      >      >      >
>      >      >      > On Wed, Mar 9, 2022 at 1:32 PM Akihiko Odaki
>      >      >     <akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com> <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>
>      >     <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com> <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>>
>      >      >      > <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>
>      >     <mailto:akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>>
>      >      >     <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>
>      >     <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>>>> wrote:
>      >      >      >
>      >      >      >     On 2022/03/09 18:26, Gerd Hoffmann wrote:
>      >      >      >      >    Hi,
>      >      >      >      >
>      >      >      >      >> dpy_gfx_switch and dpy_gfx_update need to
>     be called to
>      >      >     finish the
>      >      >      >      >> initialization or switching of the
>     non-OpenGL display.
>      >      >     However,
>      >      >      >     the proposed
>      >      >      >      >> patch only calls dpy_gfx_switch.
>      >      >      >      >>
>      >      >      >      >> vnc actually does not need dpy_gfx_update
>     because
>      >     the vnc
>      >      >      >     implementation of
>      >      >      >      >> dpy_gfx_switch implicitly does the work for
>      >      >     dpy_gfx_update, but
>      >      >      >     the model of
>      >      >      >      >> ui/console expects the two of
>     dpy_gfx_switch and
>      >      >     dpy_gfx_update
>      >      >      >     is separated
>      >      >      >      >> and only calling dpy_gfx_switch violates
>     the model.
>      >      >      >     dpy_gfx_update used to
>      >      >      >      >> be called even in such a case before and it
>     is a
>      >     regression.
>      >      >      >      >
>      >      >      >      > Well, no, the ->dpy_gfx_switch() callback is
>      >     supposed to do
>      >      >      >     everything
>      >      >      >      > needed to bring the new surface to the
>     screen.  vnc
>      >     isn't
>      >      >     alone here,
>      >      >      >      > gtk for example does the same (see gd_switch()).
>      >      >      >      >
>      >      >      >
>      >      >      >
>      >      >      > If dpy_gfx_switch() implies a full
>     dpy_gfx_update(), then we
>      >      >     would need
>      >      >      > another callback to just set the new surface. This
>     would avoid
>      >      >      > intermediary and useless switches to 2d/surface
>     when the
>      >     scanout
>      >      >     is GL.
>      >      >      >
>      >      >      > For consistency, we should also declare that
>      >     gl_scanout_texture and
>      >      >      > gl_scanout_dmabuf imply full update as well.
>      >      >      >
>      >      >      >      > Yes, typically this is roughly the same an
>     explicit
>      >      >      >     dpy_gfx_update call
>      >      >      >      > would do.  So this could be changed if it helps
>      >     making the
>      >      >     opengl
>      >      >      >     code
>      >      >      >      > paths less confusing, but that should be a
>     separate
>      >     patch
>      >      >     series and
>      >      >      >      > separate discussion.
>      >      >      >      >
>      >      >      >      > take care,
>      >      >      >      >    Gerd
>      >      >      >      >
>      >      >      >
>      >      >      >     Then ui/cocoa is probably wrong. I don't think
>     it does the
>      >      >     update when
>      >      >      >     dpy_gfx_switch is called.
>      >      >      >
>      >      >      >     Please tell me if you think dpy_gfx_switch
>     shouldn't
>      >     do the
>      >      >     implicit
>      >      >      >     update in the future. I'll write a patch to do the
>      >     update in
>      >      >     cocoa's
>      >      >      >     dpy_gfx_switch implementation otherwise.
>      >      >      >
>      >      >      >
>      >      >      > Can we ack this series first and iterate on top? It
>     solves a
>      >      >     number of
>      >      >      > issues already and is a better starting point.
>      >      >      >
>      >      >      > thanks
>      >      >      >
>      >      >      > --
>      >      >      > Marc-André Lureau
>      >      >
>      >      >     The call of dpy_gfx_update in
>      >     displaychangelistener_display_console
>      >      >     should be removed. It would simplify the patch.
>      >      >
>      >      >     Also it is still not shown that the series is a better
>      >     alternative to:
>      >      >
>      >
>     https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/
>     <https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/>
>      >   
>       <https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/ <https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/>>
>      >      >
>      >     
>       <https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/ <https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/> <https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/ <https://patchew.org/QEMU/20220213024222.3548-1-akihiko.odaki@gmail.com/>>>
>      >      >
>      >      >     The series "ui/dbus: Share one listener for a console" has
>      >      >     significantly
>      >      >     less code than this series and therefore needs some
>     reasoning
>      >     for that.
>      >      >
>      >      >
>      >      > At this point, your change is much larger than the
>     proposed fixes.
>      >
>      >     My change does not touch the common code except reverting and
>     minimizes
>      >     the risk of regression. It also results in the less code when
>      >     applied to
>      >     the tree.
>      >
>      >
>      > The risk of regressions is proportional to the amount of code
>     change.
>      > Your change is larger (and may be even larger when updated and
>     reviewed
>      > properly). At this point in Qemu schedule, this is a greater risk.
> 
>     Possibly it can make dbus buggy, but it is not a regression as it is a
>     new feature.
> 
> 
> A regression is not necessarily against the last stable, but also on the 
> current master which is freezing as we speak.

In that sense, yes, my series could have more regressions. The premise 
of the less regression only applies to the difference between releases.

> 
> 
>      >
>      >
>      >      >
>      >      > I already discussed the rationale for the current design. To
>      >     summarize:
>      >      > - dispatching DCL in the common code allows for greater
>     reuse if an
>      >      > alternative to dbus emerges, and should help making the
>     code more
>      >     dynamic
>      >      > - the GL context split also is a separation of concerns and
>      >     should help
>      >      > for alternatives to EGL
>      >      > - dbus code only handles dbus specifics
>      >
>      >     Let me summarize my counterargument:
>      >     - The suggested reuse case is not emerged yet.
>      >
>      >
>      > It doesn't mean the design isn't superior and wanted.
> 
>     It doesn't, but it does not mean the design is superior and wanted
>     either.
> 
> 
> But your suggestion would not help in this regard.

It doesn't, but it is not shown that allowing another display to 
dispatch the GL output to multiple listeners in the same manner as dbus 
does would help in the future.

> 
> 
>      >
>      >     - The GL context split is not aligned with the reality where the
>      >     display
>      >     knows the graphics accelerator where the window resides and
>     the context
>      >     should be created. The alternative to EGL can be introduced in a
>      >     similar
>      >
>      >
>      > A GL context is not necessarily associated with a window.
> 
>     It still can happen. Even if it is not associated with a window, it
>     still requires some code to know that and the user must be aware of
>     that.
> 
> 
> That's why we have compatibility checks now (which also help in other cases)

Can you elaborate the other cases?

> 
>      >
>      >     manner with ui/egl-context.c and ui/egl-helpers.c. If several
>     context
>      >     providers need to be supported, the selection should be
>     passed as a
>      >     parameter, just as the current code does for EGL rendernode.
>      >
>      >
>      > It's not just about where the code resides, but also about the type
>      > design. It's cleaner to separate DisplayGLCtxt from
>     DisplayChangeListener.
> 
>     It would add a new failure possibility where the compatibility check
>     between DisplayGLCtx and DisplayChangeListener is flawed, which
>     happened
>     with egl-headless. Unified DisplayChangeListener is a cleaner approach
>     to describe the compatibility.
> 
> 
> Care to describe the flaw in detail?

egl-headless requires to be compatible with any displays without GL 
handlers, but that case was not considered and required a patch.

Regards,
Akihiko Odaki

> 
> 
>      >
>      >     - implementing the dispatching would allow dbus to share more
>     things
>      >     like e.g. textures converted from DisplaySurface and
>     GunixFDList for
>      >     DMA-BUF. They are not present in all displays and some are
>     completely
>      >     specific to dbus.
>      >
>      >
>      > And the dbus specific code is within dbus modules.
> 
>     The code to share e.g. GunixFDList are not yet.
> 
> 
>   ~/src/qemu   master  git grep UnixFD
> audio/dbusaudio.c:                             GUnixFDList *fd_list,
> audio/dbusaudio.c:                                 GUnixFDList *fd_list,
> audio/dbusaudio.c:                                GUnixFDList *fd_list,
> tests/qtest/dbus-display-test.c:    g_autoptr(GUnixFDList) fd_list = NULL;
> ui/dbus-chardev.c:    GUnixFDList *fd_list,
> ui/dbus-console.c:                               GUnixFDList *fd_list,
> ui/dbus-listener.c:    g_autoptr(GUnixFDList) fd_list = NULL; > ..

I meant "shared code" but "code to share GunixFDList". GunixFDLists are 
created for each listeners and not shared.

Regards,
Akihiko Odaki

> 
>      >
>      >
>      >      >
>      >      > My understanding of your proposal is that you would rather see
>      >     all this
>      >      > done within the dbus code. I disagree for the reasons above. I
>      >     may be
>      >      > proven wrong, but so far, this works as expected minor the
>      >     left-over and
>      >      > regressions you pointed out that should be fixed. Going
>     back to a
>      >      > different design should be done in a next release if
>     sufficiently
>      >     motivated.
>      >
>      >     Reverting the dbus change is the safest option if it does not
>     settle.
>      >
>      >
>      > We have a different sense of safety.
> 
>     Can you elaborate?
> 
> 
> See above.
> 
> Sorry, I'll slow down my reply, as I think we have made enough rumble 
> and not much progress.
> 
> thanks again for helping so far
> 
> 
> -- 
> Marc-André Lureau


