Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70F28F79B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 19:25:30 +0200 (CEST)
Received: from localhost ([::1]:51874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT70L-0000uN-DE
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 13:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kT6yF-00083P-Fp
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 13:23:19 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kT6yD-0005ew-7x
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 13:23:18 -0400
Received: by mail-pl1-x641.google.com with SMTP id p11so1979959pld.5
 for <qemu-devel@nongnu.org>; Thu, 15 Oct 2020 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rvV8nPTH0XUu4R56Xw963w+XbAEG2bIZP3GDo9KDS4Y=;
 b=aVOgFiyfCVjKfMBGoCeEGKP2x5RdS/nfZxHUuh3m59rtylOLnFtth4G+A8wvtxID2Y
 LCxCKai1CCjOdT7moplXQQ68hTPBLMr5n4trneS2liJW04DUSJDZwfSgGN7x8A6P4+rN
 WYO85ROFXwd4e3xKCXi0aplQq2ay1KRugQPgpL8z7GxYNpYsoo9JFKitePaHenX6ayZs
 vAN8JJV9TbnnHAizheJjdzVGMaEVa3ZOyWJstGu+7KJGHfDcSCZ+KWSfZXaoYQ3n/+l9
 fOytnaMZLZetJoxn3KLTAU9/gGa+nfqPPAMUFVTuUy96LbLlPHKbbeW3MHW12dVZgmRC
 4ngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rvV8nPTH0XUu4R56Xw963w+XbAEG2bIZP3GDo9KDS4Y=;
 b=XlG4Nr7HnpRoT1LVstUn2eclFlehIBmbtbaApKPcKra+v1niGajIZdu6St/c7L8L6V
 r5QSa8D3akf1nsT6odohilFUZSbyLtL7piObhEMzJwwtF9JVZA2qQ+qSD8n/u7nPJ8/j
 8YNqofzHyUHGviiiUiy5Lp28HKHSsriBS/xp/4DFra5BQwU6TYPpQDrO+fy+dGGBEwRj
 1DTJX60NtPpV6hrUDi9uBK2y/Fgy61BRNJ1aHF97e/mfwFsMADCI0tkrkd421ePju3n8
 sgz7L1KRa+9JOX6Wgrfyr7ziY6wk+jNgC+Tz6NwDVR08AKj9pkLNbQZIeo/kMcl7EegY
 n4Zg==
X-Gm-Message-State: AOAM530bMaGr72fIxiT0hW7sywrXO6QdDAkTAzIU3FvxJxUPQtZVFdic
 UEfX61TCgTjIvG60xj2wJg9mAA==
X-Google-Smtp-Source: ABdhPJwFwviTyiXuJPHCyru6EuM19YEQI4tR7w4mkZ9kKoUhQhzCkWwKXy//xi7bzonf9NIzwvGdhA==
X-Received: by 2002:a17:90a:67cb:: with SMTP id
 g11mr5552656pjm.226.1602782595590; 
 Thu, 15 Oct 2020 10:23:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u25sm3833190pgl.31.2020.10.15.10.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 10:23:14 -0700 (PDT)
Subject: Re: [PATCH v2 00/10] softfloat: Implement float128_muladd
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20200925152047.709901-1-richard.henderson@linaro.org>
Message-ID: <32f5366f-ec30-a41d-1be8-c23eb9c1dd57@linaro.org>
Date: Thu, 15 Oct 2020 10:23:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925152047.709901-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.019,
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
Cc: bharata@linux.ibm.com, alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping.

On 9/25/20 8:20 AM, Richard Henderson wrote:
> Plus assorted cleanups, passes tests/fp/fp-test.
> 
> Changes in v2:
>   * Add UInt256 type (david)
>   * Rewrite and inline shift256RightJamming.  This keeps the whole
>     UInt256 in registers, avoiding long sequences of loads and stores.
>   * Add x86_64 assembly for double shifts.  I don't know why the
>     compiler can't recognize this pattern, but swapping values in
>     and out of %cl (the only register in the base isa that can
>     hold a variable shift) is really ugly.
>   * Add ppc64 assembly.
> 
> 
> r~
> 
> 
> Richard Henderson (10):
>   softfloat: Use mulu64 for mul64To128
>   softfloat: Use int128.h for some operations
>   softfloat: Tidy a * b + inf return
>   softfloat: Add float_cmask and constants
>   softfloat: Inline pick_nan_muladd into its caller
>   softfloat: Implement float128_muladd
>   softfloat: Use x86_64 assembly for {add,sub}{192,256}
>   softfloat: Use x86_64 assembly for sh[rl]_double
>   softfloat: Use aarch64 assembly for {add,sub}{192,256}
>   softfloat: Use ppc64 assembly for {add,sub}{192,256}
> 
>  include/fpu/softfloat-macros.h | 109 +++---
>  include/fpu/softfloat.h        |   2 +
>  fpu/softfloat.c                | 620 ++++++++++++++++++++++++++++++---
>  tests/fp/fp-test.c             |   2 +-
>  tests/fp/wrap.c.inc            |  12 +
>  5 files changed, 652 insertions(+), 93 deletions(-)
> 


