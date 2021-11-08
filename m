Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B03D447C30
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:44:29 +0100 (CET)
Received: from localhost ([::1]:46746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0GS-0007BM-0Z
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:44:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk0FU-0006Sc-0B
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:43:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk0FP-0000TU-Ow
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636361001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BmAo+yOkEGPTMwyOuDhQR9wweHYskuaPJQuEG/hFLxw=;
 b=QiLsze6EIJCnwIoEuSTMfQAc0xaqMAfAQGr8mrHSeTvOioiDPbs5J2QLlQ6msy00SAn3fc
 wGWmLUQ0ZcLItLyuIMDMal4p0gElTRIEELGLbXKPr2bzro3hcBDG1k/oAhFCMNJyfSlugr
 knlkVEjRSgaGqkUzxVHjU+GgGTrBv3s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-qFsEwO_HO2-Y-Nony9gVug-1; Mon, 08 Nov 2021 03:43:20 -0500
X-MC-Unique: qFsEwO_HO2-Y-Nony9gVug-1
Received: by mail-ed1-f72.google.com with SMTP id
 z1-20020a05640235c100b003e28c89743bso14129201edc.22
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BmAo+yOkEGPTMwyOuDhQR9wweHYskuaPJQuEG/hFLxw=;
 b=b17NZY3ZCn9bXGihqu5VZX1431NIx5YcrwKayMwLru0UqArqFmPcAxvI7CQFBa9y1E
 Eqb+TN8bGijf4eZ3TP6bGpH3P+cIc3nAL56m+qhoHiJGjPFce4nj1jPDSP7ko2ZnXRK/
 6FmZs8iKDgs1ZkP3N09T2Ztc+IoCmVo8uhEERIc4+ojl0kLI+oC7CjE+g8H07FLs3JcT
 HzZz8tt9w+pA/3tE4fqIoYhO8JP1f9+5rC8BYt89RlEChRPdTM0mhJMWU6tM7VRjIglX
 dCp1ZEEeeJflQxra3Ezcpg64rlsnCtfLFlxFXa/tIBJmjXmDgs7HoXzr8WfAX1z+X6Hn
 wX8A==
X-Gm-Message-State: AOAM530QMpPM+cbqgxJmyiek6wktTI0wZHcchMil/4UqRAOw+Gpli+Iq
 f65haM4imTyCgdCvYXYYCcMM9yo+Zp+OMRhvvbBjzNzpIo8VtNn7RFJNKg+Qg1/I1Uuun0uoDNX
 DjeG+B9WAErBCYsE=
X-Received: by 2002:a17:906:4fc4:: with SMTP id i4mr75129ejw.81.1636360999602; 
 Mon, 08 Nov 2021 00:43:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJJDcDda4bYV6c7IkrG7rPqAsDUFSfhedna19GoSlnrrDJJh/stiYPWZAuVKx+pEPFkRfvhA==
X-Received: by 2002:a17:906:4fc4:: with SMTP id i4mr75100ejw.81.1636360999365; 
 Mon, 08 Nov 2021 00:43:19 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id jg36sm7988420ejc.44.2021.11.08.00.43.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 00:43:18 -0800 (PST)
Message-ID: <d656c6e5-2efa-6c60-dbfc-6a616bfd7ff9@redhat.com>
Date: Mon, 8 Nov 2021 09:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH-for-6.2] ui/gtk-egl: Fix build failure when libgbm is
 not available
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211108083129.1262040-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211108083129.1262040-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Dongwon Kim <dongwon.kim@intel.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 09:31, Philippe Mathieu-Daudé wrote:
> Since commit 4872a023a59 ("ui/gtk-egl: guest fb texture needs
> to be regenerated when reinitializing egl") we get on Ubuntu
> 18.04.4 LTS and Debian Buster (oldstable):
> 
>    $ ../configure --enable-virglrenderer
>    [...]
>    ui/gtk-egl.c: In function 'gd_egl_refresh':
>    ui/gtk-egl.c:159:13: error: implicit declaration of function 'egl_dmabuf_release_texture' [-Werror=implicit-function-declaration]
>      159 |             egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>          |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    ui/gtk-egl.c:159:13: error: this function declaration is not a prototype [-Werror,-Wstrict-prototypes]
>    ui/gtk-egl.c:159:13: error: nested extern declaration of 'egl_dmabuf_release_texture' [-Werror=nested-externs]
> 
> Fix by restricting the egl_dmabuf_release_texture() call to the
> availability of the generic buffer management library (libgbm).

Matches other uses of the variable; queued the patch, thanks.

Paolo

> Fixes: 4872a023a593e6519b272a
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   ui/gtk-egl.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> index f2026e4b5c9..45cb67712df 100644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -155,10 +155,12 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
>               surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
>               surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
>           }
> +#ifdef CONFIG_GBM
>           if (vc->gfx.guest_fb.dmabuf) {
>               egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>               gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
>           }
> +#endif
>       }
>   
>       graphic_hw_update(dcl->con);
> 


