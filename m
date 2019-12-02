Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E476110EC18
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 16:11:49 +0100 (CET)
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibnMb-0005va-0P
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 10:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44196)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ibnLh-0005HP-Tt
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:10:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ibnLg-0001Vt-S3
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:10:53 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:40914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ibnLg-0001V5-Jp
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 10:10:52 -0500
Received: by mail-pg1-x544.google.com with SMTP id k25so2639386pgt.7
 for <qemu-devel@nongnu.org>; Mon, 02 Dec 2019 07:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4LtuvHrdNM3HYoKVotRcdu6O8PoEJJHbSkOX1onLScg=;
 b=IX7OPS9Clnw4llEJZqi7INbxDS0rEcux4JiGrblm5PhpInJtKTgkT50zkp//bE+oLC
 OeWaGig9S2GAI58JCAUIn2UdDrR/xu+mw44AmaH6k5DTcRLjhjvqZRVJUChRNjjEZkzn
 3IqNMCEt74TDktQx8uhrpMBBQajBSWtrttmIuq0LFFn4a7BsNuDoEPNit1UUI+78qF+F
 0elDP3x/Q9/Socdenx6tXnBltLiX3bd9hsAtm625MW5d10eHmb/crGuN9e5f0l7chEci
 nQ4Mddud01muL/QuvW2OR7aUxIV3SjWhipjSxPX8/no0mGmps77yCUIiX6NrnMiw0CmE
 NXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4LtuvHrdNM3HYoKVotRcdu6O8PoEJJHbSkOX1onLScg=;
 b=gwjDhPWyFgJvw0vrvp0G/wAxAA01cAvQUpk6xSvaj9C1Vv/BmEShCXb0br3yr97Lfe
 sGML5AbXXX1nFzzvweMJ43Sbc1Q4d2VtA9phwTFVmSZS5mrIzy6XH+ie1km4iT944MGP
 kdqGRLrYXrLfUhM3/hrJEab68ZUhy16+hco5BXI+IZ4DuT8DJKIqJw80GqpJf8sJ/P4W
 5S5U1J6k5aaRaouaJ9VYbt4wHTUNEJeW2RyMrLjWh26Vjuq0+jjUbXnjXSXNP/Q4np99
 5eVOnZhxmxlZvP8bTseLKveUKiwoS43UtIwEglUx0Ch+KMQ4gxvqCTEzKWz8BoSH+vCI
 VFng==
X-Gm-Message-State: APjAAAUL4Ly4pYc2U5k6/4yuai7AhVpqBk75eOpM4UXZPTNzQHPRJ8oR
 XRSLadqyLq8hcDdKbqgtDdc71A==
X-Google-Smtp-Source: APXvYqySd6q9PH4r5aJ4ooh2RxYENLiGwUlVlCK/pdU6t/wznrt1TM7FA0lPL8tHok7wS6Z1EqU4Kw==
X-Received: by 2002:a63:5c59:: with SMTP id n25mr12346348pgm.415.1575299451314; 
 Mon, 02 Dec 2019 07:10:51 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id w131sm13325568pfc.16.2019.12.02.07.10.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 07:10:50 -0800 (PST)
Subject: Re: [PATCH v2 1/5] target/arm: Honor HCR_EL2.TID2 trapping
 requirements
To: Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org
References: <20191201122018.25808-1-maz@kernel.org>
 <20191201122018.25808-2-maz@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78a7047a-bc8e-0a90-db9c-7f3a0d3d60d8@linaro.org>
Date: Mon, 2 Dec 2019 07:10:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191201122018.25808-2-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/19 12:20 PM, Marc Zyngier wrote:
> HCR_EL2.TID2 mandates that access from EL1 to CTR_EL0, CCSIDR_EL1,
> CCSIDR2_EL1, CLIDR_EL1, CSSELR_EL1 are trapped to EL2, and QEMU
> completely ignores it, making it impossible for hypervisors to
> virtualize the cache hierarchy.
> 
> Do the right thing by trapping to EL2 if HCR_EL2.TID2 is set.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  target/arm/helper.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

