Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25086614422
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 06:17:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opjdE-0007rD-A5; Tue, 01 Nov 2022 01:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1opjd3-0007ob-PP
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 01:16:05 -0400
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1opjd1-0000F2-NI
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 01:16:01 -0400
Received: from [10.199.1.165] (unknown [89.252.109.106])
 by mail.ispras.ru (Postfix) with ESMTPSA id A44DE419E9D8;
 Tue,  1 Nov 2022 05:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru A44DE419E9D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1667279732;
 bh=hcyqBX+3PRSNSV32YJP2Y4RtT+sFtW5Q8J3/00t7ojk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZtmTzGauggp/1KWDglsSPlsTRytkKIaofCHcYvMLMx6ivkN9xgAKfgSKJL/yOEh5L
 0NYWo4tVO2Q77rCDhdkDnbv31zsyTtRWysLHirAtzXJsIEeTbMjajPF+KmSqr8GfH5
 2o6kBynwtj0ls6zJqWU6ObdUrFMPgLIukaYbdCb4=
Message-ID: <ac38c79d-2a93-234b-7b4b-d66bc3ab99b4@ispras.ru>
Date: Tue, 1 Nov 2022 08:15:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] target/mips: Cast offset field of Octeon BBIT to
 int16_t
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org
References: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
 <20221031132531.18122-3-jiaxun.yang@flygoat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <20221031132531.18122-3-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Acked-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

On 31.10.2022 16:25, Jiaxun Yang wrote:
> As per "Cavium Networks OCTEON Plus CN50XX Hardware Reference
> Manual" offset field is signed 16 bit value. However arg_BBIT.offset
> is unsigned. We need to cast it as signed to do address calculation.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2:
> Do casting in decodetree. (philmd)
> ---
>   target/mips/tcg/octeon.decode | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
> index 8929ad088e..0c787cb498 100644
> --- a/target/mips/tcg/octeon.decode
> +++ b/target/mips/tcg/octeon.decode
> @@ -12,7 +12,7 @@
>   # BBIT132    111110 ..... ..... ................
>   
>   %bbit_p      28:1 16:5
> -BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
> +BBIT         11 set:1 . 10 rs:5 ..... offset:s16 p=%bbit_p
>   
>   # Arithmetic
>   # BADDU rd, rs, rt


