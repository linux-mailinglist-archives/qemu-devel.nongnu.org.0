Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB97C4CFF42
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:56:32 +0100 (CET)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCud-00043d-Sl
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRCnX-0003zW-3K
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:49:11 -0500
Received: from [2607:f8b0:4864:20::102b] (port=35346
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nRCnT-0005BW-9V
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 07:49:08 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso13168895pjb.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 04:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=LFoPqkTKntcCwvj5xfNyM15O6YV4yg4qPPO/FJtVXek=;
 b=TzY6Cfnh3gVLlt5Jx7H4d42XZG8ffYCUJL0PpBj6ElQZt2nwC0W1TG0ccY6N9s5MkE
 IWPsdpTb/POwoQPP0Agxt+Idic7eNu3P9UrUbbV5xH5+N9Bv/wvzQ6Bgqg/ghc9x0a94
 66+ImrBDEMT8AWjcMh85PRqIeExN47egaWPRl878Vz+mQQ7GYRDBkgKQin7xYQUGYiYE
 QJ9HY17j8b5nOmP2diHhvgobJ+bLKZCvlHNL7Kh2lEzT8rx1goSOdcUsgJV6xnxMfbU3
 +4A7HI/ECDMYxiY8R5zT9GMcIFj+50luSkvvMmWvXW/BMls0Rhj82iXAiiTeB7mczf5U
 qB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LFoPqkTKntcCwvj5xfNyM15O6YV4yg4qPPO/FJtVXek=;
 b=bMFd+kbPIgu2nOM1LrVuNsZXA3KTJKDEZqmEw1TeMxjZLCGaGt95ZunWj9s3/U6VkX
 wazfz6QaFx+/h79bo9WfgzMRib20PcqkfMQ6uylqjWtqGfDOqkh5Hn29MQ1zSm/osiH5
 uRAE+NnAx+Jtz6aKOJRIfEP99R7Bk/3+x5dZjYt8WgsX3FrNx6mONXycOJJzRGkDQFQq
 tbAgyh66E3KJNxSDtywXp92F93CiVTl9iBLmqKWYazZ3eyu31KyqRGV517DDD6+bV5Jj
 MaMkxGG1AOEJjSqJ/4JEvO+SR6FWOCX7qNKQt3Ylk4tJwCT0EgVZTgKS8DraaAzvtSYc
 DGXQ==
X-Gm-Message-State: AOAM531HycnReC4kvWepcjbs1gHEANFPLLTEL2yw2IYRUkHPjbk1Ztoq
 sDN7cyqDda+jHJLzkI/pzlo=
X-Google-Smtp-Source: ABdhPJzcKpWocu4vJQjlDwhbKxHq4mSjIEoqWWsMKyLKaAOzLWAa3E9c2rQ/whmnqDJAW0npFEtlLQ==
X-Received: by 2002:a17:902:7fc1:b0:151:f80f:494a with SMTP id
 t1-20020a1709027fc100b00151f80f494amr535312plb.81.1646657342987; 
 Mon, 07 Mar 2022 04:49:02 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a6540ca000000b0037445e95c93sm11883134pgp.15.2022.03.07.04.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 04:49:02 -0800 (PST)
Message-ID: <f06f3b30-eb9d-17c7-3bac-ee2a31c158f2@gmail.com>
Date: Mon, 7 Mar 2022 21:49:00 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
 <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
 <CAMxuvaw_QT4wEGLZRNJEd1m-58JV-8AOc6CHKkMw4i_yrVNgew@mail.gmail.com>
 <28ef9b06-3225-112f-b664-176e67c824d9@gmail.com>
 <CAMxuvaz3+ySgiOxawVT=P7x4ikDcap0o5Ux78_HdewL0XXa5Kg@mail.gmail.com>
 <d7df9ba7-40db-7b2a-63d7-eacf811da4f2@gmail.com>
 <CAMxuvaxU56M9AvS9XfZWVBNYSORBTqWmZf3yteK8KfVcdh9Ltw@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CAMxuvaxU56M9AvS9XfZWVBNYSORBTqWmZf3yteK8KfVcdh9Ltw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
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

On 2022/03/07 21:32, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Mar 7, 2022 at 4:24 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>
>> On 2022/03/07 20:50, Marc-André Lureau wrote:
>>> Hi
>>>
>>> On Mon, Mar 7, 2022 at 2:35 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>>>
>>>> On 2022/03/07 19:19, Marc-André Lureau wrote:
>>>>> Hi Akihiko
>>>>>
>>>>> On Mon, Mar 7, 2022 at 12:09 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>>>>>>
>>>>>> On 2022/03/07 16:46, marcandre.lureau@redhat.com wrote:
>>>>>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>>>>
>>>>>>> egl-headless depends on the backing surface to be set before texture are
>>>>>>> set and updated. Display it (update=true) iff the current scanout kind
>>>>>>> is SURFACE.
>>>>>>
>>>>>> egl-headless does not dynamically call register_displaychangelistener
>>>>>> and has console associated (console_select would not affect egl-headless
>>>>>> itself) so this should not be necessary.
>>>>>
>>>>> Could you help me understand, what should not be necessary?
>>>>
>>>> I read the description as it sets the backing surface for egl-headless
>>>> when register_displaychangelistener or console_select is called. The
>>>> change is not necessary.
>>>
>>> Without it, gfx_switch is not called to set the new surface. Switching
>>> console with VNC would fail (via ctrl+alt+num).
>>
>> Yes, but that is not because egl-headless requires its dpy_gfx_switch to
>> be called. It is because vnc does not receive the surface. The patch
>> adds a call of dpy_gfx_switch no matter if the receiver is an OpenGL
>> display or not, but an OpenGL display would not need one.
> 
> That's why I added the "update" argument to
> displaychangelistener_gfx_switch(). "gfx_switch" merely indicates that
> the DisplaySurface has changed, not to show it.
> 
>>>
>>>>
>>>>>
>>>>>> The remaining problem with egl-headless is that egl-headless renders the
>>>>>> image to DisplaySurface, and a non-OpenGL display (namely vnc) has to
>>>>>> consume it instead of texture even when con->scanout.kind is
>>>>>> SCANOUT_TEXTURE or SCANOUT_DMABUF.
>>>>>
>>>>> This is already happening, because egl-headless calls dpy_gfx_update().
>>>>
>>>> It is not called when register_displaychangelistener or console_select
>>>> is called by non-OpenGL display consuming the DisplaySurface.
>>>
>>> When displaychangelistener_display_console() is called with
>>> con->scanount.kind == SCANOUT_SURFACE, it calls gfx_update(update ==
>>> TRUE), and thus calls gfx_update on the whole surface.
>>>
>>
>> con->scanout.kind is SCANOUT_TEXTURE or SCANOUT_DMABUF when egl-headless
>> is rendering to surface. It would not call gfx_update in the case.
> 
>   GL updates go through egl_scanout_flush (dpy_gl_update callback),
> which calls dpy_gfx_update() which is in turned handled by
> vnc_dpy_update().
> 
> Could you provide a failing test case or a more concrete suggestion on
> what to do instead? I am all ears :)
> 
> thanks
> 

