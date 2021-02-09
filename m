Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F24315845
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 22:07:18 +0100 (CET)
Received: from localhost ([::1]:57408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9aE9-0004GR-FN
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 16:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9aCZ-0003Ul-64
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:05:39 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9aCK-0000Uj-6l
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:05:38 -0500
Received: by mail-pj1-x102b.google.com with SMTP id e9so2427091pjj.0
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 13:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m4MVECtyD1G9fBTHfBhMWUyVB/Vf5dOs7nXts1oGTr0=;
 b=iej/xAohBshcH8kvbLMzTfbBh76VH6+0Zo7HZHQ/lR8KepuhvvPgHxiNTdd87MhlNh
 TqwZypbptOojp7OT5/YTHl2TGaAvEn7nUvg4fS6T3cRmY2Ft/BP2UREY4JEWtvHnvsgg
 alY9XYHEIGkiBlfdAwR9RSZ2y+9Ur+8eKvHirYNVxnsoYultw+BGYV5ReZHiLqTAcpd2
 mNOHVMhh0utiiGtxi5lGk3NFfwm9JfAzJdv7G8GlwSkfoXgEK74PFcFuEr1YXHlOi0f7
 /xJ4XvRTqvZNbXTUhi+PSxnc4P0cdegDwed6cC3ywBoVqZOeBQCQPI3gesUBrj0PhXo6
 7F4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m4MVECtyD1G9fBTHfBhMWUyVB/Vf5dOs7nXts1oGTr0=;
 b=ULhYBOGNPjvt/qo0H8uJKCzfQcuxmzKO/PTF9vvf6JPKmlD0WltqRLPOBS9igZO29R
 XcS4e/kn5kl7JXR6kDWeB5w9Vj96nLz02CNBAem1ZHn3x5R6DSK+YUAvRsPrSZBvJFIG
 HcHfno7sHmKbzPHRTBVZjnneiwYIo9EjDA+99HZHYsLQinbxJWJQSw6uRhMkJH4S4qI5
 EFbc2By5g/CEVhMzk2hCfFinTF/J7w6+44IW4XLlk+vSkidxo9tA6iFlgHI9Fnemvn9V
 0L1m5jDH2y/JkdqW9eEk3sSH2X9wbS4n0gLgbZOaCrxv0LNF6qNoojdf5ijFSWX9KdJj
 UD6w==
X-Gm-Message-State: AOAM532ElCRxoELLw6nMAlGieiO7Tn5KVzargi7kO2WnXmvzZYi7uOgC
 uU5czaoFBghfyBKfme4xzXUBrQ==
X-Google-Smtp-Source: ABdhPJyLN35RbRALdDVmfC7nGkCG3Yy7+kN5GDyopxAPBXy4m4wq0njc4UyNY6i1tcE6zdcn2yGMag==
X-Received: by 2002:a17:90a:ca8d:: with SMTP id
 y13mr5889652pjt.76.1612904720770; 
 Tue, 09 Feb 2021 13:05:20 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 x64sm72153pfc.46.2021.02.09.13.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 13:05:20 -0800 (PST)
Subject: Re: [PATCH v1 11/12] accel/tcg: allow plugin instrumentation to be
 disable via cflags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210209182749.31323-1-alex.bennee@linaro.org>
 <20210209182749.31323-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c6bc458-b426-1a35-db78-53796981cf99@linaro.org>
Date: Tue, 9 Feb 2021 13:05:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210209182749.31323-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: kuhn.chenqun@huawei.com, aaron@os.amperecomputing.com, cota@braap.org,
 robhenry@microsoft.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 10:27 AM, Alex Bennée wrote:
> When icount is enabled and we recompile an MMIO access we end up
> double counting the instruction execution. To avoid this we introduce
> the CF_NOINSTR cflag which disables instrumentation for the next TB.
> As this is part of the hashed compile flags we will only execute the
> generated TB while coming out of a cpu_io_recompile.
> 
> While we are at it delete the old TODO. We might as well keep the
> translation handy as it's likely you will repeatedly hit it on each
> MMIO access.
> 
> Reported-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/exec-all.h   |  3 ++-
>  accel/tcg/translate-all.c | 17 ++++++++---------
>  accel/tcg/translator.c    |  2 +-
>  3 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

