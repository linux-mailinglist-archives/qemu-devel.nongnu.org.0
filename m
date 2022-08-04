Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE48589F0A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 18:00:44 +0200 (CEST)
Received: from localhost ([::1]:42864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJdH9-00010K-Js
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 12:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJdD4-00058h-1V
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:56:30 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJdD2-0003uW-CZ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 11:56:29 -0400
Received: by mail-pf1-x42a.google.com with SMTP id z187so9807025pfb.12
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DWIR6UETj0gLuun7KHQRO33aSS+XeMVlxFxTjE0CJzM=;
 b=awbFcuN7h74UcuvBgY3YBeMc2vSL0vMeLwAFk1lsqZReYmvMfECTVXVo/NtI1+n0r/
 XetHA28sxLnHI+/49XN9mTrodbXowMoLUCBePkGogEdmzvSckWN2mbjMh7VPrSNwMDES
 ZOlmyxsIDZohlIp1Kfax7Ll9IPLFSAp5+hw3Ln216m2L7iSK6783EIwQEVgrAtN9A8fi
 9OatbifXa1AJ2pDK9Fu2npaSYOZWmznFyvl7tLuoFO0PX3Yq0EKrPd2CQ1eFsZtslGsm
 yJAXatA/NB7ruVlX9ngjK8zwjdNk5pyMNU+3USPCcha8hlPrXnbQb28xk9KhQozTuCI2
 7irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DWIR6UETj0gLuun7KHQRO33aSS+XeMVlxFxTjE0CJzM=;
 b=DYb21LGXcb/RxseZxe7G2ZpVu3WioRBvfeHyjpbSK5PR87DW7HX344H2L5M/Oo4tGx
 xLuVo1OV16H6A2na23/FJ7GTci0UUkw5c6HCkoDvj+3vg29LZf1ty6jO97EILcr9KM0i
 2E8R0JCpkKvUsZLn6o+TjrzZ42/JTKGkrYdYZI4fOFKhYEoLUlMV3aX6d1PaFfsriV/V
 UZUMi0ZAGoCqSKsyoO8SlwKQVO5nKEy8uZ06ZkhwSVD9IbP6tGqX+yhS+kw46qygeOok
 dbt/aWCKlO/jwRI1Pm38ScjjKsDkGzYvS/v/kvTdID5nDZ3ooxdYTBoCOHby6VAcGAh5
 MlgQ==
X-Gm-Message-State: ACgBeo2BVqSqprGoCakaRa3PJDbgFpNoUise9jOaGFTuMviU1SLP2U+A
 l44fCPmJ0LgHQuGJOpOiFq033Q==
X-Google-Smtp-Source: AA6agR52XRO93GV6fUIm72pmBrUjquWTmsmNrV5AqGjkeXXkAmOEK+Ued065Jy0HCWjUIcQoWeLqcg==
X-Received: by 2002:a63:6c49:0:b0:419:a4c5:cab5 with SMTP id
 h70-20020a636c49000000b00419a4c5cab5mr2051797pgc.123.1659628586679; 
 Thu, 04 Aug 2022 08:56:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:c349:7b49:2925:a0a?
 ([2602:ae:154e:e201:c349:7b49:2925:a0a])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79911000000b0052e6d6f3cb7sm1125970pff.189.2022.08.04.08.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 08:56:25 -0700 (PDT)
Message-ID: <8a9fdc00-5d12-ca40-7101-ed5dc8b36e7b@linaro.org>
Date: Thu, 4 Aug 2022 08:56:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 1/5] target/loongarch: Fix GDB get the wrong pc
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220804130213.1364164-1-gaosong@loongson.cn>
 <20220804130213.1364164-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220804130213.1364164-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/4/22 06:02, Song Gao wrote:
> +        /* orig_a0 */
> +        return gdb_get_regl(mem_buf, env->gpr[4]);

There is no rational value to provide for orig_a0,
because this is only related to the linux kernel.
I understand that you need to enumerate the register
so that pc gets number 35, but you might as well
simply provide zero for this value.


r~

