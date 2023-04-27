Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A436F0D11
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 22:24:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps897-0001E7-Lu; Thu, 27 Apr 2023 16:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ps895-0001DO-Dz
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 16:23:15 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ps893-0003kR-MY
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 16:23:15 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6a5f6349ec3so3753758a34.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 13:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682626992; x=1685218992;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N/gVmMos9PhHYqfSmywV2l7sf2PPrXS6nCHEqb0Kx6o=;
 b=TmjZtPkEJlpUVAX7irIAJVtTAXV5qF8VJtrqPJ2kPZ0LbdDMQ7vYfPQLs081c5zlrn
 qYBEjH6zPe8FtGP+0BlQjp9PC78KjVvDuRsjtqrlNCa7r8022PIp6/IE1ZlVkRUZHuds
 BudVihbOYMcuBTK/SsxBkNJKQZpOYTpPYCF+4moMRftqbybCjrYHMgWbkRLMFz8J5mVB
 fZKPNqN2FR6cmzSzVTy8qqKJ6JG/0p0gN4k6wELZ+uxmmZpVwqTNrxR2y0SvR4vjYaw/
 neCfj2IyVVpCEYY7IEYRgUIvyH7YuBADz66P23vHklyXQjA17O4S9IbuchBSIfMkOs8U
 0rDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682626992; x=1685218992;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/gVmMos9PhHYqfSmywV2l7sf2PPrXS6nCHEqb0Kx6o=;
 b=K20il6d98XMJQ+QgAqQ+VSwtIPfCorOee+YOpWsVQnr4xegWvGulpT+2A2YkitismS
 usMcwC/o+ZHAx0fmoeTpz/5G55AfcF6tX5CDAoL3XmA1cS6CpG8Edls/uHkzZusZ7A56
 vXJFn/U9POYpURGbm2wOoBEW60WgAtjI8UwJ0JkIyj3Ir9ZqSqXpwUfsknxEXxWDe6Ok
 +k1vp/eOtqnE1P9HbVCN3tXhnhH/WO+OCv6ca5wHC37rFexwI/MrSpCexjTZH9fEq3/x
 lM8iDpy5RftUKOto0sBfK5IE5SD+LSKAWmP/EKlQTZP2+SHGMRR/DdSwkdBqgYWWLpjl
 2UJw==
X-Gm-Message-State: AC+VfDwcHxy2q43DjxzwyjknQw56oiVWKHQlbDTNe3l3IUfpa5it0SEY
 AKC1ou2rain+N149+oDEflM3sg==
X-Google-Smtp-Source: ACHHUZ40Bij2GTBfrBKHMhEcp2YT5SvzVJB9bAi+CuhuK8w7g73znz4PjKFavNACQHigGm4o8m+gOQ==
X-Received: by 2002:a05:6870:9443:b0:177:81bb:1b23 with SMTP id
 e3-20020a056870944300b0017781bb1b23mr1353152oal.38.1682626991738; 
 Thu, 27 Apr 2023 13:23:11 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 dx46-20020a05687076ae00b00183ff6b45a2sm8058830oab.10.2023.04.27.13.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 13:23:11 -0700 (PDT)
Message-ID: <006e575d-3625-509d-5d90-1c10118a730a@ventanamicro.com>
Date: Thu, 27 Apr 2023 17:23:07 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/6] Add RISC-V KVM AIA Support
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, atishp@atishpatra.org,
 vincent.chen@sifive.com, greentime.hu@sifive.com, frank.chang@sifive.com
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230424090716.15674-1-yongxuan.wang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x330.google.com
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

Hi,

The patches seems to be based on an old QEMU code base. E.g. patch 2 does not
have the changes made by 568e0614d097 that was merged in January this year.

Can you please re-send the series based on top of Alistair's riscv-to-apply.next
(https://github.com/alistair23/qemu/tree/riscv-to-apply.next)?


Thanks,


Daniel




On 4/24/23 06:07, Yong-Xuan Wang wrote:
> This series introduces support for KVM AIA in the RISC-V architecture. The
> implementation is refered to Anup's KVM AIA implementation in kvmtool
> (https://github.com/avpatel/kvmtool.git). To test these patches, a Linux kernel
> with KVM AIA support is required, which can be found in the qemu_kvm_aia branch
> at https://github.com/yong-xuan/linux.git. This kernel branch is based on the
> riscv_aia_v1 branch from https://github.com/avpatel/linux.git and includes two
> additional patches.
> 
> 
> Yong-Xuan Wang (6):
>    update-linux-headers: sync-up header with Linux for KVM AIA support
>    target/riscv: support the AIA device emulateion with KVM enabled
>    target/riscv: check the in-kernel irqchip support
>    target/riscv: Create an KVM AIA irqchip
>    target/riscv: update APLIC and IMSIC to support KVM AIA
>    target/riscv: select KVM AIA in riscv virt machine
> 
>   hw/intc/riscv_aplic.c     |  19 +++-
>   hw/intc/riscv_imsic.c     |  16 ++-
>   hw/riscv/virt.c           | 214 +++++++++++++++++++++-----------------
>   linux-headers/linux/kvm.h |   2 +
>   target/riscv/kvm.c        |  96 ++++++++++++++++-
>   target/riscv/kvm_riscv.h  |  36 +++++++
>   6 files changed, 277 insertions(+), 106 deletions(-)
> 

