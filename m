Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8AA67FBDC
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 00:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLuuc-0007CW-2S; Sat, 28 Jan 2023 18:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuua-0007C6-2E
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:47:08 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuuX-0006V9-VU
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:47:07 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso12136096pjg.2
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 15:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6+Wrk14JSwyKsbd9CXQY19oj5ZRI6MlGhTpLd4fjDzw=;
 b=hAuYyt3ErPo3GeKmw9DFziWJXnruFTBrcbowEw866ILtVNqXN6fUA7ZevqrpvNUvrU
 at6Bwuj3xGQYr2dULUmqWOAZCDmQzWo00d7YLW/em5rfAtsKLcF8QwzSJOWchxRRjKa7
 sE7leryF0g+M4piyH+pymTNfhc7WM1lzb411E44Ltcv3ZcD71SXbG3jHiC2xNxa2++Wf
 jTFHnDwakGLuDJ4iwMFCkpPOTEkBRQ8nqSoQnXXqwBHnhWi5mn7Atw/vcRrj/KBDjK8S
 00cwQ+Pbao5tldki9ABm7x2XBSMZ5MewKxkUsuXbNuQbnm4enRcgn7IacSQBnTZQoHBW
 5i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6+Wrk14JSwyKsbd9CXQY19oj5ZRI6MlGhTpLd4fjDzw=;
 b=fAgMIEs8cUbY1vsaoHihEgM+eqeo6Q3FWosWYPckBeLDmCSJzb8Ak8lof4vKSoQiYb
 KrMGrm1R/FwOElMH9lzwHmYL6Lzu0jKqaWeK8ZoCBEWzwbEwz5chWkEvZNNFIiPQxYHw
 zm1Zwq5EnC3oX2Qo2Obdzd36kTp1XjKtNebasXXPyF/TGP2F+MxE3QVbuH/VEWYSIhPD
 wutKfi9XRmnsA/qlLzY2bam/kiSZ3Y1E1OIzO/B9r4v+2FQ5F4K64dy5KFdWqCqR7VR6
 O+eEs1KPUOrWdM4agrlGhQQx2xn/inZW6iWEsZMEfKcs6FpezISsCotkJU346rI+D6QI
 e44w==
X-Gm-Message-State: AO0yUKW3dz6YO3al6UpVGq/FiSdL1PcGP+XwEren+rbCCA0eDILzvYn6
 FgknxWUaUKV7hXlDuR3zAVAwpEAk3lP/b07i
X-Google-Smtp-Source: AK7set9GsaLbPzwLzpHbV5sUTpsEZRppFOduxYxTEJ9XfRdM7b/1vu+ryIqIwmIU2PldfL/BLV83qA==
X-Received: by 2002:a17:90b:1b03:b0:22b:f214:a919 with SMTP id
 nu3-20020a17090b1b0300b0022bf214a919mr18856794pjb.49.1674949624549; 
 Sat, 28 Jan 2023 15:47:04 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 lj7-20020a17090b344700b0022bb87344a8sm7221691pjb.55.2023.01.28.15.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:47:03 -0800 (PST)
Message-ID: <660cb057-2ec7-e4a9-30ca-7ad71fe966e4@linaro.org>
Date: Sat, 28 Jan 2023 13:47:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 16/23] target/arm: Mark up sysregs for HFGITR bits 0..11
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 1/27/23 07:55, Peter Maydell wrote:
> Mark up the sysreg definitions for the system instructions
> trapped by HFGITR bits 0..11. These bits cover various
> cache maintenance operations.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 14 ++++++++++++++
>   target/arm/helper.c | 28 ++++++++++++++++++++++++++++
>   2 files changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

