Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61EE6900B0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 08:07:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ10c-0005IO-1N; Thu, 09 Feb 2023 02:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ10Z-0005Hd-2V
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:06:15 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQ10X-0006dy-5G
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 02:06:14 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so3178834wma.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 23:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iRuTkb3w4DYwZGdSllWXBXTGBdpSnpukaC5Bgij9Ov8=;
 b=qc6TvSzz13e5xf8RDVnlvF+td7+rrdZ8knnkNrYzP9Ir879bq4LytglVEK09sf9LdR
 wEJoHMrZVI2f+ZQWOUyAHHntqZPXILBOR2+6P4MYUYy+ZKtB0QnMbtiUVUx4qNkCgwNc
 m1sygcsgoas3YnWPH5lFz1sCP8cEd+707qStywEqyAV85ypgIlr/MXJKrY1Ni4COZ92C
 1JyuISgcmJU21VE/bDV23YWiw/eUWhc5qHai3/W58kCOGWVIKs/lC7G4+5R3PXH5Thle
 lMtX762PzkJ5XfT8PkBLGK+9VErCZnynjSDx0ux37vaHpopdVKndSEkNdmBgEdqnfAmb
 TLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iRuTkb3w4DYwZGdSllWXBXTGBdpSnpukaC5Bgij9Ov8=;
 b=iBB2s2+RD2EJAlCetRxT1sNDNO8tLmwC3C0aAoZQjgkU0OkLlCfS+96tT1fzRhvDUi
 1anC0ThNphcPqAE02wCsbxbqzDF1coEVIZJBen6i/gvOaoq6swM3H8nWz5/MiK8rXDqk
 dzysh1O6r0SyRkJUuCBRVsAVadIkAvHETiYy4lhsxBhNoLSAwYs8aOXLMLrB/iFkd63m
 fKQ+NVBrcmmo37Q0pov0brf2wh2fsaRipGXWCmnjqVFVgShg8whUEp7Od9bI4eEYIrbr
 tu6bgR/EMfpxJZ+Qqqae/ls0bjI1n4lpD4OwhjoWKyY0lcjEXt0AGbUlfqHvDnsf4v2L
 Ks+Q==
X-Gm-Message-State: AO0yUKWgPaFFvbJ4LN+wvE4/0A5LU+8Ye1g6CeLVKGOSnnnQzlwOMHrb
 /VXV0Tzoa3r3pVHFbSdYBq800Q==
X-Google-Smtp-Source: AK7set9/BYBU6AOBnQKu0jvWU7ZU5Tb0dACjKFSmMQhox7dZq/uO5oeS0U+ijoMyTM5TsIOF7YcTQw==
X-Received: by 2002:a05:600c:993:b0:3dc:4fd7:31e9 with SMTP id
 w19-20020a05600c099300b003dc4fd731e9mr9975045wmp.7.1675926371595; 
 Wed, 08 Feb 2023 23:06:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003dc4b4dea31sm875798wmb.27.2023.02.08.23.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 23:06:11 -0800 (PST)
Message-ID: <6744fece-c121-c6da-c811-de88d65e0b89@linaro.org>
Date: Thu, 9 Feb 2023 08:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH] MAINTAINERS: Add some RISC-V reviewers
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com, alistair23@gmail.com, dbarboza@ventanamicro.com,
 alistair.francis@wdc.com, palmer@dabbelt.com, zhiwei_liu@linux.alibaba.com,
 liweiwei@iscas.ac.cn
References: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230209003308.738237-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/2/23 01:33, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> This patch adds some active RISC-V members as reviewers to the
> MAINTAINERS file.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   MAINTAINERS | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



