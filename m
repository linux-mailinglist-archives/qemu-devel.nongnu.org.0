Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BA841404D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:06:20 +0200 (CEST)
Received: from localhost ([::1]:49842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mStWV-0004dc-3f
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStUJ-0003Hj-LZ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:04:03 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mStUH-0003F2-PZ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:04:02 -0400
Received: by mail-pj1-x1034.google.com with SMTP id dw14so1116982pjb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=aBZ9Y6JixdTABdKZL7c67EZhJOUoGrnUq3CFbOfEngM=;
 b=hnnCvkMMT0RsVddTXScGFT3yg8mkQ7boTXqvRAu/3m6XXIdvmpkxJl4Xqkvv4oGfiq
 YHAGcUE/e0vfnnq0YwNdcwow6GWAV+Q36Py/pipaaca/mlT8fN4tH+2VASkjOMHjdtsS
 ruJv2LvzVnkQyD8WmBNtySZ46CtzZWX743FEzwsE1KahOsXcdrZyKIQyhFnqOrS79yVZ
 tTix7D9pMDVoRvgFps7hVX9udKhZg5cWF3FSiX2fCgAjs+JcEyhjL6ZCSut6Er4h/Zll
 QbKM6mSG7Nr5eTaZkN8I2+Haour0/6lKnJuk60cCLCrma67CRvP4hDVG6xJWjo6jhhSV
 efnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aBZ9Y6JixdTABdKZL7c67EZhJOUoGrnUq3CFbOfEngM=;
 b=szSt6Tn/ZvSOetYwOI4VFX5Q/X1Nj+9V+ruHJsEtV2K9QUop+W9KHleQo3c2R0Pu6f
 kNdR0bJ7e+zAwjNILjndI/q4abeLTtPPjE2Bqc+T42Q2PIM7YZ+z88JVEcxQJ+tawh5f
 jWV6G2lb7uEehMXZqj1H6QYqH9phxJyfly9hgkl1P5rKhU+cNZfMFfxmlAUljOK3jaBN
 P9OVGmk4S42T4lK4982NwCKvNckUQwj0FfhBSHvJYU1qxaB5eV2pA2ooQkzVWps27+kx
 G28Gi542uBK8Mwp6/hWZN/0RHhZHW0xguxfn5xqeUk5/IWLq6A78rdWLC1f3UZvJkyqn
 ebxQ==
X-Gm-Message-State: AOAM5331Ps339dJ58Efd6cgehAPHg2XxF5pk1uB58ThnLHES5HYAvpw9
 9KAGLLB1f3dRzwLmqfVbDjLr1ifG30sCSQ==
X-Google-Smtp-Source: ABdhPJy0qA2pdJGnoGC4v1QwvVDuZAfW+SydWe/fZONsiOwya6+IsjJ3OwnAF7cbkrm8JEcrPRWHNw==
X-Received: by 2002:a17:902:be0f:b0:13a:95e:a51 with SMTP id
 r15-20020a170902be0f00b0013a095e0a51mr30309255pls.44.1632283440316; 
 Tue, 21 Sep 2021 21:04:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m10sm3688979pjs.21.2021.09.21.21.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 21:03:59 -0700 (PDT)
Subject: Re: [PATCH v2 08/30] tcg/loongarch64: Implement the memory barrier op
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-9-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dda5d777-5e83-b877-0dc6-419f31e4dbcb@linaro.org>
Date: Tue, 21 Sep 2021 21:03:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921201915.601245-9-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 1:18 PM, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui<git@xen0n.name>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r

