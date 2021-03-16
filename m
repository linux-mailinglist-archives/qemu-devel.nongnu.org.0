Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B82033E1F9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:18:56 +0100 (CET)
Received: from localhost ([::1]:54526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIxj-0001Sg-5N
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIw1-0000HA-JX
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:17:09 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIw0-0000mf-BS
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 19:17:09 -0400
Received: by mail-wr1-x433.google.com with SMTP id k8so8274994wrc.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 16:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IBrQYbXRcAor1qHmuh1oMXsHpzNvHhijYjCrJxb/KwQ=;
 b=oYlgpCmFzcWDub8zbKD14d7OtZYPKTqPfSaHytEXxd4LeXm7Tqem7sHhilPhxsG/iG
 UKvliHqplSiuJB6s9l/uz70/7uROsXiGr0RqxSsOSZSXpOc31FZWP7OddBVv/cBUpIeK
 yGVfqjLRX8BRbKftpVdsk3NCTFbUtH6Uswoq/BAUYd/8kykNOD1cyv6631MmlLgWauR2
 aInOGvIAPoAx2nKFt/rHh1psmsiTHjMni2Ib1G5AWk+IUTuqZAkgQXhLI40Ha4EFrRMl
 lLZoww7p56sirVfjGS+EnBtGM5PJL8t6H66tNP36gbTphr4hM/iI6eUiLbSZo+Kj8pXq
 LJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IBrQYbXRcAor1qHmuh1oMXsHpzNvHhijYjCrJxb/KwQ=;
 b=BU6x5MRxHxlwcXpirTBcnZyoMUn8QeLOscPGxdYAIPh9g2kV7zEN2jeDldJIKn/BIi
 w8hHizvxQHhwxRqgKgsWE+1JJwhQyJ2cMP1+6KPhGbRcCdAz92yBOByL5v2e7LoOMpul
 GWW3ZVQSth3A0GbV6snQmWQUsX9xaFVAW3uFozgkqJVwBReNgoGNcZeOtE3aa3mvTY0k
 I7H8wwHy8H4FFvdpM0zksSX5dfiIUS7qtSMWuqauLUlWFaIQPkTGVQYYDBSnZWnkeQXT
 7taPbcrzvQnqHf9EDHqvyZCHq03m7nS6DOkZ76o9AE0GONR+Otgl3UYxJJUYjy8zawlr
 QDfQ==
X-Gm-Message-State: AOAM530veXTrH8cZ1hPkdcknB7m3lMIhF5AEVo7GTE5NFDw2Dj5+nIcY
 wbSbAQfRNJrzNmZAFleNY7g=
X-Google-Smtp-Source: ABdhPJw9X1D96gHkB75gnptFn5lOVb1Imz+H5HLkbPw1hLyJOhZQVJ2iw03anM+aMGq7ghIsInc5HA==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr1365068wra.288.1615936626665; 
 Tue, 16 Mar 2021 16:17:06 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id p18sm3298540wrs.68.2021.03.16.16.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 16:17:06 -0700 (PDT)
Subject: Re: [PATCH v5 28/57] tcg/tci: Split out tcg_out_op_l
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e8c3e5ef-f0e3-474d-fa19-82b9dd26e311@amsat.org>
Date: Wed, 17 Mar 2021 00:17:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

