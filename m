Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3603748A8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 21:22:30 +0200 (CEST)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leN6L-0000u8-GO
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 15:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1leN4q-0000QZ-Dx
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:20:56 -0400
Received: from mailout08.t-online.de ([194.25.134.20]:60754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1leN4o-0006RW-DN
 for qemu-devel@nongnu.org; Wed, 05 May 2021 15:20:56 -0400
Received: from fwd21.aul.t-online.de (fwd21.aul.t-online.de [172.20.27.66])
 by mailout08.t-online.de (Postfix) with SMTP id 1F19480DCA;
 Wed,  5 May 2021 21:20:49 +0200 (CEST)
Received: from [192.168.211.200]
 (Vsj25YZBghM6x2K2y3Qsb768Tj52h0d3EhcwmLHBqFj7IoK2rnCeKHZBWmGvRVVQoT@[46.86.52.8])
 by fwd21.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1leN4h-3hCXR20; Wed, 5 May 2021 21:20:47 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH 00/10] PS/2 controller related fixes
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aed90d92-4e34-6f33-005f-10cf176e5483@t-online.de>
Date: Wed, 5 May 2021 21:20:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: Vsj25YZBghM6x2K2y3Qsb768Tj52h0d3EhcwmLHBqFj7IoK2rnCeKHZBWmGvRVVQoT
X-TOI-EXPURGATEID: 150726::1620242447-00002A54-53382A39/0/0 CLEAN NORMAL
X-TOI-MSGID: 3ed6fd5c-3423-4595-a1b5-466d2ed7d770
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series fixes two different PS/2 mouse stream corruptions
and adds a feature that allows some old misbehaving DOS programs to
have a working keyboard. With the last few patches, the PS/2 con-
troller behaves more like a real controller.

Volker Rümelin (10):
   ps2: fix mouse stream corruption
   ps2: don't raise an interrupt if queue is full
   ps2: don't deassert irq twice if queue is empty
   pckbd: split out interrupt line changing code
   pckbd: don't update OBF flags if KBD_STAT_OBF is set
   pckbd: PS/2 keyboard throttle
   pckbd: add state variable for interrupt source
   pckbd: add controller response queue
   pckbd: correctly disable PS/2 communication
   pckbd: remove duplicated keyboard and mouse defines

  hw/input/pckbd.c | 293 ++++++++++++++++++++++++++++++++++-------------
  hw/input/ps2.c   |  11 +-
  2 files changed, 223 insertions(+), 81 deletions(-)

-- 
2.26.2


