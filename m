Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FDD6B9003
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 11:30:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc1u3-00018A-De; Tue, 14 Mar 2023 06:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc1u1-00017r-Jm
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:29:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc1tz-00077c-G3
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:29:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k25-20020a7bc419000000b003ed23114fa7so4067694wmi.4
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 03:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678789745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9VmFz7uxWF/SUuHLftvHGRhUUWcutnmAckL8dW8X0mo=;
 b=ivey1tnMtDaBNu6Fj6zPz9CXeg2RlwnsGvqxc9JZivr84ZMKqkAR/cZPm3ecaerKwa
 8Xx4UrG8b1x9KLX5ajmAD59hc5JYc7oX2TFUn2HgsMYc6LbnR1dxuJ767rV1mA0XDEu5
 BrzsfKcaBGSNCvpLkGRM3kh1HJELvpcJYYbcmNCXVwH3MbZOUeOZp7+ri80/vQWgjsUB
 5X/SaPYVl17/7EBiD4Hci+xaI9GsCN1kA8kVU1W9BaUKVUQvJdgWdFptFap4bUZG/R8e
 jDnnET1CzWaiiYrl2OiFeVo9M6So/9n0OB8igmYgodtN+oZ7qpBIrbnqusJC/o9N5rs4
 7wPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678789745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9VmFz7uxWF/SUuHLftvHGRhUUWcutnmAckL8dW8X0mo=;
 b=Q7XYQCORvl8bZbKM4UMI29xoXOgVMfhdJ/qc+zd9M/RNFqXXb+ETasCMk5SWdxsoz2
 i/faDBuh1xi8bg/0SEFh09ZLlK8KqIRv6MzfxwkmubtOX3lguyuLNWZtyiaEW+9uZ2Qg
 lAy76gf/K0pC688u1HMfHK5cKbDHzW6cnum4JVZx856i1OiEeSghFI3HtROkQLOG8QBp
 z2X+LfWfuXXq01YwhAAa/bWmB+12Bzm/LA25+qZmtnYK3tGLGYfESssSAdNaS9qffkMO
 UlmKMItshaNaWiO2NtvJYWxO0naC/BHJdZlLU/ky1qI7RBfbc/MsQYXd7wCgb3+ldTiG
 StQA==
X-Gm-Message-State: AO0yUKWgJ5DZoY9Gnigfzyqn0g72GrQsJeIzdSf60HxiEpFbkjL8CPqm
 GyFRBfEErOx+DESMuBE5ivMQzw==
X-Google-Smtp-Source: AK7set//Y6M15cBDBUV2C8EzGQc2OSPWG7JZmzgQbc42cclxJh6D4mqfiHoiYjhKX5PDwW/HVPTrUA==
X-Received: by 2002:a05:600c:1c28:b0:3eb:3b7e:7b89 with SMTP id
 j40-20020a05600c1c2800b003eb3b7e7b89mr13834825wms.3.1678789745707; 
 Tue, 14 Mar 2023 03:29:05 -0700 (PDT)
Received: from [192.168.1.115] (233.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.233]) by smtp.gmail.com with ESMTPSA id
 z22-20020a1c4c16000000b003ed246c1d28sm2324008wmf.44.2023.03.14.03.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 03:29:05 -0700 (PDT)
Message-ID: <686bf557-e640-486b-7a24-c64d4e207f58@linaro.org>
Date: Tue, 14 Mar 2023 11:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] qapi/machine-target: refactor machine-target
Content-Language: en-US
To: Dinah Baum <dinahbaum123@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>
References: <20230314100026.536079-1-dinahbaum123@gmail.com>
 <20230314100026.536079-2-dinahbaum123@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230314100026.536079-2-dinahbaum123@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 14/3/23 11:00, Dinah Baum wrote:
> Moved architecture agnostic data types to their own
> file to avoid "attempt to use poisoned TARGET_*"
> error that results when including qapi header
> with commands that aren't defined for all architectures.
> Required to implement enabling `query-cpu-model-expansion`
> on all architectures
> 
> Signed-off-by: Dinah Baum <dinahbaum123@gmail.com>
> ---
>   MAINTAINERS                     |  1 +
>   qapi/machine-target-common.json | 79 +++++++++++++++++++++++++++++++++
>   qapi/machine-target.json        | 73 +-----------------------------
>   qapi/meson.build                |  1 +
>   4 files changed, 82 insertions(+), 72 deletions(-)
>   create mode 100644 qapi/machine-target-common.json

> diff --git a/qapi/meson.build b/qapi/meson.build
> index 9fd480c4d8..48be47170f 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -38,6 +38,7 @@ qapi_all_modules = [
>     'job',
>     'machine',
>     'machine-target',
> +  'machine-target-common',
>     'migration',
>     'misc',
>     'misc-target',

Eh, this reminds me of
https://lore.kernel.org/qemu-devel/20220204152924.6253-5-f4bug@amsat.org/

I wonder between -common / -any / -all. Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


