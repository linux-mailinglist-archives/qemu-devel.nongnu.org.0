Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8A4617FE7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 15:47:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqbTL-0003uD-Fd; Thu, 03 Nov 2022 10:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqbTI-0003t3-TP; Thu, 03 Nov 2022 10:45:32 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqbTG-0003Hn-O0; Thu, 03 Nov 2022 10:45:32 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3EUexh002226;
 Thu, 3 Nov 2022 14:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=MKbpYzJJ2GJwWX8PA1FBIISZvN8yXBbN2fLM17ijKJ4=;
 b=aI7Xz4TFq2mJdPwKGxJ0pHvuTA7t827B9fEtHAwjX/WaCCTEWn5WKkPkQTN9A8zkbT28
 /fj/TBHVB9e5fRI5Q1EH1jN+/3OoepR+FjWGvWH3/HOee6NCHSieeYRM71Ltj9gfoUMI
 CMu7SRIoyRxlJBSwdjisiK92ozjb0mWejlMBBSYD851uozeEUfx4uA61hZ4BxSmLuVlk
 kGtKBy5vX9L7GUO4DqnUMJc7t49IWNoeiC3o9B+Qzss/rYZ0sAPdl80aDKVxzuJy5f2i
 iV3GoCLM+abFWCxqm5EopB2Mluvvc/05poSAMaZkxoiNExnFa0YmXKIYPjBuVr+6NSzn Eg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmbm315fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 14:45:25 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3EZdGe023725;
 Thu, 3 Nov 2022 14:45:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3kgut8xpd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 14:45:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2A3EjvWZ40960286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 14:45:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3986A4C046;
 Thu,  3 Nov 2022 14:45:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F363B4C040;
 Thu,  3 Nov 2022 14:45:20 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Nov 2022 14:45:20 +0000 (GMT)
Date: Thu, 3 Nov 2022 15:45:19 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 18/26] target/s390x: Split per_branch
Message-ID: <20221103144519.q4aybcr33sanlhpe@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-19-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006034421.1179141-19-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: F07OY4grERTSrJDVJaQjSXkhZ98GoCB-
X-Proofpoint-GUID: F07OY4grERTSrJDVJaQjSXkhZ98GoCB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 05, 2022 at 08:44:13PM -0700, Richard Henderson wrote:
> Split into per_branch_dest and per_branch_disp, which can be
> used for direct and indirect.  In preperation for TARGET_TB_PCREL,
> call per_branch_* before indirect branches.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 712f6d5795..bd2ee1c96e 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -350,21 +350,25 @@ static inline bool per_enabled(DisasContext *s)
>  #endif
>  }
>  
> -static void per_branch(DisasContext *s, bool to_next)
> +static void per_branch_dest(DisasContext *s, TCGv_i64 dest)
>  {
>  #ifndef CONFIG_USER_ONLY
>      gen_psw_addr_disp(s, gbea, 0);
> +    if (s->base.tb->flags & FLAG_MASK_PER) {
> +        gen_helper_per_branch(cpu_env, gbea, dest);
> +    }
> +#endif
> +}
>  
> -    if (per_enabled(s)) {
> -        if (to_next) {
> -            TCGv_i64 next_pc = tcg_temp_new_i64();
> -
> -            gen_psw_addr_disp(s, next_pc, s->ilen);
> -            gen_helper_per_branch(cpu_env, gbea, next_pc);
> -            tcg_temp_free_i64(next_pc);
> -        } else {
> -            gen_helper_per_branch(cpu_env, gbea, psw_addr);
> -        }
> +static void per_branch_disp(DisasContext *s, int64_t disp)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    gen_psw_addr_disp(s, gbea, 0);
> +    if (s->base.tb->flags & FLAG_MASK_PER) {
> +        TCGv_i64 dest = tcg_temp_new_i64();
> +        gen_psw_addr_disp(s, dest, disp);
> +        gen_helper_per_branch(cpu_env, gbea, dest);
> +        tcg_temp_free_i64(dest);
>      }
>  #endif
>  }

...

Nit: maybe use per_enabled(s) instead of testing the mask manually?

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

