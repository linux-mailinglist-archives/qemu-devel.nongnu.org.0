Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BB33E3874
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:36:44 +0200 (CEST)
Received: from localhost ([::1]:38750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCaYF-0006tx-VS
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaX0-0006DV-Ke
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:35:28 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaWw-0000ik-TN
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:35:26 -0400
Received: by mail-pl1-x62a.google.com with SMTP id u2so12777902plg.10
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YrMUkTonQOJ9w+Ig9PKj7ophmnLSAr2uhxc4fWC7KuU=;
 b=OS1gFM4GkzIKZ5sUhKBvV7d4O8t0INog8fyC5YbhRVfguFCOFL8eKneXeWv1z4nMH8
 b4chezW1Q7jgm867EPJbPxIoZ0jsAlo+KN2hV+/LdKCJHukHIjh7szpZmrev6MRy81z3
 eg4ilw4oK6UkQc8BkeuMgT4WVVQimuaMx9ZqtlJILBxvj3IxSOCwAu6S6pL3l8/H+VRG
 cB6+ugwKDQTujbcYrMX5prnFQzcs0pfN4/zZHFpuCQ+gYR3qORuBSV5YaWdxrMTsodWw
 /ZitprHehywKsi68S/lWZniA9mn1nCa2SKiRIyeTUXVS/7NzOz2wR2TRZcFJzveYMQ7G
 z0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YrMUkTonQOJ9w+Ig9PKj7ophmnLSAr2uhxc4fWC7KuU=;
 b=iCc9SeKNrfWyGYG+l2oWukBBSmwd/WrsE2OElLCw6B360E7edfYKVdMP29c8swIkS7
 rTwtXNsb8trRS9XGkZSK9vBpPEoDWr70NtL8Kicu39ucmRk57p0uxfSUeHfWhuyGk+Un
 9AedlO1r2p+2T78m3NXIU8LrZ8aiaq1ks/GH4StOkxHjLG0ueNHONR5FYeu5SZ98/b6h
 Jq+g35PnuODFnu6AKYUR8wJDPURqK4FVhMGjn4vPm7nfJImEmV1hdMT/blnAUjO+wPys
 trTn9h6vhPVVJfsBn80y4AEq3JHufUZGEohTtz61V+D3hfyLZY18SL+1Ai26Lz/WC/hD
 9hGg==
X-Gm-Message-State: AOAM5301rRTWmpPuTMYKgvRVcRfzGkqnWMAESEiJ4LGOKheFC8cN5yQn
 6zOYCrO6Apj+GKNgxhbMH85wrA==
X-Google-Smtp-Source: ABdhPJxRvdGaY9IH3QqA2rURVwu+qYJHtVPuCbwyY1cgJZysYr+qB7B61fde4+566LSUIJq++jusBQ==
X-Received: by 2002:a63:d14c:: with SMTP id c12mr160839pgj.412.1628397321359; 
 Sat, 07 Aug 2021 21:35:21 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id x2sm13593972pjq.35.2021.08.07.21.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:35:21 -0700 (PDT)
Subject: Re: [PATCH for 6.2 05/49] bsd-user: move arch specific defines out of
 elfload.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-6-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <35186641-ce39-5d1e-aa5d-51d820bfe71a@linaro.org>
Date: Sat, 7 Aug 2021 18:35:18 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-6-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:41 AM, Warner Losh wrote:
> Move the arcitecture specific defines to target_arch_elf.h and delete them from
> elfload.c. unifdef as appropriate for i386 vs x86_64 versions.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c                | 81 +------------------------------
>   bsd-user/i386/target_arch_elf.h   | 54 +++++++++++++++++++++
>   bsd-user/x86_64/target_arch_elf.h | 41 ++++++++++++++++
>   3 files changed, 97 insertions(+), 79 deletions(-)
>   create mode 100644 bsd-user/i386/target_arch_elf.h
>   create mode 100644 bsd-user/x86_64/target_arch_elf.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

