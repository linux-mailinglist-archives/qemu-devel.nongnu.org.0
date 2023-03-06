Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908AD6AC15D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:35:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAvz-0003GI-Ng; Mon, 06 Mar 2023 08:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZAvk-0002gT-81
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:31:19 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZAvi-0007g9-Gc
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:31:07 -0500
Received: by mail-wr1-x42c.google.com with SMTP id bw19so8785640wrb.13
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678109465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vznks6+vEyxs+ncVu7lf48ue72BsaQ1Tsn/VkSb1dZ8=;
 b=v7gNZ6EaJc+H5MtJ10i6PZjsQTmCQduLX5KMR9Gq/CnqXeKfO/FwDY0qFktxqiVf4M
 vmYYF4y204ru90DTM6O7DgXCeYj4EG7/ClpvZFYTVFHNX+xEqSdKu+J4b8M2JIEJ8hf0
 68Kdj/Tj/lFMUs5hS3Qmr0K6yxAh98MKvqt+m80PZVVHVhESpyNvTF5149JJCykCSMFi
 Bdc4/9EGhwgFWQ5Rw/JeR12f2tnwHmo+5kGeX644S00CSSjg/l93RMDCPo+x3VcL/5dx
 V7TTEO1kNEMNSq6+1u2ohYDRLoqlUz3G8IO4ePAUNgbgIKZzwUS17R39FEFtIFy2FOiE
 dxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vznks6+vEyxs+ncVu7lf48ue72BsaQ1Tsn/VkSb1dZ8=;
 b=YW6Z2+eAXXkrUDtqxgh5E62HespbA7Cyf0kOwTaK00vM+xTvh8AAWV3exFOtNVa6Ys
 nSjmqwRRwBAAuAkoPwWC8JcK54oPyY6yJUQNRJP7fBTOa68ImyVrPty0iysIlvY/vVNc
 IfFEm/klgDRGs8T/Z/zgKmdemPOBLZ4x2LlfhJtPcIGnKb97hfKppnEBwONjUpxQKWwT
 mbEQxaXr4JsGdl5fHDEYV42GrC5vqzkopSUrvP3qatIL09UqJIARQqUseiv5RwpCUxrc
 GSNukWsws2VfActnpksotX37wHvNCHGHZdnZd2jIWn1Bv8QYvBml+nHDJSYrjxEVHk/h
 vxTg==
X-Gm-Message-State: AO0yUKWXojSNfSFmIYarKGhYejB3JkvSd1GctndgmjB19hqRlGwxBeLT
 j1ieyMz/jZSMrPeJEKmufSd9SA==
X-Google-Smtp-Source: AK7set+kxYIc1BdzcP3KZnmnGYFGAKEEkzTn+NStgZCp+Tpk9uSHb7IJMwASPxyB0pvGfwoUen32iQ==
X-Received: by 2002:a5d:4ec4:0:b0:2c7:169b:c576 with SMTP id
 s4-20020a5d4ec4000000b002c7169bc576mr7302657wrv.56.1678109465010; 
 Mon, 06 Mar 2023 05:31:05 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n5-20020a5d4c45000000b002c55306f6edsm9555257wrt.54.2023.03.06.05.31.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:31:04 -0800 (PST)
Message-ID: <e24209a3-bf3a-bc43-38a2-cdb5399a74a7@linaro.org>
Date: Mon, 6 Mar 2023 14:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 30/70] target/mips: Split out gen_lxl
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/2/23 06:41, Richard Henderson wrote:
> Common subroutine for LDL and LWL.
> Use tcg_constant_tl instead of tcg_const_tl and t2.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/translate.c | 106 ++++++++++++------------------------
>   1 file changed, 36 insertions(+), 70 deletions(-)

Lovely.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


