Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0874081C6
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 23:22:14 +0200 (CEST)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPWvV-0002zr-SM
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 17:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mPWuS-0001i2-Pr
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:21:08 -0400
Received: from mailout04.t-online.de ([194.25.134.18]:57328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mPWuP-0007sB-VL
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 17:21:08 -0400
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
 by mailout04.t-online.de (Postfix) with SMTP id 4FE924F1;
 Sun, 12 Sep 2021 23:21:01 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.16.31]) by fwd89.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mPWuK-16aKIr0; Sun, 12 Sep 2021 23:21:01 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 1/3] ui/console: replace QEMUFIFO with Fifo8
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <23041f12-b405-7dbc-b098-e9c48802e29c@t-online.de>
 <20210912125203.7114-1-vr_qemu@t-online.de>
 <CAJ+F1CKn+vRiUwrRF9ngSRZH865u5MCRK8jLSu0gpQQkaDDkag@mail.gmail.com>
Message-ID: <f19fb767-2230-ec3f-3641-1c6dfdc2376e@t-online.de>
Date: Sun, 12 Sep 2021 23:21:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKn+vRiUwrRF9ngSRZH865u5MCRK8jLSu0gpQQkaDDkag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1631481661-000145A5-75BC69ED/0/0 CLEAN NORMAL
X-TOI-MSGID: a1794920-0258-4df8-b23e-ce6fd757e148
Received-SPF: none client-ip=194.25.134.18; envelope-from=vr_qemu@t-online.de;
 helo=mailout04.t-online.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>
>
>     @@ -2233,8 +2188,7 @@ static void text_console_do_init(Chardev
>     *chr, DisplayState *ds)
>          int g_width = 80 * FONT_WIDTH;
>          int g_height = 24 * FONT_HEIGHT;
>
>     -    s->out_fifo.buf = s->out_fifo_buf;
>     -    s->out_fifo.buf_size = sizeof(s->out_fifo_buf);
>     +    fifo8_create(&s->out_fifo, 16);
>
>
> Missing a fif8_destroy() somewhere

Hi,

there's no function to close a text console. An opened text console 
remains open until QEMU exits. Currently QEMU doesn't free allocated 
text console resources.

With best regards,
Volker

>
>          s->kbd_timer = timer_new_ms(QEMU_CLOCK_REALTIME,
>     kbd_send_chars, s);
>          s->ds = ds;
>
>
>


