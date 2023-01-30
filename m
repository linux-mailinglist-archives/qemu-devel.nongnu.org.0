Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A5B681F99
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:25:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdW2-0008Aw-0P; Mon, 30 Jan 2023 18:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdW0-0008Ag-2y
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:24:44 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdVy-0007LC-IY
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:24:43 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so3827292wms.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xh9A/d09gdNLT8xr7xkrk1OKD8ghoaWN+D4GI03svio=;
 b=zglGYGc8DLwwVu6yODheBSifIWeaKiBMDNQUQZ5Z35fSgoE0Fk80S1BGHAqI1i+wu1
 Yy0I+1fr5IpMbXgbJxHxik32n0apSthHUOD2/Oa0nWKJJVnqipMVVjf50+9qFeyezkdS
 put29iwtU1VHi7Lb+RKRljBh0MNkYSWDaI8xIgML43S9xQySSnFUeDY/z4Aw9MXDyy4U
 qniNw7BHDLMOtXliebAPKMDdZor/AkYNEepp80DHX6iVkpk8cGU9FRNVPlSNsVu4d7ze
 S3c4HLCtiNqjV4PwZNtlBvz0UxcFl70FZFkRav+xkKe0NrHAYBS0NPpuuH6qIuqN2lL1
 UhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xh9A/d09gdNLT8xr7xkrk1OKD8ghoaWN+D4GI03svio=;
 b=a0aK3ym0EcMRmu0lybhRhOZFT4KJwiJV7dSi/HbcOt/L5BDGVwlsBMJKHmm3W5qooh
 UVragTu3yhe/9nEIwMGt343arfJ/nVxVIJrfEcWfmoSob9FOnSFd2QWICrvbq/ihoznw
 YPiDI5Bf0SRYRCl46aMVvi0CEiCdm7dsp/vIGwHeDkT7C8E2SWWa4mYdXZ/TrLihESuN
 gBzPvHbtiIQOs9Ew1we5bT2+/4UpcvtBrg3ViEPL+LJvVgZ5TtwTsn8O3fuLt9X/FmJ6
 2fbG0DFzWP0rwYmMMQF/DFAmc1KUVH4NjYLaayuAGxxC/M8zEGkfGG0ls/DV7DR/xlfR
 l3+g==
X-Gm-Message-State: AO0yUKUibDiCYt9jOBCVmJI9xKETPZrNXlZCBsi1SRk2h+r/wLd2xCXQ
 Aw/C8ySdWyIQRF/Bkg1AknLVjA==
X-Google-Smtp-Source: AK7set+82/RcHO6f0isvsz+zDN1aqtJXpzbidE/pp3UYaCZoI2ZTOOxItooCR2zM8uAnvjXHXHxOlg==
X-Received: by 2002:a05:600c:4f81:b0:3dc:557f:6128 with SMTP id
 n1-20020a05600c4f8100b003dc557f6128mr6875835wmq.3.1675121080906; 
 Mon, 30 Jan 2023 15:24:40 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c161500b003dc522dd25esm6589109wmn.30.2023.01.30.15.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:24:40 -0800 (PST)
Message-ID: <408e2293-dd23-c9d8-550f-ca800d991973@linaro.org>
Date: Tue, 31 Jan 2023 00:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 36/36] target/i386: Inline cmpxchg16b
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
 <20230130214844.1158612-37-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130214844.1158612-37-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 22:48, Richard Henderson wrote:
> Use tcg_gen_atomic_cmpxchg_i128 for the atomic case,
> and tcg_gen_qemu_ld/st_i128 otherwise.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> ---
>   target/i386/helper.h         |  4 ---
>   target/i386/tcg/mem_helper.c | 69 ------------------------------------
>   target/i386/tcg/translate.c  | 44 ++++++++++++++++++++---
>   3 files changed, 39 insertions(+), 78 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


