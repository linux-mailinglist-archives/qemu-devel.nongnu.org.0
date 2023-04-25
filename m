Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB6C6EE0FE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 13:17:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prGea-0002hf-I9; Tue, 25 Apr 2023 07:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prGeV-0002hI-Te
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 07:16:09 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prGeT-0008MK-DV
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 07:16:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2f40b891420so5408922f8f.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 04:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682421364; x=1685013364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b3DLrH5rkPpyEurm6kkCuu6nTNrwqDLVdNEzYMnl/Ng=;
 b=giNlUosKpAs9EB3wQRcSm8hpRSLaJ7x0fQogUARNFNWHdAvjfkYIPb9xkbNnOCDQKJ
 Z4w0W2T8cvCh7YAfLmZng4Xs1q9KmQ3KaBMVvQDTJTdVfLYDNkmdACapwYC2AO5xwxVf
 vUPjfOhF6JyKfOUzV1diEFfsUxgArW0mfDeUAh+jURxAeUk82eiQRiT7StJN5yodobFT
 ZcwK07FYWAuhitijFCKwugfOOiu5Lp2mXc28Fo48GjoQMuGE50sg/ceBid5uyh2pxjMh
 lnzdJngDtYwCtlZXkAHkNz7no0IUbriEXnd6OPy3zpQlQ/MUft8XMf2jKLY2iiSIWT8Z
 F5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682421364; x=1685013364;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b3DLrH5rkPpyEurm6kkCuu6nTNrwqDLVdNEzYMnl/Ng=;
 b=KcLSGC/4TjofrM7Oqynv90L8s6aTXkubB/YluzmuGEuH1pIM8Qq5neJQnug7g1un3T
 lZBC8lKOAysKoeC/O2jVys/hDH5NyQJhS/Gxkaj5EHdOPJkycI7HzaPafnWp2xwundev
 qQYEoBINK9c0dqanuuez1LtH2lNECUgCc94XqETkVgZVlTVhvnycLutdUQYuuBl31WQu
 Xeh1yt/GvYG4nf8i1Nrb3FY+czWXbZ/HaAmy3g0lLqZHlNLB6uXH5M69+85RZKNZ/nGn
 IR4KenAL2x/swNtIef6//7q9UmHPAaNC9WEoov9mMQOZE/Mlqk/Jo2wCQs/i5VMA0rF/
 HAQw==
X-Gm-Message-State: AAQBX9fpwEdnAk/yhyAWww4IvoYoQhoAuSqcNYbj80ORfGF6kILwFJau
 jtCs9zGtIoY5alKBgVfXVUv32Kl5jzZ7Wgtfrcc9Hg==
X-Google-Smtp-Source: AKy350ZrMqQxw66IB0VwMb4TnwkNFWaS/eV5TIu/o+3RsMBCHOFdUpsFr+TvJBCG4Xf2er4KIvqyxw==
X-Received: by 2002:adf:facb:0:b0:2f2:e638:1767 with SMTP id
 a11-20020adffacb000000b002f2e6381767mr11482064wrs.39.1682421364043; 
 Tue, 25 Apr 2023 04:16:04 -0700 (PDT)
Received: from [172.27.244.113] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b002fb9e73d5e5sm12846275wro.60.2023.04.25.04.16.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 04:16:03 -0700 (PDT)
Message-ID: <25dd65eb-12db-6795-0b27-f7fae1184cc6@linaro.org>
Date: Tue, 25 Apr 2023 12:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/31] virtio,pc,pci: fixes, features, cleanups
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1682408661.git.mst@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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

On 4/25/23 08:44, Michael S. Tsirkin wrote:
> The following changes since commit c1eb2ddf0f8075faddc5f7c3d39feae3e8e9d6b4:
> 
>    Update version for v8.0.0 release (2023-04-19 17:27:13 +0100)
> 
> are available in the Git repository at:
> 
>    https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git  tags/for_upstream
> 
> for you to fetch changes up to c28db9e0002df2abf88283b41dce0be17e8b0888:
> 
>    hw/pci-bridge: Make PCIe and CXL PXB Devices inherit from TYPE_PXB_DEV (2023-04-24 22:56:55 -0400)
> 
> ----------------------------------------------------------------
> virtio,pc,pci: fixes, features, cleanups
> 
> Mostly just fixes, cleanups all over the place.
> Some optimizations.
> More control over slot_reserved_mask.
> More feature bits supported for SVQ.
> 
> Signed-off-by: Michael S. Tsirkin<mst@redhat.com>
> 
> -----------

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


