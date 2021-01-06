Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8195F2EBE31
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 14:05:15 +0100 (CET)
Received: from localhost ([::1]:48702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx8Uz-0008GX-HH
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 08:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kx8Tf-0007Lx-ER
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kx8Tc-0003zj-QU
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:03:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609938228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RhiL7eK1evW1qxiPVZ2ba9+Nl6RlSsNF8NqKF9jMfuQ=;
 b=M+T/ByvB9qBVym7sbWQkO55Z2njnSf6KLyK/zNJmUWQrb+ikhrWbXPzjwQWACJSifaxU2u
 PmIJW8PirYVsjMvU4tJHH7Xgf9NQ2SVDyl3E4Gd5v8TtWswCDN1rewHtxijK9UDojt0mHs
 xd7xFYRnzlZ75xXNRvseVU/yts4o37M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-f5PSvN3ONfm41Q5fusUK8Q-1; Wed, 06 Jan 2021 08:03:46 -0500
X-MC-Unique: f5PSvN3ONfm41Q5fusUK8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CFFB800D55;
 Wed,  6 Jan 2021 13:03:44 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-219.ams2.redhat.com [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1198F10023AB;
 Wed,  6 Jan 2021 13:03:40 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] ppc4xx: Move common dependency on serial to common
 option
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1609636173.git.balaton@eik.bme.hu>
 <94f1eb7cfb7f315bd883d825f3ce7e0cfc2f2b69.1609636173.git.balaton@eik.bme.hu>
 <2f801d9c-abe9-95c7-9b6a-ec1d66f83286@redhat.com>
 <a394197c-7ce7-bc6d-afa5-68f21d08f22@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d3b3c977-e24d-8a30-cdaf-b82f19b0b004@redhat.com>
Date: Wed, 6 Jan 2021 14:03:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a394197c-7ce7-bc6d-afa5-68f21d08f22@eik.bme.hu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 f4bug@amsat.org, qemu-ppc@nongnu.org, Guenter Roeck <linux@roeck-us.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/01/2021 02.39, BALATON Zoltan via wrote:
> On Sun, 3 Jan 2021, Thomas Huth wrote:
>> On 03/01/2021 02.09, BALATON Zoltan via wrote:
>>> All machines that select SERIAL also select PPC4XX so we can just add
>>> this common dependency there once.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>   hw/ppc/Kconfig | 5 +----
>>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>>
>>> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
>>> index dd86e664d2..8548f42b0d 100644
>>> --- a/hw/ppc/Kconfig
>>> +++ b/hw/ppc/Kconfig
>>> @@ -37,7 +37,6 @@ config PPC405
>>>       select M48T59
>>>       select PFLASH_CFI02
>>>       select PPC4XX
>>> -    select SERIAL
>>>     config PPC440
>>>       bool
>>> @@ -46,13 +45,13 @@ config PPC440
>>>       imply E1000_PCI
>>>       select PCI_EXPRESS
>>>       select PPC4XX
>>> -    select SERIAL
>>>       select FDT_PPC
>>>     config PPC4XX
>>>       bool
>>>       select BITBANG_I2C
>>>       select PCI
>>> +    select SERIAL
>>
>> Not sure whether this is really the right way to go... serial_hd() and 
>> serial_mm_init() are only used in ppc405_uc.c
>> and ppc440_bamboo.c, so IMHO it does make sense to keep the SERIAL setting 
>> with PPC405 and PPC440.
>>
>>
>>>   config SAM460EX
>>>       bool
>>> @@ -61,7 +60,6 @@ config SAM460EX
>>>       select IDE_SII3112
>>>       select M41T80
>>>       select PPC440
>>> -    select SERIAL
>>
>> But this hunk here should be fine, I think, since PPC440 already includes 
>> the SERIAL switch.
> 
> If it's OK in this case why doesn't the same argument apply in case of 
> PPC440 including PPC4XX which then includes SERIAL. All these boards use 
> serial_mm_init but they also all include PPC4XX either directly or 
> indirectly via an intermeriate option such as PPC440 or PPC405.

Yeah, it's likely cleaner if you keep the "select SERIAL" here, too, since 
sam460ex.c uses serial_hd() and serial_mm_init() directly, too.

I guess we should rather have a separate switch for the bamboo board, and 
then move the "select SERIAL" from the PPC440 section into the BAMBOO section...

  Thomas


