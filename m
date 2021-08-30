Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6073FB1E5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 09:26:34 +0200 (CEST)
Received: from localhost ([::1]:33212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKbgf-0001mj-OI
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 03:26:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKbf5-0000yK-Cv
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:24:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53090
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKbf3-0005cu-Va
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 03:24:55 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKbed-00023C-4d; Mon, 30 Aug 2021 08:24:32 +0100
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210829100103.1950-1-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA8G-3rJfeeS3vM7DvazJqerFzkyNMckrABF=GNOByU4Bg@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <58a68624-abc0-279c-50f2-d24c4a8b84b5@ilande.co.uk>
Date: Mon, 30 Aug 2021 08:24:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8G-3rJfeeS3vM7DvazJqerFzkyNMckrABF=GNOByU4Bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/3] escc: fix R_STATUS when SDLC mode is enabled
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.58,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/08/2021 14:19, Peter Maydell wrote:

> On Sun, 29 Aug 2021 at 11:05, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> Here is another small set of ESCC fixes from my attempts to boot MacOS on the q800
>> machine.
>>
>> When MacOS loads the OpenTransport extension on boot it attempts to enable
>> SDLC mode on the ESCC. QEMU's emulation doesn't support SDLC mode, but without
>> these fixes the active low STATUS_SYNC bit in R_STATUS is continually
>> asserted causing the extension to hang on startup as it believe it is constantly
>> receiving LocalTalk responses during its initial negotiation phase.
> 
> The ESCC data sheet is the first one I've ever encountered that includes
> a multiple-choice test on features of the device ("ESCC Questions and Answers"
> on pages 385/386: http://www.zilog.com/docs/serial/scc_escc_um.pdf ) :-)

I wonder why the idea never took hold? :D


ATB,

Mark.

