Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503E81FB1A6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 15:07:01 +0200 (CEST)
Received: from localhost ([::1]:53468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlBIq-0007dG-B9
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 09:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jlBEH-0000Nj-Fe
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 09:02:18 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46701
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jlBEA-0001rk-V0
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 09:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592312529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RGTWgAo/GAz5mXfW8XtQzTeAkk+Fl74XVICkS1mYLXs=;
 b=RttbEl+3WI2u22ekMw3fm8xOyQL+J6Wvqbh4FsP5DlaPaW8EIocthN14VZLc65DKGylvy8
 Dup8i8h9jJDlV8OY/uaeZsUWej/OrNOC74rYA8kOZgbxa9iD/cqF5CE2zOwXfBTah3vG/0
 hAdK/xYiVjkIBG9vtdSsED5EK4vDToY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-qrYcCAT0OMSeVJG_-_kP9g-1; Tue, 16 Jun 2020 09:02:07 -0400
X-MC-Unique: qrYcCAT0OMSeVJG_-_kP9g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD2C418FE872;
 Tue, 16 Jun 2020 13:01:39 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 782125D9E4;
 Tue, 16 Jun 2020 13:01:34 +0000 (UTC)
Subject: Re: [PATCH v2 4/5] acpi: Enable TPM IRQ
To: Stefan Berger <stefanb@linux.ibm.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20200615142327.671546-1-stefanb@linux.vnet.ibm.com>
 <20200615142327.671546-5-stefanb@linux.vnet.ibm.com>
 <CAMxuvaxm+5Nuv2_1UTXY+-kK1CYMkxqU2pfLOxMgeDEqOjhgZA@mail.gmail.com>
 <8e11e2d6-5e02-89c0-759f-d74189421eec@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ab78ab4a-a3e3-64bb-ff81-413c17c21f24@redhat.com>
Date: Tue, 16 Jun 2020 15:01:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <8e11e2d6-5e02-89c0-759f-d74189421eec@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:45:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Bonzini, Paolo" <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 6/15/20 7:11 PM, Stefan Berger wrote:
> On 6/15/20 11:13 AM, Marc-André Lureau wrote:
>>
>>> diff --git a/include/hw/acpi/tpm.h b/include/hw/acpi/tpm.h
>>> index 1a2a57a21f..063a9eb42a 100644
>>> --- a/include/hw/acpi/tpm.h
>>> +++ b/include/hw/acpi/tpm.h
>>> @@ -24,7 +24,7 @@
>>>   #define TPM_TIS_ADDR_BASE           0xFED40000
>>>   #define TPM_TIS_ADDR_SIZE           0x5000
>>>
>>> -#define TPM_TIS_IRQ                 5
>>> +#define TPM_TIS_IRQ                 13
> 
> 
> Eric,
> 
>  does this change have any negative side effects on ARM? If you prefer,
> we can split this part here up into TPM_TIS_ISA_IRQ and TPM_TIS_SYSBUS
> IRQ and leave the latter at '5' because we know that this is working.
The IRQ is not advertised in dt nor ACPI on ARM. However it is
advertised in the capability reg and in the vector. reg So I think this
should be fixed? I guess on ARM we will pick up a completely different
IRQ num, allocated from the platform bus slot.

Thanks

Eric
> 
>    Stefan
> 
> 
>>>
>>>   #define TPM_TIS_NUM_LOCALITIES      5     /* per spec */
>>>   #define TPM_TIS_LOCALITY_SHIFT      12
>>> -- 
>>> 2.24.1
>>>
> 


