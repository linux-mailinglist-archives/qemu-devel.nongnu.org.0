Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F262A6964D8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:40:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRvXZ-0005HF-Dl; Tue, 14 Feb 2023 08:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvXU-0005GU-73
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:40:08 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pRvXQ-0007Zv-Pc
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:40:06 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 e12-20020a0568301e4c00b0068bc93e7e34so4665180otj.4
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=93KbEo56GRH1+WogzS7B3Q2lgXbSgNHkKRYq97CDo1M=;
 b=Ayx2bKBgmdU9N7o3RJlfyQPlJDxMwJu6tVM01ZySg9SZPOSgoYaMZumizoV4XU2+NY
 IZ7kStDLDByulgoewYkWB3JCkkEIG2WqBBY8/6U0LB/IDHDYWyEpG2Z0PydRdyz8rog1
 GfubTymn+vlyX9SRBDwCyu0Sc4eYH2YO+JpDmfZsS9rza4RcJM0H9KMuC8jlj++lYuLR
 b6c8XpEhuNmk5p5Zwu7ZiBzwOjcId24uGZeF6cdnZG7vdOS9Kwm+cBx9KYtD2VPX1Tyi
 /J+TrZ1ujMh0lcspyYA7IaiegAy55XjYRjaKnwDU7NmSjuIHvIhxnA09XTZzXBe69Def
 bLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=93KbEo56GRH1+WogzS7B3Q2lgXbSgNHkKRYq97CDo1M=;
 b=xa8ITHYFGEeHDL3oPERmi1b9j62OhvE9GF8xRwWl3NIC42DPSwgu2iNByK+AJ6230k
 XmPXcHVLveay52fdKUI8ysPPYaEi9iccl7iNuqpsl+gyDNMKYnnN48fRmolxalsgvWRp
 YAUubCMG3FqwKX85uiBUWaF9jqwBbuSVND53dZRK2okRtEGKckOrWd90/W4rzgHSEJ4X
 MbqDJH3Vi5nc7NE+2/C/t45lR2Wdnq1y3Z0M85Guk0BbO6Q+tGoqKYEnMWwrCCZeuW8B
 wrHuYiDm1YX8kZ/IduBn2Vy1cohLnHgjN4Bg36BpyrRPbgPddnzEc7FsJoaj6nxlYT2K
 Qipg==
X-Gm-Message-State: AO0yUKX+EMoTS3rHo9JsLZL4sRJiCMwPN4t96TPoQ84n6ovWC96s5TFh
 eZDUqMvWorbtFcO17UyC7GwyCg==
X-Google-Smtp-Source: AK7set8QeM3FXDoXBA4+TJVcBKDBaQuKScJa19tp6CBN6r9wF4NAjfOwiBH8qjjkUf+5xkSDTo8SMA==
X-Received: by 2002:a9d:7557:0:b0:690:a6b3:a2f6 with SMTP id
 b23-20020a9d7557000000b00690a6b3a2f6mr1058952otl.0.1676382003572; 
 Tue, 14 Feb 2023 05:40:03 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a9d6b85000000b0068bcc902b82sm6278343otq.71.2023.02.14.05.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 05:40:03 -0800 (PST)
Message-ID: <f0445a50-c84e-f580-ddc5-b669fe6a6cc5@ventanamicro.com>
Date: Tue, 14 Feb 2023 10:39:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Patch 14/14] target/riscv: Expose properties for Zv* extension
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-15-liweiwei@iscas.ac.cn>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230214083833.44205-15-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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



On 2/14/23 05:38, Weiwei Li wrote:
> Expose Zve64d,Zvfh,Zvfhmin properties
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/cpu.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 73711d392d..2c71e22ea9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -101,6 +101,9 @@ static const struct isa_ext_data isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
>       ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
>       ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
> +    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_12_0, ext_zve64d),
> +    ISA_EXT_DATA_ENTRY(zvfh, true, PRIV_VERSION_1_12_0, ext_zvfh),
> +    ISA_EXT_DATA_ENTRY(zvfhmin, true, PRIV_VERSION_1_12_0, ext_zvfhmin),
>       ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
>       ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
>       ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
> @@ -1126,6 +1129,7 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
>       DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
>       DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> +    DEFINE_PROP_BOOL("Zve64d", RISCVCPU, cfg.ext_zve64d, false),
>       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>       DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>       DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
> @@ -1185,6 +1189,9 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
>       DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
>   
> +    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
> +    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
> +
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

