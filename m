Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AFF649C41
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:34:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4g8F-0005a8-5Q; Mon, 12 Dec 2022 05:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4g8C-0005XF-D6
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:33:56 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4g8A-0000EA-Hr
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:33:55 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso3180627wmp.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 02:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mhFmygMkgDft/EAWcIzdAzg+GlkiILG91u5Wlwxqx/s=;
 b=F8hDNHlUmWoATP8cCbHDxChAwFSYOmTn2dVNpWC59baf3MG6PXnMySbvbh4t0UN1Aj
 aXg6tTm9eDr8jNgKv1IhIEts4j4I067SsVawZaSOUkb00aI6h0CljJFxOQWXz9Pumqwu
 S6gWew3t1G3bdtIbMXx2PaSNCX/7Ce9pGUzb2OuD0aJGC6Z7PX+OQd0v6eIH7VRjFN1b
 FMAKUb3lGtMBaihNAdl78sO39A5XApuvc6JrJJRPixwZns8aoLa+SgBrLwcpZG1SAuD6
 vYJX2Gk+WuazQ4MZxU/047XK3wKCyS+pUS/i9nmfDWjd7XYFs8vTymcY/OZykb6EQpAU
 MmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mhFmygMkgDft/EAWcIzdAzg+GlkiILG91u5Wlwxqx/s=;
 b=lTMx2ybXo/BlsTggXOMQjGbpo2sGVN6KurNO+AMPQeo70uGbfZWCE1lXB2ygvzi/OC
 jhXCDOfqjgQYhA3LQsk19uURB0cGQFFExwTNiMxsRYJYzJ08r0t/tykgQ6rcfDEP9AWu
 6q0qBsgPQVyVqX/NpQ1+cb4kKiJ4LWbIciP6vdmBcso8vEYoLWxX5qpHYOk+iotcKcSn
 MBVZQ4UWKSeWgZIr7a+z7tVPDtyDH5yo1bYxZP3VF1hTZazksYokWNeBqb+pO9XkKHE5
 DVawv+PQrIr2+Btc6TKRcpB+mDf5DrFIHEQaKIH2507RbikjUNd3VicLXndBfNg9DsEX
 l8TA==
X-Gm-Message-State: ANoB5pkCbv+lRK7YoQ20U/CP4lyqBjyG71p3dyQprI5R7krVv3EUWwNX
 m7VH1Twu1NhcF5fqBnKqR2zoNg==
X-Google-Smtp-Source: AA0mqf6O1VnpLtDm5ALpK6wGHD4nLng3SaqQqRNoi0C8KvmlOu8cwZq3QCCkYzLKrTWBUoYldPGmPw==
X-Received: by 2002:a05:600c:1da8:b0:3d1:e04f:9bf1 with SMTP id
 p40-20020a05600c1da800b003d1e04f9bf1mr12084394wms.35.1670841232769; 
 Mon, 12 Dec 2022 02:33:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m37-20020a05600c3b2500b003cfd4cf0761sm9725935wms.1.2022.12.12.02.33.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:33:52 -0800 (PST)
Message-ID: <cbd4e230-5887-d12f-ab73-a7d33380d960@linaro.org>
Date: Mon, 12 Dec 2022 11:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 3/5] hw/acpi/Kconfig: Add missing dependencies to ACPI_ICH9
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>
References: <20221207231205.1106381-1-shentey@gmail.com>
 <20221207231205.1106381-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221207231205.1106381-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 8/12/22 00:12, Bernhard Beschow wrote:
> ich9_lpc_realize() uses apm_init() and ich9_smbus_realize() uses
> pm_smbus_init(), so both APM and ACPI_SMBUS are provided by the device
> models managed by ACPI_ICH9.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/acpi/Kconfig | 2 ++
>   hw/i386/Kconfig | 1 -
>   hw/isa/Kconfig  | 1 -
>   3 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


