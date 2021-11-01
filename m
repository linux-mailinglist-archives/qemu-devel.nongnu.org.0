Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1735441D71
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 16:32:44 +0100 (CET)
Received: from localhost ([::1]:34852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZIh-0007W2-C7
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 11:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhZHT-0006ed-Bl
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:31:27 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:46921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhZHP-0000cD-Lw
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:31:26 -0400
Received: by mail-qt1-x834.google.com with SMTP id s1so14767354qta.13
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 08:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZQTpF83tMKfnveNBLXnXgJTprnpVbSC46DeBc3/Pxno=;
 b=JqFzphJieRh0MhwvbffcYU0D5Igox5fzh7tPqSp3dppbLkzvrBXMBsHH9FKB1FB1k8
 rDi/GaT4u+Wb5E5x+6mH4BXFynDK4QhLZGIJE1GSkq1jYYZV+zbizd2my+5bc17Bs3vv
 66Ah8Zw4rUfTNJUFLnVeiAzmYJnCzTPAw4MrNZoOkSark09/0B4Cy3JiU+EB7qCwaIVU
 RzXcgHXJef3r0mgcr6gc17nJw8Nt+IS9qjJavlGvQ/iw0pku348SsFfsLSbxzuebFi3l
 JEWGBtURdKzgl3kQPBwujfgYbo5rEoa0kHKBybPvxKLHAvt9NvdnPqzllE/7JP6fcY8s
 nq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZQTpF83tMKfnveNBLXnXgJTprnpVbSC46DeBc3/Pxno=;
 b=DpkPZST48e4QHxFKZcsc9toQs5ZbAzeHa3o9bG63GpMOqzixXTyUxU6QpMnvSt+SqA
 HOjKIV+xiUscfiRd8t8rElMhDQ/cxRByFLk/GHXf0VxUs5JSXsvPVHvuvAdpSHvAdPkY
 Fgt2xVsiMn0Ozi6XmXngdl2Sv+YbxRbeyK0G83yQrn6MrJ+AlPADjNXuFEa6ub9HGZpY
 BaS2NQYTJjup6EmhVsxLw+X4/+J9pXKR9W8Oc4FkrAMrlCATPAkinduRIKrQS+syAEnF
 f4Teu9cXY3P6MhYifcL5dhGBfvFKkUejXzxoO586MWmFf1Fxccba4w9OZA4MtqZ8Owmg
 dqFg==
X-Gm-Message-State: AOAM530vi4quIadfMgd6hZZnPTCfBx6RFHoOQ9MP1ONgd4KBYOskcUi0
 la/3OpPIFAo8GhHrrX0soPJ/ww==
X-Google-Smtp-Source: ABdhPJxi+8lB7BQ18Ge2IxnndH6j2pwlOHbS5NdaUQ+US6EUOoPqJt50JZK9UWX4kBmrk6SsCVPqww==
X-Received: by 2002:ac8:5a11:: with SMTP id n17mr26706598qta.210.1635780681923; 
 Mon, 01 Nov 2021 08:31:21 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id n19sm10865053qta.22.2021.11.01.08.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 08:31:21 -0700 (PDT)
Subject: Re: [PULL 6/6] hw/input/lasips2: QOM'ify the Lasi PS/2
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211101082747.2524909-1-laurent@vivier.eu>
 <20211101082747.2524909-7-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <04704da8-24c5-25d6-85e1-6f9901f00b24@linaro.org>
Date: Mon, 1 Nov 2021 11:31:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101082747.2524909-7-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 4:27 AM, Laurent Vivier wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
> Message-Id: <20210920064048.2729397-4-f4bug@amsat.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/hppa/lasi.c             | 10 +++++++++-
>   hw/input/lasips2.c         | 38 ++++++++++++++++++++++++++++----------
>   include/hw/input/lasips2.h | 17 +++++++++++++----
>   3 files changed, 50 insertions(+), 15 deletions(-)

This has broken the qtest-hppa device-introspection test:

ERROR:../src/qom/object.c:2011:object_get_canonical_path_component: code should not be reached
Broken pipe
Aborted (core dumped)

Also, the previous patch 5 does not compile on its own:

In file included from ../src/hw/input/lasips2.c:28:0:
/home/richard.henderson/qemu/src/include/hw/input/lasips2.h:17:18: error: field ‘reg’ has 
incomplete type
      MemoryRegion reg;
                   ^~~
ninja: build stopped: subcommand failed.

Reverting to patch 4 builds, and passes the introspection test.


r~

