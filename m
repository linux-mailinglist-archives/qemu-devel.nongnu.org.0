Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1D3908AE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:18:01 +0200 (CEST)
Received: from localhost ([::1]:56402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbct-0003j5-DK
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1llbYs-0001gK-L6
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:13:50 -0400
Received: from mailout03.t-online.de ([194.25.134.81]:49508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1llbYl-0003FA-T6
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:13:50 -0400
Received: from fwd01.aul.t-online.de (fwd01.aul.t-online.de [172.20.27.147])
 by mailout03.t-online.de (Postfix) with SMTP id 8D2453CBB5;
 Tue, 25 May 2021 20:13:37 +0200 (CEST)
Received: from [192.168.211.200]
 (VaIcxBZvrhgcxU+qu3md4HLCOdfN5keiS2kxauTBcr7hE7h6+kNfcxDFVlNdKXRgX3@[93.236.158.49])
 by fwd01.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1llbYe-1zsX200; Tue, 25 May 2021 20:13:36 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH v4 00/12] PS/2 controller related fixes
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <79355790-0f6f-7a3f-3525-4846c88ba8e2@t-online.de>
Date: Tue, 25 May 2021 20:13:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: VaIcxBZvrhgcxU+qu3md4HLCOdfN5keiS2kxauTBcr7hE7h6+kNfcxDFVlNdKXRgX3
X-TOI-EXPURGATEID: 150726::1621966416-0000B607-1F2FD83B/0/0 CLEAN NORMAL
X-TOI-MSGID: 99ad3001-39f3-4598-ae2a-e0f84f8a591d
Received-SPF: none client-ip=194.25.134.81; envelope-from=vr_qemu@t-online.de;
 helo=mailout03.t-online.de
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
as Philippe suggested.

v3:
Patch "pckbd: correctly disable PS/2 communication" exposed a bug
in SeaBIOS. The updated patch keeps the relevant code. Until
SeaBIOS is fixed, the PS/2 controller command KBD_CCMD_KBD_DISABLE
must disable the keyboard interrupt.

In patch "pckbd: PS/2 keyboard throttle" in function
kbd_throttle_timeout() an unnecessary if statement was removed.
The KBD_STAT_OBF flag is never set when kbd_throttle_timeout()
gets called.

v4:
Use a subsection for additional pckbd state variables. This allows
users to migrate old qemu to new qemu and back. Patches
"pckbd: don't update OBF flags if KBD_STAT_OBF is set",
"pckbd: PS/2 keyboard throttle",
"pckbd: add state variable for interrupt source",
"pckbd: add controller response queue" and
"pckbd: correctly disable PS/2 communication" look now a little
bit different.

New patch "pckbd: clear outport_present in outer pre_load()".

Volker Rümelin (12):
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
   pckbd: clear outport_present in outer pre_load()

  hw/core/machine.c |   1 +
  hw/input/pckbd.c  | 353 ++++++++++++++++++++++++++++++++++++----------
  hw/input/ps2.c    |  11 +-
  3 files changed, 286 insertions(+), 79 deletions(-)

-- 
2.26.2


