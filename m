Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6529A2F9E34
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:33:09 +0100 (CET)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1SmR-0007ZN-W3
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Skf-00072t-8F
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:31:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Skb-0008Kj-MO
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610969472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aTKapHRF6Lj6+WhAfnW2ESnDhmdPUQxUdwECCP8MAag=;
 b=Vl2z38MEV3fuiwTbTbt0FTyAr76wsLeDuAW/KKL8TOf6V/UrfAocuP8nNm5wAR8+pX3y60
 122dj6nBXC0lsMLfKQpYmrFOIcHyT8+oVD3j+bY9D0e516HE7gt3jU+fcImkn+5xieF/i2
 Zy+Q1C0Gbbb2sjAXoRXWLWpEC2gF3Ps=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-CD9nxSEGOXm9UMsIIvtu7Q-1; Mon, 18 Jan 2021 06:31:11 -0500
X-MC-Unique: CD9nxSEGOXm9UMsIIvtu7Q-1
Received: by mail-ej1-f70.google.com with SMTP id gs3so5100427ejb.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 03:31:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aTKapHRF6Lj6+WhAfnW2ESnDhmdPUQxUdwECCP8MAag=;
 b=Cv4rGfak4vwm9qF1kuju+kBuLdyQ+fZyY/6dAcow5uZPcblyLolz5PCFBJb1PAIorQ
 J/odGOy376MkMnQgHGOsNC2WYSK3mVKa9wHX1raRYgC66dcrNpbGHub4Hpc1Xk4duwsb
 ObhnWyR7/zCrd+dEuprmx5eWNsGL5yn+/oR+fBcMeK4uezzHL17UYlE/xrtEt//kHPS3
 oXc3u7SNxUUXb/VUhtZOIdyPG3DzxzJlHnWnatr17NsoVXP+fYoHMTHGWxWrvQnv5VSD
 HVAAugqSiJHoXpKI+NOdAypq4z4hu8Pwapfp1+3tZRsk3UgE0RzQrrIVFJ/rbgIT45PV
 sIXg==
X-Gm-Message-State: AOAM531OoOGdS4bHk5WU+Int93lQDejXinXcpkbyQCxVGgPLn4le76Wz
 RM0hrxcynryqN+SpsDVba7fFRJAHRsIs1lK36vu/7DCdB3e50VDW77zdviahdfH+X5uN3NUnRMy
 C1dZX5cBju6Y3b50=
X-Received: by 2002:a05:6402:4c1:: with SMTP id
 n1mr19001726edw.66.1610969470055; 
 Mon, 18 Jan 2021 03:31:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTCTjR6LeB133FSwleOPBeRwE9OcnC6XFT6P4DfVoB0x+glG98yyq1AIXs4+Rxtd6HutSDRg==
X-Received: by 2002:a05:6402:4c1:: with SMTP id
 n1mr19001707edw.66.1610969469737; 
 Mon, 18 Jan 2021 03:31:09 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j23sm10755398edv.45.2021.01.18.03.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 03:31:08 -0800 (PST)
Subject: Re: [Qemu-devel] [PULL 7/7] hw/usb: avoid format truncation warning
 when formatting port name
To: Gerd Hoffmann <kraxel@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20190503065954.17069-1-kraxel@redhat.com>
 <20190503065954.17069-8-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <227c9e6b-61e4-d9ec-1b4b-b33d6323bbd9@redhat.com>
Date: Mon, 18 Jan 2021 12:31:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20190503065954.17069-8-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 5/3/19 8:59 AM, Gerd Hoffmann wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
> hw/usb/hcd-xhci.c: In function ‘usb_xhci_realize’:
> hw/usb/hcd-xhci.c:3339:66: warning: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 5 [-Wformat-trunca\
> tion=]
>  3339 |             snprintf(port->name, sizeof(port->name), "usb2 port #%d", i+1);
>       |                                                                  ^~
> hw/usb/hcd-xhci.c:3339:54: note: directive argument in the range [1, 2147483647]
>  3339 |             snprintf(port->name, sizeof(port->name), "usb2 port #%d", i+1);
>       |                                                      ^~~~~~~~~~~~~~~
> 
> The xhci code formats the port name into a fixed length
> buffer which is only large enough to hold port numbers
> upto 5 digits in decimal representation. We're never
> going to have a port number that large, so aserting the
> port number is sensible is sufficient to tell GCC the
> formatted string won't be truncated.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20190412121626.19829-5-berrange@redhat.com>
> 
> [ kraxel: also s/int/unsigned int/ to tell gcc they can't
>           go negative. ]
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/usb/hcd-xhci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
> index d8472b4fea7f..2e9a839f2bf9 100644
> --- a/hw/usb/hcd-xhci.c
> +++ b/hw/usb/hcd-xhci.c
> @@ -3306,7 +3306,7 @@ static void usb_xhci_init(XHCIState *xhci)
>  {
>      DeviceState *dev = DEVICE(xhci);
>      XHCIPort *port;
> -    int i, usbports, speedmask;
> +    unsigned int i, usbports, speedmask;
>  
>      xhci->usbsts = USBSTS_HCH;
>  
> @@ -3336,6 +3336,7 @@ static void usb_xhci_init(XHCIState *xhci)
>                  USB_SPEED_MASK_LOW  |
>                  USB_SPEED_MASK_FULL |
>                  USB_SPEED_MASK_HIGH;
> +            assert(i < MAXPORTS);
>              snprintf(port->name, sizeof(port->name), "usb2 port #%d", i+1);
>              speedmask |= port->speedmask;
>          }
> @@ -3349,6 +3350,7 @@ static void usb_xhci_init(XHCIState *xhci)
>              }
>              port->uport = &xhci->uports[i];
>              port->speedmask = USB_SPEED_MASK_SUPER;
> +            assert(i < MAXPORTS);
>              snprintf(port->name, sizeof(port->name), "usb3 port #%d", i+1);
>              speedmask |= port->speedmask;
>          }
> 

