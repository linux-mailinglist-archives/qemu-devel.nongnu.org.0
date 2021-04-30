Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54FF36FE7D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:28:49 +0200 (CEST)
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcW0W-0003YP-L0
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVsw-0005jz-Ff; Fri, 30 Apr 2021 12:20:58 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:58549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVsu-0002YS-Fe; Fri, 30 Apr 2021 12:20:58 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N79hs-1lUzS32noi-017UHB; Fri, 30 Apr 2021 18:20:51 +0200
Subject: Re: [PATCH v2] ui: Fix memory leak in qemu_xkeymap_mapping_table()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210430155009.259755-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <6f9b71ba-f028-0d52-d94a-f48c206a319a@vivier.eu>
Date: Fri, 30 Apr 2021 18:20:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430155009.259755-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JrgrsAe+sa7p5Z4/udF1D+3oPo4YMmrPOIRdIT3rcnJA/s9sMkE
 QD0vVtjyHC3Y3wUF8+VPvtBAYKPDQ/8I2y8YXogtwH9iccO7qi5DJwq9NsrSXDYeBF2hUVn
 oLkfTknPAydtc9dI2hwmoA0/jiaQXd96QdkJHXWawyqjS6Er7EyENWuUvvMD8MnbLjgM3po
 N1eEoxLdbnCl6ThebsbmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vJ+EEN1YrDA=:SRecnOnUby+Xsd42CCPpoL
 PJbAfhOyvhaoEZKCMYCm4Vc1SnoMpCB1ZU4icRTYOBuxdPOQtlj6hc3nszodqsjgZEgkYEra+
 SvkjMd2Fo5K+5l+MoGOv6N7BhWSsIpl2qCn0p9ifWh6dcclPRd5D6glMdeK31tHCVGpKBl+Vq
 h9KZ49lFe8SR9EivG7veYa/uR1OkbxYJOz71t4A3HPThenZaMe7q7xitO/eYjlwQ4tjaCAILp
 +daT1qOBIrhE1IstYJUJ5kNF2We0It/GVJhq26AuRjurroAFgcmGV8FPWKNGIQXBUR2y0bHUJ
 75jtYCkjecaJuNYy5oRpzTVPtteo+aHoo4mfVEkN4+u2a5vQUlq+VR4E5gdH+xQOzOvG706/8
 lv42TqHS1F1LveySv+3Ev3QngG1ovJ8melkq71c1/5ieGiIJbF5ys4Xudoz9AANCJjVxBVqkD
 VKquapNYafS2M9Yf+E1LAwY7f3/D6GsUeId27EDEqUOBfx4pybLowgSkzZ1M1ykVtho3m+bw8
 LeeuE2OquIWAj0TYVGvDlY=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/04/2021 à 17:50, Philippe Mathieu-Daudé a écrit :
> Refactor qemu_xkeymap_mapping_table() to have a single exit point,
> so we can easily free the memory allocated by XGetAtomName().
> 
> This fixes when running a binary configured with --enable-sanitizers:
> 
>   Direct leak of 22 byte(s) in 1 object(s) allocated from:
>       #0 0x561344a7473f in malloc (qemu-system-x86_64+0x1dab73f)
>       #1 0x7fa4d9dc08aa in XGetAtomName (/lib64/libX11.so.6+0x2a8aa)
> 
> Fixes: 2ec78706d18 ("ui: convert GTK and SDL1 frontends to keycodemapdb")
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  ui/x_keymap.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/ui/x_keymap.c b/ui/x_keymap.c
> index 555086fb6bd..2ce7b899615 100644
> --- a/ui/x_keymap.c
> +++ b/ui/x_keymap.c
> @@ -56,6 +56,7 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
>  {
>      XkbDescPtr desc;
>      const gchar *keycodes = NULL;
> +    const guint16 *map;
>  
>      /* There is no easy way to determine what X11 server
>       * and platform & keyboard driver is in use. Thus we
> @@ -83,21 +84,21 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
>      if (check_for_xwin(dpy)) {
>          trace_xkeymap_keymap("xwin");
>          *maplen = qemu_input_map_xorgxwin_to_qcode_len;
> -        return qemu_input_map_xorgxwin_to_qcode;
> +        map = qemu_input_map_xorgxwin_to_qcode;
>      } else if (check_for_xquartz(dpy)) {
>          trace_xkeymap_keymap("xquartz");
>          *maplen = qemu_input_map_xorgxquartz_to_qcode_len;
> -        return qemu_input_map_xorgxquartz_to_qcode;
> +        map = qemu_input_map_xorgxquartz_to_qcode;
>      } else if ((keycodes && g_str_has_prefix(keycodes, "evdev")) ||
>                 (XKeysymToKeycode(dpy, XK_Page_Up) == 0x70)) {
>          trace_xkeymap_keymap("evdev");
>          *maplen = qemu_input_map_xorgevdev_to_qcode_len;
> -        return qemu_input_map_xorgevdev_to_qcode;
> +        map = qemu_input_map_xorgevdev_to_qcode;
>      } else if ((keycodes && g_str_has_prefix(keycodes, "xfree86")) ||
>                 (XKeysymToKeycode(dpy, XK_Page_Up) == 0x63)) {
>          trace_xkeymap_keymap("kbd");
>          *maplen = qemu_input_map_xorgkbd_to_qcode_len;
> -        return qemu_input_map_xorgkbd_to_qcode;
> +        map = qemu_input_map_xorgkbd_to_qcode;
>      } else {
>          trace_xkeymap_keymap("NULL");
>          g_warning("Unknown X11 keycode mapping '%s'.\n"
> @@ -109,6 +110,10 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
>                    "  - xprop -root\n"
>                    "  - xdpyinfo\n",
>                    keycodes ? keycodes : "<null>");
> -        return NULL;
> +        map = NULL;
>      }
> +    if (keycodes) {
> +        XFree((void *)keycodes);
> +    }
> +    return map;
>  }
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


