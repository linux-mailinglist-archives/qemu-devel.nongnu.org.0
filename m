Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD542DEE6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:08:32 +0200 (CEST)
Received: from localhost ([::1]:37324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3HT-0001Kf-Gg
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mb2dX-0002st-8Z
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:27:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mb2dP-00088v-CU
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 11:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634225225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IpPDDhNpQ0RArEoWJd5NKR3WWxbDAGX5nu4Bsew2nJc=;
 b=d0T0HHlCZ4z52I5ZdUQyKfZ5SMyITh1wap+sTw4MsWfg8FH9BsNYCAjSRRpiSq0lPlKhUk
 2iKHzDPi1ubLymJYWlUC0Vy7OZZ9r5m7zmreEdVJOQc8fesmAF4p3869SFcrYwRzFyzJH9
 HLd7NFHHqH3vWl0b2LVFPeajHgYc6r4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-MyjN8du3OaOeCtAe1Oy2Cw-1; Thu, 14 Oct 2021 11:27:04 -0400
X-MC-Unique: MyjN8du3OaOeCtAe1Oy2Cw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so4854173wrb.6
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 08:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IpPDDhNpQ0RArEoWJd5NKR3WWxbDAGX5nu4Bsew2nJc=;
 b=DURdImzMqyNb6QgK9ER9DVFlrUZSRv2mezO39qdgMsmtQvVnd1zeVY3HvdGBm0h6Sy
 uEaDsuON5OM6i+u2EO7Nh/616DNQPKnEStOTBqK3a8mxgB/nscPTA9f8DONb+qS2PR/C
 FMHuu1D+M+ADy6Dba40JCKoFHbwnST9X0+wyibymRGgeCxl5FuSJG5QimpT+AMUghK0M
 PsDmCDZAGoWvIRksgGpxGR1AbJyJxyyAeNnmDXpJaH+ARjk6oW7rosyUCrnOapfE7Yh0
 wrbhcOgnvuSp7pSoeo5eYJcu/qjj1BjrhNpYP+L0Mh64RAZpgiZ8wTC6F4bYRakYK5jh
 lXiQ==
X-Gm-Message-State: AOAM530X6fQlCiG/AexCIpV4i8NX++PVZt9XHnsZXWptiwaUkHyJ+K1a
 hHgWrvksfdtfHU5K7/FTH4NXAuRdCBclh2OGC5YJloNcsrMxKwx6khN79bYvDuhsU9PxKSfcSGp
 6ukOidFpiTKikcvk=
X-Received: by 2002:a1c:4487:: with SMTP id
 r129mr19747308wma.127.1634225223305; 
 Thu, 14 Oct 2021 08:27:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaRT3D6zYs5Rh37JnMQkGlDHswuO5+tinWymGdVWUT7FB7kvCvYqfCHl+sHxdgN603EYH+Vw==
X-Received: by 2002:a1c:4487:: with SMTP id
 r129mr19747288wma.127.1634225223123; 
 Thu, 14 Oct 2021 08:27:03 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id z6sm2790399wro.25.2021.10.14.08.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 08:26:58 -0700 (PDT)
Message-ID: <836a36f7-936b-ec36-f8e8-472bcec3970f@redhat.com>
Date: Thu, 14 Oct 2021 17:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
 <2c5ec93d-d1d1-5f08-cbf0-513e101114df@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <2c5ec93d-d1d1-5f08-cbf0-513e101114df@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, hpoussin@reactos.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 13:29, Cédric Le Goater wrote:
> On 10/14/21 12:34, Christophe Leroy wrote:

>> I have the following change in QEMU to be able to run the bamboo,
>> found it some time ago via google (can't remember where):
>>
>> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
>> index 8147ba6f94..600e89e791 100644
>> --- a/hw/ppc/ppc4xx_pci.c
>> +++ b/hw/ppc/ppc4xx_pci.c
>> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev,
>> int irq_num)
>>
>>       trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
>>
>> -    return slot - 1;
>> +    return slot ? slot - 1 : slot;
>>   }
>>
>>   static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
> 
> could you try to use :
> 
> static inline int ppce500_pci_map_irq_slot(int devno, int irq_num)
> {
>     return (devno + irq_num) % 4;
> }

Is this pci_swizzle()?


