Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63632519D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:40:20 +0100 (CET)
Received: from localhost ([::1]:56630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHoR-00046V-Hv
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHl5-0000C8-Fj
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:36:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHl0-0006um-E1
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:36:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614263804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hx4gghUA01FEVETr8ncWPbx2phheH5TbLdBekCdmDuc=;
 b=BCUWmAplMMNL4bi6JUJyRW61BY+ig9vQtH2J/dCDMF56+l+216VCbKfsb+QwQlPwtfCKkU
 gRAC1Fj43HSgDEtEruyYdznfOopMJHq4nHZhvxYFtf4TvLeWFBObdEm2DrLv2d3CpGYz3m
 iwj8WN0KUftQuojXKWqP06ZwWd7ht7g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-0bPFyYfmPVG4D0ynNJ9p-w-1; Thu, 25 Feb 2021 09:36:42 -0500
X-MC-Unique: 0bPFyYfmPVG4D0ynNJ9p-w-1
Received: by mail-ed1-f70.google.com with SMTP id c7so2777982ede.17
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 06:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hx4gghUA01FEVETr8ncWPbx2phheH5TbLdBekCdmDuc=;
 b=Yl3YCyp5viaLS4JENhrIvC4MgW3cSZacmL0OMeGtfjvRs7gNauX3Pt7PAJn5ZFS/Ln
 BFiOQ3LDVhAJQ27a+v5rvloeaKa8IwuPZWVXb+lz2JwOLwvPPENRTHbWnPhUbqaNfYEM
 essZbeAdcNCJhLjuaScr2JJrrtXu8RzujlDQMJ4UmkDPpzUpvatpJ0EIQol7YcnKGKvu
 YIjf5JSsf8BWn2pzAFpl+xBHT3H2Q8eFqRGTKmNKeqrtkS1ByHKqHWlJBv5baSOGuuKO
 dVrMz2J708L3bh+lCgHs6ydrN3lg6boN4t8ggGI806UBO0r4MKfC9sIdHosh6eUbJSNn
 Ldcw==
X-Gm-Message-State: AOAM530xAvGZNetZOEKPR4DwJIqiJFWnFNLrXPWZB/tNTAfFbVVL+Qkj
 g2AKL7o/pyuVfs73l/P7dtLSMJ5/YCI3csE4oVcVz8cXDSnKzhzDjUbYInzTrUOJqtmKbtLzDiQ
 jR2P60uHNfuwltoM=
X-Received: by 2002:a17:906:f18a:: with SMTP id
 gs10mr2933702ejb.341.1614263801311; 
 Thu, 25 Feb 2021 06:36:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRxtnk7qeC740nsjwVK/WDeA468251o1TpEhcM4TRwyNT3Ine4j9zXJMSEVL7SChadSMoeHA==
X-Received: by 2002:a17:906:f18a:: with SMTP id
 gs10mr2933691ejb.341.1614263801145; 
 Thu, 25 Feb 2021 06:36:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l6sm3775114edn.82.2021.02.25.06.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 06:36:40 -0800 (PST)
Subject: Re: [PATCH 3/6] dp8393x: switch to use qemu_receive_packet() for
 loopback packet
To: Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-4-jasowang@redhat.com>
 <70f3456c-1f3b-8a14-8c51-a0b7dff5f048@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fdd95814-c3d9-3c93-466a-5846da8e10e5@redhat.com>
Date: Thu, 25 Feb 2021 15:36:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <70f3456c-1f3b-8a14-8c51-a0b7dff5f048@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 7:13 AM, Stefan Weil wrote:
> Am 24.02.21 um 06:53 schrieb Jason Wang:
> 
>> This patch switches to use qemu_receive_packet() which can detect
>> reentrancy and return early.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   hw/net/dp8393x.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
>> index 205c0decc5..019d4fe435 100644
>> --- a/hw/net/dp8393x.c
>> +++ b/hw/net/dp8393x.c
>> @@ -506,7 +506,7 @@ static void
>> dp8393x_do_transmit_packets(dp8393xState *s)
>>               s->regs[SONIC_TCR] |= SONIC_TCR_CRSL;
>>               if (nc->info->can_receive(nc)) {
>>                   s->loopback_packet = 1;
>> -                nc->info->receive(nc, s->tx_buffer, tx_len);
>> +                qemu_receice_packet(nc, s->tx_buffer, tx_Len);
> 
> 
> Did you test compilation of that code? It looks like a typo ...

With typo fixed:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


