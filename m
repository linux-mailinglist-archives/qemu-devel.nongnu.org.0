Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA33B6542E9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 15:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8MWE-0007qG-DP; Thu, 22 Dec 2022 09:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MW0-0007pA-Ry
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 09:25:45 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8MVz-0006Oc-0H
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 09:25:44 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so1382672wmb.5
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5dbZY9tVgFwodd0gpV4IbAhdoxJMTGMv0MIrh9CLxNg=;
 b=jLWH2HQW6kIJyWV6+1KgRoeIOVCcNY1jpTngKjKU8IrxGtnlkwIE47dhNRK6O3M4VO
 NswYBlTqRa0ynxBdGr6lvdgdEt1FZldi9wGpapXI2ZX5ptCOUmXiO+2wM+QJArFdpA6H
 hy+nyB4J76L/Uj9RJIB+P19APaJ3zYOyADgoo0wAzry4/Pc3iyysy+FQj/ZO2hB0YRH4
 9LGDBYYb/DsFaHxDRzOMpPtcu+/hGNk5pclnRdxXGVSRl+Uk2mCOUZp7asJIxSbnvAUJ
 iXSV5R3A1Jf0U/iUf8iPKa1qKtPaLyfqotCVz7yRSDuciPhkwByXuHwTXvyUdCpD9Gnm
 vtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5dbZY9tVgFwodd0gpV4IbAhdoxJMTGMv0MIrh9CLxNg=;
 b=qITHnuzkHI8EtrQkTd9wf6+LhQSqVVbbxVIH9dTFcecEEuRsrjuDyJ3NNbBGiJyU8Y
 yg2cw56hs69i+ggyMclsW2uh54YjFTFzWcUiGpcvVUbalazUUVCwbVgnm1E0Ic/Lah/n
 pcKdOec7qJT88o95QaHj9U71HlGHJmgkPz+pW608IjKUGGa41QoVkMJZvpNqbUvVglnx
 jmAWD3aWEtzrDlCOeN0TQbf0zwpgrK6s5KNZ29O5yZyv880/Bv59jdyVGFVr0a78swgg
 9GS9agMfHSPJZEoOcqkQRA8+4Gzjkdh5xplDa0pk+M99eMHWpSz3NmRwZ7FHM0XtggG7
 QHNQ==
X-Gm-Message-State: AFqh2krjtPdV8LUR5wi+UFqajkKf7rjTGbROCuVDCy2ZQnXSSMpYODTf
 0KdEf97ha/FX+kHq6Oecvf5XLw==
X-Google-Smtp-Source: AMrXdXuVf96LgcFhHJUrG6zEthZL82ERg3+M4C2rVGQfpfqWpmp1IO0Jg962y1Q2Yn8SxTEeGiAxxA==
X-Received: by 2002:a05:600c:1c21:b0:3cf:9844:7b11 with SMTP id
 j33-20020a05600c1c2100b003cf98447b11mr5121646wms.23.1671719141527; 
 Thu, 22 Dec 2022 06:25:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t184-20020a1c46c1000000b003b4a699ce8esm5984592wma.6.2022.12.22.06.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 06:25:41 -0800 (PST)
Message-ID: <7e9aa5fe-468f-8006-b285-ca93eaec167d@linaro.org>
Date: Thu, 22 Dec 2022 15:25:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 03/15] hw/riscv/sifive_u: use 'fdt' from MachineState
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20221221182300.307900-1-dbarboza@ventanamicro.com>
 <20221221182300.307900-4-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221182300.307900-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 21/12/22 19:22, Daniel Henrique Barboza wrote:
> The MachineState object provides a 'fdt' pointer that is already being
> used by other RISC-V machines, and it's also used by the 'dumpdtb' QMP
> command.
> 
> Remove the 'fdt' pointer from SiFiveUState and use MachineState::fdt
> instead.
> 
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/sifive_u.c         | 15 ++++++---------
>   include/hw/riscv/sifive_u.h |  3 ---
>   2 files changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


