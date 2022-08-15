Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C050E593072
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 16:08:14 +0200 (CEST)
Received: from localhost ([::1]:54504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNalJ-0003gb-C7
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 10:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNain-0000t2-RR
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 10:05:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oNaik-0001Rx-Vh
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 10:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660572333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmzJ4DQ0AcNupTN5aRNRPTKuUydPA2i7gkgRpARvnK8=;
 b=c2mzuAPzvO2Fdqu83wEecTorJL641y7b2yQzZF9YnRsX+nPrpsICgJkC2ZFuMHxcY4PyZk
 j3DWdA79jAEtNkvwaDzRk7LfXvHQtvPEwpk5MijIkPC2w/ppYtYWsSbC12BIdTkpW/AyJG
 9V8JOTdHaY8X+3YQVuKZH8SDGFqGZ1Q=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-1Eg-_nbPPGKno8PwdTg-Ug-1; Mon, 15 Aug 2022 10:05:31 -0400
X-MC-Unique: 1Eg-_nbPPGKno8PwdTg-Ug-1
Received: by mail-wr1-f72.google.com with SMTP id
 x5-20020adfbb45000000b0021ee56506dfso1231570wrg.11
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 07:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=PmzJ4DQ0AcNupTN5aRNRPTKuUydPA2i7gkgRpARvnK8=;
 b=f6LVS6rxLZJlhr4kKvglc19y5BPusrkCn45tCQeMcHmsYO/jLl2Qy7SqhMj47Kpg9b
 +FcwVzZwbSneZ8e79l7ZYxvMN54SVHkXKmfxYYkCJ36bsiZWZD0/Uv3v0TjxZg2hx/LX
 aLkkKZo/cJ/OjO56oHoau5JWMGhpiUQ4Ymc/D6B0T7MugXzu+8SpncD8fwHCBj68fpca
 APb7Ga3DQ97Ooq1e61LC8LtfA4VY8WNYezftglD2BJk02nBL4Njn70YuiqEiyY8wSzeN
 zj0ltJLDhbgGnx4FahASqYweMmOvmuYlcsqUCMrK1JMlM0I7QThTPiHICZZS3p68IZ2N
 lj6w==
X-Gm-Message-State: ACgBeo0o4z6WnZOMOFj+GL3gdW0Af5pUJyMFKintSB7sqVCPhyMDFR4P
 CnOwqu2Gd9n9TiFks7jq+GX/zDyhfpYsAGapxYfwGl9LyNWREp/LwCR2cJZLFrtkiAskoc4kOoy
 +XxkJ9I0SS1N/hqQ=
X-Received: by 2002:adf:fac4:0:b0:21f:1228:dabc with SMTP id
 a4-20020adffac4000000b0021f1228dabcmr8529208wrs.501.1660572330054; 
 Mon, 15 Aug 2022 07:05:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5MJK9PdKeBuHVGfxNUbFdATbLKegiraOjaJ7YC3JiJ5drLWNo/WXkzfkOsG2gKdmA4Kr+ZWQ==
X-Received: by 2002:adf:fac4:0:b0:21f:1228:dabc with SMTP id
 a4-20020adffac4000000b0021f1228dabcmr8529178wrs.501.1660572329797; 
 Mon, 15 Aug 2022 07:05:29 -0700 (PDT)
Received: from [192.168.8.103] (tmo-096-168.customers.d1-online.com.
 [80.187.96.168]) by smtp.gmail.com with ESMTPSA id
 bn21-20020a056000061500b0021e43b4edf0sm7543596wrb.20.2022.08.15.07.05.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 07:05:27 -0700 (PDT)
Message-ID: <3ad27702-9d84-a94f-7f18-4ad55e1dd340@redhat.com>
Date: Mon, 15 Aug 2022 16:05:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 11/20] disas/nanomips: Remove #inlcude <sstream>
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-12-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-12-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/08/2022 09.26, Milica Lazarevic wrote:
> <sstream> is a C++ library and it's not used by disassembler.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index cab53f482b..23db8177ef 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -32,7 +32,6 @@
>   
>   #include <cstring>
>   #include <stdexcept>
> -#include <sstream>
>   #include <stdio.h>
>   #include <stdarg.h>

Reviewed-by: Thomas Huth <thuth@redhat.com>


