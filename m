Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2528C3EB591
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 14:31:27 +0200 (CEST)
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEWLO-0004IW-4X
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 08:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEWJE-0002uV-Bw
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 08:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mEWJC-0000VD-GN
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 08:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628857749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSP2+C2vIPDCwq+3R7kCfYC/H0KElcuCC7smvCCwR5M=;
 b=WPIh8WCX86b7+qfO+jzYfPMiBUgpYfeJxEOjvUf0M2z+ZW+ERatDNOY7n3BgtpHuNxqdlj
 o5+SVFreERLLonu1SL9wd1hHpzDDfhoze6WeOwFwyTZx5LtlqyvMxHPDlW/ALEuqWKOlLM
 nTkWGTbyuXuti+UODCI4QpiluZLuupU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-z0uQO2rwPYGeUjqBLtVEYQ-1; Fri, 13 Aug 2021 08:29:08 -0400
X-MC-Unique: z0uQO2rwPYGeUjqBLtVEYQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so4669452wml.5
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 05:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OSP2+C2vIPDCwq+3R7kCfYC/H0KElcuCC7smvCCwR5M=;
 b=T6FrSpkUQHgi4NqRrCjkNMIrEoIKxCO4xZQMSopjgs8Debu3z2FrOmVSmM7bT5TpB6
 12eTQo1cKMYBFD1+8pojYEgSKuRb6LoLVGAyHz07/0eAwqfJd4AN7NKXntYBXv0+0VQf
 zu7DOgsPED3j9OOhqiE90mZHU+P8RAZ8LQRrArUDCgcBnETSP+RBjHrQZe/VbGDQYEYr
 EZIzrPUe3YyJVpP6lRKYigeuIYaBrJbwlww9HjJ/TYU62kOJne9wNANPjhOmIRHa9sqg
 lL0xpxw2s8GM74v8TyOOEOfqkRz8NlTh+4ycxI7LOGWGlM/ZX8Nipj6O7h0hEWaifNsQ
 2Rpw==
X-Gm-Message-State: AOAM533yxAAuVR6WQsyhHgHRHzKSoSceUI+hfuw1bYA7aM6lwri2Zb7R
 kykeODrrek5bgQdoodzfZoJmdToJw28U6DtQTX5T2rx749qEKDf3vZJfc+9a3c2iqOPlad5ikEh
 z1jCmpTZvCbg99nI=
X-Received: by 2002:a5d:668f:: with SMTP id l15mr2931320wru.390.1628857747514; 
 Fri, 13 Aug 2021 05:29:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2B1xDeaa06FQ+8dDtGUK2HrZD2s5G9Zqm/bfkX5BXcxqpZIJ2Emcgn8DFxHfCYJtOXO/Axg==
X-Received: by 2002:a5d:668f:: with SMTP id l15mr2931296wru.390.1628857747292; 
 Fri, 13 Aug 2021 05:29:07 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o34sm1236403wms.10.2021.08.13.05.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 05:29:06 -0700 (PDT)
Subject: Re: [PATCH-for-6.1? v2 1/3] hw/core: Add missing return on error
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210813112608.1452541-1-philmd@redhat.com>
 <20210813112608.1452541-2-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fc4eb676-c144-04f8-755e-9f10a9eb8e64@redhat.com>
Date: Fri, 13 Aug 2021 14:29:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813112608.1452541-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/08/21 13:26, Philippe Mathieu-Daudé wrote:
> If dies is not supported by this machine's CPU topology, don't
> keep processing options and return directly.
> 
> Fixes: 0aebebb561c ("machine: reject -smp dies!=1 for non-PC machines")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/core/machine.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 943974d411c..abaeda589b7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -752,6 +752,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>   
>       if (config->has_dies && config->dies != 0 && config->dies != 1) {
>           error_setg(errp, "dies not supported by this machine's CPU topology");
> +        return;
>       }
>   
>       /* compute missing values, prefer sockets over cores over threads */
> 

Queued, thanks.

Paolo


