Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40046EA3DE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:32:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkJL-00075j-K0; Fri, 21 Apr 2023 02:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkJJ-00072l-A3
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:31:57 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkJH-0004LQ-Nw
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:31:57 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso8741865e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682058714; x=1684650714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fQh9Uv828lIqGt4kkP2taHga/jNpYZKiMRTXzmWlEhY=;
 b=dZ45eynEAeY3C31i29Ewsvqa/vsHeDlbJ4Dt0+hhA7sogd4JrLF62giIFusLJuNwH4
 njTJ+eD7b9pGHaEADnmz13wjnb7MW1xiM1bNcoiN+gbAIM60+57Edi0T+JP0JKcdDbwb
 6aY86DN/PKj7tQpHagfN/jhP032UjFBQ+6TNBAlSIGIDGKe5zRal8dCkbwVMUAFUAi3B
 gNeHjEiUJfAx7bUWoVpo/zFpOLjpozgtV1K4uaxaGesM/20ZcZD3QGhVXG8RfXUZMYcM
 ttWisVjg1CpIW9AOoSdmTWppzOgaqeqYfsMp95oTz2LyJ5dFtBQ5oBwqxFElkfeU83Jk
 SLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682058714; x=1684650714;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fQh9Uv828lIqGt4kkP2taHga/jNpYZKiMRTXzmWlEhY=;
 b=Bw2dampy57Gc8WKsAo/9x0lwabLedHpCSPntH+V+17gRYBMsDbt5hRwlcNv2fCezTJ
 tS0iR3YlObzhCkoEM4hZ73JPmnVVwjhCf0joWVkuAprQsLsVBwgB71Maq3ALbiMyySdY
 L/AfLAyt6d6bdIxao0yPln6hFvzKoXUaspWnuBDea6vi8koJlgDsgy0vHB/vVDodVRWG
 9v+kIu1zhgD26Ef+R1SZ8JaBGsvVtcvaCsk+fDgRFzQxoGExnQLb3pkSTFLQW2STec7I
 ej/YKRUFJE5UDqoIj/67ASU46JiISNQcK3yk7thRsqH6/LtvAzwOLOcihVNt5SQEzcnu
 8xLQ==
X-Gm-Message-State: AAQBX9fPynzy6B8elqHhDsKHUYZgHAjrUGCBk7cYzumjGpXcYRofTuuN
 IfZQjyPYIel7NB+NDYuJMwPn2g==
X-Google-Smtp-Source: AKy350Yd6HlPFdTOnhbbhl8PDSbC0WxzExo20ZnnnWnSO+816cXnX8xvo27OVTAtLLdvbF052pK4yA==
X-Received: by 2002:a05:600c:2103:b0:3f1:7fc0:4dbc with SMTP id
 u3-20020a05600c210300b003f17fc04dbcmr971712wml.38.1682058713873; 
 Thu, 20 Apr 2023 23:31:53 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b003f17e37ce60sm7290353wmo.47.2023.04.20.23.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:31:53 -0700 (PDT)
Message-ID: <cb791293-934c-9ec2-517a-f6ce7dc052ef@linaro.org>
Date: Fri, 21 Apr 2023 08:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3] migration: move migration_global_dump() to
 migration-hmp-cmds.c
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20230420121038.25167-1-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420121038.25167-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/4/23 14:10, Juan Quintela wrote:
> It is only used there, so we can make it static.
> Once there, remove spice.h that it is not used.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> 
> fix David Edmonson ui/qemu-spice.h unintended removal
> ---
>   include/migration/misc.h       |  1 -
>   migration/migration-hmp-cmds.c | 22 +++++++++++++++++++++-
>   migration/migration.c          | 19 -------------------
>   3 files changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


