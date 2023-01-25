Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 525A267B347
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 14:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKfmU-0001m8-29; Wed, 25 Jan 2023 08:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfmS-0001lJ-C2
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:25:36 -0500
Received: from mout.kundenserver.de ([212.227.126.135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKfmP-0004Ct-NP
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 08:25:36 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M27Bp-1pMaW73ssr-002aPW; Wed, 25 Jan 2023 14:25:19 +0100
Message-ID: <5c733dfd-2329-f4e8-3984-b20d59b0f918@vivier.eu>
Date: Wed, 25 Jan 2023 14:25:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] linux-user: fix strace build w/out munlockall
Content-Language: fr
To: Mike Frysinger <vapier@gentoo.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230117233042.16897-1-vapier@gentoo.org>
 <20230118090144.31155-1-vapier@gentoo.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230118090144.31155-1-vapier@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Li+oTlMmS7f0rICyrdnt/yF354Uf0E7YAAhmM4rPmzt7k3Jhsgv
 Z1Tuxh6lTA0Fs0+0CnkZ6cG7FzE6AstwHjpJC6yKZpttHYHOypFC21B6tm/zpcFmLKTjP09
 KWdp+LONIf4PbsoEpebSqy2DTcwS4WLF88QXyxVWHHEZxRa4O2ufagTbbkEXO3UEOlDha0u
 47bd5ncsA1n8Kw21mWVdQ==
UI-OutboundReport: notjunk:1;M01:P0:XrguFXMiTxw=;9U5dPp6Gz23Af60cmmcZFUAz/cL
 BZtiTvHzRkjRpEYKPwtguVO2gzdiEUUHIQbw74we25QzKLsYJHhQ4fRsQTQf0jjdsEkWY6P+L
 uqPs13RO9QmZOn4PVzlHFga/62cT71LTNNxRT/gwkhFL98aHODkyRpnhN3bbuEDbBxmssj+ZL
 EHMXc4ITlB+fPho5/zcAb7PB7CcjI8cQwmT1M0QplzuMG2vtMTX1esUoU26iowpHEDbnGJ5oA
 rhM9SFkHjnHfKU1VOddNtIyaLC0jI18wdMs/GuRZEBMveiAfj+mMeXZeiULenbmSb0LhjybPy
 8alvPm9BwsUMhmaQrIRnLj8+mnZy3cjY072IOUsZAZEIieJvoYALQHOmSnWC6YaqR0B6CxWK5
 gIEWJ38EHTlEY5S+fbVabw2PI/QJXmKjV6so4K7PUpl8InunbHZYEj3H1PhVDi5V2VbR8hD6R
 t2XRsLvMG3ThnUPPF+WxRnYYxJzkisAtCwU8+7dRAo+NuLmdqVcsfprvaYx3VsyJ9TV41XYma
 O0MRAaIw/sac5USRyFDVVLKqEhrjWjANTVrwMKM1Ukxec39ftQsj1zfw2pjqTXX9F7bLDxXLX
 EbZL8U9UQtORxsNRNV37dYGZqaUWIjIz2nr6DSNKp1YeuCOiES+km1ZaMFAWL50+JkxQaNySH
 21t6Wd7hXRlW5yuMnK/eg8dPTL6vdzNY8DDm9yyH5w==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 18/01/2023 à 10:01, Mike Frysinger a écrit :
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/strace.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index 9ae5a812cd71..11a7c3df9498 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -1380,7 +1380,8 @@ UNUSED static struct flags termios_lflags[] = {
>       FLAG_END,
>   };
>   
> -UNUSED static struct flags mlockall_flags[] = {
> +#ifdef TARGET_NR_mlockall
> +static struct flags mlockall_flags[] = {
>       FLAG_TARGET(MCL_CURRENT),
>       FLAG_TARGET(MCL_FUTURE),
>   #ifdef MCL_ONFAULT
> @@ -1388,6 +1389,7 @@ UNUSED static struct flags mlockall_flags[] = {
>   #endif
>       FLAG_END,
>   };
> +#endif
>   
>   /* IDs of the various system clocks */
>   #define TARGET_CLOCK_REALTIME              0

Applied to my linux-user-for-8.0 branch.

Thanks,
Laurent


