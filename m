Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4EC40EAC3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 21:23:31 +0200 (CEST)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQwyo-0006gu-Ex
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 15:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mQwxd-0005yb-RK
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 15:22:17 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:36862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mQwxc-0005Qz-36
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 15:22:17 -0400
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
 by mailout07.t-online.de (Postfix) with SMTP id C8F48FE81;
 Thu, 16 Sep 2021 21:21:17 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.16.31]) by fwd88.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mQwwd-19b2Vl0; Thu, 16 Sep 2021 21:21:16 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH v2 0/4] ui/console: chardev backend improvements
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <b383305b-0604-bf6e-1f66-aefeaef1df82@t-online.de>
Date: Thu, 16 Sep 2021 21:21:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TOI-EXPURGATEID: 150726::1631820076-0000F120-1D842ABE/0/0 CLEAN NORMAL
X-TOI-MSGID: 892ef5c4-9c94-4174-854e-8271333258ae
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A few things I learnt while writing a fix for a chardev bug
in the GTK backend.

v2:
Patch "ui/console: replace QEMUFIFO with Fifo8". Renamed the
variable free to num_free to help reading the code. (Marc-André)

New patch "ui/console: prevent use after free error".
ui/gtk.c needs a similar patch. I'll take care of it.

Volker Rümelin (4):
   ui/console: replace QEMUFIFO with Fifo8
   ui/console: replace kbd_timer with chr_accept_input callback
   ui/console: remove chardev frontend connected test
   ui/console: prevent use after free error

  ui/console.c | 110 ++++++++++++++-------------------------------------
  1 file changed, 30 insertions(+), 80 deletions(-)

-- 
2.31.1

