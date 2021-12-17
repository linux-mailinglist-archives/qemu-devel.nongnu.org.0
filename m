Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF0479663
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 22:38:59 +0100 (CET)
Received: from localhost ([::1]:39678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myKwM-0002JQ-AM
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 16:38:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myKvK-0001dn-9C
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:37:54 -0500
Received: from [2607:f8b0:4864:20::633] (port=46016
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myKv7-0006Fl-DZ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 16:37:42 -0500
Received: by mail-pl1-x633.google.com with SMTP id w24so2923713ply.12
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 13:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Dsal0H3KVrR1kpYWH5JyQzpxjItBtDe1exO06fZpr8Q=;
 b=mNxtqHm6QdfTHY6hnWGFqSmup4JyNrTIfpKmKyEnz+8eR5xZHHAJXXARquIQTBZJ5B
 +liAedgoW9ehMb63wANHbVN8TuVIgWkN2y8xEJVzMojowP3xBFwGEOg7AfOvL18ImV0X
 7fInul4UCvyCDfPS4VTKgasneLDMKgwGhUjNJNRrF9eOt3EWUgZTtuhjk85t7iDDOQri
 K+cWsKA+o3Svehex53A8E46zMS9WJwdI4gswFY74xTxrKYEj2T+0oO3exzvYW7rocumA
 Czx5Zly0CgRBVVZepzOSEOVemMQp3G9D2S4uyKOEOrI9QVgaUuaBLjlAQo3Ues4DhjKn
 HD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dsal0H3KVrR1kpYWH5JyQzpxjItBtDe1exO06fZpr8Q=;
 b=OxzEUjMs71tPFe/UgEOpbjZ9uJI1OmU28W+TmG+n4fIDdJmriPQhP09JBYXNOfFhF7
 wZ9oX3dtHpgFIR8IfFFRuiluLa/lFVCQ1HMJ6p1wzxTtfn/zAApHcbbHrS4XPHJng5Oq
 j6cyEN5AGpLlHY9Z7GpbTfRAFA+UWAg1/ZEgpSko4h9myCyNIW6VLcgKUSidXhVV8FqV
 pBtK0xgREDUrudzHpFzytiQD0P6rmS9pcHds8VBFVsxPuvRusaX8EPSqQTuA7ZieXkOe
 fK4q8PgZmH3eRPwn7MfhHgx38j1H9klh1Bt+Sa2yVyLa9k8gkJedMznzHJ8AqCtwqmpk
 c00g==
X-Gm-Message-State: AOAM531nnL1wCvAaVBQmelJyuO2X2r31BcRUjdcNgXOclK2YFT+psEtX
 6Ql9GPXtRX2LYPVpdnxzdLX9i/DY3ETjYA==
X-Google-Smtp-Source: ABdhPJyZIACpQ97/Y14ZBHoUlHPZFKtHvxEQSYoHKMpTAoKNlYuR+zZ+t5W5qq7OW7ytNpQW89w6QA==
X-Received: by 2002:a17:903:41d0:b0:148:a2f7:9d49 with SMTP id
 u16-20020a17090341d000b00148a2f79d49mr5159706ple.104.1639777059390; 
 Fri, 17 Dec 2021 13:37:39 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z3sm11047968pfe.174.2021.12.17.13.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 13:37:39 -0800 (PST)
Subject: Re: [PATCH 05/10] configure: unify two case statements on $cpu
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211216085139.99682-1-pbonzini@redhat.com>
 <20211216085139.99682-6-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70b71972-0a8a-b98a-5c37-023525541970@linaro.org>
Date: Fri, 17 Dec 2021 13:37:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211216085139.99682-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/16/21 12:51 AM, Paolo Bonzini wrote:
> +  s390)
> +    CPU_CFLAGS="-m31"
> +    ARCH=unknown ;;

Eh, ok.  I could also support removing the case entirely.
I don't see the point in having an entry for an unsupported host.

This will actively not compile as soon as my safe-signal reorg hits.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

