Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2E1609A78
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:25:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omphA-0002Nf-VG; Mon, 24 Oct 2022 01:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omph3-0002D2-Fn
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:08:13 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omph2-00084B-0D
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:08:09 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bk15so14300090wrb.13
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v+0X4rpcNMHjcPtPL+w3aiM9Cuf3a4hHptoWFH+xApE=;
 b=Kg4QTrbI+t49MXd0UMkar5gVlvBKVdNUIV3a583c0R1ZN0ajDfENfEnH1lN/nhXsr4
 +1NhvBf4bqRC4BGctxGbMpgwfzfFJ+pP9h71oBSTb1HzGXJRlwstDsQka0RUnaG+c/Dq
 Lgy/O8h2p919Fz4DSXtQY5i5GKBOx8Ns5AnrjYQNiL3jc+3u69Y8k6Joum26xKPjUvP3
 czxaNgxn/Mi5ebNmRdYVD1DGhZhU/qLyNtMrV+D/R4L0wDbjDGgJMudesm0muhvwNj8i
 5yPZEmE1+DWm2e8Fgsag1lFAurjIWS75uIJb/sP7kUXmXEdIzr7Eo69WVcgwBcEI7zZT
 vNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v+0X4rpcNMHjcPtPL+w3aiM9Cuf3a4hHptoWFH+xApE=;
 b=lwgGk82sobgCPseBthsCm4sgIV4wHNQNIQxU1aJnv+kisvdJES5DJvBA251DgLgE5T
 NyPOUIOOZEvSRW7YgNXYYZMVaBNs0CmCUxCyb3kEykZvPzAvMflM6sguVm4FW0q/oQ/z
 /C2cYcvIO4hniyjYqz8EmxczpjG9Ggw3xv02lF8f6WG+mN9UYeIOPzAxABIp/7JnwvxA
 PUsnE8zkGPFcvFZvp9CxnvSr6SLujFvpVGFv0Z7VQc9Hdja+odxoSzY9ry5CQRIte2OJ
 HJbAtieuUsfJtxUVpKNU7qyMzs0Ryj9n3CMRAsr/5GGlziK8OcoTyarvxeR4deKXtCSY
 viiw==
X-Gm-Message-State: ACrzQf03ISDIKgkAnKlcKGrBkG/Fpad+nhb+vmZQHiEn+eJf0AAVIHhS
 qa/rhjwrFH+3IWI0gp2ypp8FiQ==
X-Google-Smtp-Source: AMsMyM4mzaP/H4kQ7MC+wH9nMcB9GR6n9UT81mikVsu9F+iR3JyCGU/zjKhyCxxO37lJuMDaEGHYJw==
X-Received: by 2002:a5d:6da7:0:b0:22e:3edb:e372 with SMTP id
 u7-20020a5d6da7000000b0022e3edbe372mr20295368wrs.137.1666588086662; 
 Sun, 23 Oct 2022 22:08:06 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 bs14-20020a056000070e00b00236545edc91sm7952119wrb.76.2022.10.23.22.08.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Oct 2022 22:08:06 -0700 (PDT)
Message-ID: <9ff48db0-de07-cceb-8f4f-90a9d6b4da52@linaro.org>
Date: Mon, 24 Oct 2022 07:08:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v2 22/43] hw/isa/piix3: Rename piix3_reset() for sharing
 with PIIX4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20221022150508.26830-1-shentey@gmail.com>
 <20221022150508.26830-23-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221022150508.26830-23-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/10/22 17:04, Bernhard Beschow wrote:
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


