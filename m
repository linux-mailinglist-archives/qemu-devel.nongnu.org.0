Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C41B00F1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 07:17:16 +0200 (CEST)
Received: from localhost ([::1]:57376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQOny-0006GU-Pk
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 01:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jQO4x-0004rO-Fr
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 00:30:43 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jQO4q-0005ba-VX
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 00:30:38 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:38477)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jQO4p-0005S6-66
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 00:30:36 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07489178|-1; BR=01201311R111ec; CH=green;
 DM=|CONTINUE|false|; DS=SPAM|spam_ad|0.892666-0.000228023-0.107106;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03295; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=5; RT=5; SR=0; TI=SMTPD_---.HKBXbL-_1587357013; 
Received: from 30.225.208.25(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HKBXbL-_1587357013)
 by smtp.aliyun-inc.com(10.147.41.137);
 Mon, 20 Apr 2020 12:30:17 +0800
Subject: Re: [PATCH 5/7] tcg: Use tcg_gen_gvec_dup_imm in logical
 simplifications
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20200418150411.1831-1-richard.henderson@linaro.org>
 <20200418150411.1831-6-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <c89936a0-f679-3b2b-3845-d376163f2c1d@c-sky.com>
Date: Mon, 20 Apr 2020 12:30:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200418150411.1831-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/19
 23:17:04
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: peter.maydell@linaro.org, david@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/4/18 23:04, Richard Henderson wrote:
> Replace the outgoing interface.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>

Zhiwei
> ---
>   tcg/tcg-op-gvec.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
> index 593bb4542e..de16c027b3 100644
> --- a/tcg/tcg-op-gvec.c
> +++ b/tcg/tcg-op-gvec.c
> @@ -2326,7 +2326,7 @@ void tcg_gen_gvec_xor(unsigned vece, uint32_t dofs, uint32_t aofs,
>       };
>   
>       if (aofs == bofs) {
> -        tcg_gen_gvec_dup8i(dofs, oprsz, maxsz, 0);
> +        tcg_gen_gvec_dup_imm(MO_64, dofs, oprsz, maxsz, 0);
>       } else {
>           tcg_gen_gvec_3(dofs, aofs, bofs, oprsz, maxsz, &g);
>       }
> @@ -2343,7 +2343,7 @@ void tcg_gen_gvec_andc(unsigned vece, uint32_t dofs, uint32_t aofs,
>       };
>   
>       if (aofs == bofs) {
> -        tcg_gen_gvec_dup8i(dofs, oprsz, maxsz, 0);
> +        tcg_gen_gvec_dup_imm(MO_64, dofs, oprsz, maxsz, 0);
>       } else {
>           tcg_gen_gvec_3(dofs, aofs, bofs, oprsz, maxsz, &g);
>       }
> @@ -2360,7 +2360,7 @@ void tcg_gen_gvec_orc(unsigned vece, uint32_t dofs, uint32_t aofs,
>       };
>   
>       if (aofs == bofs) {
> -        tcg_gen_gvec_dup8i(dofs, oprsz, maxsz, -1);
> +        tcg_gen_gvec_dup_imm(MO_64, dofs, oprsz, maxsz, -1);
>       } else {
>           tcg_gen_gvec_3(dofs, aofs, bofs, oprsz, maxsz, &g);
>       }
> @@ -2411,7 +2411,7 @@ void tcg_gen_gvec_eqv(unsigned vece, uint32_t dofs, uint32_t aofs,
>       };
>   
>       if (aofs == bofs) {
> -        tcg_gen_gvec_dup8i(dofs, oprsz, maxsz, -1);
> +        tcg_gen_gvec_dup_imm(MO_64, dofs, oprsz, maxsz, -1);
>       } else {
>           tcg_gen_gvec_3(dofs, aofs, bofs, oprsz, maxsz, &g);
>       }


