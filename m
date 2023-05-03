Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EACD6F500B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 08:24:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu5sm-0000s7-Lm; Wed, 03 May 2023 02:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu5sj-0000rt-Mo
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:22:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu5si-0005Pg-0V
 for qemu-devel@nongnu.org; Wed, 03 May 2023 02:22:29 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso2853811f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 23:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683094946; x=1685686946;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=URVvd6LZkHtxztE8g0C8uujiBA12o3uEcBI+tRbKwIY=;
 b=HfADeA4Cotj+FkkvsK1OIGGVbNc+9gNdoGznpOL2zY7guFQETLuLPykVhzqxknojGG
 +o2SQYsePV59rozQgiWYDaqR3UcyJQmyFX8jt6h5xQCXRbkF/GrR1pntnRff9vRTXSwU
 iWY2A1usDvOpi9wC2G7yNhtSyXADakRblVHe5ZU3uaKLUoWD9PnT9ZnElom321S4CPJh
 0Xbb9/63admqUw4REGeWVcIrgGwTVd6Jg0Ofcefg08umkvICV3VEoNMAo04POz1MO4y9
 JLid3Isn8UJwT/KzoouMcktg8LZoVUmEM8KNAYH6BGeRDK9/XXxKe1qNqSwX5BAH3yQd
 Y35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683094946; x=1685686946;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=URVvd6LZkHtxztE8g0C8uujiBA12o3uEcBI+tRbKwIY=;
 b=Ez2NtJr6O5eti+wB6ThQ8lXh9pP6iKPXW5ANMs+DBEcNKh1C59luhMz2FkXJI+3KJo
 HuuQqdmxmw3LbnAqUBlo0Q6fRWEjM5HpI8Law21v34a6dAzOo/lf5XWD73JU4o1KvLj0
 uDIw0ocTOvBmGouO26dtbjqvqdIHmnOpxDOtmvJum2J6YjXZwLObQ8lkmuepxxu5D7qH
 49iGiKomj1Z4PR88LUPITAqqoNLkQJFxfISZILpJTG7TnxOpVY9t9Eoqmx2Yrhwl3KE3
 xYcWcypUlP7fspV3Dcmkjrq3YhhYdB0wwiSVD8j9bxmF2VR7NzG5dnI+xIQbry2nkqwZ
 Buxw==
X-Gm-Message-State: AC+VfDxZ1dIeEijB7AD2UhEMg1xNHfx7xi0LJZVcDWBavP8YhkP9X1h6
 4gg/yKQkTJx6vqETrXejne4WCQ==
X-Google-Smtp-Source: ACHHUZ5O6gAZXLMAlS3k1qLFGo4ahPMocavK5zggVezCtd3vD0bUxF7NCwl4tQcQ3yu4P9ENosihxA==
X-Received: by 2002:a5d:6dca:0:b0:306:29b6:b389 with SMTP id
 d10-20020a5d6dca000000b0030629b6b389mr6906507wrz.64.1683094945971; 
 Tue, 02 May 2023 23:22:25 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 y4-20020adffa44000000b002f013fb708fsm33188926wrr.4.2023.05.02.23.22.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 23:22:25 -0700 (PDT)
Message-ID: <20e8f2ee-5612-251f-62b2-20ab75345d59@linaro.org>
Date: Wed, 3 May 2023 07:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC v2 7/9] target/loongarch: Implement
 kvm_arch_handle_exit
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn, philmd@linaro.org,
 peter.maydell@linaro.org
References: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
 <20230427072645.3368102-8-zhaotianrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427072645.3368102-8-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/27/23 08:26, Tianrui Zhao wrote:
> Implement kvm_arch_handle_exit for loongarch. In this
> function, the KVM_EXIT_LOONGARCH_IOCSR is handled,
> we read or write the iocsr address space by the addr,
> length and is_write argument in kvm_run.
> 
> Signed-off-by: Tianrui Zhao<zhaotianrui@loongson.cn>
> ---
>   target/loongarch/kvm.c        | 24 +++++++++++++++++++++++-
>   target/loongarch/trace-events |  1 +
>   2 files changed, 24 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

