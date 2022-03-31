Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FD4EE326
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 23:16:18 +0200 (CEST)
Received: from localhost ([::1]:43346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na29R-0007FJ-GT
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 17:16:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na27w-0006RF-Hp
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 17:14:44 -0400
Received: from [2607:f8b0:4864:20::536] (port=33611
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na27v-00056Y-7G
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 17:14:44 -0400
Received: by mail-pg1-x536.google.com with SMTP id k14so806202pga.0
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tqrwNSQ2Rs5utgTeh9WvQtxW0w3E16CuBjVIWrm9ibg=;
 b=RESZ9PK6UMM9V93W9YffmT7MMh9VRed0MBAE+RogILpLiWJ9k8SNuoQsBYF238L+qA
 9dxPQbQkEUCpv6GSdn0LQ5QBcEXeBG6GVIfph3kk8W7y2e26DFEiFp12Ni+oLnW8u0II
 1HDirjrp9TKXu8FmHWb5eGC4ykYtaKfEEWZTKHKEj9bqk+xVwlBbcxIEF36XzKTh8z+l
 mw+VjcESU430F7eWwEmq7q3hs3sdGBr6eixhknFoGUwtVqmmE5jY0S9V5ggDVDM3lGTp
 0hhDbjpUEmd+vGu8S3dfW+ps3qMTy6RRS48dXxZCrd1b08hO+WOT8tiVlR7d1HOmWcCX
 xqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tqrwNSQ2Rs5utgTeh9WvQtxW0w3E16CuBjVIWrm9ibg=;
 b=Iop99A9z0EIwKPtYuu4ZYmSIa5j26sZHbKscpAq5bNkhUOTruagJMznQNMKU/xMNPv
 qXtWJ73LjUoOZiHD+m24Z0aR4ANLQyyjRxpJA9BrhClyKZN3oGFQDglOAWveuxMX3Be4
 Un0r3h+6Ru3J9SpQX5PrF5Pr9/KBG1G4AVwH3Ex22OXlKeVA64BZHrrRbf993zsGgmR8
 Mk+mKQQxoQdu4RiIJG4SN8ad8PkmjieVNdwFhTQg8Wa5TVLMzYpVeEF6ZCJ4eBXpX9ZF
 srCBdSqlzb8yETiuftzgD1mlAParMS/DVpfdYwwqQfbQiD/MvLEuk72W6TeYRrlw3/Ob
 aQ0Q==
X-Gm-Message-State: AOAM532bm6dsMhtfxDaPb2x6IQn8Ai69aFxyLP3uR+yJ5kKbACsBBGL/
 JgG1mTDwgHD32oGRTnmr8zM=
X-Google-Smtp-Source: ABdhPJwy4QD2V6QbfcHUqCiGnOPcq179MiI7D8XgOPo+eBy44/H3K6mqLYDErCSp7yWTFg9qLsLFjg==
X-Received: by 2002:aa7:88d6:0:b0:4fa:ba98:4f5d with SMTP id
 k22-20020aa788d6000000b004faba984f5dmr41215179pff.5.1648761281825; 
 Thu, 31 Mar 2022 14:14:41 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:f49c:562:b5cb:b2b5?
 ([2600:70ff:f07f:0:f49c:562:b5cb:b2b5])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a056a00088900b004e03b051040sm388368pfj.112.2022.03.31.14.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 14:14:41 -0700 (PDT)
Message-ID: <ef7f4195-e9b7-4f49-ad11-1e1b2bf2325b@gmail.com>
Date: Thu, 31 Mar 2022 23:14:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] qga: replace usleep() with g_usleep()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220331205339.2048330-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220331205339.2048330-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/3/22 22:53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The latter simply requires glib.h, while the former is not in the
> Windows API (but provided by mingw header & CRT)
> 
> Also simplify the expression for 1/10s.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   qga/main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


