Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655175B4C55
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Sep 2022 08:17:19 +0200 (CEST)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXGHN-00025Y-QS
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 02:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oXGCp-0008Dc-Jb; Sun, 11 Sep 2022 02:12:35 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:38180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1oXGCn-0003It-F4; Sun, 11 Sep 2022 02:12:35 -0400
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout03.t-online.de (Postfix) with SMTP id E290763F0;
 Sun, 11 Sep 2022 08:12:26 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.228.180]) by fwd89.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1oXGCg-3vd3Wz0; Sun, 11 Sep 2022 08:12:26 +0200
Message-ID: <47315b0d-e6b7-60ef-8c0a-f92881ee5177@t-online.de>
Date: Sun, 11 Sep 2022 08:12:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v2 3/5] msmouse: Use fifo8 instead of array
To: Arwed Meyer <arwed.meyer@gmx.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org
References: <20220908173120.16779-1-arwed.meyer@gmx.de>
 <20220908173120.16779-4-arwed.meyer@gmx.de>
Content-Language: en-US
In-Reply-To: <20220908173120.16779-4-arwed.meyer@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1662876746-F9452742-C78E223E/0/0 CLEAN NORMAL
X-TOI-MSGID: c091a6e8-cca4-4f47-8c67-33869606de8e
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.214, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.09.22 um 19:31 schrieb Arwed Meyer:

> @@ -54,21 +60,15 @@ DECLARE_INSTANCE_CHECKER(MouseChardev, MOUSE_CHARDEV,
>   static void msmouse_chr_accept_input(Chardev *chr)
>   {
>       MouseChardev *mouse = MOUSE_CHARDEV(chr);
> -    int len;
> +    uint32_t len_out, len;
>
> -    len = qemu_chr_be_can_write(chr);
> -    if (len > mouse->outlen) {
> -        len = mouse->outlen;
> -    }
> -    if (!len) {
> +    len_out = qemu_chr_be_can_write(chr);
> +    if (!len_out || fifo8_is_empty(&mouse->outbuf)) {
>           return;
>       }
> -
> -    qemu_chr_be_write(chr, mouse->outbuf, len);
> -    mouse->outlen -= len;
> -    if (mouse->outlen) {
> -        memmove(mouse->outbuf, mouse->outbuf + len, mouse->outlen);
> -    }
> +    len = MIN(fifo8_num_used(&mouse->outbuf), len_out);
> +    qemu_chr_be_write(chr, fifo8_pop_buf(&mouse->outbuf, len, &len_out),
> +            len_out);

Hi Arwed,

I think C function arguments are not evaluated in a defined order. It's 
not defined if the third argument of function qemu_chr_be_write() is 
len_out before or after the call to fifo8_pop_buf().

The fifo_pop_buf() function uses a ringbuffer. When the buffer wraps 
around at the end and the ringbuffer contains more than one byte you may 
need two fifo8_pop_buf() and qemu_chr_be_write() calls to write all 
bytes. The code you replace doesn't have that problem.

Some chardev frontends don't return the total number of bytes to write 
in qemu_chr_be_can_write(). They return the number of bytes that can be 
written with one qemu_chr_be_write() call. You need another 
qemu_chr_be_can_write() call after the qemu_chr_be_write() call to see 
if more bytes can be written.

The code in function gd_vc_send_chars() in ui/gtk.c could be used as a 
template to avoid the three issues above.

With best regards,
Volker

>   }
>
>   static void msmouse_queue_event(MouseChardev *mouse)


