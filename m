Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB76EB757
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 06:29:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pq4rD-0001d3-4o; Sat, 22 Apr 2023 00:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pq4rA-0001cc-DP
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 00:28:16 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pq4r8-0005Wt-Kj
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 00:28:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2fde2879eabso2226556f8f.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 21:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682137691; x=1684729691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QuKzasW04AoA5VA7PjDH2NDHqPUx5hTL9huCpDcF/IM=;
 b=e/HOMZ+NH0AvcZSQ4FbCR1ENxa0KPuVKI6ta+vMAIVBsOYjH2GbFucFfRfMWjdGsq4
 1M5jvMGRUd+U2WDuasqX+glsFFVs6c6PrB+aCnWN6rePWk4vvnZljDtvf8fxE5IYs1Yb
 Am46SYz12Sj2BkoZB539orL/bRIBNYpmc8SdXtjWVGCc6qAUPdoCW/PDC4XMH2DhSIct
 gCl/JQnYM0DufIL8fW1Zd3DXjCPDhXtLbI1AN0f+lkj+UJuDyIfb7JXE+TFln8zoGeOj
 OadBo3bbSYjvFJJ1awaDlslZ0OSYhZialO+N4rNCEW6bO5LqoE3yO15+7761QgMr2llq
 g/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682137691; x=1684729691;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QuKzasW04AoA5VA7PjDH2NDHqPUx5hTL9huCpDcF/IM=;
 b=k6OLbtvwMUg7q1x9X0XRIEaFYYDtoOOuCvVrpZtoqwNr3DLizHIwES+du1Zb7waZmp
 H27DvmNBttdlrlVv6lG97xFyOwP9YuV0fzOFusP2Na9u8vpiKit39+ErY5NsmkUzhghn
 xOgeMI3IKgh8+IddNfJhvTFsnWVVD4EURWwtqJXg/vAa/8HiVkwQlhAswLN2bpKfeC8B
 3pOAymFhXuC/bYkm/gPg0kmpv93VLwFS+3wr0a7UTI0ksg8Aq+2TQUknQ0Wv+EW57Rbe
 rXQLMLUS0B9cwpNTKS+YQdRhzzsh2swpRVS22Kz7dyyYEe7rMk0/pRzOvc3Y1cvd1uEi
 bV0A==
X-Gm-Message-State: AAQBX9f5lXo/elj9fYGGHn6Ts0tsUwL8qHxzTnBH+oefwHNKIy35d97A
 4kC3sDfmJndHnGSzpGGE4dvaBw==
X-Google-Smtp-Source: AKy350ZPl9imLd4Dv6RP8RTkwPol7YsuxY4oqt/kSJUZCSK71WQFKrq60kCEjgVVDIaHXyjOEsHbnA==
X-Received: by 2002:a5d:63cd:0:b0:2f3:ebff:396c with SMTP id
 c13-20020a5d63cd000000b002f3ebff396cmr5320684wrw.34.1682137690759; 
 Fri, 21 Apr 2023 21:28:10 -0700 (PDT)
Received: from [10.43.0.111] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c294300b003f182c11667sm6350040wmd.39.2023.04.21.21.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 21:28:10 -0700 (PDT)
Message-ID: <56df0856-1bb0-1cd0-3762-38bb6fbdb8b0@linaro.org>
Date: Sat, 22 Apr 2023 05:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 0/7] Merge tpm 2023/04/20 v1
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230420123247.226312-1-stefanb@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420123247.226312-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
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

On 4/20/23 13:32, Stefan Berger wrote:
> Hello!
> 
>    This series provides TPM I2C device model support along with test cases.
> 
> Regards,
>     Stefan
> 
> The following changes since commit 2d82c32b2ceaca3dc3da5e36e10976f34bfcb598:
> 
>    Open 8.1 development tree (2023-04-20 10:05:25 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/stefanberger/qemu-tpm.git  tags/pull-tpm-2023-04-20-1
> 
> for you to fetch changes up to 9d81aa3c0fe7480d722517f69e1bcb4aeaaf859c:
> 
>    qtest: Add a test case for TPM TIS I2C connected to Aspeed I2C controller (2023-04-20 08:17:15 -0400)
> 
> 
> Joel Stanley (1):
>    tests/avocado/aspeed: Add TPM TIS I2C test
> 
> Ninad Palsule (3):
>    docs: Add support for TPM devices over I2C bus
>    tpm: Extend common APIs to support TPM TIS I2C
>    tpm: Add support for TPM device over I2C bus
> 
> Stefan Berger (3):
>    qtest: Add functions for accessing devices on Aspeed I2C controller
>    qtest: Move tpm_util_tis_transmit() into tpm-tis-utils.c and rename it
>    qtest: Add a test case for TPM TIS I2C connected to Aspeed I2C
>      controller

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


