Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B4F447B96
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 09:10:16 +0100 (CET)
Received: from localhost ([::1]:44616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjzjL-0001VJ-I2
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 03:10:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjzgY-0007Na-OB
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:07:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mjzgV-0002ro-8F
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 03:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636358837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JBcr8mVNvUmmCvElcIO+v/rONCLbyqYzyADjMuOQE8s=;
 b=B6g1bH3lA02KGBgnHGF3r6+Ql1h5TVNurYpbzjCh8vKhdJpg1av8EVzeN6uEwL/6dmOALn
 h96j9H/yll7s78FMscl/MPxN3KcGprpxVwt28YLtkj6OzLdKuxryOnGF/A2RwkQKfpJq3a
 q9cohafCKm1Ls2As8bRVt1UlU2V0sPM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-JcDKbwb8PZ-K5XIbWkKZYw-1; Mon, 08 Nov 2021 03:07:14 -0500
X-MC-Unique: JcDKbwb8PZ-K5XIbWkKZYw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso3764220wrw.10
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 00:07:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JBcr8mVNvUmmCvElcIO+v/rONCLbyqYzyADjMuOQE8s=;
 b=D7+2Hq7s0IJxQCpbUmqVLP4kQfAmya1rCg6HRUcSBTtZ8TIfci41pYYgV8IbxD7IYi
 axRYDOeu3/Opv0fLlQmnTVq9OajAh4Q+QKWj9rbnELhN3F2H97GCt5b1nAOzPYRD/eeZ
 eae5ONpOPyiROLFuli2kIpA3fzRC/s3wsUOVF7f67NnXt+ZAoJKv4k0+OMBThZO/C8yb
 W74iamBIhpLfwSh9C1A1REfc2ZWmFRm7ZXpHi7Iuby1MvHQ2R9ERg240rFVrx72tNDrz
 1KOVgfVAA3cwyghFXriBrjZR7k7fregykW7VkF3K1JlwxJ3a45Z2LzF7iMya6R3VRsfq
 OfvA==
X-Gm-Message-State: AOAM5305t8PaRAxqikl7tw5AP5B/dM5shrqsEJIZ6BFtHHAz1XJWpmfy
 RA+pLFsKNXM6wHVylEGGIapHXAVJ+ZYpFTyNkcL7AU/dAP5jcg4qlukVOMcqrP8QrxjtyYy8i+q
 la20SGhE7hznYDCQ=
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr51541051wmh.86.1636358833514; 
 Mon, 08 Nov 2021 00:07:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC3+y5ohwDE8Ew+hK9Hoi+41i70LlJ2fWuiOlOBZllD5nv5pGGDaIU6operWHwwnWpiuxyyw==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr51541020wmh.86.1636358833241; 
 Mon, 08 Nov 2021 00:07:13 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a22sm1276462wme.19.2021.11.08.00.07.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 00:07:12 -0800 (PST)
Message-ID: <c04d53cc-3b64-6dbe-a045-5b20c917247b@redhat.com>
Date: Mon, 8 Nov 2021 09:07:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 4/6] ui/gtk-egl: guest fb texture needs to be regenerated
 when reinitializing egl
To: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org
References: <20211105113043.4059361-1-kraxel@redhat.com>
 <20211105113043.4059361-5-kraxel@redhat.com>
 <e44b788c-0764-66ce-f78b-a7123832fd00@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <e44b788c-0764-66ce-f78b-a7123832fd00@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/21 21:32, Laurent Vivier wrote:
