Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A193E5BC2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 15:33:33 +0200 (CEST)
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDRsq-0008Lt-B6
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 09:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mDRrp-0007ZU-Uj
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:32:29 -0400
Received: from mailout09.t-online.de ([194.25.134.84]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mDRro-0007Ks-2E
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 09:32:29 -0400
Received: from fwd21.aul.t-online.de (fwd21.aul.t-online.de [172.20.27.66])
 by mailout09.t-online.de (Postfix) with SMTP id 1D42B17925;
 Tue, 10 Aug 2021 15:31:14 +0200 (CEST)
Received: from [192.168.211.200]
 (bNAriuZHZhOISiVBy8LvUEEzdUyVPeZ8FebzWwxtky0aDCAWGmHyzbfwCB7w0yqgyM@[79.208.26.7])
 by fwd21.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mDRqZ-4JedSi0; Tue, 10 Aug 2021 15:31:11 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH for 6.2 v2 0/3] ps2: fix issue #501 and #502
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <c00e87fc-8d29-27bf-9e8f-65d8343e9dbe@t-online.de>
Date: Tue, 10 Aug 2021 15:31:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: bNAriuZHZhOISiVBy8LvUEEzdUyVPeZ8FebzWwxtky0aDCAWGmHyzbfwCB7w0yqgyM
X-TOI-EXPURGATEID: 150726::1628602271-00002A54-909BCDB9/0/0 CLEAN NORMAL
X-TOI-MSGID: 9f133f04-8be4-4014-ad1d-dade531dc684
Received-SPF: none client-ip=194.25.134.84; envelope-from=vr_qemu@t-online.de;
 helo=mailout09.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit ff6e1624b3 (pckbd: don't update OBF flags if
KBD_STAT_OBF is set) the OSes Minoca OS and Visopsys no longer
have a working PS/2 keyboard and mouse. This is caused by a
PS/2 queue stall due to a lost interrupt in the guest OS. This
already happened before commit ff6e1624b3, but no one noticed
because up to that point QEMU sent gratuitous keyboard and mouse
interrupts and the queue restarted with keyboard input or mouse
movement.

The lost interrupt is a guest bug. The fact that it's always
lost is due to an inexact PS/2 keyboard emulation. The way in
which the two operating systems e.g. set the keyboard LEDs,
leaves a keyboard ACK reply in the keyboard queue that is
unexpected for the guests.

This patch series improves the PS/2 keyboard emulation.

There's a workaround for issue #501 and #502 so I don't think
this is rc3 material. But that decision is up to the maintainers.

To verify patch 2/3 I plugged in an additional PS/2 keyboard
into the host and started Linux with the command line option
initcall_blacklist=i8042_init. Here is an example of the sequence
to set the keyboard LEDs.

# #regular sequence to set the keyboard LEDs
# inb --hex 0x64
1c
# #PS/2 queue is empty
# outb 0x60 0xed
# inb --hex 0x64
15
# inb --hex 0x60
fa
# inb --hex 0x64
14
# outb 0x60 0x01
# inb --hex 0x64
15
# inb --hex 0x60
fa
# inb --hex 0x64
14

# #alternative sequence to set the keyboard LEDs
# inb --hex 0x64
14
# outb 0x60 0xed
# inb --hex 0x64
15
# outb 0x60 0x00
# inb --hex 0x64
15
# inb --hex 0x60
fa
# inb --hex 0x64
14

v2:
improved patch 2/3 commit message.

Volker Rümelin (3):
   ps2: use the whole ps2 buffer but keep queue size
   ps2: use a separate keyboard command reply queue
   ps2: migration support for command reply queue

  hw/input/ps2.c | 214 ++++++++++++++++++++++++++++++-------------------
  1 file changed, 133 insertions(+), 81 deletions(-)

-- 
2.26.2

