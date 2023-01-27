Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8167F18B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 23:56:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLXe7-0006l7-Ma; Fri, 27 Jan 2023 17:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXe6-0006ky-2W
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:56:34 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLXe4-0002qt-JM
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 17:56:33 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso9286726pju.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 14:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CEOenwZxVrXxm7/FYTDEgmA4i9BQEeNIcG8DBCYxXx4=;
 b=dfMsNGnhBXzZghLDQQk0a4kLj3ZXwMMW0rR52JGjuI7IqsbsSH4oXRJj3r3JEcSZxL
 3QjCtFSZKk92PfoXh/UBXIcE6eF4ABmoynnA/mAh12KJ3cDETZJTngr71ZD3HUrQfkQM
 5fvnRnj3nf4iijFenVxa/7A5G3QdmzKgQQJEtYFhy/aDWyz0/2VJ0a+OT7yQ3kNP6TQR
 9aWjYM+bGx3DHQ7vXs2Oj+sTUBQjv2PadKyW2tSrLB4xneoD3fUwlLg+h9/1J9Clz2zZ
 0xcm7cWv2VMxJLR9Dx+IXjWlb5cI3jsK6Zl+LQvuCM2oKtDnbNjSkfRec5uVfV+A2ANK
 dslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CEOenwZxVrXxm7/FYTDEgmA4i9BQEeNIcG8DBCYxXx4=;
 b=mh2eoobK/SbMT2OmdcqkXu2LsLPB8MNpgBAZMiDIsa7A+Xoixydzl5Qw6C6LERJjmF
 mJ3Iy1pi/pHDhuONx+SO1FbvXjqR3yXbjoj9ddEuKwdoUh5MfQdqhOfdbaAvFAK8afA1
 4sjXLCRbonPsqbXYASjaYCBkSD0nSCSEKUqj0wsK7p5ikiRyZrdF4iAm1VNmAzC6B382
 wqP2mRXEMeFLpMWzqOeSRvmhu8DHCpmu6dEjBYQP1e9E3VxYTvQ/wb+tgfJJICQddUbd
 us0CFCMDFimZL1QwyK4Cd8I6SyjMMqrnrelqQR49eWNwB34WyX5KLL4hsN1QO85LYeUw
 AGRw==
X-Gm-Message-State: AFqh2kqDhX0OlJ7jr674h4XYR3i+xXJLMrWwT9FVZwH9A3wGB3+aZtSR
 hwnq6kGuvRhVuzbJbu50OVJxhg==
X-Google-Smtp-Source: AMrXdXsTCFoY8UQ6Cr53X8xDunCBN7wMcj5zn4008m+2GlA3wZijwxCvZbLTPHAU8yWOf+wiQS36dQ==
X-Received: by 2002:a17:902:d2cb:b0:194:8292:b1a1 with SMTP id
 n11-20020a170902d2cb00b001948292b1a1mr54148889plc.66.1674860191093; 
 Fri, 27 Jan 2023 14:56:31 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 z1-20020a170903018100b001932a9e4f2csm3337750plg.255.2023.01.27.14.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 14:56:30 -0800 (PST)
Message-ID: <dfa8e038-a1ad-6f6c-4920-26b33f080e46@linaro.org>
Date: Fri, 27 Jan 2023 12:56:27 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] linux-user: Improve strace output of pread64() and
 pwrite64()
Content-Language: en-US
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <Y9Q7BlDc/VX+1SBL@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y9Q7BlDc/VX+1SBL@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 10:58, Helge Deller wrote:
> Make the strace look nicer for those two syscalls.
> 
> Signed-off-by: Helge Deller<deller@gmx.de>
> ---
> v2: Use regpairs_aligned() and target_offset64(), noticed by Laurent Vivier

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

