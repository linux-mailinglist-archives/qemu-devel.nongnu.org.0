Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B058D3875DA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:57:24 +0200 (CEST)
Received: from localhost ([::1]:37606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwTb-0006Lt-Pm
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw4N-00083j-4j
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw4K-0001c3-Bj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WhaAgJt/PFVdFYG+UJ/78KyTD/ngaCxSwyhciZvshc=;
 b=BxGKOKD3n5vUrpumNa4WGht+1gsZnKV8AFBMf+QGnVFqu2ik1CX+/a/w1nAbHHgPZkY3zU
 fbQ4vjMDQ+A/TMmnksy3a6/7Dzc1omWIrvz0/gnJD9aljFo88g+1z+qPVaBvD5BLnmr8x1
 PqGpmWByzhnRuYaI8xrCxELoJSuXWRU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-fzmqd83GOhW8L18Nit8F4Q-1; Tue, 18 May 2021 05:31:08 -0400
X-MC-Unique: fzmqd83GOhW8L18Nit8F4Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 h18-20020a1709063992b02903d59b32b039so1964452eje.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3WhaAgJt/PFVdFYG+UJ/78KyTD/ngaCxSwyhciZvshc=;
 b=UXA3PaSiogv4WQH3oazsfSqL/otZwGlF2JO+UxIOmQkLw47c3uExj300pVmRiRsxlz
 bIa3kPvMhyw4mLoX8L5ynvWQnZrVtmChzjYw3f3zqMkTPpKwgiyGedQVrT9K/VkDZTKn
 dR0+1bQTxAX49u+wHgmmnx5c2/0nApIDn+F3OpJLuCBbXdttTyoYiCF68L/ZW5TlQz54
 qwkYHF3a/SJhBxiTixBExE/nTNTAmJhf+aJbl8cfScaZUgDH1eqNlYTbqSdvV4i+gbdj
 83ERT8Hr56RLun3MIX6PX+OeWbOZnTvOChs9syF8DgnARV6GZAIK/YhxMSaAWMxy2FpU
 WfhQ==
X-Gm-Message-State: AOAM531vrvSwPkJlFUOTTog9GSEiNanultvciNHnZBthhltgzBgkuMuc
 7u169IL/GoFMfkIcFk0YTyHmbsA4e//UGO+i/wNvK2yM4dd9ZkeaXlqO+x4jLdHLuJn2ucLqQaq
 2I6Db8rx0BYMHC5M=
X-Received: by 2002:a17:907:a06e:: with SMTP id
 ia14mr5198866ejc.17.1621330267014; 
 Tue, 18 May 2021 02:31:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmQISmWEH++8RgvVLBDJL1ypjIwe/lejIGbXM8iYW6zUcMfiXDvwVM3EAuzyZKkA6yZZeZgA==
X-Received: by 2002:a17:907:a06e:: with SMTP id
 ia14mr5198856ejc.17.1621330266877; 
 Tue, 18 May 2021 02:31:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id bo25sm2964009edb.67.2021.05.18.02.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:31:06 -0700 (PDT)
Subject: Re: [PATCH v2 21/50] target/i386: Reduce DisasContext.override to
 int8_t
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-22-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cdc342f8-a779-8da4-2da9-a20020a73eb4@redhat.com>
Date: Tue, 18 May 2021 11:31:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-22-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> The range of values is -1 (none) to 5 (R_GS).
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index ca7f0a8cf4..44a28858aa 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -77,7 +77,7 @@ typedef struct DisasContext {
>       DisasContextBase base;
>   
>       /* current insn context */
> -    int override; /* -1 if no override */
> +    int8_t override; /* -1 if no override, else R_CS, R_DS, etc */
>       int prefix;
>       MemOp aflag;
>       MemOp dflag;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


