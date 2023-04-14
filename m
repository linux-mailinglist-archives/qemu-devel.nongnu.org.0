Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE886E2B10
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 22:24:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnPxL-0005hQ-Ac; Fri, 14 Apr 2023 16:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnPxI-0005fS-6e
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 16:23:36 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnPxG-00088K-5H
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 16:23:35 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f09d08a2bfso181805e9.0
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 13:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681503812; x=1684095812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p1gBang1D1DIOMN5v6J1El7h9fepywzzKIQHDxw+uWQ=;
 b=C07haq/J8Z4X6M9clg652AjNCG5AdkzMZe7POkBg652eR81HS4AKlMuEZDsSrsfElC
 5KFfmAKOeSU3ySLhza0Htk/mV+f4GfQunctwILnyoU9rbctKjhYq5FWjg/F0gYE6PTcl
 pzsh+00wAArQFE2zKrAfWoW6c850GUnMoa/LHRybq/jvvnTbNzRhx4vhK9ho+5EaDCaJ
 4dJF8vyVe7gM0zc83WSx7z94KHDhS3qomoMaTFSJzsYu4g7qneLijWwHyW9yCilHJjPk
 aHi1aZrCNhaxr11pYz54vSM2JdB0+IRvuZYJw6TW9zWviGRIGcSOOa2FaxqbDz7YCbqU
 BZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681503812; x=1684095812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p1gBang1D1DIOMN5v6J1El7h9fepywzzKIQHDxw+uWQ=;
 b=W1mcGSXzFDGJUPBkFB7+yXAEDkL2HAaMElzpc4C2/OWt/coRtxTmVAlisp11EuIBnK
 QEbaGNTGlEfK7PPvbtP8QPppk7Olz522KT4o/n0tmSRiX+VfID3rfskg9vdqFEY8autc
 G5iUiQxBDnuY1Ec3uFLnf7/CgZz5iW93iWNFb+Q2KeG17UHUdNF0XOrFmO1SH67p1c/C
 nlx4aVqRD4GrQGV/Dqmlv0j3Ouw2iMhKZVm+iEYT6J2uCTMlxnhE19diFEVwRlqlkbY9
 VdOuDCcV7mK6nCR6U7sW+pLwXCSXA/nyf/+kLCLPv6UufNdrdEFxoWKkEmGM7aj1TrJH
 Yb6Q==
X-Gm-Message-State: AAQBX9eVQ8ELDRWygq24KmmLbyl6R+z8w2j4W5QGMAlx5T4wmSNRO8XU
 mo/a3B7jyAgX642q82PW5u6T0g==
X-Google-Smtp-Source: AKy350ZtTksuKQSM4MGP393k6G93h4b7bXCRKS7KVrIjTSe6JfmYaUYqnRvcU4VG7jhw6MmdVb5LrA==
X-Received: by 2002:a5d:44d1:0:b0:2f7:caba:3de2 with SMTP id
 z17-20020a5d44d1000000b002f7caba3de2mr74219wrr.24.1681503812178; 
 Fri, 14 Apr 2023 13:23:32 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.249])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a7bce8d000000b003f165472e17sm642988wmj.7.2023.04.14.13.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 13:23:31 -0700 (PDT)
Message-ID: <5a4a754e-b772-84ca-4ed9-c663b8617eae@linaro.org>
Date: Fri, 14 Apr 2023 22:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] target/arm: Don't allow stage 2 page table walks to
 downgrade to NS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20230414160413.549801-1-peter.maydell@linaro.org>
 <20230414160413.549801-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230414160413.549801-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/4/23 18:04, Peter Maydell wrote:
> Bit 63 in a Table descriptor is only the NSTable bit for stage 1
> translations; in stage 2 it is RES0.  We were incorrectly looking at
> it all the time.
> 
> This causes problems if:
>   * the stage 2 table descriptor was incorrectly setting the RES0 bit
>   * we are doing a stage 2 translation in Secure address space for
>     a NonSecure stage 1 regime -- in this case we would incorrectly
>     do an immediate downgrade to NonSecure
> 
> A bug elsewhere in the code currently prevents us from getting
> to the second situation, but when we fix that it will be possible.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/ptw.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


