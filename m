Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B4B3B76FB
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:13:32 +0200 (CEST)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHIh-0004x2-Cq
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyHHf-0004FN-CF
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:12:27 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyHHd-0008Tp-FQ
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:12:26 -0400
Received: by mail-pg1-x52e.google.com with SMTP id u14so12644308pga.11
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jBXbEMRHI+13dcXfEmpNjsZPYOwF79aQSZTJwMI84Fg=;
 b=EGXkNSNCVonppcuDGrdtoA6D4Ia708yaKGZ2i/H7hIq8gsSSn3ucqPz/2yxfBnw0ni
 oJEAgHR/kWGrkzgusbuuRVRK0uVr2cXlmEYDxu1Etgy6EWH00eCDJeCZBPTUUr04p07b
 O9dLmgPCuvWgP/e2lh7c//JADOHqr93F9pzFwQcs4A9L1WKm7TLe9mQf2g8tGlLggS0x
 e64Au2MsWlY8BQNDUMDKYJB4tF8mSTVXbZQd47zvwvxwMpeSQiNK9ecKwlju0UTHBgyC
 BT39UASkVdcM+tvEWnQgpSODMIiz/B0lSGaLFmKXe+5KL1ZNpU7sCmsUKhhw8MX2tNvP
 7unQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jBXbEMRHI+13dcXfEmpNjsZPYOwF79aQSZTJwMI84Fg=;
 b=iCqA5OYTY/zfqnGYjuf3i6IDJdemAj3OdnIgu9ByhuAK4PP0IpjqMSZy5iPiDCcTcW
 IlcWPpApdhoSc74f+TbV6er9Rf6s+2Lpk/Uv4MB/mvno7jfBfXkvs/edEXppNaY7/Z30
 si+N3w67bTjfsa1m7B7XTDOC+fMRV0z28Ej02xq45hpJ8zoja7mgC4Qzv/Twz91UEH0K
 KBKazpCN4OOMUbuwGcC2UwXGaT8WS4KG7/b6LRM5zZec0XxP0+GkGkaGs523qCBFo6r3
 g8XcHefrifqD42h57WfVZSbGtoGK3hUeRRXUKseRQWn8wgjVDBgRXyVKwnHc3Bv4WaYt
 HVSw==
X-Gm-Message-State: AOAM531okS3sdr5uHknplVZU8Bpr7c0m/jhlqa9PROlO9bE5tYBZBOhe
 WFNn0Zjz5uFAmNh8iDLElpxCEQ==
X-Google-Smtp-Source: ABdhPJwdP4ctWr8YcJI1cXLwG7MHoradCVk3X2PXK/WaEBPA0iO5BhahS/qHo0/BeHIgXgueBMHwUg==
X-Received: by 2002:aa7:8b56:0:b029:2b9:77be:d305 with SMTP id
 i22-20020aa78b560000b02902b977bed305mr31262564pfd.61.1624986743901; 
 Tue, 29 Jun 2021 10:12:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm7388566pfi.179.2021.06.29.10.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 10:12:23 -0700 (PDT)
Subject: Re: [PATCH v3 0/9] target/nios2: Convert to TranslatorOps
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210628220810.2919600-1-richard.henderson@linaro.org>
Message-ID: <03eec66c-f461-34fc-58c2-38484c5b852c@linaro.org>
Date: Tue, 29 Jun 2021 10:12:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628220810.2919600-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/21 3:08 PM, Richard Henderson wrote:
> I've reached a point where *all* targets must use the translator loop.
> Do that, plus some other obvious cleanups.
> 
> Changes for v3:
>    * Improve the commentary on patch 4 (pmm).
>    * Inline handle_instruction.
>    * Use pc_next for pc+4 (pmm).
> 
> Changes for v2:
>    * Fix (drop) singlestep check for max_insns.
>      We already do that generically.

Now fully reviewed.  Queuing to tcg-next.


r~

