Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD335917D3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 02:34:15 +0200 (CEST)
Received: from localhost ([::1]:59330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMf6U-0002QN-I8
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 20:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMf2j-0000E8-Hg
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 20:30:21 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMf2e-0006D5-3X
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 20:30:20 -0400
Received: by mail-pf1-x42b.google.com with SMTP id a22so1690176pfg.3
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 17:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=D/dIJqMWn7Az8OKLrZAE6V1Dt+UV8rHTFLdnDsSa+mw=;
 b=bxqm13OmLOPlpnS8E7Vo+kG3Uc9L0NUEsn+IMjsu/9nUbpLWsq/fym+ZB6Nm4HZUGH
 lOcBIWHeFV7+tRTUUZVxwIwrrmpyHOHhvuNTl/46/gvtzLAxRhzeBnFM6wjOJqtQBkot
 b8b+8jJMN/dN+c+PsJjDRu4yLxCqaY7GxozhX24+KYfa2wyqNMBMSNeEEj41Q9SStzOf
 3AxB+xkXNrFlECqkZIR5GshvT3BNMl9G3rDnkX2VhnvuBmyeiaAA5ICLKUyWAdmzl3CG
 X9EjizPXyaE67NbNwkh/RHS59IbmX99yKTp5l7wDkJAyxpKW0u6OlC2iuTGOouuJYIRu
 3kig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=D/dIJqMWn7Az8OKLrZAE6V1Dt+UV8rHTFLdnDsSa+mw=;
 b=7nyF6XLn0prrsrkfCCB3PXVWr3c1LoZGQg+VwGWA3VXMEEco24tR6ukjufCRfR7n0x
 TzpYcbMvlunZrw96Px0t26D2WGFWheMg4/v+Eo0SHaY/vv0HDFwLBOrpTzC9B06HLHse
 SY9f+syxmNrdHTOcJv7VnTMPYC55oRqVfIqLGIGRoYMmlgqpqFTmKeHHfi53oV5sz9Nz
 uW26AGx0vA6W5T48WBja5pMz4jeq57yJf0NCkmrYxgcFy5aL7f7EiO6ymXTvwr86eMxR
 gBhWYnPh8Iz9Tw/eFRyR7aEmZ9/JfStteaNpILFbbuiOampBiSz1wOxXd/WwxgCKWfre
 st3A==
X-Gm-Message-State: ACgBeo2IuRTHDIRKHjYvKJfqrzsf4rtq6uqJd7b2Av3IdeqrK6vJmZq7
 OFJszwN1YZBo38+gb7P+7pGOfQ==
X-Google-Smtp-Source: AA6agR7INJaARrqet7msyuKtkRlSLMYGqJfGxI6CS+3IC9z+WSr7/7CgF1meWDViuykkEXkViZ6Ykw==
X-Received: by 2002:a65:6bca:0:b0:420:712f:ab98 with SMTP id
 e10-20020a656bca000000b00420712fab98mr5084175pgw.350.1660350614438; 
 Fri, 12 Aug 2022 17:30:14 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:a7aa:1d1d:c857:5500?
 ([2602:ae:154e:e201:a7aa:1d1d:c857:5500])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a62870f000000b0051bc5f4df1csm2212402pfe.154.2022.08.12.17.30.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 17:30:13 -0700 (PDT)
Message-ID: <804cd7cd-e83c-2b89-f2ba-cc2ca5c7f835@linaro.org>
Date: Fri, 12 Aug 2022 17:30:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
Content-Language: en-US
To: Furquan Shaikh <furquan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
 <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
 <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 8/12/22 16:57, Furquan Shaikh wrote:
> I am not sure if I understood your comment correctly. Currently, qemu
> has a check in `riscv_cpu_do_interrupt` to allow semihosting calls
> only in S and M modes. This prevents semihosting calls from U mode.
> This patch changes the default behavior of checking `>= PRV_S` for
> semihosting and instead replaces it with the usage of
> ebreak{m,s,u,vs,vu} properties to allow the user to configure what
> modes should allow semihosting calls when `-semihosting` argument is
> selected.

Why do you need such fine-grained control?  What is the use-case?

r~

