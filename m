Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B543698447
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:17:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNH1-0006Ns-B0; Wed, 15 Feb 2023 14:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNGz-0006Mn-Fx
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:16:57 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNGx-0002Yq-QE
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:16:57 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so2871753pjp.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h2YEsqh1TPD237xTss37LW+PwWJGlnREYF1zjoniMAM=;
 b=M7t4cUZvTZy9nsHebdWgwz840O0OxS3DVgza8NMWa0o48nOVGCwNl5OEyExwgiN7Ny
 nSGRajvGh19C0MP8KuXTwdYCZhsGQ+J7ht7Fs31EZv+k2lWesnvCGqlnzQlUN5Mrn8LH
 cm4en0chHLHi78N06KFwA6tvxikpoqo1Kdn7It/6D248T8hk+4LfBfgW/0l07KXivk3u
 qdNFmJ1wfvdtbbZlMSDpxMLjPEphT0NH4pXbvHCryQreVtdYDXVD9NytzdFEkdoeOJYL
 OqC+zl5T5ZEKOY5hf8G3hLTO2nGXL3gjYIgq0A0VlCBw9Vmbv7TVza7kN+ENOIn2uwNy
 LRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h2YEsqh1TPD237xTss37LW+PwWJGlnREYF1zjoniMAM=;
 b=KEBn+/CY3Sd5/u6bGr4sRt8b6TAffT5z6Ft0CEtrNDwk/X6tG5jUEUM7BAoHgfxDAG
 pe4xGaQiUM9sshPuawQ6mRwgV/P9O41uBda1nAgYpOo+Kxqda4e1Fx56CWhv1bvtEOq8
 aeK14ZQqBSfTDVItnxZrSInRgT2FogWM6ViGP8gsYQP63MokQVYuuEoO0de90/Vgs06y
 CfSaj0J+gNX6Ya8ThzGlAVV4nkeVpnn67lfR2t2FMxrXMqyhpUNBBsokz7ztNMVZiK5U
 iaVYm6jAbEU9bn6R0wX9f7uI1QmwVArM2wMDmhsD0y0mJvKv7s4uzrYfc1y09QyU1qMH
 a/Fw==
X-Gm-Message-State: AO0yUKUY3YoFQuyNZ/I6daHUqiafHrb5QuvwFUHwFlUZpdhoKn6xBFX/
 wQQCR9HMkHYaBNJS35zFNrrK2w==
X-Google-Smtp-Source: AK7set+zdhH9KvUEKdfAuEX2xOYNcrBI+owX2h10UY1xeR2BYoHPaEKfa/rJxMcyagUTDMTS3TRF9A==
X-Received: by 2002:a05:6a21:9996:b0:bf:a5d1:1c6c with SMTP id
 ve22-20020a056a21999600b000bfa5d11c6cmr3666561pzb.56.1676488614240; 
 Wed, 15 Feb 2023 11:16:54 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 t6-20020a637806000000b004fb71d96d78sm7885603pgc.2.2023.02.15.11.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:16:52 -0800 (PST)
Message-ID: <1bcac62e-b720-fcde-444a-1f677220bf3a@linaro.org>
Date: Wed, 15 Feb 2023 09:16:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 15/20] hw/ide: Rename idebus_active_if() ->
 ide_bus_active_if()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-16-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> idebus_active_if() operates on a IDEBus; rename it as
> ide_bus_active_if() to emphasize its first argument
> is a IDEBus.
> 
> Mechanical change using:
> 
>    $ sed -i -e 's/idebus_active_if/ide_bus_active_if/g' \
>          $(git grep -l idebus_active_if)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/core.c             | 18 +++++++++---------
>   hw/ide/macio.c            |  8 ++++----
>   hw/ide/microdrive.c       |  4 ++--
>   hw/ide/pci.c              |  2 +-
>   include/hw/ide/internal.h |  2 +-
>   5 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

