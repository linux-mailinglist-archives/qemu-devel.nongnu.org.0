Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0D3CC818
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 09:47:14 +0200 (CEST)
Received: from localhost ([::1]:46716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m51W5-0003AN-MO
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 03:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1m51VG-0002UQ-V2
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:46:22 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:53110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1m51VD-0001d9-LI
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 03:46:22 -0400
Received: from fwd27.aul.t-online.de (fwd27.aul.t-online.de [172.20.26.132])
 by mailout08.t-online.de (Postfix) with SMTP id 6AF0F78971;
 Sun, 18 Jul 2021 09:46:15 +0200 (CEST)
Received: from [192.168.211.200]
 (JJLk4vZYrh9mug27so6-gLabGESxGGYipzzK+6kUuvr46-maiyo2b+SEK6BWZeJwBZ@[79.208.26.7])
 by fwd27.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1m51V1-2zCRE00; Sun, 18 Jul 2021 09:46:07 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 0/2] ui/gtk: prevent QEMU lock up
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
Date: Sun, 18 Jul 2021 09:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: JJLk4vZYrh9mug27so6-gLabGESxGGYipzzK+6kUuvr46-maiyo2b+SEK6BWZeJwBZ
X-TOI-EXPURGATEID: 150726::1626594367-000107BB-15EF070F/0/0 CLEAN NORMAL
X-TOI-MSGID: 63e9e295-6db2-4927-9c8c-ec5cfc53abad
Received-SPF: none client-ip=194.25.134.20; envelope-from=vr_qemu@t-online.de;
 helo=mailout08.t-online.de
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
Cc: Zack Marvel <zpmarvel@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 8eb13bbbac ("ui/gtk: vte: fix sending multiple
characeters") it's very easy to lock up QEMU with the gtk ui.
If you configure a guest with a serial device and the guest
doesn't listen on this device, QEMU will lock up after
entering two characters in the serial console.

Patch 1/2 is a bug fix for 6.1.

Patch 2/2 is a preview for 6.2. If there are no objections, I
will resend this patch for the 6.2 development cycle together
with changes to ui/console similar to the changes in patch 1/2.
This will remove the QEMUFIFO code in ui/console.c.

Volker Rümelin (2):
   ui/gtk: add a keyboard fifo to the VTE consoles
   ui/gtk: drop chars if the chardev frontend makes no progress

  include/ui/gtk.h |  7 ++++
  ui/gtk.c         | 84 +++++++++++++++++++++++++++++++++++++++++++-----
  2 files changed, 83 insertions(+), 8 deletions(-)

-- 
2.26.2


