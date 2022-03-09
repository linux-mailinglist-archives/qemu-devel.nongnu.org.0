Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ABE4D2AE9
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:51:14 +0100 (CET)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRs2K-00010s-0M
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRs0T-000079-He
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:49:17 -0500
Received: from [2607:f8b0:4864:20::1035] (port=37672
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRs0R-0000Ef-W6
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:49:17 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 lj8-20020a17090b344800b001bfaa46bca3so1484618pjb.2
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 00:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gQIIDIjIGRydH3d2lD4vUGVvF7icq8NqLj3rjaxV0KI=;
 b=b/kcNo4hhSwrNKV4nvDYVNhnnCgVvS5n34g63Qu/F2jxXRj07467zCu2tZkXvvyM0N
 m2BqkSkBnoif0zsMImScDlCABpltmNZDV4lRlSDg6OL67PRWNNDfbW2KBkR9LkXlmAkX
 MPMr8oP4QvMextfQniz+Zq7EPjdNKvYBQK8iIcQrtbmCYrAOKfD8jFdlETJhcrHBFaGN
 2a8l9YfH2AUKjieqSY5GcPXqKRURJTXn9IBKyKbkJckUDJqpiOh2wIJmXPZO3gBRWW/V
 l2sJTwc9nkHAhdOy+9DSjVo38sQQy3U5fq5g9qQwTvyVEeY36QTPI4kk7c0j06lCRYCk
 vPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gQIIDIjIGRydH3d2lD4vUGVvF7icq8NqLj3rjaxV0KI=;
 b=P5lE4m5fs4eaYvckulMmcRxKgdVommCH71yramXbiLDh1J/ASJLop70D2gKjsYhTKD
 UMif1WbA9U1fLlRI+jS9jXzw2/WJJ9ijGDvLgs6igljQ8kT7wIdx4RoSC+t+N93Gw3Dh
 VUYMU8ecVpjRTZHep2jaajCTnfSiywZyU8M1PdMXOBWCeteuTH3M4MuW8mz2kXfe+V/4
 3SGA2WXMWBsL2og9Uu4yuPUo6+SbvkmTmmIOuzxd/mvPf/OF2813bnhmM0GAXfGYNFJ9
 /sE5vsos8PAn5jt0UKrdf+6SBiyvYE9tb03gjSw5XooUsza/naGid6+U6AdqPeTFk/h9
 UFLA==
X-Gm-Message-State: AOAM533EvPE+FOqPe7TZsdttjw1Q3s8OBlvMkCmu/YAl3G/mD/dFXJPq
 PrZdm+dfCif20SJVkw02FCA=
X-Google-Smtp-Source: ABdhPJz2oNKTwEhNpLp+RqOGlN3oEMTcM4YXIfJmUTdAVlBuwbv2UrvQ0woUv1+KOQDxSyJXRIX0pw==
X-Received: by 2002:a17:902:f605:b0:14d:9e11:c864 with SMTP id
 n5-20020a170902f60500b0014d9e11c864mr21796785plg.54.1646815754847; 
 Wed, 09 Mar 2022 00:49:14 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056a0024ce00b004f7281cda21sm1780394pfv.167.2022.03.09.00.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 00:49:14 -0800 (PST)
Message-ID: <c080b8ce-c88f-aa37-f47d-1709c9e6dce5@gmail.com>
Date: Wed, 9 Mar 2022 17:49:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
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
 <2517a6b9-cc34-3bb1-d17e-d4e30f0e68b7@gmail.com>
 <CAJ+F1CKrDnYdMKNh1nu8LjnQ=gJ9-umgGHW-E1D1sFO1gf=Rdg@mail.gmail.com>
 <76c68a33-b157-f127-36ee-034290bf3e4b@gmail.com>
 <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAJ+F1CLvKn3r68f7LvCP-2Rni_0G7Z21jZrPqNCByHoL6WL+8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1035.google.com
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

On 2022/03/09 17:40, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Mar 9, 2022 at 12:34 PM Akihiko Odaki <akihiko.odaki@gmail.com 
> <mailto:akihiko.odaki@gmail.com>> wrote:
> 
>     On 2022/03/09 17:33, Marc-André Lureau wrote:
>      > Hi
>      >
>      > On Wed, Mar 9, 2022 at 12:21 PM Akihiko Odaki
>     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
>      > <mailto:akihiko.odaki@gmail.com
>     <mailto:akihiko.odaki@gmail.com>>> wrote:
>      >
>      >
>      >     If it is expected that dpy_gfx_update is required, it should call
>      >     dpy_gfx_update. I agree it is not a right timing to fix vnc
>     to remove
>      >     the implicit update as it is pre-existing.
>      >     However the lack of dpy_gfx_update call is a regression and
>     should
>      >     be fixed.
>      >
>      >
>      > Calling dpy_gfx_update is done when the scanount.kind is SURFACE.
>      >
>      > dpy_gfx_update is specific to SURFACE, GL uses dpy_gl_update.
>      >
>      > --
>      > Marc-André Lureau
> 
>     egl-headless requires non-OpenGL to display the surface content even if
>     scanout.kind is not SURFACE. Calling dpy_gfx_update is done when the
>     scanount.kind is SURFACE is not enough.
> 
> 
> We are going in circles... egl-headless call dpy_gfx_update on 
> dpy_gl_update.
> -- 
> Marc-André Lureau

Ok, let me summarize the situation.

The problem occurs in the following condition.
1. register_displaychangelistener of console_select is called for a 
non-OpenGL display.
2. scanout.kind is SURFACE_TEXTURE or SURFACE_DMABUF.
3. egl-headless is employed.

dpy_gfx_switch and dpy_gfx_update need to be called to finish the 
initialization or switching of the non-OpenGL display. However, the 
proposed patch only calls dpy_gfx_switch.

vnc actually does not need dpy_gfx_update because the vnc implementation 
of dpy_gfx_switch implicitly does the work for dpy_gfx_update, but the 
model of ui/console expects the two of dpy_gfx_switch and dpy_gfx_update 
is separated and only calling dpy_gfx_switch violates the model. 
dpy_gfx_update used to be called even in such a case before and it is a 
regression.

Regards,
Akihiko Odaki

