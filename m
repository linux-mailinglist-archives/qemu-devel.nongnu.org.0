Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA11678E5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 09:58:15 +0100 (CET)
Received: from localhost ([::1]:54070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j548U-0002Oa-8z
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 03:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j547O-0000lJ-0g
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 03:57:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j547L-0000Xv-0q
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 03:57:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37131
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j547K-0000UE-RZ
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 03:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582275418;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eI8Z5XSmzWGcnJrxPDxHmh1Gb0OHBUpDCoUA6gqF2a8=;
 b=NsqyePm7kZYsIDRx2tVN//tImZQaEsi7NXPmQAOQSQuz0H/x57icwedl/fJ2BJBhRulZaj
 skhv49I+NIhiCg3B6G/16K0VN8PD99tUhe+fCv6iJf5G3mDOcZPZqXiZkEB05OlspGMaqT
 Aylqbr23ZtkbSiD1CCDaZ90B3rIWueU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-1lRmlCg5OG6WiE_WsftjbA-1; Fri, 21 Feb 2020 03:56:56 -0500
X-MC-Unique: 1lRmlCg5OG6WiE_WsftjbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8AEB184B127;
 Fri, 21 Feb 2020 08:56:54 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-80.bne.redhat.com [10.64.54.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09F0A5D9C5;
 Fri, 21 Feb 2020 08:56:49 +0000 (UTC)
Subject: Re: [PATCH] hw/char/pl011: Enable TxFIFO and async transmission
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200221044908.266883-1-gshan@redhat.com>
 <12b3d4d4-736b-e861-6b6b-5b6885b7cbf1@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <df096c85-8a3b-6a56-53b5-fe84c67ac341@redhat.com>
Date: Fri, 21 Feb 2020 19:56:47 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <12b3d4d4-736b-e861-6b6b-5b6885b7cbf1@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, maz@kernel.org, shan.gavin@gmail.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/20 7:25 PM, Paolo Bonzini wrote:
> On 21/02/20 05:49, Gavin Shan wrote:
>> @@ -306,6 +362,7 @@ static const VMStateDescription vmstate_pl011 = {
>>           VMSTATE_UINT32(int_enabled, PL011State),
>>           VMSTATE_UINT32(int_level, PL011State),
>>           VMSTATE_UINT32_ARRAY(read_fifo, PL011State, 16),
>> +        VMSTATE_UINT8_ARRAY(write_fifo, PL011State, 16),
>>           VMSTATE_UINT32(ilpr, PL011State),
>>           VMSTATE_UINT32(ibrd, PL011State),
>>           VMSTATE_UINT32(fbrd, PL011State),
>> @@ -313,6 +370,7 @@ static const VMStateDescription vmstate_pl011 = {
>>           VMSTATE_INT32(read_pos, PL011State),
>>           VMSTATE_INT32(read_count, PL011State),
>>           VMSTATE_INT32(read_trigger, PL011State),
>> +        VMSTATE_INT32(write_count, PL011State),
> 
> Hi Gavin, please add these two fields to a subsection, so that they are
> emitted only if write_count > 0.
> 

Hi Paolo, sure, will do in next respin :)

Thanks,
Gavin
> 
>>           VMSTATE_END_OF_LIST()
>>       }
>>   };
>> diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
>> index 14187165c6..aeaf332eca 100644
>> --- a/include/hw/char/pl011.h
>> +++ b/include/hw/char/pl011.h
>> @@ -38,6 +38,7 @@ typedef struct PL011State {
>>       uint32_t int_enabled;
>>       uint32_t int_level;
>>       uint32_t read_fifo[16];
>> +    uint8_t  write_fifo[16];
>>       uint32_t ilpr;
>>       uint32_t ibrd;
>>       uint32_t fbrd;
>> @@ -45,6 +46,7 @@ typedef struct PL011State {
>>       int read_pos;
>>       int read_count;
>>       int read_trigger;
>> +    int write_count;
>>       CharBackend chr;
>>       qemu_irq irq[6];
>>       const unsigned char *id;
>>
> 


