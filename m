Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C4041296D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 01:31:41 +0200 (CEST)
Received: from localhost ([::1]:40660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSSl9-0000Bv-4t
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 19:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSi6-0006VV-E3
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:28:30 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSSi4-0004xM-Sv
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 19:28:30 -0400
Received: by mail-pf1-x429.google.com with SMTP id q23so15595863pfs.9
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 16:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cz8bR9iSmkDrQdzuE3nVDgEDeLDAk3qM3aiw9kjycAw=;
 b=vkuDmCdsJykEwIMNrvLSUlMqhvJ8t/tXvGt9trv4jtxOJAGRWoIF/EAVzbBXKabwUB
 DCKYFGTgBGWMwxEfmWlNPClxEn+LCDZINjKXYcY9vxGdAQjZwE0k92KcHRqywTp2ySr7
 GTtZDZoEcVFqWaA4pL0wFklcYPl9ZXupfZwntNzg4J3qWgmqgrXxOnsr0pM/2ViDYV0E
 PWgyFZWwfClQso+y+Kk9zna+DsgR7GmacymdXACKU6w93xA0ONVyu1ng0XX0T6uZeZHt
 cJXYuN4gUGVfrhcr57v3QB1BvwaN/VCKMo+/V/Toe/Y1+ZpGLcVc5QUws4pPZfZMKT8v
 eToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cz8bR9iSmkDrQdzuE3nVDgEDeLDAk3qM3aiw9kjycAw=;
 b=3+OhinQrnw+y4JlfEKpuaVmIgLRiWeOX3gN5pyw/wutQ/B3NcEsw52m8aZzV1u2017
 K85ym3ylAwaoT/bbf0GSdVMdREJi7WjZn6J4zJ7p0PQPu7Jeyuvgzg2MQdCXQBbXOWdb
 lv/+VtPTLXJsEfnYLWWiQiAyf6Lxm1zMip9KJoXYJBQ2Dl8GodphxaNgI/+37ebQ7vLR
 MWP/gK91C09aACN1gZAgy7gFzgTxmexeB8S0Yn+ByvDCp7im/K2vRQdL9ZEInGcksZpj
 q60l/yXSwZgF/gqx7McgOmbBXFM5DaT8S2LFNxyMU+ya2KicyWOdRoV26qJN9HCiNg7E
 KjFA==
X-Gm-Message-State: AOAM532XkOLVdemA8hIMw7efPMTqbCIad7KEIpL67uIcWLIODc/xdH3/
 KKmPU+SC92KIoqAOH2o7VSS0GA==
X-Google-Smtp-Source: ABdhPJxtilTWPWAvIylMAhLweVfn8Wa6ALNYeNEgHRGeFbdWze+AtX7HD+YJetbv3a9JfLvFWR7Cgw==
X-Received: by 2002:a05:6a00:21c7:b0:412:bb0b:850d with SMTP id
 t7-20020a056a0021c700b00412bb0b850dmr27471702pfj.33.1632180507560; 
 Mon, 20 Sep 2021 16:28:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t28sm4869719pgn.19.2021.09.20.16.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 16:28:27 -0700 (PDT)
Subject: Re: [PATCH v3 25/30] Hexagon HVX (target/hexagon) instruction decoding
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1632173065-18522-1-git-send-email-tsimpson@quicinc.com>
 <1632173065-18522-26-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3904379f-9036-3aa3-1766-ecf807f41d6e@linaro.org>
Date: Mon, 20 Sep 2021 16:28:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1632173065-18522-26-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ale@rev.ng, bcain@quicinc.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/21 2:24 PM, Taylor Simpson wrote:
> Add new file to target/hexagon/meson.build
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/mmvec/decode_ext_mmvec.h |  24 ++++
>   target/hexagon/decode.c                 |  24 +++-
>   target/hexagon/mmvec/decode_ext_mmvec.c | 236 ++++++++++++++++++++++++++++++++
>   target/hexagon/meson.build              |   1 +
>   4 files changed, 283 insertions(+), 2 deletions(-)
>   create mode 100644 target/hexagon/mmvec/decode_ext_mmvec.h
>   create mode 100644 target/hexagon/mmvec/decode_ext_mmvec.c

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

