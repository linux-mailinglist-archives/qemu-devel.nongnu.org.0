Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A866F8FB4
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 09:12:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvC47-00065p-To; Sat, 06 May 2023 03:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvC46-00064N-CH
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:10:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pvC44-0002MB-DB
 for qemu-devel@nongnu.org; Sat, 06 May 2023 03:10:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19a7f9424so26322825e9.2
 for <qemu-devel@nongnu.org>; Sat, 06 May 2023 00:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683357042; x=1685949042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NUmTuIurQ5gFHtbfeXVurjtW8iGpqkivb10s9jML6Jk=;
 b=aHgGh5ECABQhw4LR6JUZuN0DbHv6IZbfk3cUaUqJu5QJ6Xn8eXsm4I/Et7WO7Tn5fv
 3Gw0fTakBN90lMahPCNmIyZp8trmXQ4Fq7VhlyHLD9hHMYr+PcXauRdocGZ6jaoR8kG2
 Bipj08c9EsFUg7rm6qUdIU6raLnjVTU67zrOGVNdhbWvtksSM50GM3ORmnNbGnx8ZNkz
 Ge4RNhVNAEJZrrwHhfU4Y9xG7i6k9rP6nRy0F4X96Sqw24hF7epDSrBsl1Gdt4Lds2XZ
 3ByTWaCBvCuYgABFRUnwf+H/q7M0EQcotwks3KFRkDGL/2pGLi4A2aXW5Vi1Tl/nErop
 IiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683357042; x=1685949042;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NUmTuIurQ5gFHtbfeXVurjtW8iGpqkivb10s9jML6Jk=;
 b=gEnR9GUwLgByGvMDOytbtLhyDpm0YyYrE0hFmOO9SfO4Lza11iUa6465Xzvn3/GjYs
 1swmOoMckZabM5Ctpdiw17TmloRoY4aC8O68sZQL0oVtoaneJyEuKS+rRcHJYG1IYr/X
 n+IVg1uVsFBfsbEYvLemzNroP8AwGK3VfzjJJXSeZD55FQRscRgOIC4KPmlZKPo1kV8Q
 m2fztgOGDR2SkTtfjHTqDHBC4o7mrXwV/aCC/lhAFYWgzRKiyIqBT2ZATZikH+AXm/ty
 +zwqKcF1jndT6MB2wErgiJ1BguX7cUTeFL3k9gFiAJe5EmWHEe1wJg6NuQIkBZlMWWAC
 ZNUw==
X-Gm-Message-State: AC+VfDwpyjkHUKusmq00Y9YA6h4Vn6BWx0S9mWJhSXWvCZLXENRw4ngp
 X52OqtpG6uqZRcUj1eLrBBwhLQ==
X-Google-Smtp-Source: ACHHUZ5GnipV93u5XRSbWhzXajmFGyQInbnlyxbGt1U+1d9Wcv5+jDuqHISzfFg1Dqruf06xSyohMg==
X-Received: by 2002:a7b:cb95:0:b0:3f2:557b:453 with SMTP id
 m21-20020a7bcb95000000b003f2557b0453mr2353925wmi.39.1683357042330; 
 Sat, 06 May 2023 00:10:42 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a1c4b06000000b003f17131952fsm9959564wma.29.2023.05.06.00.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 May 2023 00:10:41 -0700 (PDT)
Message-ID: <830f1afd-71f5-a305-9298-70b131cf5492@linaro.org>
Date: Sat, 6 May 2023 08:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/6] ppc queue
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, peter.maydell@linaro.org
References: <20230505163444.347006-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505163444.347006-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

On 5/5/23 17:34, Daniel Henrique Barboza wrote:
> The following changes since commit a9fe9e191b4305b88c356a1ed9ac3baf89eb18aa:
> 
>    Merge tag 'pull-riscv-to-apply-20230505-1' ofhttps://github.com/alistair23/qemu  into staging (2023-05-05 09:25:13 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/danielhb/qemu.git  tags/pull-ppc-20230505
> 
> for you to fetch changes up to b35261b1a6c2729fa7e7a6ca34b9489eda62b744:
> 
>    hw/ppc/Kconfig: NVDIMM is a hard requirement for the pseries machine (2023-05-05 12:34:22 -0300)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2023-05-05:
> 
> This queue includes fixes for ppc and spapr emulation, a build fix for
> the pseries machine and a new reviewer for ppc/spapr.
> 
> We're also carrying a Coverity fix for the sm501 display.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


