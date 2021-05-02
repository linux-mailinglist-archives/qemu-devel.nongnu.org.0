Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86B6370B48
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 13:22:17 +0200 (CEST)
Received: from localhost ([::1]:58800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldAAx-0001Ot-Hz
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 07:22:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ldA8z-0000qx-Oa
 for qemu-devel@nongnu.org; Sun, 02 May 2021 07:20:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43434
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ldA8v-0004R7-MC
 for qemu-devel@nongnu.org; Sun, 02 May 2021 07:20:13 -0400
Received: from host109-146-177-131.range109-146.btcentralplus.com
 ([109.146.177.131] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ldA9I-00021r-CU; Sun, 02 May 2021 12:20:33 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210407175305.1771069-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2531855e-f24e-cd38-7e67-edeae26d0dc5@ilande.co.uk>
Date: Sun, 2 May 2021 12:20:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210407175305.1771069-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.131
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH-for-6.1 0/3] hw/sparc/sun4m: Introduce Sun4mMachineClass
 to access sun4m_hwdefs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/04/2021 18:53, Philippe Mathieu-Daudé wrote:

> Hi Mark,
> 
> This series QOM'ify a bit more the sun4m machines.
> I need it for a further memory maxsize check.
> It is mostly code movement (and the diff-stat is good).
> 
> Philippe Mathieu-Daudé (3):
>    hw/sparc/sun4m: Introduce TYPE_SUN4M_MACHINE and Sun4mMachineClass
>    hw/sparc/sun4m: Factor out sun4m_machine_class_common_init()
>    hw/sparc/sun4m: Make sun4m_hwdefs a Sun4mMachineClass field
> 
>   hw/sparc/sun4m.c | 178 ++++++++++++++++++-----------------------------
>   1 file changed, 69 insertions(+), 109 deletions(-)

Hi Phil,

Possibly it might be worth having an abstract TYPE_SUN4M_MACHINE and then for each 
sun4m machine to have that as a parent type? This would allow you to move 
sun4m_machine_class_common_init() directly into the abstract 
sun4m_machine_class_init() rather than having to call a function from within each 
individual class init function.

No objection to the cleanup though :)


ATB,

Mark.

