Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2015EE092
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:34:51 +0200 (CEST)
Received: from localhost ([::1]:51252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZ5G-0002aG-Vr
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYva-0002na-8k
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:24:50 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYvY-0007aH-Gj
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:24:49 -0400
Received: by mail-pl1-x62f.google.com with SMTP id z20so5163298plb.10
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=EV3p08a7Wg73yOtvcbOuNOCUl1cYSkdatjSNLQnX8w8=;
 b=y6jIpr4Bv44NFNJXpuIy3oR6uhm9vbB+r59pUuNwwT6d+/9optNnnLTeKQsc/Zjny9
 gSyLE5ZxjIdrgZHRxxlG+nanAb3zlQPYu918JpZRuc59ZMMDhvBM/0pOSNZLoSVWrCgR
 KOfJ4tQPpVs/6GXolT4WZnxbR58JyJqY0hT2lvLvdIOVJZuHDtYgP7/nQI52LokMiSF3
 As3Z1/WkBr9pHve7sBtkEAlHy7FFOvTmOk6lWbXdZpPFtyGa7Fs7J5W6JWdx9PwoyqTE
 HLYHUPZg1ZWYaicTNvg0dJIQV3Qd9CYEYLIhuObSOxDMBumj+M1uOYQ3qBY+oujQ2m0g
 oKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=EV3p08a7Wg73yOtvcbOuNOCUl1cYSkdatjSNLQnX8w8=;
 b=6aoWQP3q2Dm/kX3KAinjaCprm/l51/Is/RBL21IF5vHnoRf3orN1HDY2hyeFMuUrYD
 2BuQaUr4RjPf9A9FfvtrUQJ0qN3O/n9XHl75z761X0XbW+B/MxJjLWMxVXb/i8bwUBW8
 EVEfXVsC1B7DHaEQKdBYfQ50TaE8ce9DYRRvvgxpWi0ECBNtokH48XLe7Wwr6IdO9rug
 07nHhs7FP8/mRAKXmaoxNVzK6bm+n4ufbezkVM8NsNmdVP/acigRMfH3rtz/ns082y8G
 MJG4Q0bfOGI59vgdaPD7Fa7QmCQ7Ji0d+7ivhEkE+iHUOCcuGy7ncC6i6pXwLIyuj8Kn
 5qYw==
X-Gm-Message-State: ACrzQf0FiGXwEqZRR21jeBt2KJku1pJfHf+WKzjsIFB7npgm+cANuzeQ
 27StvxfYBzAqJ8GpsI2BYoMtCA==
X-Google-Smtp-Source: AMsMyM4GIxETuOWHys7fZGnCYDjShGCjiKUipHiELSwg5ZUewCuble3tA5jETwRDeDcYhIK/LW1CUQ==
X-Received: by 2002:a17:90b:4c0a:b0:203:6c1e:e730 with SMTP id
 na10-20020a17090b4c0a00b002036c1ee730mr11159241pjb.146.1664378686594; 
 Wed, 28 Sep 2022 08:24:46 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a170902a3cc00b0016dbe37cebdsm2092780plb.246.2022.09.28.08.24.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 08:24:46 -0700 (PDT)
Message-ID: <673a8e64-31f4-99a6-2e1d-ffb833237e16@linaro.org>
Date: Wed, 28 Sep 2022 08:24:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/4] target/loongarch: flogb_{s/d} add set
 float_flag_divbyzero
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn, huqi@loongson.cn, peter.maydell@linaro.org,
 alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220927064838.3570928-1-gaosong@loongson.cn>
 <20220927064838.3570928-5-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927064838.3570928-5-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/22 23:48, Song Gao wrote:
> if fj ==0 or fj == INT32_MIN/INT64_MIN, LoongArch host set fcsr cause exception FP_DIV0,
> So we need set exception flags float_flagdivbyzero if fj ==0.

You are correct that ieee754 says that logB(0) should raise divbyzero.
This should be fixed in softfloat-parts.c.inc, not here, within

         case float_class_zero:

             /* log2(0) = -inf */

             a->cls = float_class_inf;

             a->sign = 1;

             return;



r~

