Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243513FCCD3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 20:16:58 +0200 (CEST)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL8JT-0007bf-3L
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 14:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL8IO-0006Ox-BW
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 14:15:40 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL8IJ-0007ma-Kt
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 14:15:40 -0400
Received: by mail-pg1-x535.google.com with SMTP id 17so48475pgp.4
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 11:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Gr2H2IQB81RFTJVZbug57Bbw1VFWMWMrMMKgGdfwapE=;
 b=sm6o2Lj/GFLpc26MNBujd9Ob5B2Kiws50wvIDADfz3ezA/cx/0qFbmasXvm0Xd3CLo
 FIGvzdzYm5p2GtpJq60PXnoWaEb/VrsPyGnHTFm7dmzkjysFnRRm+E8EI+B+6+BiAcaU
 IaYT54emytEz8Wp1481qWrCcPMO3u5Pdd1Y0vvCRdnxUWw6WVfs89O+ReXgX+m58U8Za
 00RgipIOuXewCOaPFMMIsaZxa9ykwzcyZ1L9FPwuO/m+vdiuyB/tL06sZSSzEHv7VlNd
 0PYY5IDH62SNMb0I+uN2toIEpQRonDsts2c0BNDNIuMTT3tTpHnhk4wLnZtR6pJxrTR/
 1CfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gr2H2IQB81RFTJVZbug57Bbw1VFWMWMrMMKgGdfwapE=;
 b=UzQpnTMP7v6US2d3ywiVu5kUM6lmTSAvjJ60VhJmsaYehKKGV2Zt60C+BiM+NGIO2N
 jXyEcWJCZgZ18X3smzUK5eSMWMzLZRzb6gh1hwyq+lDP5qe2vmOl2P9+6U4QPe0A1pi8
 2rJfYzBqQAULRDO/EmGcMHu3Nx2OeDQFYcZNVmM0fC6zEiE5mg3BGyWUV8a0DwNdbN1A
 YREI+HR0oE0H/a2fYQ43HurllBWwNHYOunblBgpHICPu5+Z461bzCLjQZRSbSznDDWtH
 QWnC6L7cBtCzBZnbtBNdMuINTHehRRYJLXQcJc2OhMC0gbH/A1OwaTosunng9CbfnQhg
 DGig==
X-Gm-Message-State: AOAM533jeqOgsejXQrYOUq4EET2hfPbnAXEZVlUSdBsPXBvG1kkS8z8t
 ySnrEdkoZLfSXY3rYcrmEtWu5Q==
X-Google-Smtp-Source: ABdhPJxpclAp57Tmj+80atmzSeM9Y520U7xKfU3guNiQJmkZy+xy9Z5lez73MTyL0Boa8Ntzs4K7IQ==
X-Received: by 2002:a62:ae0d:0:b0:400:813d:cf74 with SMTP id
 q13-20020a62ae0d000000b00400813dcf74mr10819537pff.14.1630433733731; 
 Tue, 31 Aug 2021 11:15:33 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id fh2sm3418608pjb.12.2021.08.31.11.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 11:15:33 -0700 (PDT)
Subject: Re: [PATCH v2 08/19] target/ppc: Introduce REQUIRE_FPU
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-9-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b59c072b-a94c-eab8-79e0-6dc6705b7873@linaro.org>
Date: Tue, 31 Aug 2021 11:15:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-9-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Fernando Valle <fernando.valle@eldorado.org.br>, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 9:39 AM, Luis Pires wrote:
> From: Fernando Valle<fernando.valle@eldorado.org.br>
> 
> Signed-off-by: Fernando Valle<fernando.valle@eldorado.org.br>
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> Reviewed-by: David Gibson<david@gibson.dropbear.id.au>
> ---
>   target/ppc/translate.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

