Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683513D4ECA
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 18:49:02 +0200 (CEST)
Received: from localhost ([::1]:51166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7hJE-0001eZ-Uv
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 12:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1m7hIJ-0000zl-KC
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 12:48:03 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:58856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1m7hIH-0002kO-Se
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 12:48:03 -0400
Received: from fwd27.aul.t-online.de (fwd27.aul.t-online.de [172.20.26.132])
 by mailout03.t-online.de (Postfix) with SMTP id 456FD69FB6;
 Sun, 25 Jul 2021 18:46:57 +0200 (CEST)
Received: from [192.168.211.200]
 (Gu6OGsZSQhO0a1DzZN-GF6k9xHMzGqITwLymXu-znrQiE49YlZ3E0kO2xD7+ZsGwh8@[79.208.26.7])
 by fwd27.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1m7hHE-0UXFj60; Sun, 25 Jul 2021 18:46:56 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 0/1] ui/gtk: prevent QEMU lock up
Message-ID: <d06fa203-5a89-b454-8b01-8711aaafeea2@t-online.de>
Date: Sun, 25 Jul 2021 18:46:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: Gu6OGsZSQhO0a1DzZN-GF6k9xHMzGqITwLymXu-znrQiE49YlZ3E0kO2xD7+ZsGwh8
X-TOI-EXPURGATEID: 150726::1627231616-000107BB-5E2E4F49/0/0 CLEAN NORMAL
X-TOI-MSGID: d42cf927-4af7-4529-aad1-0574b6ec10b5
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
characeters") it's very easy to lock up QEMU with the GTK ui.
If you configure a guest with a serial device and the guest
doesn't listen on this device, QEMU will lock up after
entering two characters in the serial console.

v2:
Gerd suggested to use the chr_accept_input() callback function
instead of a write retry timer and to drop patch 2/2.

Volker Rümelin (1):
   ui/gtk: add a keyboard fifo to the VTE consoles

  include/ui/gtk.h |  4 ++++
  ui/gtk.c         | 42 +++++++++++++++++++++++++++++++++---------
  2 files changed, 37 insertions(+), 9 deletions(-)

-- 
2.26.2


