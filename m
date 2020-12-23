Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE052E2250
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 23:06:32 +0100 (CET)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksCH8-0002TS-Vy
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 17:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ksCG9-00022L-7d
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:05:29 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43708
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ksCG3-0008LC-0H
 for qemu-devel@nongnu.org; Wed, 23 Dec 2020 17:05:29 -0500
Received: from host86-184-125-210.range86-184.btcentralplus.com
 ([86.184.125.210] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ksCFv-0006De-K0; Wed, 23 Dec 2020 22:05:15 +0000
To: Guenter Roeck <linux@roeck-us.net>, BALATON Zoltan <balaton@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <e90b9df0-5173-6e2b-3572-4f21ac318231@amsat.org>
 <2c478b3e-5098-1887-73b3-90f91a808ad8@ilande.co.uk>
 <1d33fa46-2079-ad40-d579-6e827543de50@roeck-us.net>
 <f04ae64-fa4a-2e21-1468-cf37315ec9b2@eik.bme.hu>
 <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <536fedf3-d61a-39cf-b806-c282a124e202@ilande.co.uk>
Date: Wed, 23 Dec 2020 22:05:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <c64fe3a4-cd9c-b455-53ce-c53fb6cf0632@roeck-us.net>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.184.125.210
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Problems with irq mapping in qemu v5.2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/12/2020 21:01, Guenter Roeck wrote:

> I don't have a real machine, and therefore did not test it on one.
> 
> I tried with Linux mainline (v5.10-12913-g614cb5894306), v3.16.85, v4.4.248,
> and v4.14.212. I can't test older version because my cross compiler is too
> new. Each of those kernel versions shows exactly the same behavior.

Is it possible for you to provide links to your drive image and kernel so that we can 
reproduce the same environment to investigate?


ATB,

Mark.

