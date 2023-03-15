Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25EB6BBA17
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 17:43:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcUDh-0001fk-Co; Wed, 15 Mar 2023 12:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcUDc-0001fP-U2
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:43:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcUDb-0007ql-F7
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 12:43:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso1684565wms.5
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678898593;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ApbcRmhUAIv76FZM20cBwdZF7oN3DSBff64qTgmRKcQ=;
 b=EzoG2bB+VkiRdlGpAVYhAviXdO1l31KqnfRBeAVs7hdVOs4yJoxYX8IQQm7O5ZwfKo
 vZiMCtPQqBldi/eQfdmi99sPpdvDQCpMFrqLas5oY9X/BtQMuGHv35LJ3JCJK2iZpph9
 RhdzC1hQYrxAuHUqhBKXKqx+sbhtJgY1EQDjyu+MVZYSa3sdYMo/Yy0RUjlqxQPIa1ys
 dbJswwtVK4Yvn8qpzt2Q4L7IH2bKWRk8habYWZsn+Ub8i73XrnODadJDftHaqmexhCsP
 7V2zKQz8Sc8sgkshhaXrUwEC/2UBYMDmqngsO4dodTGcFKTNufn65h0jo6+C2cHJdYtg
 /Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678898593;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ApbcRmhUAIv76FZM20cBwdZF7oN3DSBff64qTgmRKcQ=;
 b=DHZjTMh6IwjNPorU0qoGVtSTrEb46D7P6Go8vd4lnpmS0X+HR0Lv0qzNbvCnXYo917
 hXWQO3gZM4rwsW28N8EcEsL8GYQfSPqcp8QRYTx+FYw2LxZ/c0bYcxNZtOYJEPC0CcAe
 JRv+CJ//Dfl8a/X9EPZY/hyXaKKDZ0/+WbDN6XzgBe2HhEjUIFu7nZlwQAAUuBDVhilw
 HYv7xKzJCt9QlaTuXQc4SOcfqU9nbc0dcrt26ZjMxGyG149C/BfDVbmHH2tFttn78Pp+
 uymDqsFoF4DoTgWPDzZoI29QGGp/xPY2mBWtLB8j4pUvefToR10NkYsltg6SqeV+ePMF
 dogg==
X-Gm-Message-State: AO0yUKVSsd+Pnz2gexgh+IGny3JcWvphofvB3IWEkGtna/TTgkLXl2QA
 XZJpn1sIYrts5UFuOaNx1GwbFCiOxta/EJ0CTaZvRA==
X-Google-Smtp-Source: AK7set96SSyibIebeaNzv+VAbw6KncJkWf8bvegDQEDvan9YLPruwkDQSCPGgHRusmUD1/6/oHO1Cg==
X-Received: by 2002:a05:600c:3d88:b0:3eb:33fb:9dcf with SMTP id
 bi8-20020a05600c3d8800b003eb33fb9dcfmr19605579wmb.5.1678898593595; 
 Wed, 15 Mar 2023 09:43:13 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d10-20020adffd8a000000b002c705058773sm5061620wrr.74.2023.03.15.09.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 09:43:13 -0700 (PDT)
Message-ID: <c0dc065d-6d9f-dd1a-edc2-752d35200671@linaro.org>
Date: Wed, 15 Mar 2023 17:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 29/30] tcg/i386: Add vex_v argument to
 tcg_out_vex_modrm_pool
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230216025739.1211680-1-richard.henderson@linaro.org>
 <20230216025739.1211680-30-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216025739.1211680-30-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 16/2/23 03:57, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


