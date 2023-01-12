Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA586672A6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 13:54:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFx3w-0001nR-OX; Thu, 12 Jan 2023 07:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFx3m-0001kP-88
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:52:04 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFx3j-00067E-R6
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 07:51:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 ay12-20020a05600c1e0c00b003d9ea12bafcso11096300wmb.3
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s/hHhUzGA/RNf52UHfmHzkNBpR8Wdm5LS2lPjxjkQVI=;
 b=uqNDZKnAIeLS1g74e9GRErsld2/fz1e4XV+tiIXrsqKZmNrKBGjeXaH2BVLjcOSowR
 uYw8qtpVOh8noi1bZcFdcnIFf8AlsoMwfsRBaMHfrr88O6+fJ558VTBp10rQ2h1j/RaC
 nowwHuUkxh2CzrqQSlv/i89JwiBKwsx81gp55CH0EHbW2TBjwSWNEZkNWZb7C2Ht0AhB
 trkxPvEPlrWibGul2fgDJRU8lA9iFXUXdW/0pSmGYH9f95GirsFvo1bETA5OIVJzFTDs
 nHEIUPUvCzuCv1aAjfXyZCgWEQRY3ECu5EOxgE17+QBots4J5J+k58lxYCpgPZEokpY7
 zXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s/hHhUzGA/RNf52UHfmHzkNBpR8Wdm5LS2lPjxjkQVI=;
 b=dILrjEstyGsGYzV1/+SXzdFvH/4jGvOblbjU2hso6ERMHZVqSLUtv4y5GHzzSwuMtd
 ND9Zl12J+QfOp0CmNdbIOzzW8oPK0ePweR7BDOCLnOjSO5cjocFAVCddn3YIY9VWbWOh
 WEOz3R8FcWS3WRtQOxb2TC5k84WWTZq3f6p5Yqw2ceesAzCFMueklPhAY+qyqqxJlv48
 gzdZazjQAX/PrShds22W2Q49feo7HDqGVWe8dMowlZwyicd5/nm0Lp0ulTl/5mBig1B5
 wLKjd/D+fFNcZeN60GlYkYQbYqWEx9V4BPkL2kxgNJZHGYwlkDn4l+jy/D5ni2ELK4eH
 Mrgg==
X-Gm-Message-State: AFqh2koVCtu5dZtwSBYQT41hFq9SBRdGBbydQWJJ0RuhXYh+Nz0Ps3Tp
 dOgo5z2paFYEOhGcZ9UMZ0DDBw==
X-Google-Smtp-Source: AMrXdXvjYdxc6KeB5pp7BtV5YdvfcQG/aJtGgcJewIDDeTf/03dwAsIVP0QT8/QWD9yGrfDHApXenA==
X-Received: by 2002:a05:600c:44c9:b0:3d1:f6b3:2ce3 with SMTP id
 f9-20020a05600c44c900b003d1f6b32ce3mr65786287wmo.35.1673527913467; 
 Thu, 12 Jan 2023 04:51:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f28-20020a05600c491c00b003d9bd56e9c1sm20338917wmp.11.2023.01.12.04.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:51:52 -0800 (PST)
Message-ID: <861b7552-efc2-1304-a5cb-82e0d8d3cdef@linaro.org>
Date: Thu, 12 Jan 2023 13:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 30/33] hw/isa/piix: Reuse PIIX3 base class' realize
 method in PIIX4
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-31-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-31-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 9/1/23 18:23, Bernhard Beschow wrote:
> Resolves duplicate code.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-39-shentey@gmail.com>
> ---
>   hw/isa/piix.c | 65 +++++++--------------------------------------------
>   1 file changed, 9 insertions(+), 56 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


