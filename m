Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433FB39CBD8
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 02:29:29 +0200 (CEST)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpgfP-00078a-Qe
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 20:29:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpgeP-0006RO-Pk
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 20:28:25 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpgeN-0000W0-00
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 20:28:25 -0400
Received: by mail-pg1-x532.google.com with SMTP id 6so10944959pgk.5
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 17:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mmE8sMs83/0vm8GMO5yMPhyHYwK+srj02hoA1IPnEbQ=;
 b=jtOvcGAqMlr5St/BkKUhmhhFn9gnwvliHszh13XpRzZXH2jR1DayHHNsWiFk/Owlxn
 5/DLSTkbRAY1o6FkUwkrwCrqOfV2QO3KUI8Z+NXkZ+7rcU54CaDTM6+dZj9I/TQIwgnx
 MvQBv4VmIk7iJZi03osdD7UYETaNf4gwBF98YVU2hHKPfC7HJ39z8mfbpeMhdogJ1nfl
 yae2KBWC0QdMk3xRV0Qg0lo9bW5hrSz1OYHGbQ5JHotCoge9D/vPzouqdiozNKULJmZ9
 iVztu/9ctXZQ8oKya3s/IJe8MCqTYa2uHsOFRPAAHD1uhPDxxrtCf4tAl4OKaBxwDYPI
 GbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mmE8sMs83/0vm8GMO5yMPhyHYwK+srj02hoA1IPnEbQ=;
 b=n83gLC0l4sgRlNUvhnPuhUP4E3ibFPI6BJTYYUeWRGmOUKfL17/BFkR8NeObGF1RhM
 sDQozE62GWe9suurkK+yUlqRu4zeroLu4ma4PsUIzLsze4LboBPXrhp6g0OPnqLkhZEf
 VZsZ0a+ej2MsOM3GrHuq0lUNMcffFE3opo/cZeDaQ65SPbwgNPIErSzqGtJx1p6zh4mm
 8YcnJYsie1wI6AEeqgculsVliEzk46nvehizRPk0f9vDdXAlMD2bRmlgZAZEsjqoT78e
 TkyIg/hFE4TsB6SHHwE1UdHE3oI8EOw6M7XiHNcM5jbxMRtZKNMK1/wY7LxOQdQ6n5Bt
 xQFg==
X-Gm-Message-State: AOAM531azjbQJPHnsWATLN/MBtdAs9LA+Cb1PhNcOpcC0qOz9M3x2asy
 vxXze1dBoeghkF7AGbSfgJCOspN2wt2L3w==
X-Google-Smtp-Source: ABdhPJzSk/UpHKvFl7Wd3M5BeQ3oG1lbvx3htkDnvAnVwyKUbSwxeZaMxaKVrNboPijMHRX92YMwEw==
X-Received: by 2002:a63:8f46:: with SMTP id r6mr11888214pgn.182.1622939301282; 
 Sat, 05 Jun 2021 17:28:21 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j16sm5552669pgh.69.2021.06.05.17.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 17:28:20 -0700 (PDT)
Subject: Re: [PATCH 3/8] Fix initialization of the hwrpb.hwrpb.cpuid field.
To: Jason Thorpe <thorpej@me.com>, qemu-devel@nongnu.org
References: <20210603035317.6814-1-thorpej@me.com>
 <20210603035317.6814-4-thorpej@me.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b89efddf-4960-07c4-1c13-f2eb80c44117@linaro.org>
Date: Sat, 5 Jun 2021 17:28:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603035317.6814-4-thorpej@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 8:53 PM, Jason Thorpe wrote:
> Initialize the hwrpb.hwrpb.cpuid field with the primary CPU ID, not
> the processor type, as per the architecture specification.  Some
> operating systems check and assert this.
> 
> Improve a couple of comments.
> 
> Signed-off-by: Jason Thorpe<thorpej@me.com>
> ---
>   init.c | 29 ++++++++++++++++++++++-------
>   1 file changed, 22 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -257,8 +272,8 @@ init_i8259 (void)
>    outb(0x04, PORT_PIC1_DATA);	/* ICW3: slave control INTC2 */
>    outb(0x01, PORT_PIC1_DATA);	/* ICW4 */
>  
> -  /* Initialize level triggers.  The CY82C693UB that's on real alpha
> -     hardware doesn't have this; this is a PIIX extension.  However,
> +  /* Initialize level triggers.  The CY82C693UB that's on some real alpha
> +     systems controls these differently; we assume a PIIX here.  However,
>       QEMU doesn't implement regular level triggers.  */
>    outb(0xff, PORT_PIC2_ELCR);
>    outb(0xff, PORT_PIC1_ELCR);

I'll split this out to a separate patch.


r~

