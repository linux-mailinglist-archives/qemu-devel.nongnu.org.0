Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A106C6E59B4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 08:53:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pofCk-0006X9-9U; Tue, 18 Apr 2023 02:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pofCe-0006Ia-PR
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 02:52:38 -0400
Received: from mailout05.t-online.de ([194.25.134.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pofCQ-0005rq-Ge
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 02:52:36 -0400
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout05.t-online.de (Postfix) with SMTP id BD7F019621;
 Tue, 18 Apr 2023 08:52:14 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.18.128]) by fwd80.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pofCI-3JjsiP0; Tue, 18 Apr 2023 08:52:14 +0200
Message-ID: <59ffc014-ec48-64a4-3403-7e64c5594053@t-online.de>
Date: Tue, 18 Apr 2023 08:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 qemu-devel@nongnu.org
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH v2 0/1] SDL2: fix handling of the AltGr key on Windows again
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1681800734-AE6BCCC3-6F561553/0/0 CLEAN NORMAL
X-TOI-MSGID: d6e80738-76e4-4d9b-8b3e-037db5575935
Received-SPF: none client-ip=194.25.134.82; envelope-from=vr_qemu@t-online.de;
 helo=mailout05.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Based-on: <20230417192139.43263-1-shentey@gmail.com>
([PATCH v2 0/2] SDL2 usability fixes)

Windows sends an extra left control key up/down input event for
every right alt key up/down input event for keyboards with
international layout. Since commit 830473455f ("ui/sdl2: fix
handling of AltGr key on Windows") QEMU uses a Windows low level
keyboard hook procedure to reliably filter out the special left
control key and to grab the keyboard on Windows.

SDL2 version 2.0.16 introduced its own Windows low level keyboard
hook procedure to grab the keyboard. When enabled with a grabbed
keyboard, this disables the special left control key filter and
handling of the AltGr key on Windows is broken again.

This patch fixes handling of the AltGr key on Windows with
international keyboard layout.

v2:
Fixed the cover letter subject, so that :patchew applies this
patch series to the correct QEMU branch.

Volker Rümelin (1):
   ui/sdl2: disable SDL_HINT_GRAB_KEYBOARD on Windows

  ui/sdl2.c | 3 +++
  1 file changed, 3 insertions(+)

-- 
2.35.3


