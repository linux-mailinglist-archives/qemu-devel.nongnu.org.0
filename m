Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4957938F2BD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:09:05 +0200 (CEST)
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llF0i-00070D-Cq
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llEwA-0002X9-Pz
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:04:22 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llEw7-00030c-2W
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:04:22 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso11613019pji.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lv2oo1mMiXU9w733nRRGCq5EqoVUookgtjUDw26eOy0=;
 b=XNj1QNA3IJk70u24tO3TQH9VcYGSc8FQJLmfMPZuWJAMHGQxm3CgXYFwr3TINDP2Ri
 i0mLY7ySbRG+h2Nf3QwmeGgtPxLpBNozTETQXd6CU5ixdco0unTldmFtBhNiPjVdpR1m
 uV6DgSr/vE6xMQvjRWJ9T+hP/HsMmLwOg/Zi1ocTnh1hpLbDBQBk+8ksu9qAaE1R+uwg
 CctF/ICEc+1afq8Ad89dmsA4olIwAi91kwtYnGGpIKcmXts8N9+70ApvH1XiANQOeALx
 KkZGFrwYdn6RkRwn08NVJqLmCc84Xm+2rlJd1wIGp5TbgBtHgOsPpOEFyFyBIUFn0ncT
 53/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lv2oo1mMiXU9w733nRRGCq5EqoVUookgtjUDw26eOy0=;
 b=NAXJfAnAfOdWmcWweoNJ6aK8uWNH/rY3ypPLC4DC8L/aeptOWelBNFjD3lmdOlSn1L
 nebO5dyHrpEy1pJ7JfEbQxqYuE15d/lSDoCnxSUKoLYKiNlPZ9n3Dt15zKTq0ueINSce
 wcZfb+GhUhvX5pJ4+tcPONL7G60PrQfahQG/3Jy3O40/xFnBmeKaHivn32vn1sRK+HO6
 BCkp/Nu9XqswwDiEuoc/64f+FDVP8/kyzPxLelwN09eU0YDDXUBZ7JidyS7AqZG7xA0f
 pvNqanDkgELtDmBJIuua9c9XqkZ8yQkAsN+flrbZimh9CCL+nVsaHphEfCqtRRaHe1IY
 gUCg==
X-Gm-Message-State: AOAM532BuoKTS+E9W+CQYANtbG+xjtHwWnGbL7AA1p+MaiCf2dNRH4Sp
 Tf7mpW3s3vq021mwsSbw4MyTaA==
X-Google-Smtp-Source: ABdhPJzfrJ4XXwHgpr3e5ScHGuWG14kpHjm/Bmqj2sHFtq1TQPa1ypk1PqksC8v96YVlsG41YhWNew==
X-Received: by 2002:a17:90b:ed5:: with SMTP id
 gz21mr26644669pjb.102.1621879455912; 
 Mon, 24 May 2021 11:04:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u21sm11340251pfm.89.2021.05.24.11.04.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 11:04:15 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: Pass the same value to oprsz and maxsz.
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210521054816.1784297-1-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ec4abbfd-fccb-a9cd-9dd8-a99bef328d56@linaro.org>
Date: Mon, 24 May 2021 11:04:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210521054816.1784297-1-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 10:48 PM, LIU Zhiwei wrote:
> Since commit e2e7168a214b0ed98dc357bba96816486a289762, if oprsz
> is still zero(as we don't use this field), simd_desc will trigger an
> assert.
> 
> Besides, tcg_gen_gvec_*_ptr calls simd_desc in it's implementation.
> Here we pass the value to maxsz and oprsz to bypass the assert.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 89 ++++++++++++++-----------
>   1 file changed, 50 insertions(+), 39 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

