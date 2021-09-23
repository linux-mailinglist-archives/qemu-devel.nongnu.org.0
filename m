Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8023E4171C3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:25:04 +0200 (CEST)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkGF-0007lD-BZ
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsM-0006tD-4J
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:27 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:39665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsG-0002yO-88
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:21 -0400
Received: by mail-qk1-x731.google.com with SMTP id f130so27648607qke.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RQLP+dx9Yg3DXwd8zxerCI726Yo7uqFSQQieYV5Dxnw=;
 b=vCh1Z9Rj22PyDpkzisoJ0qFuLT4xdax2Rr33MwkqydfupzvwTBBOz3PWXGC/gfZp7r
 MyDj09n+lCD7NeV9yyP1nOiFWWW+SPbWlt/+WPFj0rJ7MckfD/wap6H73dHYl6dBj4x1
 Mhq0PcV5mQCC8Bew07ARNbtUBvRNtkTd7mWkQTxTXK0kLvl2kBXlXuesob6/0Y3dja7C
 HpnwLyIJPdgI5EW01HKAibpVVKyWxG7yQalT3/RWKQwEGxhKoRQ0C4R6kJot4qzcYU7T
 q1MFbsUSv3bVtJhKtUpCijXWiauKfCU9tBfypO/rbFWPcBuscdEg+FdADlxj91m0Mqx3
 bbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RQLP+dx9Yg3DXwd8zxerCI726Yo7uqFSQQieYV5Dxnw=;
 b=GwKq2rc3n5FtxBjgU1qhtWNniOnFV3z7vmhSA0GY2nxBLnxGMuT3Hv8Gb2JeJhPJyZ
 P4XZDTmKI3IU2prlIFj6wZpJp9RvgnTjH54t5DqKQUidd4CPW1KlYEkQo8ygYbbFdy70
 ThSfUMZ1WNAegAhhXUnBA8qo9C0/qgQN1Cm4eZmyCKdcdEooeMl4KEswzXT0tPnEH1wj
 TYayetyxNB19FYhXFX+zLFnH/nNsHNlOu2U9+QL5RDQy4Ew5HgBEbOT3vzg+SeiyEXd0
 zzx7+TgMvv1UBYls6RSIlvkNf4hnnuPcdSle8Eb2vSeF5kZW3SbbgDUhnapKOG+zByju
 joOQ==
X-Gm-Message-State: AOAM532GNcorLfSeofALFRD8GlmEycD2fDuRCSgoc5AxQvfyepmL8lp4
 X45ihUczG+aH0rXOnZWKK0koEw==
X-Google-Smtp-Source: ABdhPJyNRjQ4cwkKF1nx5No1rHfRdrSVPGcpzEqm/JkYEG5E4ur/InL0L5K6uL6Kh16hJ9FePwolYw==
X-Received: by 2002:a37:a193:: with SMTP id k141mr9749099qke.447.1632484813064; 
 Fri, 24 Sep 2021 05:00:13 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id k19sm367033qko.115.2021.09.24.05.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:12 -0700 (PDT)
Subject: Re: [PATCH 04/14] bsd-user: export get_errno and is_error from
 syscall.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aaa6ddac-8fda-239a-da25-22dd87df4e7d@linaro.org>
Date: Thu, 23 Sep 2021 10:58:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-5-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> Make get_errno and is_error global so files other than syscall.c can use
> them.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h    |  4 ++++
>   bsd-user/syscall.c | 10 +++++-----
>   2 files changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

