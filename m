Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5332D614A57
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 13:11:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opq5x-0004Hq-KA; Tue, 01 Nov 2022 08:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1opq5w-0004HT-2T
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 08:10:16 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1opq5u-00077G-Jq
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 08:10:15 -0400
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id D7662DA045D;
 Tue,  1 Nov 2022 13:10:12 +0100 (CET)
Message-ID: <ffc8ec49-298e-912e-ee43-a7f2626470fb@weilnetz.de>
Date: Tue, 1 Nov 2022 13:10:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 2/5] disas/nanomips: Fix invalid PRIx64 format calling
 img_format()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Petar Jovanovic <mips32r2@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20221101114458.25756-1-philmd@linaro.org>
 <20221101114458.25756-3-philmd@linaro.org>
In-Reply-To: <20221101114458.25756-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Am 01.11.22 um 12:44 schrieb Philippe Mathieu-Daudé:

> Fix:
>
>    disas/nanomips.c:12231:62: warning: format specifies type 'char *' but the argument has type 'uint64' (aka 'unsigned long long') [-Wformat]
>      return img_format("RESTOREF 0x%" PRIx64 ", %s", u_value, count_value);
>                                                 ~~            ^~~~~~~~~~~
>                                                 %llu
>
> Fixes: 4066c152b3 ("disas/nanomips: Remove IMMEDIATE functions")
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   disas/nanomips.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/disas/nanomips.c b/disas/nanomips.c
> index 6466c80dc5..e4b21e7c45 100644
> --- a/disas/nanomips.c
> +++ b/disas/nanomips.c
> @@ -12235,7 +12235,8 @@ static char *RESTOREF(uint64 instruction, Dis_info *info)
>       uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
>   
>   
> -    return img_format("RESTOREF 0x%" PRIx64 ", %s", u_value, count_value);
> +    return img_format("RESTOREF 0x%" PRIx64 ", 0x%" PRIx64,
> +                      u_value, count_value);
>   }


Reviewed-by: Stefan Weil <sw@weilnetz.de>


