Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235C83491CF
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:23:38 +0100 (CET)
Received: from localhost ([::1]:37514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPP1U-0002ZB-01
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPOzH-0001hD-PK
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:21:19 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:46862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPOzF-0002rw-6X
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:21:19 -0400
Received: by mail-oi1-x22d.google.com with SMTP id m13so1855373oiw.13
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cr3Sb45PRag70u2aHs+o1lwKdzMFvNo2dwoaSQ3fSgY=;
 b=CwhOIOzlqsGp5bii7XtbRARFEPczMKYtK6oC+x1LSeWsjyHatuVpdvG9b5izgBrFQX
 VD9J9623gXRegf0Ix24aXPuSZFH430l/E3rQWG8S2sG3D8lkwLHaPG+9QrIihdnwbMrJ
 utBX/UDnEk9jiz6zgUqa5DOG6qO70Bn0uCJXOYRqGtx70jaYbioPxBA887nqWDPoBxGw
 pcT/xNpPbe6wGcAB1KGK2row0w3UTbcrcrk5mv2Sa3+jU+4ycoIE5uqvhOHzrdAXzSPx
 a35OITrjknZeODoUTeCCMcaFc55wk09Il9eMC9+0BY4yJvtKUSM2mitFa2ZhdYoJrNh0
 f9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cr3Sb45PRag70u2aHs+o1lwKdzMFvNo2dwoaSQ3fSgY=;
 b=dBuckfqVxCufQAJLgd5zdm0YZCyk5JX+mAIhM5IpDNmvZlvdY92uoEYN5cKgrZD7fX
 FP4EmOhqcxZVGOJnEEFDqniGcUIte+Yy8GAaAISrP2VFzCdunKDUdfw6z4UeEj8VqMdk
 UWcSdwYb65yn4LWBXQUmbhiUFpptlUO+EESBTXN+P9Cw70gn+4ObOM9Nlu/am9NVymgq
 /lkD0bVxwUplsGAon5+8f9Km02s7KhmOUAEY/B8gWJtU2sRndnBLlu1Mv1FNkQaeTBpe
 OcR5qjFZoE0bdlij4lOVi8hMkDc/X4L6lvvdssir0CIr3ai2a9nI4IjV2kWEDFpHlYKo
 ojAw==
X-Gm-Message-State: AOAM5305UxR6Tg9twuWCHr7hUluwT1N0X2E/D9v1L84xEsmitQxbYLCH
 5WbPuQe6hJU9kTYbX15W5vU4hw==
X-Google-Smtp-Source: ABdhPJwXrf53JXkpcWYrC1LQzzu3DpP9cpAIPp3amx5Ttu39eZcqSV90F8BlrJZy03pGPHAIbvdclA==
X-Received: by 2002:a05:6808:252:: with SMTP id
 m18mr5793869oie.85.1616674875983; 
 Thu, 25 Mar 2021 05:21:15 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id p3sm1303890otk.9.2021.03.25.05.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:21:15 -0700 (PDT)
Subject: Re: [PATCH 4/6] hw/ide/via: Replace magic 2 value by ARRAY_SIZE /
 MAX_IDE_DEVS
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210324175438.680310-1-f4bug@amsat.org>
 <20210324175438.680310-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1726f914-62de-1175-22b0-b89d9a0e418a@linaro.org>
Date: Thu, 25 Mar 2021 06:21:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324175438.680310-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/ide/via.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


