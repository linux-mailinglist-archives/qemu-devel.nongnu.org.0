Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B841551C797
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 20:28:47 +0200 (CEST)
Received: from localhost ([::1]:48802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmgDW-0004vu-J3
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 14:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfbH-0005FM-Pa
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:49:15 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:36498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmfbG-0000bZ-7p
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:49:15 -0400
Received: by mail-oi1-x22a.google.com with SMTP id v66so5097433oib.3
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 10:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=l7+oh46ssaKjqd685x5QUfiSHmGnqXC6ONpT48/SiEY=;
 b=R1OCImwCgfgvoDFwAASxhByXmpXsTsO2z4YhM+/4uiAJidykYOWwxSp+CcbwTsaz2H
 LTZu6bPgfpTEo4RPCC42MIGidPxbhQ02E/YPn7sLNcgfHr9dimWA6K0rNH4OMad4bEH5
 A3K0yBv3eQ/1omKbr+p7tou6xazX7fxJnj+XPKNdlkb6/7Luiej7jbABWOE7UPj2Ohf3
 gwJbYSDP+X8zO+paEbI6pQtcH1XjENTf7cwGsu95PQdGe4rCINffBWVgDD2FQPJy3oEO
 CsmZyz4b/7JRP6Gaeb9yztF6B9YsDiLgJfSr9wX/QdeVClUAf3pkpVEKJ8lmRf+iHbOp
 TKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l7+oh46ssaKjqd685x5QUfiSHmGnqXC6ONpT48/SiEY=;
 b=qrjuA5S8TyNsD3s3RN+9DNKo46lOWcwX7BRKecsqF3BdHWcO6BfkM30N6a+++VqO+B
 cOjJtmXGZV1U5ZsBRREGyhwktIfXoyxmM8Fos9s0Nf2JxQgMLYnRUE083isSbWm/YFLR
 aIYonQ9kaxWI5oBEjqFH0REi2FHubErhe8Gxz4vhvc3eRBUzD39QN9v9l/22PZ8gcE58
 T8/qGGATNucMLNW+4zaleBfOz1BDStJaY/DwJUTxmCb6ZlL53Q82FSHcz+rYRQZXW+YV
 Xsx1IGoZJBU7pWgPcRbjuZLJxwhMBu/MqA2JZzvOUxYeTZKL7uDU83axWQKml/LTg+qp
 FjiA==
X-Gm-Message-State: AOAM533goUq9MIuFXLzqX3IYjnm43qkDR0sPVdCIuZ9qtr9n3Cqv+IB1
 rzCrmeKLY4wi3VTaBs4cWkaFTA==
X-Google-Smtp-Source: ABdhPJwpfGaTpfcCwwQw0HXdbWIe8RuSyK5o3pI3pFtjjXKSoprEjpp/6dHiogA/qLD1bMCv7FCmlQ==
X-Received: by 2002:aca:1817:0:b0:2ec:f542:c96c with SMTP id
 h23-20020aca1817000000b002ecf542c96cmr3173873oih.36.1651772953015; 
 Thu, 05 May 2022 10:49:13 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6?
 ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056870310500b000ead8b89484sm767224oaa.5.2022.05.05.10.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 10:49:12 -0700 (PDT)
Message-ID: <a4415eeb-b9a9-4645-296d-3e2647c649b0@linaro.org>
Date: Thu, 5 May 2022 12:49:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 18/50] dino: remove unused dino_set_timer_irq() IRQ
 handler
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-19-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-19-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> According to the comments in dino.c the timer IRQ is unused, so remove the empty
> dino_set_timer_irq() handler function and simply pass NULL to mc146818_rtc_init()
> in machine.c instead.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/dino.c     | 10 +---------
>   hw/hppa/hppa_sys.h |  2 +-
>   hw/hppa/machine.c  |  5 ++---
>   3 files changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

