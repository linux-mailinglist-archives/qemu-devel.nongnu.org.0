Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F08936F888F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 20:17:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puzyi-0001ti-2C; Fri, 05 May 2023 14:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puzyf-0001tU-J8
 for qemu-devel@nongnu.org; Fri, 05 May 2023 14:16:21 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puzya-0001jC-74
 for qemu-devel@nongnu.org; Fri, 05 May 2023 14:16:21 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f19afc4f60so14573455e9.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 11:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683310574; x=1685902574;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6GoCj9SDbPXqCKEmNHYDHMT2EP3ZlY40MbtVwhnAc7Q=;
 b=EWj+rii4aIVFGi8ZmGEdnv90jP9kyc6URcsb9JRPsDuZZsmWIRxQfD0h/+CuLqI0x5
 /PVMACqfQl7TwrVDnlPHuZ30/Qt4tz4TDIt5x2o6ibnbNajmSGw4iWxKDW0oCx+fYZjr
 aA/uORlzV1KUDaD3n4s3KbBNu2enDdLs4KmCbWPwGWeJGGke/1sUyVAPHW9JgPwCqcqC
 WDCm3zLcE54FTsq3yYz6+2tELFcdTrXDHqyBXSipN3vM8jPtBjN/4D7bPOl3rtWy/s3w
 lKPZY58hUvRhhDhtDFsIWWp/Cbl0WBedUtB+eDVVvLmHV25RIjwsoHy3SREErzS2nYM/
 lB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683310574; x=1685902574;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6GoCj9SDbPXqCKEmNHYDHMT2EP3ZlY40MbtVwhnAc7Q=;
 b=QncXoaZvz43miQO5yRB4XWvSICF16sVxN31x51jT49BYCUHNAiFaaTHk3iEpzweikn
 VQbQ8mNB3Ktx7ENZwlITZ57LPOt72v/y/HDbvnaoWMZkIHwRl4HROIKGLChNB/Qwr9j0
 y6zCVjWNJi79vhXeIfmnrEoW2PD/7oq0LL9LUQWDoqDGfF2zYyGxLW9MssrkRSxJb8YD
 SemXZ69vxytKcxrL5bqwVOEhrlfpJBfRs6VYcfep7Vu/4xc66gfFqEUiovPGcaGA2m83
 yZW6WauWBn7sSf6UZEFDvuLm/yT419yvW844hoZJAg3ggySGwZ5wXIWcy7ou87eswERE
 oNHg==
X-Gm-Message-State: AC+VfDxHNIJ8SptcoBhd4Uy0XJZkrWwDFTuotioTWRUByXDU+CAGToMh
 zjZIkPVUoXtwGEErcNxzC6LnFIdrWmSQZ9OZspu8xQ==
X-Google-Smtp-Source: ACHHUZ5Uwn7qvehjAiQslbE9MzOguJSmD2b3NZaCpIqz1Sq5cy++XB2F+A/YvYQxz7x+eblUXgjUDQ==
X-Received: by 2002:a7b:c8c6:0:b0:3f1:979f:a736 with SMTP id
 f6-20020a7bc8c6000000b003f1979fa736mr1633672wml.34.1683310573885; 
 Fri, 05 May 2023 11:16:13 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a7bc34b000000b003f195d2f1a9sm8643800wmj.15.2023.05.05.11.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 11:16:13 -0700 (PDT)
Message-ID: <005cb984-e347-8735-afad-ba23558dd549@linaro.org>
Date: Fri, 5 May 2023 19:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/45] loongarch-to-apply queue
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230505022806.6082-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505022806.6082-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 03:27, Song Gao wrote:
> The following changes since commit f6b761bdbd8ba63cee7428d52fb6b46e4224ddab:
> 
>    Merge tag 'qga-pull-2023-05-04' ofhttps://github.com/kostyanf14/qemu  into staging (2023-05-04 12:08:00 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/gaosong/qemu.git  tags/pull-loongarch-20230505
> 
> for you to fetch changes up to 9dd207d409cc2eb08fe52965b9d1fd4a12a82bd5:
> 
>    hw/intc: don't use target_ulong for LoongArch ipi (2023-05-05 10:00:47 +0800)
> 
> ----------------------------------------------------------------
> Add LoongArch LSX instructions.

This has CI failures:

https://gitlab.com/qemu-project/qemu/-/pipelines/858609469/failures

Importantly, it does not build on 32-bit hosts:

https://gitlab.com/qemu-project/qemu/-/jobs/4235054589#L2631

../target/loongarch/lsx_helper.c:1013:17: error: incompatible types when assigning to type 
'int64_t' {aka 'long long int'} from type 'Int128'
  1013 |     temp.D(0) = int128_urshift(Vj->Q(0), imm % 128);
       |                 ^~~~~~~~~~~~~~


r~

