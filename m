Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F33A6E0EF9
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 15:39:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmxA9-00021X-O2; Thu, 13 Apr 2023 09:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmx9q-00020n-Gh
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:38:38 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pmx9o-0008K5-T2
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:38:38 -0400
Received: by mail-wr1-x433.google.com with SMTP id s12so5819540wrb.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 06:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681393115; x=1683985115;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NMSEZSkz62vEXgNmEQbs+OXZbji/sgdWxxDakkbGz1U=;
 b=HVrBazlJ8I5kWQcZMZnH9597vOHwD72TJq3XjZ/X13dyRYd4nmsQUimtE+mLfZdo4b
 7jc6szaYJUysYoI7Z51l3G7wOJTS5ROSoYkgXph4Ve2/W4QS05T4a4L6/xlTQAWMgSxC
 a/wU0tuXy2Wj6DrAeQ81y8I8XLTOq2DG5HnNBeFCyzI+Kg6NWcISB8mfUAd4XT/tPBlX
 yle3jM5+3FdZrXuNmMqSP8ln52trzCr29PL3Xjosdpc0XYkUL8vr7ERtxHYP/UaVCbI4
 FezyzXCPjDomacS7t76ahDtl9b44zGnVd58bGbSmz/Mh97++9tJEaNtaZtRmhenQsUM4
 MzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681393115; x=1683985115;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NMSEZSkz62vEXgNmEQbs+OXZbji/sgdWxxDakkbGz1U=;
 b=b/kaH+L8y8HnSwj2SOZe2OajnDmFcTdRiexhT+LpJ1SdTxGLVBEubHHZ4jnF9ng2Mt
 pQyt3dcBLWZHDmV9IuU9Xk/nEqGHLzGI9soLal6kBH0//YmN3aEu9FPUbhPG+GkY5nZA
 IvQHsugL+cNx/wDORuNqYnZ6L0iBL0pXbQuPiJfN3oY3E4iIzOGFdnd5IPOH4C54/tDQ
 Y91L7HHdViMG94nS4F1cJNtrd/FVTCC0TLsP2SWZIrYey7S1aYP8fb00Mz0Lg1y4N6YW
 rJAOzZoupDRZ1DI3GBD01Yt5wXTI/pXiAeY5jS3U1U6YgZU5PUmaS3hgIOGcxaUcLZkp
 dGkQ==
X-Gm-Message-State: AAQBX9fhpNPzAIvUH1vli4rnRusSik1lbJedCjrrvfooNUIHQe1vfsef
 VsF/by9aEqT5rbSUw12yok9eXg==
X-Google-Smtp-Source: AKy350byME4j2gHC+jH+fdPpzZNz3NB0IpwoCbY+anZh6CGS1TELEBV8VEugEdEwwiGPCfe8QRjDdg==
X-Received: by 2002:adf:ec8e:0:b0:2f0:bd17:2d2c with SMTP id
 z14-20020adfec8e000000b002f0bd172d2cmr1775341wrn.9.1681393115220; 
 Thu, 13 Apr 2023 06:38:35 -0700 (PDT)
Received: from [10.1.0.53] ([62.72.67.132]) by smtp.gmail.com with ESMTPSA id
 h12-20020adffa8c000000b002d322b9a7f5sm1311601wrr.88.2023.04.13.06.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 06:38:34 -0700 (PDT)
Message-ID: <8177194c-853e-de0b-fe06-0ae82bbc127f@linaro.org>
Date: Thu, 13 Apr 2023 12:31:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] softmmu: Move dirtylimit.c into the target independent
 source set
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Hyman Huang <huangy81@chinatelecom.cn>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20230413054509.54421-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230413054509.54421-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 4/13/23 07:45, Thomas Huth wrote:
>       uint32_t dirty_ring_size = kvm_dirty_ring_size();
>       uint64_t dirty_ring_size_meory_MB =
> -        dirty_ring_size * TARGET_PAGE_SIZE >> 20;
> +        dirty_ring_size * qemu_target_page_size() >> 20;

Existing problem, the types here are suspicious: dirty_ring_size is uint32_t, 
dirty_ring_size_meory (typo) is uint64_t.

I wonder if this is better computed as

     uint32_t dirty_ring_size_MB = dirty_ring_size >> (20 - qemu_target_page_bits());


r~


