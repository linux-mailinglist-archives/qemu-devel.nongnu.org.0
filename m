Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E99410CEE
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:40:53 +0200 (CEST)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1kC-0007Za-33
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS1f0-0002YW-7u
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:35:35 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS1ex-00040B-12
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:35:28 -0400
Received: by mail-pg1-x533.google.com with SMTP id f129so15149779pgc.1
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gFcvJV+CCOCuvjQxV4NmRAX9kLZaEbAumyBb3jdQMd8=;
 b=TMDDMCi3j9QoMfLmQANKONLOSRuOGOvpKaUfWr8GB7ZPhD43eB6GnaUkX31YUSHHl+
 SHAWKqLgZ/JmZIwxhoB+ynPZVcHLdbGr7Nc9vcYwRUpyTwHxIPFE5VBm/tQO2z8o3VVM
 uXwmtcUoWgiq3d8H9j4UhCwdBDFySeu7V7tF/2Rw2KYSAkdP39o7SNq1ZzqlHp45xza0
 HPUIn00FZmcchCRF/nJ79cBDoU6JHIjP2rr1qFyR81CAxXrXC2X+yvQrsQ9Pp5n+JY5r
 gVH5cbUXXifNAF6XqLJwFdGbZ68VVvr43re5WuOkURQQd7bp+nB2qENCMF5D6Xgx0U9u
 jiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gFcvJV+CCOCuvjQxV4NmRAX9kLZaEbAumyBb3jdQMd8=;
 b=ejPST/fGSwCv7HcoSmWnZ/DYlEGV9wVaE1QKNZ3Mhc4CYvhz+/j0J5GLDjESTaprUI
 GYnUjGrKDZ/WLsprYQV0Zh0p76FDYLYy1eZ4X3Ss7hl1Eh2YPS7wNMsy/FMwS5PdA7Kh
 jcB/jbj43WaA48U1ZXDuC5z3jM52QyEC8eQkL7C94nSuMZ5pC9eM31zWsJvNnaimnova
 8IDGmi3q9PjehWa4sCMenxySheNDFfjWIBehCDnWpJIkDpZITH1IF5vMzyh+ZCzQaLbx
 AeMtOA57eP0pyn6ehGsAOxT+mAz38fMKgm6unJw6sDnNxUY5cW9OPS5EmC1iylEMGGux
 +PmA==
X-Gm-Message-State: AOAM530Xa7VvlzDXS4pslsSY8bWSjHY6I9Dr1vXMvzWcSac++QmwSMV9
 qNfu5aaILOTyzYyRAo7VCY5hyw==
X-Google-Smtp-Source: ABdhPJxOkmZPHLtQuh/hg51c1QLIgwSd+zizftyaZK/sF5i4yAz0vQ7b8rfmov4PfrbwbF5RiBiPrg==
X-Received: by 2002:aa7:954e:0:b0:438:a1c2:340d with SMTP id
 w14-20020aa7954e000000b00438a1c2340dmr21787521pfq.30.1632076525400; 
 Sun, 19 Sep 2021 11:35:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b13sm16034406pjk.35.2021.09.19.11.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:35:25 -0700 (PDT)
Subject: Re: [PATCH v2 20/41] linux-user: Add raise_sigsegv
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-21-richard.henderson@linaro.org>
Message-ID: <425a941d-5f7f-e875-dc62-24d8973c4a23@linaro.org>
Date: Sun, 19 Sep 2021 11:35:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210918184527.408540-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/18/21 11:45 AM, Richard Henderson wrote:
> +/**
> + * raise_sigsegv:
> + * @cpu: the cpu context
> + * @addr: the guest address of the fault
> + * @access_type: access was read/write/execute
> + * @maperr: true for invalid page, false for permission fault
> + * @ra: host pc for unwinding
> + *
> + * Use the TCGCPUOps hook to record cpu state, do guest operating system
> + * specific things to raise SIGSEGV, and jump to the main cpu loop.
> + */
> +void QEMU_NORETURN raise_sigsegv(CPUState *cpu, target_ulong addr,
> +                                 MMUAccessType access_type,
> +                                 bool maperr, uintptr_t ra);

FYI, something to bikeshed here is the name of the function.  Should it in fact be 
cpu_loop_exit_raise_sigsegv?

Because it can't be used outside of the running cpu context.  (E.g. there are a couple of 
instances where it's tempting to use this from within cpu_loop itself, processing 
pseudo-syscalls.)


r~

