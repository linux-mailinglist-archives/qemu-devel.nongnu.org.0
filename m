Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4458444EA3
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 23:41:40 +0200 (CEST)
Received: from localhost ([::1]:45850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbXTX-0005Y7-Fo
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 17:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49722)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXHr-0004xC-FK
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXHq-0000jn-Cg
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:29:35 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:38395)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXHq-0000jO-5x
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:29:34 -0400
Received: by mail-pl1-x643.google.com with SMTP id f97so72920plb.5
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 14:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xliFVyd+L1z4t/SGEf7l3fazrap3Sq4RK1AsGcXYU14=;
 b=WF0fLdjO/u4RlMUDYj4nwBGuLbz2JknqUCaCVGq3CmK4yLs9ulXXW19ifpFl2+hVke
 2dmv9b8CgnfZxtemLv2U97byVKfklbh62Q3O5m498OVOW5eFmUE9fc6ogKwbYDj4MYFa
 B6vzvnd1dYkhuMr9jdw5Szs6RP0F9m/whgD4RgcvzAHFhPd+982cOGo5HeRenDrC5D9/
 7hT/9FwY6Acr1fjvPJONQ39zW/q+Kn/y7vaujTUiFxYjHtOoZkKI2NLjoKw0EmDBT7y9
 G5XgzAyy8h8om7OHB6wryzRJ9Y8x5wX8ZyarfoGmj00Qv8ZHzyvDwPqXCHCQSB47Jfmx
 2x8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xliFVyd+L1z4t/SGEf7l3fazrap3Sq4RK1AsGcXYU14=;
 b=I1GaAXmVKUGciEWBiZr+xKAbmoib7XYHMPCY+x5JoIGc4NyPJTSD/Iaw8N78mW6wne
 NHm2dNbdYCy/aod/YqNgDAQ17JFBBQznJMPmddPV+34mAEtaI2swjBqspx6WF/8e0Pyj
 4GwDV3n1Gz9CjuD40mhvOCEMDmxp0Zj/SI4bGuvwJQ8gWussNdHcowBMUNa4AyqJhgwe
 hqZdIJ+XMiSFlYp+xXJTOVRSFCUCfPULb0WwHr3fuYwSaeuCNfIFfuXx7/C5S52D3pkQ
 NnP6eErcKhJbtB7TFnywiRJTBaeIVJoqXTm7zVuhcouOPYR/yp/U+W7Autvy1P03OLX1
 EGjw==
X-Gm-Message-State: APjAAAWqgvXnhrP8wjv6gPGxVM/VzfGknrsYsPUBf+pKvhgm1N5zKCZf
 i51QFdK6hIzvah9CTVcsYfnc3Ek0aK0=
X-Google-Smtp-Source: APXvYqxMbtdUKOLMwc2OFHcA2ngCOtXMxqMb8+tbKCQHZ066OGFLDPH6Ahwnm1UxyrQIWHquWP+bfQ==
X-Received: by 2002:a17:902:27a8:: with SMTP id
 d37mr90318116plb.150.1560461372860; 
 Thu, 13 Jun 2019 14:29:32 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id b17sm658899pfb.18.2019.06.13.14.29.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:29:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <dae3bc40-576a-c592-3bd6-c30e2938ebd8@linaro.org>
Date: Thu, 13 Jun 2019 14:29:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH 08/12] target/arm: Stop using cpu_F0s for
 Neon f32/s32 VCVT
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Stop using cpu_F0s for the Neon f32/s32 VCVT operations.
> Since this is the last user of cpu_F0s in the Neon 2rm-op
> loop, we can remove the handling code for it too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 82 ++++++++++++------------------------------
>  1 file changed, 22 insertions(+), 60 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


