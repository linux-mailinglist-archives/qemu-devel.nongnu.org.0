Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C358AD0F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:29:49 +0200 (CEST)
Received: from localhost ([::1]:44218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzGm-0007o5-UM
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJzFC-0004yB-JL
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:28:10 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJzFA-0000a7-RN
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:28:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id x10so2941345plb.3
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hjG2eV73tRyhMPa6zkWjB9r3alhIIjCsO5+zCPmRpwU=;
 b=NAEx7o3IpYPdC8BhPESf8Lh8I4MdPO3OnR661D/L6UOiQzsegO88nylWk+rqHNP+2m
 jlV1XY3eehoGKCnaMSZ78+fFN6cfH8eCjTRfNp989j0hlwJZmbs1DCoS9ThV7RU6tY9g
 1GIcvWCMoOPqBpclG6Xhm44Hhw4BwqRqGKZlEM9Nimy1xCFu8seSZ0tLK3zbbTNbBW0E
 V0Mnm4tuHOVDfqgP/sQaCEx1SwQbsOCM3wo9jdciKFy0vM/0S77ibwBKHRpugxun3O1R
 PGpuSuU5L5FASPZL/SJhvFkOYq8DS9piJxKuUPmJUutyXEp8DC+os6aQZ4OAMAxTipTU
 NA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hjG2eV73tRyhMPa6zkWjB9r3alhIIjCsO5+zCPmRpwU=;
 b=OANpdYUVhBEGmSCouKB+AYzNTn3F+J0cuiPoKFgU6nMNpsv2ZI3Uo+fy733b7nUsQY
 Fl4arws0+5mxWUHzHICzSPuzm614O7DYRUKxLfmm1DkDoNRyUjVo8SsCLs6yLBNv5aGm
 +fXBlgfU4FRohcxoq7WuppmLlFawxKYV6cdE2xlXgcF/fngm4gMw9K3IzGhfFzaHzXhD
 q9UhQbXBQeFfwdmQQ50ykW28bMk7D/jWrSlXk/WvODRkIAU5YVDxxYSwrKRC112FaGqk
 vkdt+SNZMM/pSAnEGzub9iuiVzl63xVkQu085im+RPw2sVpnejL8v/AHT3HQiIcT2HYI
 0/nQ==
X-Gm-Message-State: ACgBeo3VQrhRyJUzKLtAhtDjiy5s3+qiMaNdCAceKN9YWoCwtbL1fq1L
 SyU5bMprYLpUDLeLSVO4wUGGwA==
X-Google-Smtp-Source: AA6agR6+IvIJZLWlIj59IQn9zWUYjSlgGxmoOz4qMRXQET+uQcbCgxOw2AZoHr4V1toD+MhGifzWBw==
X-Received: by 2002:a17:90b:38cf:b0:1f5:6e50:5abc with SMTP id
 nn15-20020a17090b38cf00b001f56e505abcmr7697869pjb.83.1659713286939; 
 Fri, 05 Aug 2022 08:28:06 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 f71-20020a62384a000000b0052d96d86836sm3153126pfa.50.2022.08.05.08.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 08:28:06 -0700 (PDT)
Message-ID: <0b90c962-592f-c7b7-e2cb-d1e55251a7bf@linaro.org>
Date: Fri, 5 Aug 2022 08:28:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1 v2 0/5] Fix gdb bugs and update gdb-xml
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, f4bug@amsat.org, alex.bennee@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220805033523.1416837-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805033523.1416837-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 8/4/22 20:35, Song Gao wrote:
> Hi,All
> 
> This series fiex LoongArch GDB get the wrong pc, because the xml missing
> the register orig_a0, and update loongarch gdb-xml to match GDB[1]
> 
> [1]:https://github.com/bminor/binutils-gdb/blob/master/gdb/features/loongarch
> 
> Please review!
> 
> 
> V2:
>      - Update orig_a0 value to 0;
>      - Update fcc type to uint64;
>      - Share write_fcc()/read_fcc();
>      - Update patch2 commit message.

Thanks, queued.


r~

