Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC166F06B8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:35:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1m1-0007QB-Cm; Thu, 27 Apr 2023 09:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ps1lx-0007PO-Na
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:34:57 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ps1lv-0005nK-VD
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qlzzavp8mwic6jj9sKRnPIwxl6mtAWzwyKonhopsLp4=; b=MhilxK70wxELRkyljsXT+ozCM9
 +ZrI0KSxa6DboGc0knJ9S0uuJFrNGnRPy4rScosuKAJC6QjIpdfwNQGPTB3AELMPVw5xahcS8BH+7
 dmEY9alsZ9C6B8YoEx+DZFfLSQkSCXjF7Sbuasc7NB/U7vKkl+Ahc5acySiz/p41hNF8=;
Message-ID: <b5443af7-4192-774c-66f4-1b020613f07b@rev.ng>
Date: Thu, 27 Apr 2023 15:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/9] Hexagon (tests/tcg/hexagon) Add v68 scalar tests
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230426023018.1742266-1-tsimpson@quicinc.com>
 <20230426023018.1742266-4-tsimpson@quicinc.com>
Organization: rev.ng
In-Reply-To: <20230426023018.1742266-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/26/23 04:30, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/v68_scalar.c    | 186 ++++++++++++++++++++++++++++++
>   tests/tcg/hexagon/Makefile.target |   2 +
>   2 files changed, 188 insertions(+)
>   create mode 100644 tests/tcg/hexagon/v68_scalar.c
>
> diff --git a/tests/tcg/hexagon/v68_scalar.c b/tests/tcg/hexagon/v68_scalar.c
> new file mode 100644
> index 0000000000..7a8adb1130
> --- /dev/null
> +++ b/tests/tcg/hexagon/v68_scalar.c
> @@ -0,0 +1,186 @@
> +/*
> + *  Copyright(c) 2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <stdio.h>
> +#include <stdbool.h>
> +#include <stdint.h>
> +
> +/*
> + *  Test the scalar core instructions that are new in v68
> + */
> +
> +int err;
> +
> +static int buffer32[] = { 1, 2, 3, 4 };
> +static long long buffer64[] = { 5, 6, 7, 8 };
> +
> +static void __check32(int line, uint32_t result, uint32_t expect)
> +{
> +    if (result != expect) {
> +        printf("ERROR at line %d: 0x%08x != 0x%08x\n",
> +               line, result, expect);
> +        err++;
> +    }
> +}
> +
> +#define check32(RES, EXP) __check32(__LINE__, RES, EXP)
> +
> +static void __check64(int line, uint64_t result, uint64_t expect)
> +{
> +    if (result != expect) {
> +        printf("ERROR at line %d: 0x%016llx != 0x%016llx\n",
> +               line, result, expect);
> +        err++;
> +    }
> +}
> +
> +#define check64(RES, EXP) __check64(__LINE__, RES, EXP)

check32/check64 show up in fpstuff.c, usr.c, mem_noshuf.c, and now in 
v[68|73]_scalar.c, but in
slight variations (different arg. names/order of args.)  We should 
consider keeping a single definition
in a check_result.h header, or similar.

Otherwise,

Reviewed-by: Anton Johansson <anjo@rev.ng>


