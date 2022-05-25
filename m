Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155FA533EF6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:18:45 +0200 (CEST)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntrqW-00038a-6r
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntra0-0000gf-Bh
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:01:40 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ntrZx-0006hW-L8
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:01:40 -0400
Received: by mail-ed1-x52d.google.com with SMTP id i40so27183089eda.7
 for <qemu-devel@nongnu.org>; Wed, 25 May 2022 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hd7UvpFrloWM0Iw9S+Myt2HHVMNNaqyQQJKGjyZCYZg=;
 b=NC4bvFRs0uLLzwFf02kk/UvHjB6MqBumoAPFZ4Gk0CQF34H94pYNPY47VVSCRUuHxC
 FTVJDqHnCjAIfX2zQEx/nmFiQf86TYi2w+X8iqwNEUNsIJ3LJN2Az32/8Daazcb5XouW
 vOqw81MDERp34623bkFMrYIligtog11wjFUJeM2wFt86Eot2ZRezuPyv1tq9pioHFlVe
 S1m6k6ff6G8uG9fjO6m7eUfEkjqiSgPwZJcsCmp33leEHepyVV5imdX9IVqBVLgwiExQ
 Nj76JKZNa1rU5pqg/2T6zQ6JiLOOPdnD4PhhDM5QRtA5WEDDFxKmuDaFMSR7/El6qEDR
 s7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hd7UvpFrloWM0Iw9S+Myt2HHVMNNaqyQQJKGjyZCYZg=;
 b=mSYIl/D0QRM3mQ3Ty9V9+3AIJz60GYmhgsPK6eaIQPqODsnChAPntmKdWXve4yuwt1
 xOcASuxH7+MHPIOfog/3qC8Nj38fkgkbW/tBQxg8E57YtgdZ/WINHNeVqnfrgGOdKvBV
 vCdkRwr2zOt2es8qWGBw55sY2xzlGv+u9V1T7L8NnJ6cUkxC68NzgKQkZOrIwNGcZDd3
 40wMNi5IzzI2dhpwZICcEe0iE5mOsCaLLw+px5no3EiibfDoYj25Hig1lSZtJpNHpDhg
 f6edix/km5wpug4sLLBRy/IDRGDDSto16d71fPZVoSbixCQXowvhZSZafumtjDiLma75
 jGFg==
X-Gm-Message-State: AOAM533SivO3YEvZ+AtTg7V7Ifhbh9Lcz8Ulq0pE/OTgDot5s3ekKDIW
 U3x2744aJtG1CYtV9YEoY/I=
X-Google-Smtp-Source: ABdhPJxQRs1zFXr1dH9wrAAeEy2LDO1yS5DCRYAWczsbyFkYQOYePisyjbHEuSn/pcVPUHmKVYjtBw==
X-Received: by 2002:aa7:cb8f:0:b0:42a:e9bd:3b5f with SMTP id
 r15-20020aa7cb8f000000b0042ae9bd3b5fmr34464673edt.8.1653487295970; 
 Wed, 25 May 2022 07:01:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 16-20020a17090600d000b006f3ef214da6sm8350202eji.12.2022.05.25.07.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 07:01:35 -0700 (PDT)
Message-ID: <af8559fb-888d-6803-d556-c79e06ac0146@redhat.com>
Date: Wed, 25 May 2022 16:01:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 6/8] hmp: add filtering of statistics by provider
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, berrange@redhat.com,
 Mark Kanda <mark.kanda@oracle.com>
References: <20220516090058.1195767-1-pbonzini@redhat.com>
 <20220516090234.1195907-5-pbonzini@redhat.com> <Yo4GiLam/J7nBOD/@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yo4GiLam/J7nBOD/@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/25/22 12:35, Dr. David Alan Gilbert wrote:
>> +        return filter;
>> +    }
>> +
>> +    /* "info stats" can only query either one or all the providers.  */
>> +    StatsRequest *request = g_new0(StatsRequest, 1);
>> +    request->provider = provider;
>> +    StatsRequestList *request_list = g_new0(StatsRequestList, 1);
> Why that g_new0 there? isn't that request_list = NULL and let the
> PREPEND below do the alloc?
> 

Yes, it is fixed in patch 8.

Paolo

