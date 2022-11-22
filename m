Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C0A6333F7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 04:32:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxK0I-0002Tu-4v; Mon, 21 Nov 2022 22:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxK0G-0002Tg-5D
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 22:31:20 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxK0E-0002Pm-4v
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 22:31:19 -0500
Received: by mail-pg1-x536.google.com with SMTP id q71so12945821pgq.8
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 19:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NPnPbkHui8y4bxWWEreEsnwzIYyR/NGVHQmbWXnmtA0=;
 b=qfqpjtTbMapG5fqoQ/FlkAeUqsuQXZLzCjyH0+CSiUFzE6JrL5kLSrgfkQyDcIWEuv
 uMDaW9GiiY3+qVMIu88jPVHWhuiYcgfnP+E/+K4EY8Loc0wLBRishjnkr0S3Pqb8ugct
 6a9vA44E3VsPtjAKOjzJPdlyQuRnsSj4wfUJq6pg5g1deSoiyIm2AoF3hXdJT3OanEWo
 Be/EmnV0fKO71PDdXstZyxItviY8e3O07S9kaJ7pW06gWltCAFyRdUNAT7/DTE41DNet
 tMWzXp/kuwT8HhuNs/G0tu43p9MZRXpIoBTvkZIcDi+Hy0ccW9iYHzKALOIpSI1t0tcy
 SYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NPnPbkHui8y4bxWWEreEsnwzIYyR/NGVHQmbWXnmtA0=;
 b=KATHXYBBl8WPgExfB0xDNxLcKdmIkS8qXLYXNfT+FSQ6Jh7KPLakfZvLt917CxGoL6
 05kLPME9LsTeEKLcQn2m8aaMN2bsa8u+ERtxJVDSTVUKjH0gXjbmN+nMx1WxCGz9/A32
 XXf0Do663K+eTEp4uFICeqCHeVWhB8l1/5FFNHRXuVZLJAcmG6PmXaApK78L8fD5REom
 QA0KuKm3/udGwRmY0RRb8anN7yexFVlsPTizD4FJYmBP/dwadSVDSxGB+GkuXLdnbiFe
 gDEcVTjxsukOwSNowkDk1hnEoGyt5o+3vb781DvxKxFmPwmDrZVdNn4N/xvr16+gK5mk
 4IiQ==
X-Gm-Message-State: ANoB5pl2Gu7bmAIfM0rNGQE52eb4R+GQPzq0X8MUncvKqYMSedHNz0b8
 JTMeFETVg+SxZ9E6Gx9Y43KnyJ2YYq1rXA==
X-Google-Smtp-Source: AA0mqf4gdQMEWiTgNY68bzJOjcXuYMyDyG3BpXpgLXpk6LDshTj3NFcl+KZSFv46k5+V74k1u+7Bvg==
X-Received: by 2002:a05:6a00:1303:b0:561:7dc7:510b with SMTP id
 j3-20020a056a00130300b005617dc7510bmr23571996pfu.3.1669087857497; 
 Mon, 21 Nov 2022 19:30:57 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:dd04:f222:eac3:5b54?
 ([2602:47:d48a:1201:dd04:f222:eac3:5b54])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a170903231000b0017f73caf588sm10623437plh.218.2022.11.21.19.30.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 19:30:56 -0800 (PST)
Message-ID: <26078849-48c1-f4de-7600-21f616a65a47@linaro.org>
Date: Mon, 21 Nov 2022 19:30:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 12/29] tcg: Add 128-bit guest memory primitives
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-13-richard.henderson@linaro.org>
In-Reply-To: <20221118094754.242910-13-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 11/18/22 01:47, Richard Henderson wrote:
> +                ret = do_ld16_beN(env, &l.page[0], 0, l.mmu_idx, l.memop, ra);
> +                b = int128_getlo(ret);
> +                ret = int128_lshift(ret, l.page[1].size * 8);
> +                a = int128_gethi(ret);
> +                b = do_ld_beN(env, &l.page[0], b, l.mmu_idx,
> +                              MMU_DATA_LOAD, l.memop, ra);

This last should have been l.page[1] -- fixed locally.


r~


