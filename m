Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6BF256ADA
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 02:07:22 +0200 (CEST)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCAsT-0002Zh-7n
	for lists+qemu-devel@lfdr.de; Sat, 29 Aug 2020 20:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCArW-000287-8L
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 20:06:22 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:44410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCArU-0005Ti-NG
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 20:06:21 -0400
Received: by mail-pl1-x62f.google.com with SMTP id q3so1333429pls.11
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 17:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dpfJKRIhgHlnrQeOHTpYPgMOQF4/62+aU0gKL8wLSgY=;
 b=n43cpHeWjzzZYtQJoLxHOzfMDskQ7EQUo2gj9Hv8WxJHECU6PtyOvMa1UPIIwBTnPb
 rRIqt0PV+ZL/4VbNyLHFNJQQ9bA8pGtHXOTuh9KqalzC7Jivnvaqo58hYwqS0H7UwyH+
 tRI4rFp/edsUwlmLOdHbVxvWUHPHQa1Mnd+KNGGou8myci/01g94X6OkNgrnn7x2sInG
 CbBJYrH7FXpKs4hhKBQ/ywdq65vOXqFdDstHfYqC4Qb/+0dUiISCVpwIWxOyq/zcsmXz
 9q+XMkB2Axpg/pgA20YVDqECu4UMaN34c1L3q0Q4NJkwgbOjo5lYqw5or0OwfOeQLZ3q
 XcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dpfJKRIhgHlnrQeOHTpYPgMOQF4/62+aU0gKL8wLSgY=;
 b=WRitgwHO7vudtzB525lz4OBJRidlJdHG2xzBssldDj6InzzuoO9wXveibABrESO4AG
 rJHliAzzWW1d31RSsk6JqmPr5R9pWSI684xtgLLQiwk1AzYqOZlXvRnwGf6eVmVH5rHg
 10PFHXeww3YuGh5AA0/N6ZRbgqR9VQsLjCoHDG8jCNZ1ymnRNV/vCvED2uPh1fYT0q1o
 7qypOa9vnYDVLo6on2W0fCv/Ru5d2vEDc3Qay/1WevIXzSxqXLFZjM08FgSIqO/WpJeR
 Rs8ZTRXHtWavf5SsEDdmxX1QeN3I295fLmWegwtgx/X0xyf/lc3lwzdYaq0aAz1w+p48
 H6Rw==
X-Gm-Message-State: AOAM531D8KE582kpKtl8CjsmWpzP8EkmzykJ2yPve8/R3/44ptgKbQF5
 dUgrgmWrkDyEKMMg1Xqrk8uF6g==
X-Google-Smtp-Source: ABdhPJxg8SKh5WfeYqLL3yIJK17gltbP54KQbFIGz+FxzP/NYIwdmCt3ribBLBi9v6Qosvc7yM+G5g==
X-Received: by 2002:a17:902:b789:: with SMTP id
 e9mr2058957pls.146.1598745979316; 
 Sat, 29 Aug 2020 17:06:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id y7sm3298507pgk.73.2020.08.29.17.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 17:06:18 -0700 (PDT)
Subject: Re: [RFC v4 63/70] target/riscv: rvv-1.0: floating-point/integer
 type-convert instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-64-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91e9dc92-3eda-380d-c101-7f72fe536942@linaro.org>
Date: Sat, 29 Aug 2020 17:06:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-64-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> +DEF_HELPER_5(vfcvt_rtz_xu_f_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_xu_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_xu_f_v_d, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_x_f_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_x_f_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vfcvt_rtz_x_f_v_d, void, ptr, ptr, ptr, env, i32)

You do not need any of these new helpers, because...

> +GEN_OPFV_TRANS(vfcvt_rtz_xu_f_v, opfv_check, FRM_RTZ)
> +GEN_OPFV_TRANS(vfcvt_rtz_x_f_v, opfv_check, FRM_RTZ)

You get to set round-to-zero mode here.  Of course, the macro used will need to
change...


r~

