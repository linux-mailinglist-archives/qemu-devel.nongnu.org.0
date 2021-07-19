Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC623CEAEF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:23:50 +0200 (CEST)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Xvc-0004vy-73
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1m5Xup-0004Eu-Au
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:22:55 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:47650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1m5Xun-0007UG-Dp
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:22:55 -0400
Received: from fwd19.aul.t-online.de (fwd19.aul.t-online.de [172.20.27.65])
 by mailout07.t-online.de (Postfix) with SMTP id B348D81577;
 Mon, 19 Jul 2021 20:22:48 +0200 (CEST)
Received: from [192.168.211.200]
 (S+OyjBZ-ghp-DMsU2t5U4sESrNBYOOjAYXlxc6GjDPbrFUXw215oskKZlygeaGHZKc@[79.208.26.7])
 by fwd19.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1m5Xud-32usD20; Mon, 19 Jul 2021 20:22:43 +0200
Subject: Re: [PATCH for 6.1 1/2] ui/gtk: add a keyboard fifo to the VTE
 consoles
To: Peter Maydell <peter.maydell@linaro.org>
References: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
 <20210718074757.22489-1-vr_qemu@t-online.de>
 <CAFEAcA9hzbs71s4aeLgwGsepwU9DgZrxcY16hr4EX9tDeeJv3Q@mail.gmail.com>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <e4f3d659-aa3d-68ab-4762-ac3239c9c2ab@t-online.de>
Date: Mon, 19 Jul 2021 20:22:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9hzbs71s4aeLgwGsepwU9DgZrxcY16hr4EX9tDeeJv3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: S+OyjBZ-ghp-DMsU2t5U4sESrNBYOOjAYXlxc6GjDPbrFUXw215oskKZlygeaGHZKc
X-TOI-EXPURGATEID: 150726::1626718963-0000782A-D8E4C971/0/0 CLEAN NORMAL
X-TOI-MSGID: 6e0d5bbc-b454-4274-be87-0400d3482029
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Zack Marvel <zpmarvel@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.07.21 um 15:00 schrieb Peter Maydell:

> On Sun, 18 Jul 2021 at 08:50, Volker Rümelin <vr_qemu@t-online.de> wrote:
>> Since commit 8eb13bbbac ("ui/gtk: vte: fix sending multiple
>> characeters") it's very easy to lock up QEMU with the gtk ui.
>> If you configure a guest with a serial device and the guest
>> doesn't listen on this device, QEMU will lock up after
>> entering two characters in the serial console.
>>
>> To fix this problem copy the function kbd_send_chars() and
>> related code from ui/console.c to ui/gtk.c. kbd_send_chars()
>> doesn't lock up because it uses a timer instead of a busy loop
>> for the write retries.
>>
>> Fixes: 8eb13bbbac ("ui/gtk: vte: fix sending multiple characeters")
>> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
>> ---
>>   include/ui/gtk.h |  5 +++++
>>   ui/gtk.c         | 53 ++++++++++++++++++++++++++++++++++++++++--------
>>   2 files changed, 50 insertions(+), 8 deletions(-)
> This feels like maybe it's the kind of thing that should be handled
> more generically rather than in one particular UI frontend ?
>
> thanks
> -- PMM

All other UI frontends (except Spice) use the correct code in 
kbd_send_chars(). I think only the GTK UI code is wrong.

With best regards
Volker

