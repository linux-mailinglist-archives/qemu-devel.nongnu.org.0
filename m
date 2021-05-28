Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2637393D87
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 09:12:51 +0200 (CEST)
Received: from localhost ([::1]:54760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmWfq-0000RU-PN
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 03:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lmWeU-0007wu-L9
 for qemu-devel@nongnu.org; Fri, 28 May 2021 03:11:26 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:48820
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lmWeS-0006T4-Um
 for qemu-devel@nongnu.org; Fri, 28 May 2021 03:11:26 -0400
Received: from host86-134-213-168.range86-134.btcentralplus.com
 ([86.134.213.168] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lmWeE-0001Qe-81; Fri, 28 May 2021 08:11:14 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu, hpoussin@reactos.org
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <cf1b703a-7329-c88e-e4b5-82630c62f0df@ilande.co.uk>
Date: Fri, 28 May 2021 08:11:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.134.213.168
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/5] esp: fixes for MacOS toolbox ROM
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

On 19/05/2021 11:07, Mark Cave-Ayland wrote:

> This patchset contains more ESP fixes from my attempts to boot MacOS under
> the QEMU q800 machine (along with a related NetBSD fix).
> 
> With these patches it is possible for the MacOS toolbox ROM and MacOS drivers
> to detect and access SCSI drives and CDROMs during the MacOS boot process.
> 
> This patchset has been tested on top of the ESP fix series posted yesterday
> (see https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg05763.html) with
> the extended set of ESP test images without noticing any regressions.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> [q800-macos-upstream patchset series: 1]
> 
> 
> Mark Cave-Ayland (5):
>    esp: allow non-DMA callback in esp_transfer_data() initial transfer
>    esp: handle non-DMA transfers from the target one byte at a time
>    esp: ensure PDMA write transfers are flushed from the FIFO to the
>      target immediately
>    esp: revert 75ef849696 "esp: correctly fill bus id with requested lun"
>    esp: correctly accumulate extended messages for PDMA
> 
>   hw/scsi/esp.c | 137 ++++++++++++++++++++++++++++++--------------------
>   1 file changed, 83 insertions(+), 54 deletions(-)

Ping? I'd be particularly interested if anyone could clarify the history around the 
code removed by patch 4...


ATB,

Mark.

