Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF53D39DA89
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 13:02:39 +0200 (CEST)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqD1i-0006aa-CN
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 07:02:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lqD01-00057X-Hd; Mon, 07 Jun 2021 07:00:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:60078
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lqCzr-0002LZ-Ik; Mon, 07 Jun 2021 07:00:53 -0400
Received: from host81-154-6-215.range81-154.btcentralplus.com ([81.154.6.215]
 helo=[192.168.1.65]) by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lqCzU-0000Hq-EW; Mon, 07 Jun 2021 12:00:25 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-stable@nongnu.org, pbonzini@redhat.com,
 fam@euphon.net, laurent@vivier.eu
References: <20210518212511.21688-1-mark.cave-ayland@ilande.co.uk>
 <b617c218-6364-66e0-85d5-0db501282b4a@ilande.co.uk>
Message-ID: <206f744b-54cf-de7b-15aa-2bc45240ead6@ilande.co.uk>
Date: Mon, 7 Jun 2021 12:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b617c218-6364-66e0-85d5-0db501282b4a@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.154.6.215
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/2] esp: minor fixes for older Linux versions
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/05/2021 08:07, Mark Cave-Ayland wrote:

> On 18/05/2021 22:25, Mark Cave-Ayland wrote:
> 
>> Following on from the ESP changes in QEMU 6.0 someone pointed out that the old
>> Linux 2.6 ESP driver as used in Aurelian's SPARC image at
>> https://people.debian.org/~aurel32/qemu/sparc/ emits a constant stream of
>> "esp0: STEP_ASEL for tgt 0" messages to the console during boot.
>>
>> These patches solve the issue so that the older image is able to boot cleanly
>> once again. The first patch is a genuine bug fix for the QEMU 6.0 changes whilst
>> the second works around the delayed bus phase change when deferring IO transfers
>> from the end of the command phase to the start of the information transfer
>> phase.
>>
>> I've tested this using the extended suite of images used for the QEMU 6.0 changes
>> and confirmed that there are no other regressions.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>
>>
>> Mark Cave-Ayland (2):
>>    esp: only assert INTR_DC interrupt flag if selection fails
>>    esp: only set ESP_RSEQ at the start of the select sequence
>>
>>   hw/scsi/esp.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> Ping?

Ping again?


ATB,

Mark.

