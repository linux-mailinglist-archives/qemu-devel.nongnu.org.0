Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D3A655B36
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 22:14:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9Boq-0000c0-OO; Sat, 24 Dec 2022 16:12:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9Boo-0000br-DD
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 16:12:34 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9Bom-00055K-3j
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 16:12:33 -0500
Received: by mail-pl1-x630.google.com with SMTP id jn22so7811267plb.13
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 13:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4mlowHaH53I7h5WO+Gx8aVsr4B7HarWuvKnm+w/gllU=;
 b=q5POr52ASDFT1zfVFl67uYYiycXXWVABWxTUTggqbZjOnnQUOHSwnkjjMJGlDvgZcb
 envTiE7o5mYayX/Ysqww8C4VH6HR5ALYlhncUyaRzB5jw6IYhE5m+49fd6KNHcAgCgQW
 YLQxHqx7dcaf/wHuqgHVXA+QaMRWaOJbmvVV3ICE7sjO5eO+gRUuspIhKkrAeTVVEY5x
 AFUEPLkenerTU6HMNSGGRPS1Gid5CWP6g/OUwCqj83ckplyRhNHotOn/++8Iabe+U9j6
 2wcVyqf4ss4V0s+wtRql35Ard7t9kZr6jKO17UpwjAKpDscl/xobUJmdKt61XoYiZK6T
 ZJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4mlowHaH53I7h5WO+Gx8aVsr4B7HarWuvKnm+w/gllU=;
 b=USgGP0jOVd40nTpdRTsJtwYrr29NoCqht/jPiEomrtnfFiowC9W4UoSUbrNsrvX0tH
 ZfFaDgQ++kDCyZRMZq0DkFwq4J/m62QBcy9pLJ8VNZQvkICk28cwDDAcT0K2iIZDwXwS
 s4d8hMbdrDsrA7khfi8tCaEOiVsVNnmaErB8S8mdGuwXPy3Bv2NvBzknbutKGdObF0GC
 iDD/H85lDWM/C7ej6llBXj5Cmg22TrgosOet9RYWDspH8Fq9Bwos9A15xXaZmxXbXKEL
 BIMppiUgNZE2dS+EUeMTCxAFnjpBcK95pJS8DLgWUzs+NHsU7Yed5jLx9p470ElsYHza
 pW1w==
X-Gm-Message-State: AFqh2ko8Q3euhXpxZ2D9txfdaheUhC0z11DK/wSFHkcJGK6LgsthJCgY
 N+xcGT0t/GbuSKHUQ19eTi1dgeLv4/rk2RKu
X-Google-Smtp-Source: AMrXdXvnzeIy6AtPqr0bJ5ppufp1P3z12YlFCgdU9KsrvYwL/5DomKxGkJO10ZK6i3vjqWYyy61Cpg==
X-Received: by 2002:a17:902:e2ca:b0:18e:c6b0:b2f6 with SMTP id
 l10-20020a170902e2ca00b0018ec6b0b2f6mr13577083plc.14.1671916350112; 
 Sat, 24 Dec 2022 13:12:30 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a170902e5c400b00189240585a7sm4458478plf.173.2022.12.24.13.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 13:12:29 -0800 (PST)
Message-ID: <f47ae8f2-9563-750a-d190-d6ad90600be6@linaro.org>
Date: Sat, 24 Dec 2022 13:12:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 40/43] target/loongarch: Implement vreplve vpack vpick
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-41-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-41-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:16, Song Gao wrote:
> +TRANS(vreplve_b, gen_vvr, gen_helper_vreplve_b)
> +TRANS(vreplve_h, gen_vvr, gen_helper_vreplve_h)
> +TRANS(vreplve_w, gen_vvr, gen_helper_vreplve_w)
> +TRANS(vreplve_d, gen_vvr, gen_helper_vreplve_d)
> +TRANS(vreplvei_b, gen_vv_i, gen_helper_vreplvei_b)
> +TRANS(vreplvei_h, gen_vv_i, gen_helper_vreplvei_h)
> +TRANS(vreplvei_w, gen_vv_i, gen_helper_vreplvei_w)
> +TRANS(vreplvei_d, gen_vv_i, gen_helper_vreplvei_d)
tcg_gen_gvec_dupm.

In the case of imm, this will be cpu_env + offsetof.
In the case of reg, compute cpu_env + register offset + offsetof.

> +TRANS(vbsll_v, gen_vv_i, gen_helper_vbsll_v)
> +TRANS(vbsrl_v, gen_vv_i, gen_helper_vbsrl_v)

These can use tcg_gen_extract2_i64, with imm * 8 bit shift.


r~

