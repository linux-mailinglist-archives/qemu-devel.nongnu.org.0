Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6733A456CF2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:03:23 +0100 (CET)
Received: from localhost ([::1]:35170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0jq-0006cB-99
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:03:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo0hG-0004g7-Sb
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:00:43 -0500
Received: from [2a00:1450:4864:20::32d] (port=46710
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo0hD-00080W-Mt
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:00:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so7028893wmb.5
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 02:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p5DQsA/Xwb5raEn98ra2KyAyhRmLBvJLRioS9EHaBNE=;
 b=bUybGvUjeRBiSu5AVFPtPGmGhwTqFpVONVQxMgtczovbzknHvJONo1CnsNfaE3naFr
 G58wQ0FM57x4rB62gFr1v3ircqa+rm33TudDJ382P7C7I7P4g5ghwgKPDW8Fp3+lFQ7g
 FQD3RgsFC8YEc83aHbPp0GxM/cb3jN5ABoO25rFZ8xj4sDayqukIZjdbORqXXAzFd8oG
 wRdxjeV3I4C8kT7/OZoeMWHMrqzMp42+tbbse/IC4T69VPkWcBMCRPb8dCqVAFTps6d2
 mcBIeLs9qTRVlC9ZiZhiCqsx/gccld4bmdZAg4IbPmVcyaeEh8ihTat2JunTpu7sUb8s
 K6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p5DQsA/Xwb5raEn98ra2KyAyhRmLBvJLRioS9EHaBNE=;
 b=1VJ9OKb4dYENCY/cNDOXn1FpKjmA+jNZZCpt91NeQbS27wwFA60Du49IiLwgD2/BQR
 CbLzoenJOzLiLAcyaxvcYHuUKn0pmcaK0VVG60Oshf+/bkvnZ5kXKrYapZeNh4JoZyM6
 y+8HohF0Wo+pQN25yLO/7T9+9Wpb3hokJyzkNFeEvbYyKUaSZI0pppckRs30tdlRiZA6
 w5y+yX/iVR81fcab/pG2KgciFaAPxeH1w/mXLapKDMNnXRGdulbz0DiEE9K3/Cheh5Tv
 xyGlVLiUs3YYJPyziElRhi9OtRHUYkCuMdgJaewU/rg8M5hV3wi4sFNNHxerY7AdNIp9
 0qPA==
X-Gm-Message-State: AOAM533DVEEUkUaDl9y2u7Rhl/0SE6irvx8tTj8i/SbR2aV9CwlsARnU
 0tLxtBXCxp8rGcjiA/4lFzCZrw==
X-Google-Smtp-Source: ABdhPJzuHpyfjYUFofcnr0TLpWws/Le3ouZ6abeLShu9ieJvBhTrJnPvLiaBis+lZewpgY4PO751wQ==
X-Received: by 2002:a05:600c:3b28:: with SMTP id
 m40mr5319028wms.100.1637316026371; 
 Fri, 19 Nov 2021 02:00:26 -0800 (PST)
Received: from [192.168.8.105] (165.red-37-158-79.dynamicip.rima-tde.net.
 [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id g4sm2413719wro.12.2021.11.19.02.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 02:00:25 -0800 (PST)
Subject: Re: [PATCH v2 3/3] test/tcg/ppc64le: test mtfsf
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211118132502.984059-1-lucas.araujo@eldorado.org.br>
 <20211118132502.984059-4-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4cf5b6a1-f120-acce-0ec2-b3a58cfa9f6c@linaro.org>
Date: Fri, 19 Nov 2021 11:00:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118132502.984059-4-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.727,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, mark.cave-ayland@ilande.co.uk, pc@us.ibm.com,
 david@gibson.dropbear.id.au, matheus.ferst@eldorado.org.br, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/21 2:25 PM, Lucas Mateus Castro (alqotel) wrote:
> +void sigfpe_handler(int sig, siginfo_t *si, void *ucontext)
> +{
> +    exit(0);
> +}

It would be good to verify si->si_code = FPE_FLTINV,

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

