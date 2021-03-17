Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CC033E294
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 01:23:21 +0100 (CET)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMJy4-0004s1-HD
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 20:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJvJ-0003Xt-OY
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:20:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:42681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMJvI-00044Q-6I
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 20:20:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so330947wmj.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kt620uDRTS49rq/ixppTlv5QIUW0RGPyAixrELIsRD4=;
 b=rdXL8s4qXhEoeJ+9qy+Dm9pLsqL5NVQzi6QETN64rFFl6WmSYiQ0Vc98RZ8Vs3amXp
 WZv+0dDFAc/6gR/6DzEEBUMshypyGiviQbHidC8BNxITTyzpWAcjYxuuvNa1+EfaBQce
 Yj0KCQQ0gZJs3H8F62suNralmgFLu1elfcYpcVo5Mr7hoEDONo3b4w7tfrc06MRxG+IF
 Ib7QxbjFfm9m5lIuTvhwgTKLrrIUwhbtiQ6D3cWXHW32olbu9q1toJB7kHU7pdWkV2KP
 k3q65iGhJPPVDT/PXF1xvfbKW2okKqVo9eVGLRe0h/n0X61bAAsWGVLBR4935B+grMOo
 kSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kt620uDRTS49rq/ixppTlv5QIUW0RGPyAixrELIsRD4=;
 b=UjmP9wsw+CGqXcwkc96ZJbWjyF49rYirIeL4pZU8YGbDtHPecNfAUecUkkX5TAs+iQ
 VxVuIzmvXP/KkzNWQ5HZQtTiFd5cndSppGkRWQYtJ8x6iSLlfwRScjNlQ42p+3E4LHXa
 shzYQdv6gyRC2roVWyL01CWCGHCFL5uXaAlrlR4Hhk1kgXO0/2MyMGsQ7ojzvTtxF3Mp
 x3i5hIBtGSMH1uFWLhVTcxjg2Jq5Y2cnrU3paRhayQFYlYtTwXVsCrvh12op8l4ZhS3F
 Zhp1dPwMix8X1C5MAZeovSdLryzR0w8Wu/6ZyM8UEmQKxP1xXrIVV2YAqztJSGwqysjA
 Qp9w==
X-Gm-Message-State: AOAM533iA5nc8RTHvP5FGHuQK82XknuJBjcwoxMENhveX2MrzgifYMWg
 Ou3xZpIdhnqWVgoULWmyfOI=
X-Google-Smtp-Source: ABdhPJxlNXece4mLnFZQnC7YsnVETD9OJYgKu8WUzzQLu0NtXUUrlnLlk13bEW/GfEs4krywZwNdrA==
X-Received: by 2002:a1c:bac2:: with SMTP id k185mr1153532wmf.148.1615940426807; 
 Tue, 16 Mar 2021 17:20:26 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e1sm24907977wrd.44.2021.03.16.17.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 17:20:26 -0700 (PDT)
Subject: Re: [PATCH 0/4] esp: fix asserts/segfaults discovered by fuzzer
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 alxndr@bu.edu
References: <20210316233024.13560-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d554bbd0-2216-9609-59ba-43470f8d7c4d@amsat.org>
Date: Wed, 17 Mar 2021 01:20:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316233024.13560-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Laurent for 1 & 4.

On 3/17/21 12:30 AM, Mark Cave-Ayland wrote:
> Recently there have been a number of issues raised on Launchpad as a result of
> fuzzing the am53c974 (ESP) device. I spent some time over the past couple of
> days checking to see if anything had improved since my last patchset: from
> what I can tell the issues are still present, but the cmdfifo related failures
> now assert rather than corrupting memory.
> 
> This patchset applied to master passes my local tests using the qtest fuzz test
> cases added by Alexander for the following Launchpad bugs:
> 
>   https://bugs.launchpad.net/qemu/+bug/1919035
>   https://bugs.launchpad.net/qemu/+bug/1919036
>   https://bugs.launchpad.net/qemu/+bug/1910723
>   https://bugs.launchpad.net/qemu/+bug/1909247
>   
> I'm posting this now just before soft freeze since I see that some of the issues
> have recently been allocated CVEs and so it could be argued that even though
> they have existed for some time, it is worth fixing them for 6.0.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> Mark Cave-Ayland (4):
>   esp: don't underflow cmdfifo if no message out/command data is present
>   esp: don't overflow cmdfifo if TC is larger than the cmdfifo size
>   esp: ensure cmdfifo is not empty and current_dev is non-NULL
>   esp: always check current_req is not NULL before use in DMA callbacks
> 
>  hw/scsi/esp.c | 56 +++++++++++++++++++++++++++++++++------------------
>  1 file changed, 36 insertions(+), 20 deletions(-)
> 


