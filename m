Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C81C1376A1B
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 20:38:20 +0200 (CEST)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf5Mh-0000Jp-Uk
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 14:38:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lf51B-0000b3-TS
 for qemu-devel@nongnu.org; Fri, 07 May 2021 14:16:05 -0400
Received: from mailout02.t-online.de ([194.25.134.17]:42846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1lf4vJ-0001Rz-81
 for qemu-devel@nongnu.org; Fri, 07 May 2021 14:10:03 -0400
Received: from fwd31.aul.t-online.de (fwd31.aul.t-online.de [172.20.26.136])
 by mailout02.t-online.de (Postfix) with SMTP id 8FDF21867;
 Fri,  7 May 2021 20:08:54 +0200 (CEST)
Received: from [192.168.211.200]
 (ZkKyBsZbrhcGgbigpVdfSDgrVyBiL-jvLQuFyiNlA3X3rrOnq6b58J3PnwF4e6FQlP@[46.86.52.8])
 by fwd31.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1lf4u9-13zjk00; Fri, 7 May 2021 20:08:49 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH v2 00/11] PS/2 controller related fixes
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
Message-ID: <a898b0d5-7086-9699-ae8b-9524ad319b01@t-online.de>
Date: Fri, 7 May 2021 20:08:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: ZkKyBsZbrhcGgbigpVdfSDgrVyBiL-jvLQuFyiNlA3X3rrOnq6b58J3PnwF4e6FQlP
X-TOI-EXPURGATEID: 150726::1620410929-000102A7-972745F7/0/0 CLEAN NORMAL
X-TOI-MSGID: 8e224951-54f5-46ce-9a5e-33f2fe6f5faa
Received-SPF: none client-ip=194.25.134.17; envelope-from=vr_qemu@t-online.de;
 helo=mailout02.t-online.de
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

  hw/input/pckbd.c | 293 ++++++++++++++++++++++++++++++++++-------------
  hw/input/ps2.c   |  11 +-
  2 files changed, 223 insertions(+), 81 deletions(-)

-- 
2.26.2


