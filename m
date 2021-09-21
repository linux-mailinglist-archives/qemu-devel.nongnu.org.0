Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1902A412F5A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 09:27:02 +0200 (CEST)
Received: from localhost ([::1]:52226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSaBB-0002nU-4z
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 03:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSa8o-0001Jq-7D
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 03:24:34 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45668
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSa8m-0003Du-Da
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 03:24:33 -0400
Received: from [2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mSa8d-000CDR-Re; Tue, 21 Sep 2021 08:24:24 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, laurent@vivier.eu
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
 <20210916100554.10963-11-mark.cave-ayland@ilande.co.uk>
 <e01c06c2-2260-1229-f25d-f721b2438532@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <02ddb11c-c84b-2738-7ba9-6eba147bdbfa@ilande.co.uk>
Date: Tue, 21 Sep 2021 08:24:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e01c06c2-2260-1229-f25d-f721b2438532@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9d:4100:5d98:71b5:90ca:dad1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 10/20] nubus-device: remove nubus_register_rom() and
 nubus_register_format_block()
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

On 19/09/2021 22:10, Philippe Mathieu-Daudé wrote:

> On 9/16/21 12:05, Mark Cave-Ayland wrote:
>> Since there is no need to generate a dummy declaration ROM, remove both
>> nubus_register_rom() and nubus_register_format_block(). These will shortly be
>> replaced with a mechanism to optionally load a declaration ROM from disk to
>> allow real images to be used within QEMU.
> 
> Nubus neophyte question: is it OK to load a device without
> optional ROM nor dummy?

Yes, since the physical existence of the card is determined by whether the card 
accesses generate a bus fault, as per the Apple documentation, which is fixed in 
patch 8. The macfb device is an example of this since at least for the Quadra ROM its 
resources are not on the card itself, but stored in the MacOS toolbox ROM (normally 
referenced as slot 0xf).

Having said that, without a declaration ROM being present then your driver would have 
to be able to identify the card the hard way, and at least Linux attempts to parse 
the MacOS resources during enumeration. So I'd expect declaration ROMs to be required 
for nubus devices that don't have corresponding drivers included in a standard MacOS 
toolbox ROM which is likely to be the majority of cases.


ATB,

Mark.

