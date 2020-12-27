Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DF92E31DF
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 17:44:07 +0100 (CET)
Received: from localhost ([::1]:53926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktZ9K-0001zr-UR
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 11:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktZ7q-0001A3-6f
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:42:34 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:24188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ktZ7o-0003rS-Ll
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 11:42:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 82F41746552;
 Sun, 27 Dec 2020 17:42:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 554EB74646C; Sun, 27 Dec 2020 17:42:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 5380D74645B;
 Sun, 27 Dec 2020 17:42:31 +0100 (CET)
Date: Sun, 27 Dec 2020 17:42:31 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 09/12] vt82c686: Convert debug printf to trace points
In-Reply-To: <7d9d823d-d75b-c586-218a-e40de35d8b6d@amsat.org>
Message-ID: <96aefaf1-1b8e-7da7-cf1-2e49a98b3cd5@eik.bme.hu>
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <d404014f90d8ba9d09d4c000ca599dea86992864.1609031406.git.balaton@eik.bme.hu>
 <7d9d823d-d75b-c586-218a-e40de35d8b6d@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-705507364-1609087351=:84491"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-705507364-1609087351=:84491
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 27 Dec 2020, Philippe Mathieu-Daudé wrote:
> On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>  hw/isa/trace-events |  6 ++++++
>>  hw/isa/vt82c686.c   | 51 +++++++++++++--------------------------------
>>  2 files changed, 21 insertions(+), 36 deletions(-)
> ...
>
>>          switch (superio_conf->index) {
>>          case 0x00 ... 0xdf:
>>          case 0xe4:
>>          case 0xe5:
>> +        case 0xe6 ... 0xe8: /* Should set base port of parallel and serial */
>>          case 0xe9 ... 0xed:
>>          case 0xf3:
>>          case 0xf5:
>> @@ -74,18 +68,6 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>>          case 0xfd ... 0xff:
>>              can_write = false;
>>              break;
>> -        case 0xe7:
>> -            if ((data & 0xff) != 0xfe) {
>> -                DPRINTF("change uart 1 base. unsupported yet\n");
>> -                can_write = false;
>> -            }
>> -            break;
>> -        case 0xe8:
>> -            if ((data & 0xff) != 0xbe) {
>> -                DPRINTF("change uart 2 base. unsupported yet\n");
>> -                can_write = false;
>> -            }
>> -            break;
>>          default:
>>              break;
>
> This hunk belong to a different patch (does not match the patch
> description).

In a way does, in that it removes two DPRINTFs instead of converting them. 
Maybe I should mention this in the commit message or could make it a 
separate patch but don't know if that's worth it.

Regards,
BALATON Zoltan
--3866299591-705507364-1609087351=:84491--

