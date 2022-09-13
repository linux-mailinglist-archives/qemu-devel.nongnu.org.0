Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7565B7796
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 19:19:55 +0200 (CEST)
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY9Zi-0005jx-Gc
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 13:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY9Vd-0003sG-G0
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 13:15:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY9Vb-0005GA-Oo
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 13:15:41 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h8so14908940wrf.3
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 10:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=txo6rVtBe+vrMnCLxLgsg4qNFWL6t0wwr1oI+Hn/AmU=;
 b=zV1QWE8SW4848HW1cN58skt78vQcF5e1eyM4dSJPwp83m7VulhZryQiBQQrh7e48MD
 +gS/ts7A8UxZP0fjdzDZERIfKUE3k5348jwbLgdizqsjPIy9ySrpqXTF62ea7D+btXO9
 E37VHkaE92oo+nUv/jmstUfgInl10qTh+00JTiPrXUoLj+LrQY+zY7s8SbjBSbeJ8zTJ
 ChpKYSI4bqqh2htDeq3wntNaxZEsp8PhCsVVgtZjUTT1k3qTI+Fs0aIiy4sqh9LoyDPm
 na5dcYJEHNV83fi2wod76GI768oCMtsYg49QVgpwopuNwYkFp340Zohp5KSTrJ0uM0VS
 LcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=txo6rVtBe+vrMnCLxLgsg4qNFWL6t0wwr1oI+Hn/AmU=;
 b=FXb+BsYOywm/skVJP6Gz4jKe5EuJUpZMgTJ3IlQF5ASNQXKp4YSufUXuLby0ePDQNm
 6jA+UMXUWTYyGAb1d94LrN8lyK3jT+HkOQwKHLlnSGXCGcv5JfmOsU3ABk9Sa+ACV5hN
 OciRRyI/2hUkEOFtQBGwHiXVpT0eo6faZ9WuaYOt7snLb8FElEIqnsI+CmfKc/7hG0V0
 EqB239/20bkfIFlAlVCrxalnnhr+iF6odfpb/8HrOX7o1y6iPlgDSUoqXvky8ToLlQdP
 8eTm02Wdp5EsPtY7pHO17S/qvfA2JAgjzvzfhzQBio5oaS09NysA3sYC4YFCPQe5G5Ew
 tb/Q==
X-Gm-Message-State: ACgBeo1zarJ/RIARAGJ3fwYPyNzD0aK9mb/WnErLHYIz9aQF+SclBoe8
 Po2HG6Mzc3AR4f7doUqMWIcieQ==
X-Google-Smtp-Source: AA6agR4ApgpySGfayLss9SKr1ic4e5doGBDfhJEXhX3/m6YtdE4046p+QG1dPh9phYEunK8/XvqmUg==
X-Received: by 2002:adf:a28e:0:b0:22a:7428:3b04 with SMTP id
 s14-20020adfa28e000000b0022a74283b04mr7987935wra.75.1663089337768; 
 Tue, 13 Sep 2022 10:15:37 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.66])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a5d4b47000000b0022860e8ae7csm11231028wrs.77.2022.09.13.10.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 10:15:37 -0700 (PDT)
Message-ID: <a9e073e6-08ed-06cf-561e-6f99e2be674d@linaro.org>
Date: Tue, 13 Sep 2022 18:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] target/m68k: fix two writes to %sr
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220913142818.7802-1-richard.henderson@linaro.org>
 <5880ddb1-3a7c-139d-3833-9902b98caf01@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5880ddb1-3a7c-139d-3833-9902b98caf01@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.628,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 9/13/22 17:29, Mark Cave-Ayland wrote:
> Possibly it might be worth including a tidied-up version of the "WIP: target/m68k: always 
> exit_tb when changing sr with andi/ori/eori" commit from that branch which is also related 
> to switching between supervisor and user modes under MacOS. Shall I tidy it up and send it 
> to the list?

I peeked at the patch in your tree, and it looks good.
By inspection, strldsr needs to exit the TB as well.


r~

