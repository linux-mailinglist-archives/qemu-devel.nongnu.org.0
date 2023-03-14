Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A5A6B8ADA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 06:55:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbxcK-0007A8-FU; Tue, 14 Mar 2023 01:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbxcI-00079o-Iy
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 01:54:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbxcH-0003e9-4u
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 01:54:34 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso9308346wmo.0
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 22:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678773271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/ErSqSM96rJpsC3uSqdgRe7F4ZCEIKCRiNwCqKHn1Vo=;
 b=Tva0fivNjqpl+9XxfX27/C62V0vchzx0ADLlROM6ccZyBzQacqQTGtzapfUglW+9US
 XYbwtQlbSA8f31BJDRxv7UorrRVxKkBeGeLXiFq/Z0470O5yn9apQ5YEcZkQdm0QQk/x
 n+AGAIWmdDhsVWD9qu9Axa4luDXnX9frcXmbycGNbOpEgD3sZHTs86RzyZjx/YQAb3ki
 xWOtYOpJtthcq9lle9bvwPvVUT7Njwb/QE3yEpAUFt46WIYt9CPCmfDfBo9C73WvgVH2
 dz6vIqXUr1OVDG/3dbDtnAf1wy3o/PaE2tvtByHyxgyOCdCesTDCgQScHMWmhG4l2t3c
 /mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678773271;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ErSqSM96rJpsC3uSqdgRe7F4ZCEIKCRiNwCqKHn1Vo=;
 b=51LAmIMHnqNpnzlnowzHpGjwjBbGWci4BbFIj6UxjUL5zbl9ym0hG85PBUmuIq4lbl
 3ac+NFFyurm4xNToYuJ4Tyk1uEjuo3Jw3/40xttSilUMjjB4VuJeE+b2o6vD+9U8lyC1
 pv/kLc8AhcqqRQUmaVTrxrCMx8cHY/yacO+rL2DEtoAbxA+uxsKBY641X9misR/VZoJD
 f1eEJGHyB5/QDeyvCym+YaUi+B4hdWI0vehSrZAkhB6sNMhUHl+I9wm7my9VilyDVazg
 dc+3dBU+hYISa6M/r1NbLYRfyC8LvQ8A3YyhK2BR5rBPjcWqrUJWEwSPc/S3flVcIDir
 MHXA==
X-Gm-Message-State: AO0yUKWJ0GaisK2pXu6gNMGcmPIYxXIJEbkNAB3mMPEDzKr5Uhywb/rt
 R54xQWDxbyNRaKq4axfKlHx6tg==
X-Google-Smtp-Source: AK7set9+dQ0aKjNe6ZppwcIMr5p3XWJwcPgDSXID7i1rleiaE0TyM3nL9hcGqDB9YhLfHfYW3GdW0g==
X-Received: by 2002:a05:600c:511a:b0:3ea:f01d:2346 with SMTP id
 o26-20020a05600c511a00b003eaf01d2346mr13767055wms.15.1678773271505; 
 Mon, 13 Mar 2023 22:54:31 -0700 (PDT)
Received: from [192.168.150.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 z4-20020a1c4c04000000b003eb395a8280sm1677191wmf.37.2023.03.13.22.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 22:54:31 -0700 (PDT)
Message-ID: <a3278eb8-a553-cf47-34bf-c0287cf4a069@linaro.org>
Date: Tue, 14 Mar 2023 06:54:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] target/riscv: Simplify arguments for riscv_csrrw_check
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-5-liweiwei@iscas.ac.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230309071329.45932-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/3/23 08:13, Weiwei Li wrote:
> Remove RISCVCPU argument, and get cfg infomation from CPURISCVState
> directly.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/csr.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


