Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BCC4CF368
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:17:02 +0100 (CET)
Received: from localhost ([::1]:39354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8Y9-0003Dp-RY
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:17:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR8QQ-00013S-Cy
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:09:02 -0500
Received: from [2607:f8b0:4864:20::1030] (port=32934
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nR8QO-00028k-7I
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:09:02 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso5950287pjc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UdHMAiwxJ1X+e2wjauw3dH5/Ns6CPm3UdVPuEGDkeDk=;
 b=gHQq+fhBzaa9LmVPBhv06leOpOzycSXb4+y+iG714MD1Pb4qyIs71WgB/VJXAsbJIP
 41zbHK4PYNWlGuV2RrPpLDavGA+IDC6scIy4xQsGE07qNnkzhtPP5iW+gnYrc987qX6Q
 SrAOG3T67FT6IndNocXSdnc7eGUc6j3rEDK2FdpzXFKvUPecFGhP3ntUVBvUzs9WU/2l
 oVusfBb+TryYbaumyZ95TZLX1VE2+rNYCLnt/b9bJoj816QW4kJHktgnOQEueJ4fDF2L
 VhzQmlD1fRS1buaIFqvNn+VN2EiyT/M3UIjFA4vfTrlXyBTRQ7Aeeh17wOt+aqHGr8U6
 NZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UdHMAiwxJ1X+e2wjauw3dH5/Ns6CPm3UdVPuEGDkeDk=;
 b=J/LiFEXT9+SBGqOvd6jG4VuRnwcmSBMHHMNAbN/3O1eZ154kEZdUkdBvmSpFheOb8b
 9BLmcIPLliOPUJeRslDt620br2EmpgVzUbbF1pqvbBLNIWD1HXiBuMm7Uhns/tuBPZwk
 mAiTtG+5KmTP59jXCd88ISQ34d4FhrGPxCpYEEG+xcG90JwinU78YR0QHzVvjKi1CQ/y
 9sOEFKbmi8dttbe1dBBLCalY8bYjw+8jYxTHLj2Eh9jiAi+oec9Uwoibd6HmPd8nHPw+
 acuSyQXLdawcuFOIFO/wN1PmYSEgJ2MpNWvoUsxn1wxb+qasiXd2/qZu2S5HzTYwDvCY
 7CaA==
X-Gm-Message-State: AOAM531l0/B8YwyJL+hRGr05AjqWxxbD2tvUXbY89GbFR3H/8cTP9Z9O
 UQ2GpkUt3R5/PIFEnp/dc3U=
X-Google-Smtp-Source: ABdhPJzA5tBVD1Uw/cPPPe4wFFAWmP2HL9YKRNYBhcinS8j4vL/+ciTUuCXHJJoScKcan5B9R7NgxQ==
X-Received: by 2002:a17:90a:4411:b0:1bc:99b0:acad with SMTP id
 s17-20020a17090a441100b001bc99b0acadmr23918429pjg.25.1646640538441; 
 Mon, 07 Mar 2022 00:08:58 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7888e000000b004e5c2c0b9dcsm15137425pfe.30.2022.03.07.00.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:08:57 -0800 (PST)
Message-ID: <c80fde18-bb3e-e780-356c-f935e7390e4d@gmail.com>
Date: Mon, 7 Mar 2022 17:08:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 12/12] ui/console: call gfx_switch() even if the
 current scanout is GL
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220307074632.238049-1-marcandre.lureau@redhat.com>
 <20220307074632.238049-13-marcandre.lureau@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220307074632.238049-13-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/07 16:46, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> egl-headless depends on the backing surface to be set before texture are
> set and updated. Display it (update=true) iff the current scanout kind
> is SURFACE.

egl-headless does not dynamically call register_displaychangelistener 
and has console associated (console_select would not affect egl-headless 
itself) so this should not be necessary.

The remaining problem with egl-headless is that egl-headless renders the 
image to DisplaySurface, and a non-OpenGL display (namely vnc) has to 
consume it instead of texture even when con->scanout.kind is 
SCANOUT_TEXTURE or SCANOUT_DMABUF.

Regards,
Akihiko Odaki

> 
> Reported-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   ui/console.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/ui/console.c b/ui/console.c
> index 5bfecea4549e..16a0b0909ba2 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1112,6 +1112,10 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
>           return;
>       }
>   
> +    dpy_gfx_create_texture(con, con->surface);
> +    displaychangelistener_gfx_switch(dcl, con->surface,
> +                                     con->scanout.kind == SCANOUT_SURFACE);
> +
>       if (con->scanout.kind == SCANOUT_DMABUF &&
>           displaychangelistener_has_dmabuf(dcl)) {
>           dcl->ops->dpy_gl_scanout_dmabuf(dcl, con->scanout.dmabuf);
> @@ -1126,9 +1130,6 @@ static void displaychangelistener_display_console(DisplayChangeListener *dcl,
>                                            con->scanout.texture.y,
>                                            con->scanout.texture.width,
>                                            con->scanout.texture.height);
> -    } else if (con->scanout.kind == SCANOUT_SURFACE) {
> -        dpy_gfx_create_texture(con, con->surface);
> -        displaychangelistener_gfx_switch(dcl, con->surface, TRUE);
>       }
>   }
>  

