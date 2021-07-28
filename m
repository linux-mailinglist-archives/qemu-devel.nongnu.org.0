Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED633D8A93
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 11:28:31 +0200 (CEST)
Received: from localhost ([::1]:46592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8fra-00052A-2i
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 05:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8fqF-0003g3-70
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 05:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m8fqB-0006Ni-B6
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 05:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627464422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9qaVC+eNdHDkfchGZZKSwJNtgv95qMfATU+0W670TL0=;
 b=irB7pw+89XqvsaDz+FUl1esqC6KWL5YVEjXm7H0/Zg05C2O1PH4bHIfloj8/q9PQEyQdN2
 iZyqqfdXAwT8t/iwE63hw+YA5lfVE+1iCFCcuzw1vf/MmR9FP1ohWWk66E29ETFRNXp9AA
 Y5PAZiyNRIejWA/M8HSrKvInk0UgHps=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-v20FG0B2O0GVOswBQ4zlLA-1; Wed, 28 Jul 2021 05:27:00 -0400
X-MC-Unique: v20FG0B2O0GVOswBQ4zlLA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b88-20020a509f610000b02903ab1f22e1dcso934428edf.23
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 02:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9qaVC+eNdHDkfchGZZKSwJNtgv95qMfATU+0W670TL0=;
 b=oVu3Kd0veACYKiJ1O9NsGoEHnb39LUeA9EVhxQWYhcLO20oczR81GIfh/PzNbKLlMD
 cxfR/zETAZ4F4qBfaIExPxCGl0W+Q8gx8CpNE18sXqYrxFyrhF+4cHOw5GxrVPvk2GLS
 DiQlO4JTZyjjxkdBGaUZN+f5QJapT1obx+8FTysDmX0xMQy/ZQd+pj80nWisZTogo9+K
 YB3U2xsNzNUjlXycitDGqEFkmG0kGG0vIGISL6f6QJ0fV9ulI3smm2XgT7SaD7FxXFiZ
 rkWTAsirK9GkGJjMQXT+tnU+eJUyF2MCAgbvpcbJYTQZ6gBIyL01o/ZwBIkxskJx2ze6
 bQcA==
X-Gm-Message-State: AOAM533x5px4WMsaH8iizIvKfoxAbAia9QQmdwuk27oKJHUcHao37itj
 WOiBm6iMJSkZtwSKsTVjubVJBuUvvmsPp1nkldniJHrqMSt53rjpJIu72TpQJsmZrgoVuSvUA8E
 L7SBvjr8g75MudCe2qdKULFknIhi4s8RZozZmyoUfnyKpk4y22NTDJchqp4gi9Sp+Z1Y=
X-Received: by 2002:a05:6402:2317:: with SMTP id
 l23mr32668445eda.265.1627464419262; 
 Wed, 28 Jul 2021 02:26:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF06NA0bPv2lb7aR9rSGMmsDjxxrz7z4oaswycasATLl77kdQzGRVd1Vs1jq3TGqkofTrC2w==
X-Received: by 2002:a05:6402:2317:: with SMTP id
 l23mr32668428eda.265.1627464418931; 
 Wed, 28 Jul 2021 02:26:58 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id cf16sm2317951edb.92.2021.07.28.02.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 02:26:58 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Added V_INTR_PRIO check to virtual interrupts
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210721152651.14683-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d834787d-a9a4-b3a3-b80b-087ed216181f@redhat.com>
Date: Wed, 28 Jul 2021 11:26:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721152651.14683-1-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/21 17:26, Lara Lazier wrote:
> +static inline bool ctl_has_irq(uint32_t int_ctl)
> +{
> +    uint32_t int_prio;
> +    uint32_t tpr;
> +
> +    int_prio = (int_ctl & V_INTR_PRIO_MASK) >> V_INTR_MASKING_SHIFT;

Oops, I missed that this should be V_INTR_PRIO_SHIFT.  Can you send the 
correction please?

Thanks,

Paolo

> +    tpr = int_ctl & V_TPR_MASK;
> +    return (int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
> +}
> +


