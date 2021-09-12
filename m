Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FAD407F6F
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 20:37:39 +0200 (CEST)
Received: from localhost ([::1]:52444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPUME-0006kb-JJ
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 14:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mPUK3-00058F-WD
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 14:35:24 -0400
Received: from mailout11.t-online.de ([194.25.134.85]:55522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mPUK0-0006hk-I9
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 14:35:23 -0400
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout11.t-online.de (Postfix) with SMTP id C8BC41734C;
 Sun, 12 Sep 2021 20:34:27 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.16.31]) by fwd81.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mPUJ9-1mfdNx0; Sun, 12 Sep 2021 20:34:27 +0200
Subject: Re: [PATCH 1/3] ui/console: replace QEMUFIFO with Fifo8
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
 <20210912125203.7114-1-vr_qemu@t-online.de>
 <CAJ+F1CKn+vRiUwrRF9ngSRZH865u5MCRK8jLSu0gpQQkaDDkag@mail.gmail.com>
 <bbf7ed4e-6664-90f9-36bf-63517b2b4583@t-online.de>
Message-ID: <535c344e-6899-0acb-3693-bff241c995c1@t-online.de>
Date: Sun, 12 Sep 2021 20:34:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <bbf7ed4e-6664-90f9-36bf-63517b2b4583@t-online.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1631471667-00013856-3F56AB2B/0/0 CLEAN NORMAL
X-TOI-MSGID: b0819319-f7ec-482e-b826-969e96d586ef
Received-SPF: none client-ip=194.25.134.85; envelope-from=vr_qemu@t-online.de;
 helo=mailout11.t-online.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 12.09.21 um 19:58 schrieb Volker Rümelin:
>>
>>     @@ -1185,6 +1138,7 @@ void kbd_put_keysym_console(QemuConsole *s,
>>     int keysym)
>>          uint8_t buf[16], *q;
>>          CharBackend *be;
>>          int c;
>>     +    uint32_t free;
>>
>>
>> Better call it num_free, to avoid symbol clash (even if we don't use 
>> free() directly), it helps reading and can prevent mistakes.
>>
>
> Hi,
>
> OK, I'll send a version 2 patch.
>
>>
>>          if (!s || (s->console_type == GRAPHIC_CONSOLE))
>>              return;
>>
>
>>     @@ -2233,8 +2188,7 @@ static void text_console_do_init(Chardev
>>     *chr, DisplayState *ds)
>>          int g_width = 80 * FONT_WIDTH;
>>          int g_height = 24 * FONT_HEIGHT;
>>
>>     -    s->out_fifo.buf = s->out_fifo_buf;
>>     -    s->out_fifo.buf_size = sizeof(s->out_fifo_buf);
>>     +    fifo8_create(&s->out_fifo, 16);
>>
>>
>> Missing a fif8_destroy() somewhere
>>
>
> An opened text console stays open until QEMU exits. There's no 
> text_console_close() function. Just like there's a ChardevClass open 
> call but no close call. I think this is one of the many cases in QEMU 
> where resources get allocated for the lifetime of QEMU.

Sorry, I think my last four sentences are simply wrong. Please ignore this.

>
>
> With best regards,
> Volker
>
>>          s->kbd_timer = timer_new_ms(QEMU_CLOCK_REALTIME,
>>     kbd_send_chars, s);
>>          s->ds = ds;
>>
>


