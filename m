Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844FE3902A4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:39:24 +0200 (CEST)
Received: from localhost ([::1]:49036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXHH-0004pG-CP
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXGI-00048g-Rl
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:38:22 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llXGH-0001Ne-4N
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:38:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso12560835pjq.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4aMFf9Sp7Ts3gJ6elOMKj2duk7ow+8J1Ud/tJThb2nM=;
 b=sPWcEJlvbgngCzhHrJGHVmqGCi2ouNPNM2S/2lSjah8AbwATItRFayQ9H7CNwMAvsn
 CAN7gA+ys3rbAUaXuEx0rwDrXLr4GCpmw9izsnUmb8PU5LFVVzhNRPK67IroeMXZJpJI
 VaUIsTwPQj2orGcILSvrL38n/RHcqiYYKvYyhxoEro6cs14FtG2YW4p82Jy/ko25Hrpk
 IOXpCw8undtL2z4Zoqquf0DCvDSIkPh+qffIgw/tnFlJkVLjnFJ2+r/1Z5+KIFI1cpdZ
 2NYCnUvGWVDMo5f83CtBp5LqGfjVXNP0aauCU+P7q4ElV3oFnG5nUiQzSJ4M/YrJuqr7
 xn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4aMFf9Sp7Ts3gJ6elOMKj2duk7ow+8J1Ud/tJThb2nM=;
 b=Vu0qgaxPL9cAdKTTsKqJf6g8IJjRzZLN5ckfDAqeX9bNXaJPMG9ZpVVn399QlUygky
 nEVjOKBYGhXL67hDxChey8yDNSMLyPvL3DKaavjqwwjswvV1hXqZnLn8Bw+NbhGVCbXu
 XYDyeLAOysPM+HoFXs8653A2y8eHAXlEp6HIrCGVFIvsRfLqmKJvoL06+hSb+NaIfIKV
 6twZeMp4BH6J0JujawHItFpAxbMOBQ77bnmMxB5UR/aiHtKvf8OEZkStpNAegwmF4Riy
 3EVcOM2JwZlP5+v7XLCnQHHukqhqQPi/64i1JxumFeTwFimeo/rQrPk8LQ6OVCAFWWPF
 PuhQ==
X-Gm-Message-State: AOAM532ZHFR2E60zuU54oz7LH2P18o/IErBjSAH4G3J5jGMScIV9J5k0
 JEQy5N3v6R+D0JzVxQqE5etYTQ==
X-Google-Smtp-Source: ABdhPJwCLH0SVH8wAqx7nktPw9+3ZAdGul6/Y9jHgTDOoKlNHxNc5cVqubsSuhAtcKnEMI1AYC/l4A==
X-Received: by 2002:a17:90b:3615:: with SMTP id
 ml21mr31352420pjb.194.1621949899628; 
 Tue, 25 May 2021 06:38:19 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q24sm14250684pgk.32.2021.05.25.06.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 06:38:19 -0700 (PDT)
Subject: Re: [PATCH 3/9] accel/tlb: Rename TLBFlushPageBitsByMMUIdxData ->
 TLBFlushRangeData
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210509151618.2331764-1-f4bug@amsat.org>
 <20210509151618.2331764-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <25e2dba9-a89d-6651-49e3-59d3c56969c4@linaro.org>
Date: Tue, 25 May 2021 06:38:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210509151618.2331764-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/21 8:16 AM, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson<richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> Message-Id:<20210508201640.1045808-1-richard.henderson@linaro.org>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   accel/tcg/cputlb.c | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Rename the structure to match the rename of tlb_flush_range_locked.


r~

