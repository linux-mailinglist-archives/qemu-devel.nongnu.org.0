Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124B76ED14E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 17:29:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqy7V-0007Ve-Hj; Mon, 24 Apr 2023 11:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqy7K-0007M6-JD
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:28:38 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqy7J-000721-2o
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:28:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so29464365e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682350101; x=1684942101;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrcfAq7GpvAQ85HMncMMXdn9L3vMq9LXjETEWfhQ4T0=;
 b=WjCaBhcQcQLxJFn7P4gShL9GTREDkwqBSxWSfFJWQy+hBb7ciiocAcRFK/nontWAA8
 tOOvKrZDcLn/zhmQWsJJORzvffp2DGBAKv7NYwmej6MvVKV/EGI8Z3CXwYYlJB1MLGdN
 MWLtKhSRH9VBB/0dJL2VtF686+KAVLZDG3nCS3RlfpgkTKtC0s8cniZjUVME/HEeGbZF
 obgHORaw3q7xQDWgG3oa2afqru1w6/j6gaqGSPOURQP+TVcu3IuZ5FP2qHT9RtpgtJiQ
 Tdqd9B8Bc+23fQyyMYqIxLfLaDo30A0lndm/lVYcs3zwgcaf/4AReRLV9hlNCL9SZ/yX
 4WPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682350101; x=1684942101;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrcfAq7GpvAQ85HMncMMXdn9L3vMq9LXjETEWfhQ4T0=;
 b=EsG1QG35+ko8AwPV34jXaWrRqsjjupP+MWP8vcp8vLVGfn6n0lQxBA8PJL7PqGewyJ
 oKVAmuo+mTy/qahgr+Ey68G9Kt6521dYSlJPkv136rmwcKnwv2trq8mmiq5k/IRBRTMk
 kqg8i8yO9E0YZF8z4YkGPGAmQVcrOxWIxgs8RbsMA7X6m1FtnQAcYp5gXeIOzYB6dzUS
 h2Q2mBKqwL0fNjJ+aiAH2gm6tFn/uck58L/MyJshBvONDbMWwPnnhCgVw4XXJD3taCs4
 EusdNI0T7FJYBkDNY3OfXj7SyHEFSWDUxDA3FlLISbYDetGCDV5N3i5EHDIwb8a3F3cD
 XTXw==
X-Gm-Message-State: AAQBX9eKafzRqardu9mp8vJnDYplvIoMPmohzAv2Mm8aILAF43WsjVeY
 pgeyn5Jts3fEmtoo3YEs7sDNKACKPRZaQ859YmrZow==
X-Google-Smtp-Source: AKy350Yz+WExavPY50HWnZrIL7BnKzuc26zkYZJ7ublQ+Lzerh4iXbTR0A+z6A7hcYJMVIUTyd0eXw==
X-Received: by 2002:a1c:4b05:0:b0:3f0:3d47:2cc5 with SMTP id
 y5-20020a1c4b05000000b003f03d472cc5mr7849778wma.10.1682350101626; 
 Mon, 24 Apr 2023 08:28:21 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b003edc4788fa0sm16018130wms.2.2023.04.24.08.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:28:21 -0700 (PDT)
Message-ID: <317bb3ff-8555-81c5-29ae-8b9dedf3cf6a@linaro.org>
Date: Mon, 24 Apr 2023 16:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 28/44] target/loongarch: Implement vssrlrn vssrarn
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-29-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-29-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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

On 4/20/23 09:06, Song Gao wrote:
> This patch includes:
> - VSSRLRN.{B.H/H.W/W.D};
> - VSSRARN.{B.H/H.W/W.D};
> - VSSRLRN.{BU.H/HU.W/WU.D};
> - VSSRARN.{BU.H/HU.W/WU.D};
> - VSSRLRNI.{B.H/H.W/W.D/D.Q};
> - VSSRARNI.{B.H/H.W/W.D/D.Q};
> - VSSRLRNI.{BU.H/HU.W/WU.D/DU.Q};
> - VSSRARNI.{BU.H/HU.W/WU.D/DU.Q}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  30 ++
>   target/loongarch/helper.h                   |  30 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc |  30 ++
>   target/loongarch/insns.decode               |  30 ++
>   target/loongarch/lsx_helper.c               | 358 ++++++++++++++++++++
>   5 files changed, 478 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