I am confused, I upgraded Fedora 32 -> 33 and am now getting this
error back, the assertion being apparently ignored:

C compiler for the host machine: cc (gcc 10.2.1 "cc (GCC) 10.2.1
20201125 (Red Hat 10.2.1-9)")

...
                      QEMU_CFLAGS: -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
-m32 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv  -m32
-Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
                     QEMU_LDFLAGS: -Wl,--warn-common -Wl,-z,relro
-Wl,-z,now -m32  -m32 -fstack-protector-strong
...

[889/5130] Compiling C object libcommon.fa.p/hw_usb_hcd-xhci.c.o
FAILED: libcommon.fa.p/hw_usb_hcd-xhci.c.o
cc -Ilibcommon.fa.p -I. -I.. -I../slirp -I../slirp/src
-I../capstone/include/capstone -I../dtc/libfdt -Iqapi -Itrace -Iui
-Iui/shader -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include
-I/usr/include/libmount -I/usr/include/blkid -I/usr/include/gio-unix-2.0
-I/usr/include/pixman-1 -I/usr/include/p11-kit-1
-fdiagnostics-color=auto -pipe -Wall -Winvalid-pch -Werror -std=gnu99
-O2 -g -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -m32 -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -m32 -Wold-style-declaration
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
-Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
-fstack-protector-strong -isystem linux-headers -isystem linux-headers
-iquote tcg/i386 -iquote . -iquote accel/tcg -iquote include -iquote
disas/libvixl -pthread -fPIC -MD -MQ libcommon.fa.p/hw_usb_hcd-xhci.c.o
-MF libcommon.fa.p/hw_usb_hcd-xhci.c.o.d -o
libcommon.fa.p/hw_usb_hcd-xhci.c.o -c ../hw/usb/hcd-xhci.c
../hw/usb/hcd-xhci.c: In function 'usb_xhci_realize':
../hw/usb/hcd-xhci.c:3309:54: error: '%d' directive output may be
truncated writing between 1 and 8 bytes into a region of size 5
[-Werror=format-truncation=]
 3309 |             snprintf(port->name, sizeof(port->name), "usb2 port
#%d", i+1);
      |                                                      ^~~~~~~~~~~~~~~
../hw/usb/hcd-xhci.c:3309:54: note: directive argument in the range [1,
89478486]
In file included from /usr/include/stdio.h:866,
                 from include/qemu/osdep.h:85,
                 from ../hw/usb/hcd-xhci.c:22:
/usr/include/bits/stdio2.h:70:10: note: '__builtin___snprintf_chk'
output between 13 and 20 bytes into a destination of size 16
   70 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL
- 1,
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   71 |        __bos (__s), __fmt, __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../hw/usb/hcd-xhci.c:3323:54: error: '%d' directive output may be
truncated writing between 1 and 8 bytes into a region of size 5
[-Werror=format-truncation=]
 3323 |             snprintf(port->name, sizeof(port->name), "usb3 port
#%d", i+1);
      |                                                      ^~~~~~~~~~~~~~~
../hw/usb/hcd-xhci.c:3323:54: note: directive argument in the range [1,
89478486]
In file included from /usr/include/stdio.h:866,
                 from include/qemu/osdep.h:85,
                 from ../hw/usb/hcd-xhci.c:22:
/usr/include/bits/stdio2.h:70:10: note: '__builtin___snprintf_chk'
output between 13 and 20 bytes into a destination of size 16
   70 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL
- 1,
      |
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   71 |        __bos (__s), __fmt, __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors


