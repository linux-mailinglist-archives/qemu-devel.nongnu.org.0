Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2963E288
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 22:10:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0UKo-0005oA-Pb; Wed, 30 Nov 2022 16:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0UKk-0005np-2o
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 16:09:37 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0UKi-0007dM-EO
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 16:09:33 -0500
Received: by mail-pf1-x429.google.com with SMTP id 130so17972595pfu.8
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 13:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EMi7OrX7JOgy1SnwIgoieGG8TDFMWqpycqWv/sWXuRU=;
 b=gFDpi+QMz2j3LNBWni3AT3EfkpXpOP6VsSTixwPAgY40AmSLhMCd7Fisc4zJbGz/kr
 yIBwu640b5HjMwt31LUtnA1aRIsPrcqaaW8WdFcXWun7SO3zwPtIpjB69xPGhVy4JH08
 z1xMyQgi/GRrEUCdWyoEPvHwZC0xbWc/QDinmmpSn6K4VLD/Jui4yi4NX1yzfVbv6+8+
 zObzbJCa19mUqS+GLZmxnMeKR1fSFMs9Id7XwBkvfO+D/NfwkZwvwJEhyUqjdMiv9Qyp
 NErX+OuBvvx/sKSKZshubVhF4o0scFXIkMgdUmGoLQgmS/uyRv7Vzv1SxmkBG4r1Z7BB
 QlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EMi7OrX7JOgy1SnwIgoieGG8TDFMWqpycqWv/sWXuRU=;
 b=lyl+YPG2XaGu3XJh99pKYGpkh9fv4SctMxTRPr1kBoByyNX2ijQuiNwMzqGbzWosFX
 Wkq0emddBUMW1vEyGrV1VlTmClgGOWorbbap/eD+0n2MJHZ5mFF9PnFiu8eQp0JJv87M
 6orNh5ZIp+X0YiC2h0RRn17lNPofn7c18yWZ8Zy6kkWCDPC4xqyFGF4R+rYcSw/gSWAb
 V2oGSGZDvgNu+eRYbUFOW7RHKCDGN5xveyRaeYyWvzRYGTZQqzCImO86Q8XkLaQSkkhX
 4Dvv07nI4IBxzZntBf1KDrOhOkdWwX1dcagnD1xkyWAL8uU5nu9/VO3smseqimZjCbIa
 5YZw==
X-Gm-Message-State: ANoB5pntsZh7XlXSAFEhpA34Bo95JNaUM59fEz5tG5L3agALqS2+49I3
 R6/ASOjw4COqkL0adiRZRVDZsA==
X-Google-Smtp-Source: AA0mqf49CcUl00Bbcex9RcdWHCjPIXY8jjsAdBQOJ1ipqajLF1pDBNaNGZ54/R8FeIZ3QgDk8QMxaQ==
X-Received: by 2002:a63:e1f:0:b0:478:5ba8:3901 with SMTP id
 d31-20020a630e1f000000b004785ba83901mr4347835pgl.117.1669842570695; 
 Wed, 30 Nov 2022 13:09:30 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 b65-20020a62cf44000000b0056f0753390csm1864457pfg.96.2022.11.30.13.09.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 13:09:29 -0800 (PST)
Message-ID: <5f8d64c4-3ad0-2340-6fe0-86707b41980b@linaro.org>
Date: Wed, 30 Nov 2022 13:09:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 24/26] tcg: Introduce tcg_temp_ebb_new_*
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-25-richard.henderson@linaro.org>
 <20221130180703.dprt7lzmppgfihtp@heavy>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130180703.dprt7lzmppgfihtp@heavy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 11/30/22 10:07, Ilya Leoshkevich wrote:
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> While not directly related to this patch, it would be good to update
> tcg/README with all the new kinds of temporaries. E.g. the EBB ones are
> not mentioned there:
> 
>      TCG instructions operate on variables which are temporaries, local
>      temporaries or globals.

Thanks for the review on this.

I'm not sure I want to take this anymore.  It's confusing to use.  I really think what I 
should do instead is improve the TCG register allocator.


r~

