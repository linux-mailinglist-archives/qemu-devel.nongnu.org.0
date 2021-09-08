Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5BC403D44
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:05:59 +0200 (CEST)
Received: from localhost ([::1]:48154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO05G-0000GH-HH
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mO00p-0000y4-Fk
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:01:26 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mO00n-0008CK-DV
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:01:23 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1943547wmi.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 09:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6LeNwf5XH15FQjgitK8l0TeYqm5/YwJUfyN9VarTqtk=;
 b=nuWHtuHIUDIt59ePKxi0dCJub/SWvzMNEhPthYi+8Wujd8YuKr8RDvvKs78IytRf0i
 myaE4rJyA/MaxuuQIIU18qRZnrfEUiZW3xppDGRhF73sc0xtmn3hEWCF6l2hWLJV3bgZ
 IKBxwKPcvgHziyGUHDNjdybgFlOa/czdzVdx4RbFkySkTZMtC0kpiCz7DHqGtJygumkO
 2qstz6qBIgGTRokCE11Te6YBcgZkPM/9hwZDeuY8BLy/cN9JV6bXRyn+tsMQ6nLl5A3o
 71qkHIooM2Tdr5QAE3pGqwbNuN3Dp2wx8MUqmSvo8KOHOT4Mpz7XzG+VzCwEQyR1LRDX
 ZPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6LeNwf5XH15FQjgitK8l0TeYqm5/YwJUfyN9VarTqtk=;
 b=CvxRXUtDUNK6sxcWqiOXf8Ycq0Kfi9og6wXBAVj1GUNgOIRhlu/0Q2rDNGXPVTJke3
 r5RuY0gV1UKhEYzyvsCy2o2lY3wTwL4BKu+vYNg05HFOJ3UOgspYsInC0NOetwc/WfF3
 RDLox7X3K2T0WFwnAqg1QNQmmww9dKDdYixLDazMEUNTLHDcfpjTXOp6vp0LBfk11/Q2
 FzP15q/O4AImDzi1EHntzIitRWJBL/sZFt4dsc6YFPnNhhrpqypxIt6R2nz5D01a1fIp
 Oi7jqUmEzgZGuZPG5PblhfsRPxTc5hztx1ksUjoT+0O/feUEZ1rOrAIsildv5Q+FQqTr
 hERA==
X-Gm-Message-State: AOAM532WftImdDTAKx/uDkG+S/oiTnvi0zChpCNeo/W8duVy/uFmAL3A
 tAT5zDsMgfXuRkfcEyBNzPjMoPjcE14=
X-Google-Smtp-Source: ABdhPJy4vnXq2jklD/GXpxHskxRmAwMzLF7xPp7qNfPS08n8R/blfI8LkPB5aamcR95gvQNoL3Ht7Q==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr4332564wmf.84.1631116878098; 
 Wed, 08 Sep 2021 09:01:18 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d129sm1705115wmd.23.2021.09.08.09.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 09:01:17 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] linux-user: Split mmap prototypes into user-mmap.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d6e749fb-8f1c-415b-b722-afc40ec50a5a@amsat.org>
Date: Wed, 8 Sep 2021 18:01:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.922,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 5:44 PM, Peter Maydell wrote:
> Split out the mmap prototypes into a new header user-mmap.h
> which we only include where required.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/qemu.h          | 14 --------------
>  linux-user/user-mmap.h     | 34 ++++++++++++++++++++++++++++++++++
>  linux-user/elfload.c       |  1 +
>  linux-user/flatload.c      |  1 +
>  linux-user/i386/cpu_loop.c |  1 +
>  linux-user/main.c          |  1 +
>  linux-user/mmap.c          |  1 +
>  linux-user/syscall.c       |  1 +
>  8 files changed, 40 insertions(+), 14 deletions(-)
>  create mode 100644 linux-user/user-mmap.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

