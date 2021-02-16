Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DF131CD11
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:38:38 +0100 (CET)
Received: from localhost ([::1]:33556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC2Qv-00080A-9m
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:38:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC2LH-0003xB-Ot; Tue, 16 Feb 2021 10:32:48 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lC2LD-0001Yo-Cs; Tue, 16 Feb 2021 10:32:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id m1so14900040wml.2;
 Tue, 16 Feb 2021 07:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RNMcEp1f0vbr2+J7G22jgfhS4FYHSM2Gzk028fn5zAY=;
 b=m9KrRukH3rptF57RhFiv+n+WzxDdNdQa47B4WTLaViinMR3M8GCApI7bLfeumY1nGF
 wjZVLYxkK3g+V/wF7bywO6v8UxbRBjcPkTyI/vrVGHOYmbaqjO6Vn9k/P6LNZUq8jz/M
 kNXiFiTTQFHtdhr6Fty30YoFHNiktpqgB0xXBnx17pE2NWal5HkwXTEcSx5kuTbOmHE5
 H79YaBx5RhYMJYjBpaNChX2R7KFQ1qHBYFS7eUY1HbSuz0hVChubuMPdH0I0thN8fEKK
 RNIELQQjrdHUJ80Eqj8OCzwNPdOu5OHHDWy9l2Ntt4XSgf+MR7bTo65zTG6aGVfEv/Fj
 H0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RNMcEp1f0vbr2+J7G22jgfhS4FYHSM2Gzk028fn5zAY=;
 b=pu+FA8Tz0cs6vTJnVp7gAwGktZGPd0RyG4Kq8nTEXkHe/2Se7U7PBLo96KCCvc/pNH
 SjbptFpgIrqC26A8V/45Md60UD5Wd3EQE6I5HEEsPMEncc2gxAVnF2lC2s24Ov15aMfU
 L7gLW+aSH8Lqx7ggPIbL+fna4GXW4XSAMqm72wixZs39wOh9vQlyrIzh8el2+Za4O10z
 HTGfeeqrm3HivyXCDowMtFriE4oqv0qQzxeL1Rwg2MpQDFmXisWiDHfgtX4ItSrQkk3S
 crA9Q7sWGl86fwhVfSdkdPT3ltDc8YD98bmmwJ5Z2UQFxsLZpLu3wSGHCqxr8gcpBMWn
 RBAw==
X-Gm-Message-State: AOAM531N7Asso9BV+yg+KuCblgdEcCPzjhbZxHNedsOmuhAa/Pwg1ZAt
 knv8R6+cxIBIGGHX7rtlar4=
X-Google-Smtp-Source: ABdhPJyTPA1YREXpzS/Mk0UeWZo0ajT3KGlzg3tKiv59Wg7DOkADCUUmH3CoU3z9XchObNYST9ZAvw==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr3766282wmj.65.1613489560587; 
 Tue, 16 Feb 2021 07:32:40 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w4sm3755024wmc.13.2021.02.16.07.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 07:32:40 -0800 (PST)
Subject: Re: [PATCH v2 2/8] hw/sd: sd: Only SDSC cards support CMD28/29/30
To: Bin Meng <bmeng.cn@gmail.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20210216150225.27996-1-bmeng.cn@gmail.com>
 <20210216150225.27996-3-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2f922d69-98c2-4c67-a859-305c11215b47@amsat.org>
Date: Tue, 16 Feb 2021 16:32:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216150225.27996-3-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.19,
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
> (SD mode) and table 7-3 (SPI mode) command descriptions, the
> following commands:
> 
> - CMD28 (SET_WRITE_PROT)
> - CMD29 (CLR_WRITE_PROT)
> - CMD30 (SEND_WRITE_PROT)
> 
> are only supported by SDSC cards.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v2:
> - new patch: sd: Only SDSC cards support CMD28/29/30
> 
>  hw/sd/sd.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

