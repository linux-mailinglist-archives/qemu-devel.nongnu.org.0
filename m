Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38B7626739
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 06:52:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjQo-00065P-K0; Sat, 12 Nov 2022 00:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjQm-00065C-MA
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:51:52 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjQl-00062D-4H
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 00:51:52 -0500
Received: by mail-pj1-x1029.google.com with SMTP id l6so6137119pjj.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 21:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zyx2Y7UFHTqZ5ZNwS2MOdB+00oBk0ui1AeJ7YenU1xU=;
 b=B4X44trHHUsdpIAZesqWqwZu6+k0JmAyvc3rwn2fPCNGpSC+M++r4diqPDnOR3tmDK
 MOC6RQt5igMJMl1KgHheIFrU2jVFXdgPN6ZYWEiSIjAe+4O1jNHHvTzBuWyLF/yfULYy
 SkPwNzjF416VsA3Q1nDzmAmQ/DiYYYREVMWmrIlRoc2oL6lKNt+chp069Q1hwdmngnNj
 YW2YYifHSRGRCEmPkircESxKyzCsuO8z0ppd/4JvkzfFtbJxFd5/KxksBJ9TAf0uLZ9Q
 7kuhkAeuKohNIO7eIFI48bfFGoEDA741Lo1xZ1qoeL5LOBFZqOgdZ7LxcZdffy8+Nfzi
 2mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zyx2Y7UFHTqZ5ZNwS2MOdB+00oBk0ui1AeJ7YenU1xU=;
 b=vCANHmkoF2ONrBf62wzU/arYtBSO0nx2xg6p6jIuYw4rEZnJYg+HKzgxXmu8Lj9NxQ
 zB6tzMAvgoei0ZSgSoG01A2p6USpANOUxlhbs01UtCAOXlWkl1A3eeJgnpSX8pz6u8LA
 4jv/fIs2xYVcFqzGUupviJRIB10ratsgtDpuFpf5e0VjN8PUWaf7eAXnQDFS72SvrZWN
 ZJ+aD00zigEbL0boi+2f8B4kF67P/5Z6tOhhGXiOmwss78f6vbmya5YkPjk4yFUAjCJx
 Bhixj8rJrXv4kkVei5qWAJgEA3i+xdy5HnG+dYj01kJZZNdWSkaEF6hIVvK2m8hX/WvA
 80Hw==
X-Gm-Message-State: ANoB5pkTAQFM6OjbcEy2q9xjSsM3VvSZJ9SonxIXspjmEc7gLT62QHp9
 CC/b/1HwKZRab2APeXKHqiahJA==
X-Google-Smtp-Source: AA0mqf6728td7W5odT18nRyDWrbnvK8oARIIPyaBzYaIXXAH/6EyLaHMmEATyt/6pPq/zbFrCUOxaQ==
X-Received: by 2002:a17:902:c142:b0:188:55f5:972f with SMTP id
 2-20020a170902c14200b0018855f5972fmr5637133plj.148.1668232309564; 
 Fri, 11 Nov 2022 21:51:49 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a17090a7c0100b001f94d25bfabsm5678563pjf.28.2022.11.11.21.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 21:51:48 -0800 (PST)
Message-ID: <84aa1c9e-ee2f-5368-0b32-4e3a32a6bbeb@linaro.org>
Date: Sat, 12 Nov 2022 15:51:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 15/20] hw/i386: update vapic_write to use MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/12/22 04:25, Alex Bennée wrote:
> This allows us to drop the current_cpu hack and properly model an
> invalid access to the vapic.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/i386/kvmvapic.c | 19 +++++++++++--------
>   1 file changed, 11 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

