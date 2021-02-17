Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926231E18A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:38:34 +0100 (CET)
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUWn-0007iH-9S
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCU69-0007oZ-Mj
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 16:11:05 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCU68-0003OD-29
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 16:11:01 -0500
Received: by mail-pf1-x429.google.com with SMTP id w18so9237656pfu.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 13:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UJh9+zsFqIfXm8HfpSKSK4P+6q/PwEQrbIp5RulXhao=;
 b=mnytdOEdaU36WAv/8ysQX/M/Aa7CDjv3f9oqUz41fgBZ6gu9rd+icEx4lQqr61ENMl
 yRLjy3ofQp3WLvJxfraV/m3lb+LJbtWA71HeNYXl7EA1g0m4q4Hy+FwQYEcAjFxRFu6l
 cy5XHMqFNWr9MK3Xhb3KqxP/3L+IhiZHFzE+vmCVGPTrk0pUhqqk9qWlxGCjZPiw2xgx
 7/gid2C6yKj8ZODicL9bC8S6TCgT5/+hDBaRaAo5YqOUXtzTEVcBeFp8UoUaF0OYC2/K
 q0GWICIKonUOAi5NuVK30spoQ6ESFTD3mrdQv6DsqP2WZZyniHH3LsLsGmQBoBuIg+Op
 4mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UJh9+zsFqIfXm8HfpSKSK4P+6q/PwEQrbIp5RulXhao=;
 b=tY/f5fc2J5VOxoCHSlWO5LKN+yJcLx+qgPL4tx/gWA19vEfViYxXp18isJHYDAwe9n
 bPAGQcryD5TUuEn/447xbLKUevUMeNGsPsVj6ZevF6N7t3ZtnTc5ztnRz4fcXn9B6meR
 i0saFgsyCEX270i4htJBWZ1shdHzQJhaK0/MVs33CqoWmIvIHwak7nVEwULdGEiDJzXV
 aflWD/JHMIrurADW0E9153PnzPrKRIku9tI1ZesOzMfPZFCBw91dv92yDccfLtLo3kRb
 2miNgta0GAatLc7uqlPD0XR7fWXdeTcsFs3DyDGQga6NKJgcCoAGaSxWz2W6fJ+/cGYI
 58vA==
X-Gm-Message-State: AOAM530JAjLciJtSPX/trUSkHAOzGpCRJRZfQ03tmKEphPIFH2cuPlj+
 ntuUgaTANBgfmraCMf8CkGOcjg==
X-Google-Smtp-Source: ABdhPJyJtG19GpofsWCAe9xmC/78LKfAgfkREYJVcp29oD1PAmUFRkWRvYMsPU8dKWFSSGsyxJpTMw==
X-Received: by 2002:a62:16cb:0:b029:1da:358c:4338 with SMTP id
 194-20020a6216cb0000b02901da358c4338mr1104901pfw.36.1613596258679; 
 Wed, 17 Feb 2021 13:10:58 -0800 (PST)
Received: from [192.168.3.43] (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c22sm3269249pfc.12.2021.02.17.13.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 13:10:57 -0800 (PST)
Subject: Re: [PATCH v7 30/35] Hexagon (linux-user/hexagon) Linux user emulation
To: Laurent Vivier <laurent@vivier.eu>, Taylor Simpson
 <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-31-git-send-email-tsimpson@quicinc.com>
 <92ec87f8-55d6-5b5f-7a7f-e8643e49c54f@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2456d0e7-25e1-2459-1c53-7c02c5d85f1a@linaro.org>
Date: Wed, 17 Feb 2021 13:10:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <92ec87f8-55d6-5b5f-7a7f-e8643e49c54f@vivier.eu>
Content-Type: text/plain; charset=utf-8
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
Cc: ale@rev.ng, alex.bennee@linaro.org, philmd@redhat.com, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 12:15 PM, Laurent Vivier wrote:
>> +#include "../i386/termbits.h"
> 
> should be #include "../generic/termbits.h"
> 
> Acked-by: Laurent Vivier <laurent@vivier.eu>

Fixed against the v8 patch set.  Thanks,


r~

