Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDEE381858
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:34:36 +0200 (CEST)
Received: from localhost ([::1]:39896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsZ1-0005df-PQ
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lhsXS-0002ur-Uc
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:32:58 -0400
Received: from mailout06.t-online.de ([194.25.134.19]:60026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lhsXP-0003AB-MP
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:32:58 -0400
Received: from fwd15.aul.t-online.de (fwd15.aul.t-online.de [172.20.27.63])
 by mailout06.t-online.de (Postfix) with SMTP id D91E279A26;
 Sat, 15 May 2021 13:31:33 +0200 (CEST)
Received: from [192.168.211.200]
 (S+JEayZGQh+fpD6SodgFSrHZxe536uRMXpXFx98Nz-8NyonzzS7CFvrWGXupYuhQis@[79.208.18.63])
 by fwd15.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lhsW5-2Stk240; Sat, 15 May 2021 13:31:33 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH v3 00/11] PS/2 controller related fixes
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
Message-ID: <d00ea6b1-43c7-78a2-8c0a-35e19efb5e46@t-online.de>
Date: Sat, 15 May 2021 13:31:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: S+JEayZGQh+fpD6SodgFSrHZxe536uRMXpXFx98Nz-8NyonzzS7CFvrWGXupYuhQis
X-TOI-EXPURGATEID: 150726::1621078293-0001577D-AE7B30AC/0/0 CLEAN NORMAL
X-TOI-MSGID: 1ed3ab80-3613-4da1-9dac-651518002ed9
Received-SPF: none client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series fixes two different PS/2 mouse stream corruptions
and adds a feature that allows some old misbehaving DOS programs to
have a working keyboard. With the last few patches, the PS/2 con-
troller behaves more like a real controller.

v2:
Introduce the function kbd_pending() in a preliminary patch to ease
the review of patch "pckbd: correctly disable PS/2 communication",
as Phillipe suggested.

v3:
Patch "pckbd: correctly disable PS/2 communication" exposed a bug
in SeaBIOS. The updated patch keeps the relevant code. Until
SeaBIOS is fixed, the PS/2 controller command KBD_CCMD_KBD_DISABLE
must disable the keyboard interrupt.

In patch "pckbd: PS/2 keyboard throttle" in function
kbd_throttle_timeout() an unnecessary if statement was removed.
The KBD_STAT_OBF flag is never set when kbd_throttle_timeout()
gets called.

Volker Rümelin (11):
   ps2: fix mouse stream corruption
   ps2: don't raise an interrupt if queue is full
   ps2: don't deassert irq twice if queue is empty
   pckbd: split out interrupt line changing code
   pckbd: don't update OBF flags if KBD_STAT_OBF is set
   pckbd: PS/2 keyboard throttle
   pckbd: add state variable for interrupt source
   pckbd: add controller response queue
   pckbd: add function kbd_pending()
   pckbd: correctly disable PS/2 communication
   pckbd: remove duplicated keyboard and mouse defines

  hw/input/pckbd.c | 289 ++++++++++++++++++++++++++++++++++-------------
  hw/input/ps2.c   |  11 +-
  2 files changed, 221 insertions(+), 79 deletions(-)

-- 
2.26.2


