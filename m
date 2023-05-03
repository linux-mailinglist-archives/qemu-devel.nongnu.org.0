Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651776F562A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:28:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9ir-0005B4-E7; Wed, 03 May 2023 06:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9io-0004xi-TK
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:28:30 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9in-0003uO-9w
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:28:30 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30626f4d74aso2761198f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109708; x=1685701708;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pb9ZuHVwIb5dS4B+4BgihKKNSZkQ9AbZJqo4HMGcw/s=;
 b=vhGsVqG3v1C0f97x8+FXwc0dstDibv+bMOs64vpUzVK2CgVhAGANJMe1eN56+ROMfI
 mKc8EuTX5qndI8xKHrR/G2ZN4v4kHYwyaucgCGzbf9xpQ5hhI3Bra1VUOKkd3T4USX1R
 oGHC7kM6p9tcDxjYFkXX54aiMXiQv9fLkk3/4lWOj/oThL0q3mMlgouXVmChRJgMuU0/
 kaQ5zeaGFjVGSZEXmK554kFxc91ATmguNNO+B80pq/wPJOR7a5TiZlwwMdJ0omhx1S94
 i6j+cIJrg5Az2W6hsgsl0QwPmoLxoVmRfCXAdumSqDANl6Qxr4fxaKrT2Tu3jP3tSo8A
 EbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109708; x=1685701708;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pb9ZuHVwIb5dS4B+4BgihKKNSZkQ9AbZJqo4HMGcw/s=;
 b=e4g158acBsTo5Ft0goyRLXBl4aewfOtJvxlIX73unt/3Ls4AuJ+VL3MGKHnQV4AnjG
 uQC+yVTyHh2JXfSA7SflC7IJt1hW/1WqPZ2jTZZIP1g9m/snndBtHVPTZj0xRtZtk3Ut
 Cj7Ff2p9lmK4bEs+MkX9mlNc7BRTsqx7dgstWK611pYiggjOd7/o/brSDIO85k1lVnpd
 ooPpisqtRNhHYfBWiphCcSVmKWGN9UfRDOKByjmR9Ptj3nwAOokMV+0IFNp0/jloBgtL
 nc6/M2oyyxoHVYTdSk5kxDxEiaI/MfYgbpMKfsPi6zP7ygo4H0AzzWZ57sMU4LYUEY0S
 feTA==
X-Gm-Message-State: AC+VfDxyUN3N6NrKcv7TF2qlQMSxvNcCXFJ2oiRewH8J+BfEhhIsVPmh
 UweSq/hBNUHzR3+OUjgP+bofMw==
X-Google-Smtp-Source: ACHHUZ6M8zigwLKuVstRngPlOjboISlAMH1xblecdp3W729DG2WaKpbtpG6aa39R5KvIGVJ1CUN/UA==
X-Received: by 2002:a5d:4e44:0:b0:306:3912:a7f0 with SMTP id
 r4-20020a5d4e44000000b003063912a7f0mr3776408wrt.50.1683109707916; 
 Wed, 03 May 2023 03:28:27 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a7bc45a000000b003f09cda253esm1449412wmi.34.2023.05.03.03.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:28:27 -0700 (PDT)
Message-ID: <fcc126aa-e805-3396-aaaa-7d499237dc27@linaro.org>
Date: Wed, 3 May 2023 11:28:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 17/22] hw/xtensa: add VIRTIO as dependencies for
 XTENSA_VIRT
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

On 5/3/23 10:12, Alex Bennée wrote:
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/xtensa/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/xtensa/Kconfig b/hw/xtensa/Kconfig
> index 0740657ea5..a54a9d395e 100644
> --- a/hw/xtensa/Kconfig
> +++ b/hw/xtensa/Kconfig
> @@ -6,6 +6,8 @@ config XTENSA_VIRT
>       select XTENSA_SIM
>       select PCI_EXPRESS_GENERIC_BRIDGE
>       select PCI_DEVICES
> +    select VIRTIO_PCI
> +    select VIRTIO_NET
>   
>   config XTENSA_XTFPGA
>       bool

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

