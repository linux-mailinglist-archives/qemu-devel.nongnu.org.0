Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71C03BD51F
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 14:18:18 +0200 (CEST)
Received: from localhost ([::1]:58212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0k1p-0003Xe-AT
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 08:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0jxz-0000wO-Na
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 08:14:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m0jxr-0006Oe-Jk
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 08:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625573649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZSJ5yDtmPrUJoJ7TeNVxDqQ5Ol+eC5DmPRhJA7vhbs=;
 b=c2oSbGg1w8sDwawfiC8DjBmPTIgDlQvYWv6NAu2xTZFzhFLnAIj65wYbqpBMVl/NLVC2bi
 baRoJE8pMmOgIgkeyGQmtT87ssQp4siMfnr790vJSlFfFJlw99KwkQTd9qzgEYuT9jJT3M
 Tagkm49guPtUWGqLdInEDbPx3CBJ8dc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-4RYATbZaMyOm-R4yOv8nfg-1; Tue, 06 Jul 2021 08:14:07 -0400
X-MC-Unique: 4RYATbZaMyOm-R4yOv8nfg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so3626849wmj.8
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 05:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FZSJ5yDtmPrUJoJ7TeNVxDqQ5Ol+eC5DmPRhJA7vhbs=;
 b=BNilV56lwrd+vXyAEyUaMq2KCApjd8rQBTLowr5Bn2Xmvfi1UjhSdiFL0+xVsZEAi4
 BKag/LvQKfIPSE8tiJizZlAbpcVj6f8JUOVTZ632/lRYXmgcwax/eLcVzpelhMb/zaY4
 EHRaTQ2xz9uLGlpfdzZe6FIQ2esAXkztkYt7ZU9ZoyW9ybw5bSjvEG0xOk0WsT35EndH
 LAIX4u8L5mq4vE5N0oqdOSPWZp55hArQlmyJBGm3WwM8jdvdHD2K++7NYJaXTTveQv60
 DFb+mKIcV5bmHkAe2+3Tfp4hnQvg+o2pqkClWuItxP9qhQBFxRRBod395cfnCsz7/gC9
 rYOw==
X-Gm-Message-State: AOAM533/3iCSO4LUtmxPGbGJwR7SjWYAbawVPLfjewsyhlV+/pkgKVOm
 KafkDqJAngewkLF+m1m4VoozGIMAg3axeG9hS68DsVBsMIoyaKgrQiHxAMAwxS74RxzZ+ZVSb1X
 5Jyz9SDATp2uromI=
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr19801539wmq.140.1625573646220; 
 Tue, 06 Jul 2021 05:14:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD2RZGF/F7MKb+JF1gDwHR4jWB89rDeUJ+MQ7f5H5ipcp4V4LspRCZQTQpVdfCIBiWn6zRIw==
X-Received: by 2002:a05:600c:198c:: with SMTP id
 t12mr19801525wmq.140.1625573646036; 
 Tue, 06 Jul 2021 05:14:06 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id b12sm12441008wrx.60.2021.07.06.05.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 05:14:05 -0700 (PDT)
Subject: Re: [PATCH v1 3/5] hw/arm: move CONFIG_V7M out of default-devices
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210621152120.4465-1-alex.bennee@linaro.org>
 <20210621152120.4465-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cb956777-828c-0b29-66ca-f356d6495fa8@redhat.com>
Date: Tue, 6 Jul 2021 14:14:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621152120.4465-4-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 5:21 PM, Alex Bennée wrote:
> We currently select CONFIG_V7M for a bunch of our m-profile devices.
> The last sticking point is translate.c which cannot be compiled
> without expecting v7m support. Express this dependency in Kconfig
> rather than in default devices as a stepping stone to a fully
> configurable translate.c.
> 
> While we are at it we also need to select ARM_COMPATIBLE_SEMIHOSTING
> as that is implied for M profile machines.
> 
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> vconfigs
>   - cherry pick from re-factor
>   - minor tweak to subject line
> ---
>  default-configs/devices/arm-softmmu.mak | 3 ---
>  hw/arm/Kconfig                          | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


