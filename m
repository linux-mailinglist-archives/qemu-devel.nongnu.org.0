Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCEE3E386F
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:29:49 +0200 (CEST)
Received: from localhost ([::1]:57694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCaRY-0000U5-Dg
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaQp-0008FB-I8
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:29:03 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:36438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaQn-0003px-K4
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:29:02 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so29030123pjr.1
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ed240GZDvuyxAAbe8MiPyru0j1fWLPo+KuoOPQFrVzw=;
 b=xj7CGE9mwhMctf11hCfXLsXdrx/bz5g9EqLxWIvkb8+ExJJ+R2/AqkCW08BL2y2zWm
 dbl/txLOVwEPBjb4YIse8XFQZCqzJP6DVxXRRG/sEYhHLT3aI+ITYv4Cz3n3s32WXpo6
 vU8vB+A7tcYIM6wuKEr5VX4mhuxeu5Z4RQ3yNZy/O/Vv/BUPR0Aq7hMp6NySd/B9VmRm
 fWj17m3CR0wAAVTnkzEMJDdjmJuhrbQ5dfzhux2G7VG+xUvTrXLKmq4Ztmty34E6LPYV
 j0qSW+5ypdA2atdLQTZdVNbHIkdc1vu6pD2qyTrSqYrDd9KM/iUmG/wHwSSgtURfYbe8
 fGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ed240GZDvuyxAAbe8MiPyru0j1fWLPo+KuoOPQFrVzw=;
 b=O5xXANN8UwcsnMvI3mih3WwoI+XTfRZaTwMcTcW0T3D9TutSVRe5iBFrJudFWjAMGW
 osooxg+D3q9vbwe0rDz1CSSMX+6Zftgrkao7DMJTXLbSAfv+lDAIekKzA9tRZ+If9MXE
 8yTrgoP/LzkeGk6bGOQ/XVwAkLJFuOQB/sifzM2iUtjpsMwHC3WGdSMTSwfoJQCwjMlH
 7Rbo4zCv3OVx2aLJifB1PJBu0AbFO96IXMBhNyfIwO32LsZ+uwosW9DtUrC0Q39PT9dx
 FvGk5H6rlzlHnYGShb4+R5UGF4WSE/LMrdersQk6H8s/rhTKyd+9iHCqp29W6ETuAu+Z
 +Myg==
X-Gm-Message-State: AOAM533NopMt/epqaCx+eo01OCmR56s+PUPGXQ6cGWbPZQ33TBIYm1TS
 xZhDSK8zISKKVNzxqDkF3u3VuQ==
X-Google-Smtp-Source: ABdhPJz+dOFcXgEty9N+gyV65UQ0rP3YvlR4kWUgZ5QyCgf71Xjc0fyfGnJ2oN9sJJ5DHtk+qsthZA==
X-Received: by 2002:a17:90a:19db:: with SMTP id
 27mr17667416pjj.25.1628396938945; 
 Sat, 07 Aug 2021 21:28:58 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id r17sm19340508pgu.8.2021.08.07.21.28.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:28:58 -0700 (PDT)
Subject: Re: [PATCH for 6.2 01/49] bsd-user: remove sparc and sparc64
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bf221b90-537c-186f-fb61-fc5e1738647c@linaro.org>
Date: Sat, 7 Aug 2021 18:28:54 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:41 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> These are broken here and in the bsd-user fork. They won't be fixed as
> FreeBSD has dropped support for sparc. If people wish to support this in
> other BSDs, you're better off starting over than starting from these
> files.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c                        | 290 -------------------------
>   bsd-user/sparc/target_arch_sysarch.h   |  52 -----
>   bsd-user/sparc/target_syscall.h        |  36 ---
>   bsd-user/sparc64/target_arch_sysarch.h |  52 -----
>   bsd-user/sparc64/target_syscall.h      |  37 ----
>   bsd-user/syscall.c                     |  11 -
>   6 files changed, 478 deletions(-)
>   delete mode 100644 bsd-user/sparc/target_arch_sysarch.h
>   delete mode 100644 bsd-user/sparc/target_syscall.h
>   delete mode 100644 bsd-user/sparc64/target_arch_sysarch.h
>   delete mode 100644 bsd-user/sparc64/target_syscall.h
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

