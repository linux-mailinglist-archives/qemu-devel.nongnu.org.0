Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564E5438C0E
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:21:59 +0200 (CEST)
Received: from localhost ([::1]:40014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mekwI-0008LT-60
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekuT-0006Qt-An
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:20:05 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekuQ-0007OD-RR
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:20:05 -0400
Received: by mail-pl1-x632.google.com with SMTP id v16so1156862ple.9
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=68aAhMsMY8w0dcksqtjZDFdGc1GcY213y/9L15lshfU=;
 b=ug/hOcMXzyC6uRk591yt+i48eHKI4WC8fDWze8bpZxokTs1JyGItZ+XWPD4V+hDBYK
 dELg7kadd9jzPqhLdoNUkm8yDWZBU56+BvG7NY1KUAo6OKGL4WzTOICwJOmh605HXbdZ
 npUJkB2M3qkgyG6iEdUTiIHFBqVncsztKFsqaICv/KgEfDZx5Hvp5o850cbX3hVl7f86
 ACDD1Jxi7fTF8xgsDX2zTQjywoxZmqAT+9RRiJ/QY9KzBE47KZV7arIoHvE9Hm9aSh5z
 D+eo1kPlJcDziStYX8UI3n+WN33qBLa9KOnGLnrdGl2NVvOA4zMonJoVSwAaisw1LU8R
 /SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=68aAhMsMY8w0dcksqtjZDFdGc1GcY213y/9L15lshfU=;
 b=3eQ8VN6GSQsvVgOr93APqU0rJZJZh3ZURCNdmfUU+kR1Ngvp2dRw8jK159sDGme3Cr
 /5T/OZZV5SXXEoFCk3kmwR9FQWwe8WzuWu7eFI/YBvozvaW/YKwKyp1XoDqqA6NozVgC
 M0FNYhGDblFJvnOGNeDQEebFIE/o8TCBbpLNDTfkOtu4dZIalIyAitQZ7K6m1dDRIATG
 nCLvL83BcVGAbu1fciqjrFNw4R1nO0gM+2KhRc1vo8E1dZvZKrN0fk6jj0+iqjDbw6kT
 fuIQktPIg8rp1mPXUHnfwbFYPob7W0CtLGAtVo4xqJY4AuWIgQzxVC22t5mU7eVItgvS
 uilA==
X-Gm-Message-State: AOAM530EInY2DvK9Gu5pu4eVShNcPuPrjo7lLDf8yJZiXEccIMsrAH2S
 cFavy+G53F0PI76Jy0VqMOe4qA==
X-Google-Smtp-Source: ABdhPJz+t+y2difq1cBWmYg9oksFddFAOFbR8t92BhkWvRoYeeRO2BEoo3adq1B4MMy9D/acFuphVw==
X-Received: by 2002:a17:90a:191c:: with SMTP id
 28mr15794887pjg.121.1635110401445; 
 Sun, 24 Oct 2021 14:20:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k19sm5703342pff.195.2021.10.24.14.20.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:20:00 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/alpha: Use tcg_constant_i64() in gen_call_pal()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211024161619.325903-1-f4bug@amsat.org>
 <20211024161619.325903-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2abbdc9d-bd42-e3cf-0045-ee8c4a094ad9@linaro.org>
Date: Sun, 24 Oct 2021 14:19:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211024161619.325903-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 9:16 AM, Philippe Mathieu-Daudé wrote:
> Avoid using a TCG temporary by moving the flag and
> exception address to the constant pool.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/alpha/translate.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

