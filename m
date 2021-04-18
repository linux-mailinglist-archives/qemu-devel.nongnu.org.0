Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FF1363841
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 00:47:41 +0200 (CEST)
Received: from localhost ([::1]:49744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGCZ-0000Uo-WB
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 18:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGAj-0008QC-FY
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:45:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGAi-0006MZ-4g
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:45:45 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a4so32045291wrr.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5gAfWysMm8DtFz8+UfJssfjsT+efeaQTSA7aBppBi+s=;
 b=pr1nx51r1jI0/jobjsCT3fWOKYJ+In6RFujMsEBVz9lIWla3tZilFW9uEig/GWm0g5
 XEk45kxfW4lcfP2L7Uq6C4Ngn6vrCRCfpk3LJbQBGFYDRA5qplh4zWpvolbX1RU2JZV/
 GaRDe+SvjGep4IPt1+X0qcHrUF9c345N9DtQL5ekQh04wI1nePeCpXcpyqBafOOMMIsC
 rnjM2MC0YUGqn+AyVMoCXkflCY0JIqyLwRZtN8WCTYwp+C9Ipgsm5MgBimGLw7+fc+Se
 W0gxbLSnxDcOJMw6Ud4np5xL+MCcd7/w5RrKfszpLCrDsAqDO9C50Gdg7SRi7UnN8ngO
 8uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5gAfWysMm8DtFz8+UfJssfjsT+efeaQTSA7aBppBi+s=;
 b=i0hBBgcZqnKKD/HDHPv8plAHTjcbxS5MKk4iBNBk7okxBDzScV0b/OYbkez4iN0s3Z
 3m7ddOUkeMFDnRqkbTKkJPCPLkyE9J2YpD3RniEEmPCf4VTk8jBpoHEiz8CMTrRw9GPF
 i0YRMADUh2v12NA/YBSWdxg5zhk9SpWbNNtrcRMNi3ymirz+kBLon9vaLKStC144c+Hf
 byaLfljcgqElB0+DUvuvUIAXZXZ58WY1zgVh4ULWA1+sbXNf0kRYcJTpP7OZ8lc7ppLC
 pq74jE1SCDG44pYaoIdwEIcsjafyj8HUOXEaLSAv8G51oBD2LlOMicYkB0iGIbcUad+/
 wcwg==
X-Gm-Message-State: AOAM532hhe0S6OsnBp0KBZb1H1g8TIpSQvrmTCcA21DduwTdwNtuoAdo
 4ie6KafgMXKaMcG10O0LHBQ=
X-Google-Smtp-Source: ABdhPJzkraozwEqkCopwIAT6KsSGVPTpfVu4m/NPstraG9T050VQrEn6faqzxcG7Q+JUjfFuKOBmig==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr10767337wrm.427.1618785942802; 
 Sun, 18 Apr 2021 15:45:42 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h1sm17810070wml.38.2021.04.18.15.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 15:45:42 -0700 (PDT)
Subject: Re: [PATCH 14/26] target/mips: Move sysemu TCG-specific code to
 tcg/sysemu/ subfolder
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-15-f4bug@amsat.org>
 <122fac14-a7cd-87c1-5217-d86d8af49cb2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bd03027d-9ece-6903-126a-26d68101f71c@amsat.org>
Date: Mon, 19 Apr 2021 00:45:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <122fac14-a7cd-87c1-5217-d86d8af49cb2@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:35 PM, Richard Henderson wrote:
> On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
>> Declare cpu_mips_get_random() and update_pagemask() on local scope,
> 
> What is "local scope"?  Anyway, I don't see what this has to do with the
> rest of the code movement.

I guess I meant 'TCG'. I'll split.

