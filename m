Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D592E8594
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 21:41:24 +0100 (CET)
Received: from localhost ([::1]:44594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvREh-0008SI-St
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 15:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRDY-0007wX-OU
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:40:12 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvRDX-0006Zi-7l
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 15:40:12 -0500
Received: by mail-wr1-x434.google.com with SMTP id y17so22698021wrr.10
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 12:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l9YsjDYF+kuxocNfj5mXal2TeM+Ur9axLXzlj4Og0uE=;
 b=bjP0f8QZXPhC90YlMH588bk2SxqEx+9/8WcaFX4EXBohGJmr0jV1rlxc9HXojN5nhU
 x6fCqfIxujHd9xNGcwIUzi41kKmhYGFcneRgyFrEO1rmVJwjJVYMeeBhFEuChqZnb0Ab
 iyf8ikdOyzqXz1Vl34+dzTWS9/O1TDql2q7PeYhXFb+af9YtTnq5WxGujcxnCK4NukWD
 xYPeXsi7T9czEHlRo/LxROOB+nfj7Y250xTMW38q0xCklfR+ZE99qdosGqMBZabE2wrf
 GF9KXVUTcGH2xGZp70DOT89ij/OjoqoBc3UfLYm8MaYdI6LBZGXJNUHHRneUYAC44Ggt
 UzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l9YsjDYF+kuxocNfj5mXal2TeM+Ur9axLXzlj4Og0uE=;
 b=T26h0s9EQsX7meSvs3pQimVGNGquPUtgFYlaStqAode/YecyVBpp+28iuzoYOX34DZ
 r8gw6QoKyty1tniI9Za99/R9Cpy01b4tiRJpD4hxtLnTqwj9YBhNbuRtwp6J6rfmWOxV
 B43o8khPkOt2P94G0S722rt48xlOZwyB60p431UXp7Oq9rhnZFLIt7jfjdl+iM89yDMI
 an9cG3eC4BV/WK84O2KT9NJIvCAMITgnIA4NlZy2R1TNH+fTkmYXPe+Tz+t5SfAmbEN2
 JCQc6RtbF4G1RS0jm6EcRRx9w5Jv0kXtPxL/7EISeDeiF8AdP1BDzqDp254XHIF8vVHB
 javw==
X-Gm-Message-State: AOAM531LTH8i/OUkG8HR/4Vyyv7kMAOGNfdd2dR0vW/AvbKfznXp5Q1Q
 IEbLKTsOrYfg6IOXzYf4qMgY9m+2M+w=
X-Google-Smtp-Source: ABdhPJxp3xHgvJNPeHRhCj4pgfBxgezWSbIS1P45+hasd9qfMvNjeefS28bysRPrcqOahC3sJXHlig==
X-Received: by 2002:adf:ba49:: with SMTP id t9mr70456401wrg.183.1609533609971; 
 Fri, 01 Jan 2021 12:40:09 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id s63sm20001076wms.18.2021.01.01.12.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 12:40:09 -0800 (PST)
Subject: Re: [PATCH v2 2/8] hw/mips/malta: Use address translation helper to
 calculate bootloader_run_addr
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
 <20201215064200.28751-3-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e2ddd755-63a7-5eae-d872-92faec3c24b4@amsat.org>
Date: Fri, 1 Jan 2021 21:40:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215064200.28751-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: chenhuacai@kernel.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 7:41 AM, Jiaxun Yang wrote:
> So it will sign extend adresses properly.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/malta.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