Let me describe a more concrete case. Think that egl-headless and vnc 
are enabled. The guest devices are serial virtio-gpu-gl. vnc selects 
serial at first.

vnc uses register_displaychangelistener and console_select to switch 
consoles.

displaychangelistener_display_console does the actual switching, and 
calls dpy_gfx_switch and dpy_gfx_update if con->scanout.kind is 
SCANOUT_SURFACE. It calls dpy_gl_scanout_texture or 
dpy_gl_scanout_dmabuf if con->scanout.kind is SCANOUT_TEXTURE or 
SCANOUT_DMABUF. It works for a OpenGL display, but it doesn't vnc in 
combination with egl-headless.

virtio-gpu-gl starts scanning out texture. It would happen in the 
following sequence:
1. virtio-gpu-gl calls qemu_console_resize. con->scanout.kind will be 
SCANOUT_SURFACE.
2. qemu_console_resize calls dpy_gfx_switch, delivering DisplaySurface 
to egl-headless. con->scanout.kind will be SCANOUT_TEXTURE.
3. virtio-gpu-gl calls dpy_gl_scanout_texture. egl-headless starts 
rendering the texture to the DisplaySurface.

In the end, the DisplaySurface will have the image rendered, and 
con->scanout.kind will be SCANOUT_TEXTURE.

Now vnc switches to virtio-gpu-gl.

4. vnc calls console_select
5. displaychangelistener_display_console finds con->scanout.kind is 
SCANOUT_TEXTURE so it tries to scanout texture, but vnc is not an OpenGL 
display. It essentially becomes no-op and the display would be blank.

This patch will change it to call dpy_gfx_switch but not to call 
dpy_gfx_update.

Regards,
Akihiko Odaki

