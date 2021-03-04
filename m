Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6332DB75
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:53:56 +0100 (CET)
Received: from localhost ([::1]:43728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuyp-0004m4-SZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:53:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuv8-00009x-Hu
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:50:06 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:39142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuv6-0002PW-JM
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:50:06 -0500
Received: by mail-pl1-x62e.google.com with SMTP id j6so3287578plx.6
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Jrxs1Pdwpo4GE5AjWraWRxP73dsGn+r9ZABbTNhRmZE=;
 b=XDkFgw+FQvUzXTBLTpCw4B2znOUwlSnTZGDtRG9qz3O+Qenjpll69Ec46oHRYny8DQ
 yRVRpVhdYeq3+/QZwtHyjtDO48qo2lj9m9X4RJtTCaFgX2tuH1cdjekxHQTmBmz5KJXP
 hq+wxAc6RTGU08yIGKx84LbBMTm+fyhATAJnN4tBL7sEAR6B0G2DVhNQWM8Y3QaJRFfq
 4TUSDCNjqCGmlcLLZ/DvEUGeUSvUuxRg4VTKpWQU6tk7am6n5oD1bk56UOylM0ixZAij
 6yxTgJkZn3uNObRSf11guAH7phNJWy9STtoEpflsN6sh17OVljamF2bliGNKfgmT/jK3
 3WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jrxs1Pdwpo4GE5AjWraWRxP73dsGn+r9ZABbTNhRmZE=;
 b=JX2bGZQZKTTR7QPxRaEhN1cPRuIWFdLu5nzLx9IpAglLxhdS/+KMIq5yvN2Pz1jEPS
 XRMbUxCn9/hSkJsLZm/ssvb/evr/jUD9wPlF5rQtQBN7MeCLuSGFWOuy2Prx1TRL9uz6
 JL05GafW2un1sggsLpALSyCPrZtWwx6cI0TYjHD4kabGKEr1GrhyL9DptBMMoP6MIY4R
 wTrT54ysQTjeIA3DWi2kb9KvEio/q1LVcPTaXCBwgBfY6hq4v5n9hMT5JCVCaUg8RwZR
 LNuhxHQaDaTRxMkicUYIt4TZBAI4IFi1MqMz59jILaKDxtgI8EayH1LhSs3JGKL04siJ
 +csg==
X-Gm-Message-State: AOAM53194w5MNrV2OSAH9Hyo6Rk+P/BF67UYkjZBCD2STElgEicmPG99
 aqN7HsCvm+iaC2P2kKbY97iqX/vLFkMFFA==
X-Google-Smtp-Source: ABdhPJxyftU7zwUWd+Y21T3w6yfSMc/UvIaAzuwTmNWsU0xqPrj2ZNB+NpChN+H5ZQoBi+XSgunv5g==
X-Received: by 2002:a17:902:e8d2:b029:e3:c3e5:98ae with SMTP id
 v18-20020a170902e8d2b02900e3c3e598aemr5779208plg.78.1614891002825; 
 Thu, 04 Mar 2021 12:50:02 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w128sm264042pfw.86.2021.03.04.12.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:50:02 -0800 (PST)
Subject: Re: [PATCH 38/44] hw/misc/mps2-fpgaio: Support AN547 DBGCTRL register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-39-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <683afa5c-ad24-6caa-db28-6121651caee8@linaro.org>
Date: Thu, 4 Mar 2021 12:50:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-39-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 6:46 AM, Peter Maydell wrote:
> For the AN547 image, the FPGAIO block has an extra DBGCTRL register,
> which is used to control the SPNIDEN, SPIDEN, NPIDEN and DBGEN inputs
> to the CPU.  These signals control when the CPU permits use of the
> external debug interface.  Our CPU models don't implement the
> external debug interface, so we model the register as
> reads-as-written.
> 
> Implement the register, with a property defining whether it is
> present, and allow mps2-tz boards to specify that it is present.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

