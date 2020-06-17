Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3791FCE1F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 15:10:29 +0200 (CEST)
Received: from localhost ([::1]:53544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlXpk-0003Fy-89
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 09:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jlXoy-0002Zn-HS
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 09:09:40 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24440
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jlXox-0000fc-15
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 09:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592399378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zoTn4XpTf2TEF7T8/H6yD/BGTcNBH8vb/2toCOzMRHI=;
 b=I2drO7tLzfUnT6GIlkqfNuSvJVkFEaw5gH30YxR/JthFBFWIb/3lDZWLiohm/lw8nDPki6
 ih6wG0XP6uOGZo9gxPxz+SbchhrXLdyp/Epxu236V8XyqwTnGB8vDn+KmX2C5lJs9FqIiv
 L63WhXAlncF72iXAbXPvkFH1RuCCgJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-57u46iVTPlyURGhPNoEDCw-1; Wed, 17 Jun 2020 09:09:32 -0400
X-MC-Unique: 57u46iVTPlyURGhPNoEDCw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0CE710AEA09;
 Wed, 17 Jun 2020 13:09:31 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67F667CAA9;
 Wed, 17 Jun 2020 13:09:27 +0000 (UTC)
Subject: Re: [PATCH v3 4/8] tpm: Split TPM_TIS_IRQ into TPM_TIS_ISA_IRQ and
 TPM_TIS_SYSBUS_IRQ
To: Stefan Berger <stefanb@linux.ibm.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20200616205721.1191408-1-stefanb@linux.vnet.ibm.com>
 <20200616205721.1191408-5-stefanb@linux.vnet.ibm.com>
 <62a70526-7c3d-8342-3c23-a2751b6d508c@redhat.com>
 <0baa825d-138f-dfa6-b70d-5b9387b567ce@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ca4a24fd-4b58-2586-6326-e4b71f069ee8@redhat.com>
Date: Wed, 17 Jun 2020 15:09:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <0baa825d-138f-dfa6-b70d-5b9387b567ce@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:42
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
Cc: marcandre.lureau@redhat.com, philmd@redhat.com, mkedzier@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On 6/17/20 2:06 PM, Stefan Berger wrote:
> On 6/17/20 4:12 AM, Auger Eric wrote:
>> Hi Stefan,
>>
>> On 6/16/20 10:57 PM, Stefan Berger wrote:
>>> Before the enablement of interrupts on PCs, split the TPM_TIS_IRQ
>>> into TPM_TIS_ISA_IRQ for PCs and TPM_TIS_SYSBUS_IRQ for ARM.
>>>
>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>>> ---
>>>   hw/tpm/tpm_tis_isa.c    | 2 +-
>>>   hw/tpm/tpm_tis_sysbus.c | 3 ++-
>>>   include/hw/acpi/tpm.h   | 3 ++-
>>>   3 files changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/tpm/tpm_tis_isa.c b/hw/tpm/tpm_tis_isa.c
>>> index ed6d422f05..27222a9a49 100644
>>> --- a/hw/tpm/tpm_tis_isa.c
>>> +++ b/hw/tpm/tpm_tis_isa.c
>>> @@ -97,7 +97,7 @@ static void tpm_tis_isa_reset(DeviceState *dev)
>>>   }
>>>     static Property tpm_tis_isa_properties[] = {
>>> -    DEFINE_PROP_UINT32("irq", TPMStateISA, state.irq_num, TPM_TIS_IRQ),
>>> +    DEFINE_PROP_UINT32("irq", TPMStateISA, state.irq_num,
>>> TPM_TIS_ISA_IRQ),
>> irq_num is a uint32 prop while the default value we are going to assign
>> is -1. I guess we will end up with irq_num = 255?
> 
> We can make it ~0, if that's better. Otherwise it does seem to become
> 0xff ff ff ff with the current -1.
yes sorry that's what I meant.

Eric
> 
> 
>    Stefan
> 


