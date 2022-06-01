Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B034353A1EA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 12:06:32 +0200 (CEST)
Received: from localhost ([::1]:51830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwLFH-0004Fo-RN
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 06:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nwLC2-0002QI-Ad
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:03:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nwLBx-0004sR-04
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 06:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654077783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DSvOTCX5zEjp2Gq6BzngIjkHNH93Xez2WNZHTt4ZoZI=;
 b=Og0AtX9/kkAVc+hsq4JDt8MSwVhCP5E9lSF9/rvxxyf0aKLFYKJXgbGjviYOaTZZdiq9nm
 FnvE1R/nbCZV3kAkt3u04x/TubKLkj0wwRCh0XyfUAVPdSh/3RitQrrqJOU4CAW0pAFWgK
 JPfVe/xqgBP/To+J7/FZTNXHqa8wSQ0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-F3ZIikvCO5KAq2kIKdziTQ-1; Wed, 01 Jun 2022 06:03:02 -0400
X-MC-Unique: F3ZIikvCO5KAq2kIKdziTQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 m6-20020aa7c2c6000000b0042dc237d9e7so909806edp.15
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 03:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DSvOTCX5zEjp2Gq6BzngIjkHNH93Xez2WNZHTt4ZoZI=;
 b=sytrG8JJ6YPOqpjgR6Nf9QUGkR0BGsaVH72/Rh37cnvJMUnLsupFXBW/vSs0f/26rG
 3FUmYI3PiNXibTeZc/ec96zk+6A5JVzxn0bUHijdqUiPUEWDu5eqWgCsOFr0xqB6O28F
 ZdlT4wOkaht+tJhsKxIQ8Pz5sZ/ArVyvbCIC5tGThJhTlL0zAYMyjqbmsE3dR40xRI0R
 d0MYS+/rmqAKqA3XUvex6DbF5UzfajXKVExtZkBogC5pGF//7T3wNq4RbzivxLPUPbD/
 p+dS+7pDTev2EkiSuKsj5TABKYUMmsCz2Bfr33qC+5tQ4liWBcgOrL91Ho2lMrwrklXR
 kjgw==
X-Gm-Message-State: AOAM530D+FtkPG9RUPgEzoVLxuGHdvulESUoGxHmkX2pfYdU1CcA4yea
 pw0+ejk9kd/My0w3XgjLlaedTanT6SGMnFqSCwp4Mm+rh06HH6cn0aeKB4rvJiygbB+/SfmJSeE
 LzdFiWcjoRmwjjbQ=
X-Received: by 2002:a05:6402:3551:b0:42b:6d38:9485 with SMTP id
 f17-20020a056402355100b0042b6d389485mr49817292edd.234.1654077780693; 
 Wed, 01 Jun 2022 03:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwERA14cwPQPUsoujCHH07PdOOkAZdRqKW7cmpFPOtyR0umDd4TM7ilq2sE0xDgkCsXMG2NdA==
X-Received: by 2002:a05:6402:3551:b0:42b:6d38:9485 with SMTP id
 f17-20020a056402355100b0042b6d389485mr49817269edd.234.1654077780439; 
 Wed, 01 Jun 2022 03:03:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 s23-20020a170906bc5700b006fec9cf9237sm516588ejv.130.2022.06.01.03.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 03:02:59 -0700 (PDT)
Message-ID: <e39f2adc-1391-1b2d-f809-dc114bea4df8@redhat.com>
Date: Wed, 1 Jun 2022 12:02:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/2] i386: fixup number of logical CPUs when
 host-cache-info=on
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220524151020.2541698-1-imammedo@redhat.com>
 <20220531144417.73eb53b1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220531144417.73eb53b1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 5/31/22 14:44, Igor Mammedov wrote:
> Paolo,
>   can you pick this up if it looks fine, please?
> 
> On Tue, 24 May 2022 11:10:18 -0400
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
>> Igor Mammedov (2):
>>    x86: cpu: make sure number of addressable IDs for processor cores
>>      meets the spec
>>    x86: cpu: fixup number of addressable IDs for logical processors
>>      sharing cache
>>
>>   target/i386/cpu.c | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
> 

Yup, queued now.  Thanks,

Paolo