> Le 05/11/2021 à 12:30, Gerd Hoffmann a écrit :
>> From: Dongwon Kim <dongwon.kim@intel.com>
>>
>> If guest fb is backed by dmabuf (blob-resource), the texture bound to the
>> old context needs to be recreated in case the egl is re-initialized (e.g.
>> new window for vc is created in case of detaching/reattaching of the tab)
>>
>> v2: call egl_dmabuf_release_texutre instead of putting 0 to
>> dmabuf->texture
>>      (Vivek Kasireddy)
>>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
>> Message-Id: <20211104065153.28897-3-dongwon.kim@intel.com>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>   ui/gtk-egl.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
>> index 21649950983f..f2026e4b5c9b 100644
>> --- a/ui/gtk-egl.c
>> +++ b/ui/gtk-egl.c
>> @@ -155,6 +155,10 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
>>               surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
>>               surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
>>           }
>> +        if (vc->gfx.guest_fb.dmabuf) {
>> +            egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>> +            gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
>> +        }
>>       }
>>         graphic_hw_update(dcl->con);
>>
> 
> This patch breaks something:
> 
> $ .../configure' '--target-list=m68k-softmmu' '--enable-virglrenderer'
> $ make
> ...
> 
> FAILED: libcommon.fa.p/ui_gtk-egl.c.o
> cc -m64 -mcx16 -Ilibcommon.fa.p
> -I../../../Projects/qemu-next/capstone/include/capstone
> -I../../../Projects/qemu-next/dtc/libfdt
> -I../../../Projects/qemu-next/slirp
> -I../../../Projects/qemu-next/slirp/src -I/usr/include/pixman-1
> -I/usr/include/libpng16 -I/usr/include/p11-kit-1 -I/usr/include/glib-2.0
> -I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4
> -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0
> -I/usr/include/virgl -I/usr/include/gtk-3.0 -I/usr/include/pango-1.0
> -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/include/fribidi
> -I/usr/include/libxml2 -I/usr/include/cairo
> -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/cloudproviders
> -I/usr/include/atk-1.0 -I/usr/include/at-spi2-atk/2.0
> -I/usr/include/dbus-1.0 -I/usr/lib64/dbus-1.0/include
> -I/usr/include/at-spi-2.0 -I/usr/include/vte-2.91
> -fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
> -isystem /home/laurent/Projects/qemu-next/linux-headers -isystem
> linux-headers -iquote . -iquote /home/laurent/Projects/qemu-next -iquote
> /home/laurent/Projects/qemu-next/include -iquote
> /home/laurent/Projects/qemu-next/disas/libvixl -iquote
> /home/laurent/Projects/qemu-next/tcg/i386 -pthread -U_FORTIFY_SOURCE
> -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
> -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -DNCURSES_WIDECHAR -D_REENTRANT
> -MD -MQ libcommon.fa.p/ui_gtk-egl.c.o -MF
> libcommon.fa.p/ui_gtk-egl.c.o.d -o libcommon.fa.p/ui_gtk-egl.c.o -c
> ../../../Projects/qemu-next/ui/gtk-egl.c
> ../../../Projects/qemu-next/ui/gtk-egl.c: In function 'gd_egl_refresh':
> ../../../Projects/qemu-next/ui/gtk-egl.c:159:13: error: implicit
> declaration of function 'egl_dmabuf_release_texture'
> [-Werror=implicit-function-declaration]
>   159 |             egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
> ../../../Projects/qemu-next/ui/gtk-egl.c:159:13: error: nested extern
> declaration of 'egl_dmabuf_release_texture' [-Werror=nested-externs]
> 
> I think we need something like:
> 
> diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
> index f2026e4b5c9b..45cb67712df0 100644
> --- a/ui/gtk-egl.c
> +++ b/ui/gtk-egl.c
> @@ -155,10 +155,12 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
>              surface_gl_destroy_texture(vc->gfx.gls, vc->gfx.ds);
>              surface_gl_create_texture(vc->gfx.gls, vc->gfx.ds);
>          }
> +#ifdef CONFIG_GBM
>          if (vc->gfx.guest_fb.dmabuf) {
>              egl_dmabuf_release_texture(vc->gfx.guest_fb.dmabuf);
>              gd_egl_scanout_dmabuf(dcl, vc->gfx.guest_fb.dmabuf);
>          }
> +#endif
>      }
> 
>      graphic_hw_update(dcl->con);

Yes, I reached to the same conclusion:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg850166.html

It would be nice to get this fixed (single buildfix patch?)
before the rc0 tag. Dongwon, could you send a patch?


