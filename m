Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797AF3E36F6
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 21:29:02 +0200 (CEST)
Received: from localhost ([::1]:36582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCS0D-0002DG-1u
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 15:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mCRzG-0001Go-DD
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 15:28:02 -0400
Received: from mailout05.t-online.de ([194.25.134.82]:52194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mCRzE-0003an-7k
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 15:28:02 -0400
Received: from fwd17.aul.t-online.de (fwd17.aul.t-online.de [172.20.27.64])
 by mailout05.t-online.de (Postfix) with SMTP id 1121D76A2;
 Sat,  7 Aug 2021 21:27:58 +0200 (CEST)
Received: from [192.168.211.200]
 (XZVxi0Zbgh9ZZIU-jaa8xMQ-EeM0M2HBxm3+e6JBzA3zmC-9t7eAUBBJps8UFFFZuU@[79.208.26.7])
 by fwd17.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mCRzA-2NqGHI0; Sat, 7 Aug 2021 21:27:56 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: [PATCH for 6.1 0/1] Fix chardev frontend bug in HMP
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Message-ID: <70e3486e-b486-887b-4d57-44a3fd9766ad@t-online.de>
Date: Sat, 7 Aug 2021 21:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: XZVxi0Zbgh9ZZIU-jaa8xMQ-EeM0M2HBxm3+e6JBzA3zmC-9t7eAUBBJps8UFFFZuU
X-TOI-EXPURGATEID: 150726::1628364476-0000EBC3-C7528057/0/0 CLEAN NORMAL
X-TOI-MSGID: 6cd5dc11-e55d-4b7a-8459-6c4181011096
Received-SPF: none client-ip=194.25.134.82; envelope-from=vr_qemu@t-online.de;
 helo=mailout05.t-online.de
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 584af1f1d9 (ui/gtk: add a keyboard fifo to the VTE
consoles) a GTK VTE console chardev backend relies on the
connected chardev frontend to call qemu_chr_fe_accept_input()
whenever it can receive new characters. The HMP monitor doesn't
do this. It only schedules a call to qemu_chr_fe_accept_input()
after it handled a HMP command in monitor_command_cb().

To see the problem copy and paste the word help into the GTK VTE
monitor console. You will only see the letter h. Now press the
enter key several times. Each key press will add another letter
to the word help.

I think I need help with this patch. This is the first time I
had a closer look at the monitor code so it's quite possible my
patch is completely wrong.

Volker Rümelin (1):
   monitor/hmp: schedule qemu_chr_fe_accept_input() after read

  monitor/hmp.c              |  1 +
  monitor/monitor-internal.h |  1 +
  monitor/monitor.c          | 19 +++++++++++++++++--
  3 files changed, 19 insertions(+), 2 deletions(-)

-- 
2.26.2

