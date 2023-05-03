Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9D6F523A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:50:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu7DN-000211-I3; Wed, 03 May 2023 03:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu7Cy-0001um-Sg
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:47:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu7Cv-0004VM-VC
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:47:27 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fa47de5b04so4599305f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683100043; x=1685692043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1IUNtaPAk6k1Yg+mIAO61qis0LGTZnfg4LNJoMHnLbM=;
 b=ChqJatjlfBDSlLGOshzxBWPKAnwsmj3Ned57vlri/D5gXkg/Ap90XYDFVyqzdINWvu
 DtrQA69zx3Sqf568FRuU6/nlklQ9RyiV/VY7Zxky6EaIzq27VlhhkzQAvVnJF1IvEi+9
 AfUcGyzt34TpE5gbPKDZ/HYcEXyP8PLsfaV4gzc3HEZ37ImMC3a2WXWQOG19zTmYtX/n
 r0EpnEZ8ns00hLcs7H7sRSi6FcbTUIjVC+5vnLeo4miP/noEPcwTzIABop7hEOjEcDCG
 bdLEK/gwmPzGAEOXxXnCaKtZqbkvG1Jla4s1jta3zu3wg9ckBk2GnWuAZ+h/L0tIafZw
 dBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683100043; x=1685692043;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1IUNtaPAk6k1Yg+mIAO61qis0LGTZnfg4LNJoMHnLbM=;
 b=GB7LSweJq9GnqpK9en44nldlsnHFFLoNMYmEXXdnEJLaDunbyKqo/lLdUGKuFYH75S
 5Sicwbb96oCx4bhmX27acRZ6dPk0IpmKMGE2cD8ElIjYJ0oe7JaB4vQ42TB3IAHM+SKw
 Cow6xv0oEbngIYFetwLm4ST6UqKCDgsrWo1ATeWdkmcWM2eZ9vO6CWqc/Z0wvmh1FcwC
 akCoXc7CHcGvt0XRqr8B5Qp0TCZOWSWFt5ghHwMWpUZkHvv/AGvyAElCzBoiAOAo6AXE
 AQv9cRMIYTN9eUajTmfkKglJgQrOCyIDTfD0I9AYltItWnv9O8eXxeZ+A24RRSq/4sSQ
 DDeA==
X-Gm-Message-State: AC+VfDyWTxhl8+ufXC2deWk1MFRNk9EbLp3q0yb7y/PnBSxcyrZAKEOb
 iy+he6BC/bO9z2jt8MxMTLP1EWRAz8tK2saiJC0R1w==
X-Google-Smtp-Source: ACHHUZ7vj4bkjEmUGjN/RJ+bGLZ/j4iVP2x0l/s4LeEWrDbKx2ePX/K8bemzwT+fxTrQYmG8jXaqhw==
X-Received: by 2002:a5d:6606:0:b0:306:772:5c2e with SMTP id
 n6-20020a5d6606000000b0030607725c2emr8312762wru.70.1683100043122; 
 Wed, 03 May 2023 00:47:23 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a5d6045000000b0030626f69ee7sm9917068wrt.38.2023.05.03.00.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 00:47:22 -0700 (PDT)
Message-ID: <a01d5ddf-b6b3-7fc7-daef-44debf48ca77@linaro.org>
Date: Wed, 3 May 2023 08:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL v3 0/10] xenpvh3-tag
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, vikram.garhwal@amd.com
References: <alpine.DEB.2.22.394.2305021708010.974517@ubuntu-linux-20-04-desktop>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <alpine.DEB.2.22.394.2305021708010.974517@ubuntu-linux-20-04-desktop>
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

On 5/3/23 01:12, Stefano Stabellini wrote:
> Hi Peter,
> 
> Vikram fixed the gitlab test problem, so now all the tests should
> succeed. There were no changes to the QEMU code. I am resending the pull
> request (I rebased it on staging, no conflicts.)
> 
> For reference this was the previous pull request:
> https://marc.info/?l=qemu-devel&m=167641819725964
> 
> Cheers,
> 
> Stefano
> 
> 
> The following changes since commit 4ebc33f3f3b656ebf62112daca6aa0f8019b4891:
> 
>    Merge tag 'pull-tcg-20230502-2' of https://gitlab.com/rth7680/qemu into staging (2023-05-02 21:18:45 +0100)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/sstabellini/qemu xenpvh3-tag
> 
> for you to fetch changes up to bc618c54318cbc2fcb9decf9d4c193cc336a0dbc:
> 
>    meson.build: enable xenpv machine build for ARM (2023-05-02 17:04:54 -0700)
> 
> ----------------------------------------------------------------
> Stefano Stabellini (5):
>        hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
>        xen-hvm: reorganize xen-hvm and move common function to xen-hvm-common
>        include/hw/xen/xen_common: return error from xen_create_ioreq_server
>        hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration failure
>        meson.build: do not set have_xen_pci_passthrough for aarch64 targets
> 
> Vikram Garhwal (5):
>        hw/i386/xen/: move xen-mapcache.c to hw/xen/
>        hw/i386/xen: rearrange xen_hvm_init_pc
>        hw/xen/xen-hvm-common: Use g_new and error_report
>        hw/arm: introduce xenpvh machine
>        meson.build: enable xenpv machine build for ARM

Errors in CI:

https://gitlab.com/qemu-project/qemu/-/jobs/4216392008#L2381

../hw/i386/xen/xen-hvm.c:303:9: error: implicit declaration of function 'error_report' is 
invalid in C99 [-Werror,-Wimplicit-function-declaration]
         error_report("relocate_memory %lu pages from GFN %"HWADDR_PRIx
         ^


r~

