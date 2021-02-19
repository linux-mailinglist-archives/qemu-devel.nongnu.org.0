Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0543320136
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:16:25 +0100 (CET)
Received: from localhost ([::1]:39426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDE4W-00015U-OW
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:16:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDE2V-0000PL-4m; Fri, 19 Feb 2021 17:14:19 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDE2T-0002lk-Mx; Fri, 19 Feb 2021 17:14:18 -0500
Received: by mail-ed1-x532.google.com with SMTP id d2so12297536edq.10;
 Fri, 19 Feb 2021 14:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yItVW+GGp1Yr8AcfF6tetuUkPWyNZdOJE4ZQXP/M7Ag=;
 b=G5ux0Kr0AV8Gfkcp7x0HeXZguanXIm1n0trS4vU2DXfZquYZCf/96MMVE3iM7N21FE
 jmgLLwcIkxBVQ9D5c61eqmnD2+2vKPfgWM/MpU/9Z5umVMxIHp7+d/tMk9CdD736DnXe
 QF0gBV5Bq4Tnu3q+//I1Bj9o5brJSpOh3D4Z9O/2jbTghmz3ijI+YTola57UAt5xnRZp
 cewX7kuxTUtr8pgY74q8ZxZhTHoCw1CT0daAGhSmrtXG8p9LXdSoBmRiMxANX//pnylt
 NohmlVzk2Xu+aoZlczawRJ8tSoxygEUq1RRcQgo6+l9yMV8D50Sh06IBhRSdfa19+DfR
 YYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yItVW+GGp1Yr8AcfF6tetuUkPWyNZdOJE4ZQXP/M7Ag=;
 b=phVUDZjX5qI/Ov8d9IXveHEGLydfDHrsNOzQy9rp7/2JaWB/JXOWOCQ6vuPEBtjkN9
 FQWWFbxdutEqwJ93zKHhcYk4Lh34xlDWwoM0BCHIA5/bkVHI4VTcMTpX2UWRNMzvIBSf
 +NaHg4qwKve6i83RVj0jdwA8oaD0h6bUqxuqub7pbn5LgtmMEbjEAPgrJ0q8QyNsL/l0
 0fdkuEMm5vD0xrxkN3HTgCtrLb036hgw/CPsAr6nnHlSFQXbR/hqKfu1gjZMwbfpdmY1
 1Y0PSvAHsMrjn2/sj9oWZzrWksvpNVJ80rcu7+0huZ2FilYfgBgV+JCZ+aQHr2M8Z8zD
 YdhA==
X-Gm-Message-State: AOAM530n5lfmmfeKekZW6A/asw0zpYLaYZGokMnfvi4K3gC8372ns06X
 tqOFiV0x6HRi5NRRC6sItRM=
X-Google-Smtp-Source: ABdhPJzE/ijJoUPYTR4WaQIojU4XOrc8kyZrm3lFSR8EJ/w7/0KLmWtr6fX/n2ucP/I14QebtzpL2A==
X-Received: by 2002:a05:6402:1854:: with SMTP id
 v20mr11142638edy.56.1613772855773; 
 Fri, 19 Feb 2021 14:14:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f10sm5886410edv.72.2021.02.19.14.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 14:14:15 -0800 (PST)
Subject: Re: [PATCH v2 3/8] hw/sd: sd: Fix CMD30 response type
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
 <20210216150225.27996-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <323e070b-7df2-3c32-f1e0-6c77a161816d@amsat.org>
Date: Fri, 19 Feb 2021 23:14:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216150225.27996-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 4:02 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Per the "Physical Layer Specification Version 8.00", table 4-26
> (SD mode) and table 7-3 (SPI mode) command descriptions, CMD30
> response type is R1, not R1b.
> 
> Fixes: a1bb27b1e98a ("SD card emulation initial implementation")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - new patch: sd: Fix CMD30 response type
> 
>  hw/sd/sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

