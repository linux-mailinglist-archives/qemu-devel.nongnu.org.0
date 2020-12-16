Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1982DC5FA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:12:48 +0100 (CET)
Received: from localhost ([::1]:45286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpbI6-00087q-Ug
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpbH2-0007ft-RT
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:11:40 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpbH1-0007TL-ES
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:11:40 -0500
Received: by mail-wm1-x32f.google.com with SMTP id y23so3330241wmi.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pYdidEMO64K0L8F96ZsATuX9T2nfpTIncULIMJRvJKI=;
 b=Rcix18/8ImQqY7+948tQ3VW97HW/JHh/U8EBsGkP/6XRcV/YPsPwRqEBUp++e13iER
 qIWQeW2D5xHbwPS2VQ/QvUcmn4XM6ysCrG9t+pM+l4UfOXyio9Mq6MDR9YMeRkVY8b/M
 Ck9/Gw1eOjnkPqTk4QJPmBkJpdVWlJWhyP/ert++Ip6ytBkDsWnl2uaiept257+D3mgY
 1mp8W7gOPEDahj7wiU0b6v1YeVsi9yhlvpfFw5RT1kSSOIIsuqX5q6iDiK0jS9kGXBgP
 3T+1YOCShb5pfVmylTNL9sGjIvtj9oOUQF7MUK4MQnme1LcaDD41FQ+4RLvMH7BsN5MK
 p0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pYdidEMO64K0L8F96ZsATuX9T2nfpTIncULIMJRvJKI=;
 b=C8O8HAp8fredpF4cIDiO6VN/aDKI9qkXx6hLp81EowdTv1lWPSGiERnUyMUj5hOkXN
 MQddVoOyGrAn6ndscvuyNZ1MaUa9beD5WI9SrP6rZm4WOqm0rkcd82hxvQxGhGleQgoG
 zDKjqzs8XIKoFhJRch2JZhGufkhCNvLiOiv9uHqRap5GfC63yBeBet8hFb4HQG7mSRaV
 cJb0L2UIbXJ3thlemjeqQuPpzz7eloDcVn0ag9I1Joa7KUKLv730ckqCfGGMFU/rEFzf
 2Vy7JFCXoErc9g2bNbVM81fKT0lmkm7S2A7zsWJO5k23FsnFtLS3yV1heZQaG0ri++Sz
 iXcQ==
X-Gm-Message-State: AOAM5319A5K9q9eCUzab0mvAs1Rop85CZ2fS0itS3r52jVSY2RKASAzy
 mC2QLYC0ASO/OEY3FekWjQI=
X-Google-Smtp-Source: ABdhPJzIl5XiC7OHpGqKR2NFgcQjClDZWNLKBcl42n5L/MNhWYIoJhoHCEyCY0duWTqJtiA7+dA2Hg==
X-Received: by 2002:a1c:17:: with SMTP id 23mr4535550wma.35.1608142297466;
 Wed, 16 Dec 2020 10:11:37 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id d8sm3803960wmb.11.2020.12.16.10.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 10:11:36 -0800 (PST)
Subject: Re: [PATCH V18 3/5] hw/mips: Add Loongson-3 boot parameter helpers
To: Huacai Chen <chenhuacai@kernel.org>
References: <20201215125716.477023-1-chenhuacai@kernel.org>
 <20201215125716.477023-4-chenhuacai@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <47ebfcd8-cfa9-f45a-dc66-f936681fc5e5@amsat.org>
Date: Wed, 16 Dec 2020 19:11:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215125716.477023-4-chenhuacai@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Huacai,

On 12/15/20 1:57 PM, Huacai Chen wrote:
> Preparing to add Loongson-3 machine support, add Loongson-3's LEFI (a
> UEFI-like interface for BIOS-Kernel boot parameters) helpers first.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/loongson3_bootp.c | 151 ++++++++++++++++++++++++
>  hw/mips/loongson3_bootp.h | 241 ++++++++++++++++++++++++++++++++++++++

I plan to add these to "Loongson-3 virtual platforms"
in MAINTAINERS, is that OK with you?

>  hw/mips/meson.build       |   1 +
>  3 files changed, 393 insertions(+)
>  create mode 100644 hw/mips/loongson3_bootp.c
>  create mode 100644 hw/mips/loongson3_bootp.h

