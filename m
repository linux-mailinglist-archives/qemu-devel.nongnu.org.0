Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53453FCC5F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:31:30 +0200 (CEST)
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7bW-0002hU-7r
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL7Fo-0006L2-Gt
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:08:56 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL7Fl-0003KA-Tg
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:08:56 -0400
Received: by mail-pf1-x436.google.com with SMTP id r13so15091338pff.7
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 10:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FulrJ9IX1n59FPxp04kW5nJFsxyONTkeC/a/WYTaln8=;
 b=thc3mpnngy75DNvcoljZ+OYTpY5+xlLcJ8IorY1txmkO75NXwC/+rtdd+3RoymCgvy
 bOXtcv1slOoE+pV5FmkrKTiqd2QHYHu/IqYOSsCm+jHrLO1JNUbGtb8nXLEg6gJAQV9q
 6l1l5Pm9J4dJev4S60Sybgop8XsUa9wiWx/R5KdqaxvcYMmCh7wDk839FSDJhuZh204b
 zXzT8ocJP9lbZIR/DK0+Dep4rVjdnSBtvYa2Y2LkT1MuMA0/3pwfaDeHwoS85k1tM8q3
 r5izNSgrNiSa1cqDI7Ce5CuOh0BxLMEYBI3zVqCDfdBQhi2ZF4v2FOnfJREVj0JryXL5
 Yh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FulrJ9IX1n59FPxp04kW5nJFsxyONTkeC/a/WYTaln8=;
 b=iq1czANjigd6VbEOMgG9Q/YVU0i/W63/zMYZI1q6lQtH9mCbp0gZaP8/psGNPO9PTU
 glU3Y1tBwNixcs3RxKlLegMHFt3mHh6dNKcdWSiSo183iOLDSWtpmhyqZxspm2HjjwoF
 CQQc+cVfoENF9dflUisyO1wWS4z4dZd3fR37vsiuGgPIXgdlQAvb4NIAuv0M6kxBngUG
 B/5YulleYuL2JF4GsNCybArNv3yHU4S9JbfUzrxr1R6Y75hKqnRUfjiscTfC0BUhs9uo
 zDgTiil9gfdZP46Mv7Xy4C4+y4iLCP8bmR8XbjSrIjXltS7Elz4fdRBmICRuM8RZRz39
 meMA==
X-Gm-Message-State: AOAM530hGsvIJMDMEU5SA9v8A6BUWBQ0BgirMxilNEQUMs6D/WSvv3r7
 IuTOgVt6VWVEmiCa3s3cArXmhg==
X-Google-Smtp-Source: ABdhPJw7V752u2pm68YuW5ufAh9S2X9Tk8PL+qoz/8MBXz6cBFUPhzcM8EbnX5RVDYW8176MFsMx0A==
X-Received: by 2002:a62:cf86:0:b029:3e0:7cef:9e03 with SMTP id
 b128-20020a62cf860000b02903e07cef9e03mr29973900pfg.0.1630429732041; 
 Tue, 31 Aug 2021 10:08:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id o1sm3534117pjk.1.2021.08.31.10.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 10:08:51 -0700 (PDT)
Subject: Re: [PATCH v2 01/19] host-utils: Fix overflow detection in divu128()
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-2-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5dd6437c-4aab-5e47-8562-2501cea226dc@linaro.org>
Date: Tue, 31 Aug 2021 10:08:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-2-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 9:39 AM, Luis Pires wrote:
> The previous code didn't detect overflows if the high 64-bit
> of the dividend were equal to the 64-bit divisor. In that case,
> 64 bits wouldn't be enough to hold the quotient.
> 
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   util/host-utils.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

