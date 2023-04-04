Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9C6D5F70
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 13:47:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjf7U-0005QF-CF; Tue, 04 Apr 2023 07:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjf7R-0005Pw-7U
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:46:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjf7O-0005UJ-SO
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 07:46:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso725916wmq.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 04:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680608788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i2mJCMw2woQrhVkQOvN88l0jz3uWO/T1Q/c65HoG48E=;
 b=A6BKshadDKerA5DKitfN4cWDqVPaz0BxNm46AjdD1GnCpe897fv4ubaOvmQhQIzduH
 INWQIgfSiSyJ2/AAsIa4IMisHxoAreoYiFXLDQOe2+//Aic105gCLg5lODkfkmOSQgrf
 pGaucmR52ZQ7bcqd2oiLY+bTOHQ8mdcPUSC/El8EcXrl8xFqJEGoGdgy9vzDUYp6GV2C
 jv38w2D46ANhZ92noUPCHvcWvoHBCnk0qg/xxMWnhuQayYjyN/jprCm6VMGhyCRDZ5tB
 lieNRPy1BCPOFTVUqbOp6Xr2QnuhpLd82+XqVo4n7PROOvNnTjq4dQO2JA4N8tO89Y8j
 TBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680608788;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i2mJCMw2woQrhVkQOvN88l0jz3uWO/T1Q/c65HoG48E=;
 b=zv2lIw1lyym+uGrbcea8GJoT5negHT0LEnHiXKyUV6ORRSXxmBXZjJbyJYfAd9htyJ
 GwK3gQgthzsH20JO0igSXDhl+hHUa9sz153Ar6ySIPBChayacaGwQDuMwDu8J5YotEAq
 2dLKdWaqCHqgE/yR7q/iIJzV5WbzFgeGkxp5Cf2qiYFMrEOWrY5Ja7w4pUywmhMPOzEc
 xT+nO4uxb0eYXh0YEEy4BUjDEDLQoGWy+PzHLunz8LfFJ6NkWsgGb9Oprm8ZUbfJgrie
 Bkr4vRia9t5z7WqP2j598jZ1NfQH3cygtQuQo++yJydozekn3QWmdHrsE6SPAbVdlhjH
 8MVQ==
X-Gm-Message-State: AAQBX9fk3Z9qpPY9Rhc93iohn8jdswB5qshtIZD/XdTnDuHro999yFMU
 qC9TKBxlzIABV2UeQJfyMUPdhw==
X-Google-Smtp-Source: AKy350YlhcShaS2vl5KxG3AU+X2PzNwP+zEbOIEmxT/vFMbvNx1WEh9ca2cCFNO1ItgrJzlMPhv92A==
X-Received: by 2002:a7b:c38a:0:b0:3ea:e834:d0d1 with SMTP id
 s10-20020a7bc38a000000b003eae834d0d1mr2004503wmj.36.1680608787976; 
 Tue, 04 Apr 2023 04:46:27 -0700 (PDT)
Received: from [192.168.69.115] (gra94-h02-176-184-53-13.dsl.sta.abo.bbox.fr.
 [176.184.53.13]) by smtp.gmail.com with ESMTPSA id
 q9-20020a1cf309000000b003f04f0c5a6fsm8208365wmq.26.2023.04.04.04.46.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 04:46:27 -0700 (PDT)
Message-ID: <7d34296a-c877-1247-d885-62b235271912@linaro.org>
Date: Tue, 4 Apr 2023 13:46:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] block/nvme: use AIO_WAIT_WHILE_UNLOCKED()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>
References: <20230404112044.427062-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230404112044.427062-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.925,
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

On 4/4/23 13:20, Stefan Hajnoczi wrote:
> A few Admin Queue commands are submitted during nvme_file_open(). They
> are synchronous since device initialization cannot continue until the
> commands complete.
> 
> AIO_WAIT_WHILE() is currently used, but the block/nvme.c code actually
> doesn't rely on the AioContext lock. Replace it with
> AIO_WAIT_WHILE_UNLOCKED(NULL, condition). There is no change in behavior
> and the dependency on the AioContext lock is eliminated.
> 
> This is a step towards removing the AioContext lock.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/nvme.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


