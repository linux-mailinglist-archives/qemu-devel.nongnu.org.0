Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7B3406D1
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 14:27:00 +0100 (CET)
Received: from localhost ([::1]:59706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMsfz-0008LE-1e
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 09:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMseY-0007qI-SU
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:25:30 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:33299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMseX-0000X3-6n
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 09:25:30 -0400
Received: by mail-qv1-xf32.google.com with SMTP id o19so3187528qvu.0
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WExaGAKqF3gAJ7vqHPPLyDjFWie/MELjUvyG4RcAJjU=;
 b=V0J3V7p0Oc/6emESNB9fpV8fKVzflnX/LzPD61UFkOnNAAsJt79Q+i+Zb6l9ww1Si6
 Cq1Ore7XVH6WbpKqhdi+A/ZR5xcll/JB7HSmZmI9Nsw99VjMXVmaqSCQ0xiiHZRpgE++
 7GlGf8CxSfXj4XExKK99tNlREVr9PpcfMjuVMuUTiaJWq/Vn1WMfvXF3GhviSiExjzBL
 JU8xLwnkORnlnIl8tWjYpTWBGCqFYA6sWnCUTpaR+QuEouIwh61os6fQ2rCMdo66rw2o
 R+oB8BriP9iinuZ+R7iEODrLk/YCRSmiN643SOXhoWtipjBIOYWpCCaIjyYSBhSWAwsY
 RNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WExaGAKqF3gAJ7vqHPPLyDjFWie/MELjUvyG4RcAJjU=;
 b=G19rRWbJNLQrKfZJru+v36zDW8K8zrJ43wpS+vP/fBsr9wRSjJFv6wpHDbQdmlBxnu
 vtz83CzZfBmXUJKa2i3Xe16co6U8gdMDVW7EHhmIwYrZtytDXIHNntjBaCGFkFy5bhNa
 or8KB7DO2YIhcbVH6pUM+DvEgrz6j83EHRWf5r2+KnfqVpbUEBW5ZLWfZkuEBxsqO2UD
 h4I3ig3AXjOJi6Z9d86sVSEJoL0jTCFiMngOeMkwf0rKd8CmppDYG/Z7AQPlD2wFsaCv
 NtVUOyILEjPdkv+eqg3bmWSs7iJ8J2xpkSu9NgGUyvtJtpbcrOQHO4i4m1jykCBbdMHo
 TTBg==
X-Gm-Message-State: AOAM532u0GAtLQETVQfnuw4yedlt/UnKkKl+Fp21dBUCD+4+pPbolCQI
 a5WpuOPjE0/DBu6RFIrEjWRMag==
X-Google-Smtp-Source: ABdhPJwE3X8VUbGQrTS3mOAQvqfGbynUfG91vz0pErawkCRi9lJWWW6VAT9mlmtFuY1KsGyir1ucJg==
X-Received: by 2002:a05:6214:b27:: with SMTP id
 w7mr4277613qvj.34.1616073928127; 
 Thu, 18 Mar 2021 06:25:28 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i25sm1712984qka.38.2021.03.18.06.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 06:25:27 -0700 (PDT)
Subject: Re: [PATCH v1 5/5] target/riscv: Use RiscVException enum for CSR
 access
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1616002766.git.alistair.francis@wdc.com>
 <6834cb79431f394b05b06a26317799c9066ccd4f.1616002766.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20c52b91-3ddb-f384-3094-7efb344ca5ef@linaro.org>
Date: Thu, 18 Mar 2021 07:25:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <6834cb79431f394b05b06a26317799c9066ccd4f.1616002766.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 11:40 AM, Alistair Francis wrote:
>           result = riscv_csrrw_debug(env, n - 32, &val,
>                                      0, 0);
> -        if (result == 0) {
> +        if (result != RISCV_EXCP_NONE) {

This was intending == NONE.  I.e. no exception raised, let gdb proceed.


r~

