Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7993331A61B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 21:37:15 +0100 (CET)
Received: from localhost ([::1]:60658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAfBi-0008A5-JY
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 15:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAf9O-0007fD-4b
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:34:50 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lAf9M-0003X4-KU
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 15:34:49 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so808634wrz.0
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 12:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wf9a+438uUKdV+C2ByY9TeaK3dLZXVjyxza/PPeCc/o=;
 b=aH20RORXjSghRpa4AQsqcfpfFS9szY8E0DfVnZ/hzEI0jUujydbhvnsvk2zz1kH8zK
 VcPX6uuGhy2ES+CSxCSn428n3ZwcSKjUJhnF0v4UnWPTdxv0Jwopsb95nRbo8RAIOaoP
 5VAfBqH+/bdSSLTXdmnNBMfx3VOuB9Zdcff1iJbDdxQnY710q/Cb+IU/EhgomfTa1qNh
 lRQlCcRpjm8L10zT7vMTf0R7LTnDeXn7cUhnD/b8s16tzt/ziu2BqwljoushgS2XxYKh
 1iswj1RXP5xDrg7V2PxK2pWvpN0zOPGSOK5kPnVDh/omwDNkTshob0g3OTWkTGydAxFp
 AKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wf9a+438uUKdV+C2ByY9TeaK3dLZXVjyxza/PPeCc/o=;
 b=Jb0OynXaDO3fhWPxgcDqcjLTTmDYoqxq+fJP4V6LUhrAmbGZjPLHYpnqrz3B3M/0pG
 NtPWwp98iyTaj9buKXlFBaEY9K50rRMXFgSQ82sPKT12DKz09TlvF3qVP84r1Uj1Z8UB
 hxbplO6+ucHKyUJe7JyzXxBxVbZeDHShNd/RC5A+BlxxEl+o9L4/DfeAayqiFRsQAY+s
 LFEh9V9sD10vbQb2RXKbCmj5IpSrjE90qOyVDLdiEBxXNVWRVDzUXaH5PaHwAOaY+PWW
 K8UGeo5I4f7RbxBsEY0dzLsehY+EDT5iTsMPcuTE1xgFe26z+dntWEI8NEO3z2vvX/FE
 rWbQ==
X-Gm-Message-State: AOAM533su42wuiCWnUFqrmWbKg0gM6UEnF9kv/DBoOsLzyMkg/47tAHo
 ifrY+NAcTyGIYtIXC1sWtyQ=
X-Google-Smtp-Source: ABdhPJwNoskmapXAUI/OXxBh6rv7d/1n2c5o+z5Z9exH/Bz+jB8r0h92aflWX8NXcSkS+fABlrJD/A==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr5608017wru.111.1613162086930; 
 Fri, 12 Feb 2021 12:34:46 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm15304626wrs.45.2021.02.12.12.34.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Feb 2021 12:34:46 -0800 (PST)
Subject: Re: [PATCH v7 18/31] linux-user: Fix types in uaccess.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
 <20210212184902.1251044-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6fd7bf80-08dd-a446-6d41-d94a9bbd1b47@amsat.org>
Date: Fri, 12 Feb 2021 21:34:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210212184902.1251044-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.119,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/12/21 7:48 PM, Richard Henderson wrote:
> For copy_*_user, only 0 and -TARGET_EFAULT are returned; no need
> to involve abi_long.  Use size_t for lengths.  Use bool for the
> lock_user copy argument.  Use ssize_t for target_strlen, because
> we can't overflow the host memory space.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/qemu.h    | 14 ++++++--------
>  linux-user/uaccess.c | 45 ++++++++++++++++++++++----------------------
>  2 files changed, 29 insertions(+), 30 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

