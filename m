Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDCD60F613
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 13:19:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0tu-00056F-9F; Thu, 27 Oct 2022 07:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oo0tr-0004Zi-GI; Thu, 27 Oct 2022 07:18:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oo0to-0000of-OU; Thu, 27 Oct 2022 07:18:15 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RBCI4e024920;
 Thu, 27 Oct 2022 11:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=hAc/Sd/rVsu1V9J2nI7vBolGRPBdB0NAv+paGZcTZKg=;
 b=hOPCI27pWrKRZk5HdhBvOpkCcH/NQsEw4epbraszZMHrQDy3HVzcDCiyH9MbwPIJwvOQ
 r7Ruzw+d+pDJQ/zv3D8z93S4gjDnv//z8wugy2npb7XD8h1CjLm5PunYne5bV9boTT6/
 3fYV1CThMdP1yRGHAexH97IjcyFXHY3ZFXCKypOfT2Yw8TH1nawQGPrlNpePUAPdYUqh
 zrKa2lA8ojC62zEzycOBhYAKEKrhAjyhZTvRTQYm6dxgGgExL9raBVUrAXJ0NOnHDU/K
 QqDzMuMTxj4dQNFKVvqvvIS9h2Z54irpVVDOwLGWCNDz588eHK8AJTNIjepPKTnlINhT Uw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfrwc05df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 11:18:08 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29RB5twU018251;
 Thu, 27 Oct 2022 11:18:06 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3kfah918gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 11:18:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29RBI4oD4391472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 11:18:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B622A4040;
 Thu, 27 Oct 2022 11:18:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 013F7A4051;
 Thu, 27 Oct 2022 11:18:04 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Oct 2022 11:18:03 +0000 (GMT)
Date: Thu, 27 Oct 2022 13:18:02 +0200
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 8/9] target/s390x: Use Int128 for returning float128
Message-ID: <20221027111802.t7p2txte5qbdtoyz@heavy>
References: <20221021073006.2398819-1-richard.henderson@linaro.org>
 <20221021073006.2398819-9-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221021073006.2398819-9-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Uz-C0U9o_zVq37vxTU7R6M93qyuD4H62
X-Proofpoint-GUID: Uz-C0U9o_zVq37vxTU7R6M93qyuD4H62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_05,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 mlxlogscore=687 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270061
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 05:30:05PM +1000, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/helper.h          | 22 +++++++--------
>  target/s390x/tcg/fpu_helper.c  | 29 ++++++++++----------
>  target/s390x/tcg/translate.c   | 49 +++++++++++++++++++---------------
>  target/s390x/tcg/insn-data.def | 20 +++++++-------
>  4 files changed, 63 insertions(+), 57 deletions(-)
> 

> @@ -2032,7 +2031,7 @@ static DisasJumpType op_cxlgb(DisasContext *s, DisasOps *o)
>      if (!m34) {
>          return DISAS_NORETURN;
>      }
> -    gen_helper_cxlgb(o->out, cpu_env, o->in2, m34);
> +    gen_helper_cxlgb(o->out_128, cpu_env, o->in2, m34);
>      tcg_temp_free_i32(m34);
>      return_low128(o->out2);
>      return DISAS_NEXT;

Do we still need return_low128() here?

>  static DisasJumpType op_lxeb(DisasContext *s, DisasOps *o)
>  {
> -    gen_helper_lxeb(o->out, cpu_env, o->in2);
> +    gen_helper_lxeb(o->out_128, cpu_env, o->in2);
>      return_low128(o->out2);
>      return DISAS_NEXT;
>  }

Same question.

