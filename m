Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6014A63DC11
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 18:35:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Qxp-0006K6-QW; Wed, 30 Nov 2022 12:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0Qxn-0006Iu-Bc; Wed, 30 Nov 2022 12:33:39 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1p0Qxl-00029o-EU; Wed, 30 Nov 2022 12:33:39 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AUHTRQW030284; Wed, 30 Nov 2022 17:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=PKZUOGQwwBDnz1G32cVZ5/dMu7MvrI9K+qs15D6mu6w=;
 b=CEb2cF/gjM9LGVSXsKHhEDOGVvX+A6lZmtfXz0ujZLH87EZ8JCjvrsnRv2V+IN0wK5Dp
 R3psWxr8f/XjLekt5mel3TN27b0nuaWWSt7t/t0TVEOTw3y0cvPHymLRj/FHdRzHZBdE
 LJTwSdqWCNW7n7e2W2YQfCeiFxCX58pv0P+GNjH7UCmx2t8O2VKOaYBgOB3VhbtM0J29
 yW/XT0Nzbq+VfyfAOhGNKOuixOkJsScUOZ1cjzsFhCP0Rzx780RIS9KIFMjr4SPjaYdO
 PO/nmcXsUYexPwHwDUSf0R9D9BmtzoJxZDKGxIWHP8HU/SvrUyLhJSf3JzngFNQ6n70R VA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m6bmd83tr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 17:33:32 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AUHKx4b028149;
 Wed, 30 Nov 2022 17:33:30 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3m3ae94fwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Nov 2022 17:33:30 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2AUHXRJi34472502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Nov 2022 17:33:27 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA1A44C058;
 Wed, 30 Nov 2022 17:33:27 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5572C4C046;
 Wed, 30 Nov 2022 17:33:27 +0000 (GMT)
Received: from heavy (unknown [9.171.36.196])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 30 Nov 2022 17:33:27 +0000 (GMT)
Date: Wed, 30 Nov 2022 18:33:25 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 21/26] target/s390x: Remove PER check from use_goto_tb
Message-ID: <20221130173325.v5u6xnzcxir4ntrc@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-22-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006034421.1179141-22-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q-Z-6FDYs0yjL3maqEEZN9LN0TIHhFX8
X-Proofpoint-GUID: Q-Z-6FDYs0yjL3maqEEZN9LN0TIHhFX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=884 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211300122
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Oct 05, 2022 at 08:44:16PM -0700, Richard Henderson wrote:
> While it is common for the PC update to happen in the
> shadow of a goto_tb, it is not required to be there.
> By moving it before the goto_tb, we can also place the
> call to helper_per_branch there, and then afterward
> chain to the next tb.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index a2315ac73e..e6c7c2a6ae 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -654,9 +654,6 @@ static void gen_op_calc_cc(DisasContext *s)
>  
>  static bool use_goto_tb(DisasContext *s, uint64_t dest)
>  {
> -    if (per_enabled(s)) {
> -        return false;
> -    }
>      return translator_use_goto_tb(&s->base, dest);
>  }
>  
> @@ -1157,15 +1154,16 @@ static DisasJumpType help_goto_direct(DisasContext *s, int64_t disp)
>          per_branch_disp(s, disp);
>          return DISAS_NEXT;
>      }
> +
> +    update_psw_addr_disp(s, disp);
> +    per_branch_dest(s, psw_addr);
> +
>      if (use_goto_tb(s, s->base.pc_next + disp)) {
>          update_cc_op(s);
>          tcg_gen_goto_tb(0);
> -        update_psw_addr_disp(s, disp);
>          tcg_gen_exit_tb(s->base.tb, 0);
>          return DISAS_NORETURN;
>      } else {
> -        update_psw_addr_disp(s, disp);
> -        per_branch_dest(s, psw_addr);
>          return DISAS_PC_UPDATED;
>      }
>  }
> -- 
> 2.34.1

While looking at this, I had a hard time convincing myself that
successful-branch PER events work at all. The code does set
per_perc_atmid, but afterwards it does goto_tb/exit_tb, and does
not reach per_check_exception() added by translate_one().

I wrote a small test for this theory by turning on PER for
successful-branch events and looping 10 times. It passes in KVM, but
fails in TCG. Here is the relevant IR fragment:

IN: 
0x00000212:  a706 0000       brct     %r0, 0x212

OP:
 ld_i32 tmp0,env,$0xfffffffffffffff0
 brcond_i32 tmp0,$0x0,lt,$L0

 ---- 0000000000000212 0000000000000004 0000000000000004
 mov_i64 tmp2,psw_addr
 call per_ifetch,$0x1,$0,env,tmp2
 sub_i64 tmp2,r0,$0x1
 extract2_i64 r0,r0,tmp2,$0x20
 rotl_i64 r0,r0,$0x20
 mov_i32 tmp0,tmp2
 brcond_i32 tmp0,$0x0,eq,$L1
 /* branch taken: set per_perc_atmid and exit */
 mov_i64 gbea,psw_addr
 call per_branch,$0x1,$0,env,gbea,psw_addr
 goto_tb $0x0
 exit_tb $0x7f73fc000400
 set_label $L1
 add_i64 psw_addr,psw_addr,$0x4
 goto_tb $0x1
 exit_tb $0x7f73fc000401
 /* check per_perc_atmid */
 call per_check_exception,$0x0,$0,env
 set_label $L0
 exit_tb $0x7f73fc000403

I will post the proposed fix and the test itself shortly.

That said, the patch makes sense to me and does not make things worse,
so:

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

