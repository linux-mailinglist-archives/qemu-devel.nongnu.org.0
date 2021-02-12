Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0A831A584
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:38:52 +0100 (CET)
Received: from localhost ([::1]:34014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeHD-0002n0-Ee
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdn7-0000yH-Tw
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:07:45 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAdn6-0006ul-AH
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:07:45 -0500
Received: by mail-wr1-x435.google.com with SMTP id t15so385074wrx.13
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 11:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vj0K1b6vg8zQ5Q1WGt75NzaGp5suo0Tdc60Idy6W3NA=;
 b=SUj+EfD7uFebSomxSwIxLytseJKaohDKjuNSe/I7o2We3UvePXToBJQ/Uu/GGckyQu
 q8dchcFP7B+0cmPnQCgKnpmGpPWHy3nx6CjZxns24AOpr0JrJpty4ug6Mgw/VaUJxtEm
 GdQypXRhNlIL1sv5fJkoAXCCyn2ROP9ujRysp+STsvFFpedu7WIOeeOWpFlohvTEvfVp
 b3fguFYJ3nYaAspB1m+higN4sue2e87AYFcNWM1/vB7wt7sTAoGrtYLFhyL/rwJvBoxa
 KQ1GkprIxgDaT/G+jhneiGaqrLkwR+ecqIQ6tn0Yv8FdYy8hpck4rpoHhH/LDtbnvw/I
 bbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vj0K1b6vg8zQ5Q1WGt75NzaGp5suo0Tdc60Idy6W3NA=;
 b=Z452C0CAWQVaBCY7gCv5QVlOkOZQ8c8VikRs+3pN9YuG4W2BOnu9QA2wwFZD1MR7eD
 CIZPiW5rd1xsIrzkB5TrIwc7rlDT1rYJD3/9FqZrW7tE9LScVG7xcpX2XPRcmFoHUn/3
 pOe4GSqfr2WW9eV1ooDGHcsEntocOn8lYOpexi6czA6XCjq6CaRwF+VQkRjyhejBRi/w
 fBhCYCLiM+OilwcMgyUSpD+/Fb3ksITOmNDVbz9KidEdl1gtlIQPxcVMIQWg766p9oR2
 71/2+rhxVJ/qbHBTDyBcnPRKfsM+OS9dmECR1kE0O8mYOrzJeTkXQEbIFe8sogFUKcmc
 IEGw==
X-Gm-Message-State: AOAM532Apep7wFkvUqV84A8DL4BwAggwFj64BD0KJLIrOSabB1ElwOcC
 u5XGmiWR81JsWn/NLWdbNcmxZq5mHwE=
X-Google-Smtp-Source: ABdhPJyo/TAGM+vfk+E1OBrg9/j/QkY8gIJhRqHVhURMVbiPNVlifjkhkKB+9WcKmO+PrN+/SOXMZQ==
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr3950798wrh.56.1613156862890;
 Fri, 12 Feb 2021 11:07:42 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 35sm12229048wrn.42.2021.02.12.11.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 11:07:42 -0800 (PST)
Subject: Re: [PATCH v7 05/31] exec: Improve types for guest_addr_valid
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
 <20210212184902.1251044-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <83e9b825-459d-40b1-352e-79a0b5a63037@amsat.org>
Date: Fri, 12 Feb 2021 20:07:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212184902.1251044-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 7:48 PM, Richard Henderson wrote:
> Return bool not int; pass abi_ulong not 'unsigned long'.
> All callers use abi_ulong already, so the change in type
> has no effect.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

