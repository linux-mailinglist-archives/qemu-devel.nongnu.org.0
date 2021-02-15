Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 370C231C415
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 23:36:48 +0100 (CET)
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBmU3-0007Z9-AA
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 17:36:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lBmSk-000713-Jw
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:35:26 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38030
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lBmSi-0001SO-FT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 17:35:26 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lBmSy-0001ZF-0G; Mon, 15 Feb 2021 22:35:45 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net, laurent@vivier.eu
References: <20210209193018.31339-1-mark.cave-ayland@ilande.co.uk>
 <20210209193018.31339-31-mark.cave-ayland@ilande.co.uk>
 <0978e91b-d2e8-ce30-87de-cba2896ecc16@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ce56bbc6-8467-db6d-599d-c52c56ad6f5f@ilande.co.uk>
Date: Mon, 15 Feb 2021 22:35:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0978e91b-d2e8-ce30-87de-cba2896ecc16@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 30/42] esp: add 4 byte PDMA read and write transfers
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/02/2021 18:56, Philippe Mathieu-Daudé wrote:

> On 2/9/21 8:30 PM, Mark Cave-Ayland wrote:
>> The MacOS toolbox ROM performs 4 byte reads/writes when transferring data to
>> and from the target. Since the SCSI bus is 16-bits wide, use the memory API
>> to split a 4 byte access into 2 x 2 byte accesses.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/scsi/esp.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Out of curiosity, what is the bus used?

AFAICT it's a custom logic chip that sits on the CPU address/data buses that does the 
decoding between the CPU and ESP chip. Other than a simple block diagram of the 
Quadra there isn't much official documentation out there :/

Are you planning to review any more of this series? I'm keen to put out a (hopefully 
final) v3 soon, but I'll hold off for little while if you want more time to look over 
the remaining patches.


ATB,

Mark.

