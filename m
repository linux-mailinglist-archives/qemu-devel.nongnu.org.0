Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD294EA32C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:48:29 +0200 (CEST)
Received: from localhost ([::1]:40596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYyA0-0003my-LF
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:48:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy7o-0001Lj-PZ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:46:13 -0400
Received: from [2607:f8b0:4864:20::22b] (port=33619
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy7n-0008SB-3h
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:46:12 -0400
Received: by mail-oi1-x22b.google.com with SMTP id k10so17289404oia.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sFWMgCbCyUJHYw8ablGJZlTRgGt1moL5FLSZQ/fetWo=;
 b=k3cC09nNvXnmRTmlMVrTlOFn59ytOKZxyuRRzTGODeXSr0VFDGkvpDTY5D75Kp/je0
 RdxKUiddDuigLCgV+olfGOuy+mvh9K5qnPnajRO9QOdSQSDK9EvBZTn2Bxuv3Ct2DZIO
 COi5ribzZp6YbyAT8jLcNVvoT4E5ygAWwb6IDHU628NCLudhk/9nfGKgrjSJ0vJhdhWD
 tuI65ILQqwIay/wfwZFI2CDwifHsktn7Ppre0eO6VzJOBlYFsH2/9RQwaPCIJnwXnAGP
 XUyaWf1vftrfj+g32HQY5cXgx1kqYYc1xadHUuIWLe4xW6IsNXiuR4Ssg4/RdCbYsWtR
 JGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sFWMgCbCyUJHYw8ablGJZlTRgGt1moL5FLSZQ/fetWo=;
 b=ijvA9N6IL5/Z/Mq1TpfxJJWNoBNYMD58t/XJCU2ubJnOL8o/5OWuO7nSc98ha1LzEh
 U8QwaISPnA4dd8BI5JhisIthFP5ktTHpzGIsTRTPZhBz507FTRmkbgaOsZfwGuZhoB4E
 IQDzuUapKtsq/YPSfdWb9fsrqgM/3WPn4bz01ZKFxPskOfc6Fh3iPrt5sCqvLotenF5M
 0fJME/hlAytBf0sqw67+RdKgRvlgFmsb1dquNnUODLbIUI25msRajDkTOiEL3DuOvOtT
 0ngpg5xF0oWPfXPlMnhtjdR2D+XV6J/bpJ1ygV83FwJQSlUTnKah/WCL2O4OZTkonVsa
 +Shw==
X-Gm-Message-State: AOAM533Hr0qo+h+DwytASQSVu5Huu+aDu+A8FJ5a0SxqGjODoL2FJqkm
 QVKfzMox/a8I93CLnylV4Vmo9cW6t7KDzg==
X-Google-Smtp-Source: ABdhPJxmPLvxMH2O0SW44MqwtxRsCeKTxudvFYynefbtI+rSLUs7lL52VTUmKuO14BLWoCVZ4748VA==
X-Received: by 2002:a17:90b:4c08:b0:1c7:61ce:b707 with SMTP id
 na8-20020a17090b4c0800b001c761ceb707mr1392692pjb.16.1648507558680; 
 Mon, 28 Mar 2022 15:45:58 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056a001a8b00b004fab740dbddsm17098253pfv.105.2022.03.28.15.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:45:58 -0700 (PDT)
Message-ID: <951486fd-ba68-183e-742f-c581128ba498@gmail.com>
Date: Tue, 29 Mar 2022 00:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0 v2] target/mips: Fix address space range
 declaration on n32
Content-Language: en-US
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
References: <20220328035942.3299661-1-xen0n@gentoo.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220328035942.3299661-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-x22b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Andreas K . Huettel" <dilfridge@gentoo.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/3/22 05:59, WANG Xuerui wrote:
> This bug is probably lurking there for so long, I cannot even git-blame
> my way to the commit first introducing it.
> 
> Anyway, because n32 is also TARGET_MIPS64, the address space range
> cannot be determined by looking at TARGET_MIPS64 alone. Fix this by only
> declaring 48-bit address spaces for n64, or the n32 user emulation will
> happily hand out memory ranges beyond the 31-bit limit and crash.
> 
> Confirmed to make the minimal reproducing example in the linked issue
> behave.
> 
> Closes: https://gitlab.com/qemu-project/qemu/-/issues/939
> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
> Tested-by: Andreas K. Huettel <dilfridge@gentoo.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> v2:
> - Collect tags
> - Make it clear this patch is for 7.0
> 
>   target/mips/cpu-param.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

And queued to mips-fixes, thanks.

