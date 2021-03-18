Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8EC340F82
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 22:03:17 +0100 (CET)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMznY-0002I9-Kh
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 17:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMzlo-0001c4-GS; Thu, 18 Mar 2021 17:01:28 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMzln-00017V-3r; Thu, 18 Mar 2021 17:01:28 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so4138399wmf.5; 
 Thu, 18 Mar 2021 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1LqS30Gxc/TZvF/u+w4m5Z7AV/teNTprrXJNUbCzflM=;
 b=j2zPtt2hk7NOFCRFlkGTJu6TI9dqLlXLuahp1aaDaQS20IuDMuHHPe1TB6VaQmzQ37
 /K8+reLwxarmoBqMZiTgEE40QWDVMzoG+JyD7FglBpLHxgKlmbeg/W2a7NxEdyZtzpfv
 neka29racE7+hFacy1zgFnFrc9E3I2KpGKFTT/4vxkox2Xw38aQisqBObrNSAtvgD1f6
 HRaPRs+QLTIHbynUXkMFS0sgqz1P3uy1uPTV6NoT+4zUl6KfEL70PcPriBxChe+CG8Om
 6nxwkkdacc39qtYzlOAsPYzUGJHlh/ahNcfJLzJzWGdsIAERYYHd8ik/TUrxaHFU+SBH
 0waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1LqS30Gxc/TZvF/u+w4m5Z7AV/teNTprrXJNUbCzflM=;
 b=XFU1sz4Q9GlzyyOL8OpnaNmHJuLcROLh1tIBAtN+/vrJ6JS67Xo0EcWfoq5Gd08T1/
 tWif+e4HtlGmSLh9LDwCiwWHEhxVpf/NWF4YXDURYnn4FirQhIjbjHVR8W3sRBrBZm3G
 PYdBCuDVvAxJPmcZ5w11fl61dZUi2CUGhx/+WO2MpecHyzHYGPXuJp0KoxSGSxS+myqu
 d2yuo77E16yERAP3CsA2XLMr7EnGc9ESUqi1/wjWr0ttagf7mSPjoRypzMYCthH1GPKF
 +p9n8UvitKm3tzcCOLL2eI0/qebEbSdE0zMCrlTgY5Io65rcdHwLimpqSFjXRY6cm0ti
 FvoA==
X-Gm-Message-State: AOAM531gk+CAwdNhgYog5QB4Fw1m01jCNOeAp8Vz2gjMlVIsK1x89gw2
 qM6EnJL0418e1rHJjU57H5aM+6GcMSqhrA==
X-Google-Smtp-Source: ABdhPJyAx1NvvaCG3orI5N+zzQrwaz+ztIX6cAri7B1R7fgPF/Ctb+hO2XoUJwDssSlHg9LHAl+mKQ==
X-Received: by 2002:a1c:e244:: with SMTP id z65mr883681wmg.130.1616101285315; 
 Thu, 18 Mar 2021 14:01:25 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n3sm3558243wmi.7.2021.03.18.14.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 14:01:24 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 3/5] memory: Add offset_in_region to
 flatview_cb arguments
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6b65b4d6-f1dd-928d-a5b7-88e4558e7d57@amsat.org>
Date: Thu, 18 Mar 2021 22:01:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 6:48 PM, Peter Maydell wrote:
> The function flatview_for_each_range() calls a callback for each
> range in a FlatView.  Currently the callback gets the start and
> length of the range and the MemoryRegion involved, but not the offset
> within the MemoryRegion.  Add this to the callback's arguments; we're
> going to want it for a new use in the next commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/memory.h           | 2 ++
>  softmmu/memory.c                | 4 +++-
>  tests/qtest/fuzz/generic_fuzz.c | 5 ++++-
>  3 files changed, 9 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

