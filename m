Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3505D400F25
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:35:50 +0200 (CEST)
Received: from localhost ([::1]:58602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMpV7-0007Om-AS
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpTJ-0005PE-5v
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:33:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMpTF-0004N0-La
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:33:56 -0400
Received: by mail-wr1-x430.google.com with SMTP id d6so4585893wrc.11
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xz7vOOD8T5GnL+n+emE9wja2eN0wiWHqeKkmHGB3AWg=;
 b=u2qJC3yvALuLrAyT+roN3F5RFUlT4zF1l+khqEVuxIxGaH4x74yXjse2HMx76RqiWY
 1Pb978RmqgM+VM3ywMVgLvfYw6pQmlWtdPjz0e2mTx6EXsOiR41HlN88D/VKNGPmu65N
 UqWOPNfIyicHPPXYItIabb8NFokRBev+rC/K2gCiIJPoCcs+NN0YAaLKs1uNT2e9+DwJ
 v3BH+VtYvKGdUy8UgLHteV5b17KXH33sjvMZPWwLkNPkh6TbvH+pvSZH9AethP5Zze70
 lqA2Wke5vDWGet9fCaF/VtHREmhS23O8AuU/kqr80TAHIFHopWCv7MF25dw3m9vEPWDD
 ET8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xz7vOOD8T5GnL+n+emE9wja2eN0wiWHqeKkmHGB3AWg=;
 b=aBNcMzza4LDHtMVrC4/7vTuJOVyj3o7iQZl/OklzYxWHKuSWthGT64ukm8zqbDcQm8
 bGsUtv73w1yM5SVOZEyfLUUXglMDxBpMljb+QsXOmKSvSSruAyypQG1Tr8DZ1E0Xz9lN
 QPsFN0ZZxzXn5ghNsQGr/phbhL4OdqZx/mw4A1bqBREgi98Vz+tJ7EHZ4OaWC+i1uR7m
 Q2RgNB7BSYinKxO3h6h3sHjGFT6D/zkoKo6NCL2m5hsLsWs1oKXaSrMJL5gC/IhpaDQY
 YpwTU4wIZxDfA/cEM66FK4+rdmxxgU8A59nq9K1gi9+nhLTrCBRQFs8S5tBn+Trc00T6
 Idlw==
X-Gm-Message-State: AOAM533Z8EzDBlGGtjd4vbw3YJiadH7hePv0nwt6n3XATukL2sjc5GI6
 HGUGfwmmHHyjOCzfA0VcJgTDYA==
X-Google-Smtp-Source: ABdhPJwGllXBUAA5hIq51zpNFciCzIKecFPFRdvkjV2eyPb5EOG44dAlhaZZG9oOCPpXsOji5Hkciw==
X-Received: by 2002:a5d:4c4c:: with SMTP id n12mr7698227wrt.19.1630838032112; 
 Sun, 05 Sep 2021 03:33:52 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id c13sm4571462wru.73.2021.09.05.03.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:33:51 -0700 (PDT)
Subject: Re: [PATCH v3 32/43] bsd-user: Rewrite target system call definintion
 glue
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210902234729.76141-1-imp@bsdimp.com>
 <20210902234729.76141-33-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d46ae71-f66c-1a5c-d2b5-8d91eef05b6f@linaro.org>
Date: Sun, 5 Sep 2021 12:33:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902234729.76141-33-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 1:47 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Rewrite target definnitions to interface with the FreeBSD system calls.
> This covers basic types (time_t, iovec, umtx_time, timespec, timeval,
> rusage, rwusage) and basic defines (mmap, rusage). Also included are
> FreeBSD version-specific variations.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-mman.h     | 121 --------------------
>   bsd-user/mmap.c         |   2 -
>   bsd-user/syscall_defs.h | 247 ++++++++++++++++++++++++++--------------
>   3 files changed, 162 insertions(+), 208 deletions(-)
>   delete mode 100644 bsd-user/bsd-mman.h

I think I gave you an
Acked-by: Richard Henderson <richard.henderson@linaro.org>

