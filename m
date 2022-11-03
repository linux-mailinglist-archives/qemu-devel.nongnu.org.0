Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A1B617B50
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 12:05:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqY1V-0007T8-IO; Thu, 03 Nov 2022 07:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqY1O-0007RD-PF; Thu, 03 Nov 2022 07:04:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1oqY1M-0000oK-3T; Thu, 03 Nov 2022 07:04:30 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A39cSMl009134;
 Thu, 3 Nov 2022 11:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=9Vym0JgwWO0qPUtUEZTYiUPDkmCpAqKrLif+ATf+0Cg=;
 b=dHIduLPnKerVibp7X6Oi7zf9t8ANxhPV/hnEiZQnHkkSXMeSzt2RdjKqbYisKU8ikeMF
 sVAX6r4cMZQjBEFpABbWQFouvIxfzzFf0CACRxA/366pkhwbyMm2aBroD+cmo0zhBbmX
 Wv81uy+OOqR4NylSmGGR3T7LyHxvtqLfUb0UR8z97eEmU8ksDBbYJDfzSLkvP+Nz1ED3
 DlfMJQO0E7w1BquxjsoFzPLpi9522ZlKvai8kWcUlUeszUskSLIu9fdfFbzNk7cdFFea
 v9MzUrFrkf+53H7JLDb7mTNRjTApclQDJh3+pck7tWdrIRKopkTQIbGW0Fp1vXxhf7wj vg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km9mnd15r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 11:04:24 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3B4BUY018247;
 Thu, 3 Nov 2022 11:04:22 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3kgut90mq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 11:04:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A3B4JZe393764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 11:04:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBE1552075;
 Thu,  3 Nov 2022 11:04:19 +0000 (GMT)
Received: from heavy (unknown [9.171.39.72])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 93CC952078;
 Thu,  3 Nov 2022 11:04:19 +0000 (GMT)
Date: Thu, 3 Nov 2022 12:04:18 +0100
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: Re: [PATCH 04/26] target/s390x: Use tcg_constant_* in
 translate_vx.c.inc
Message-ID: <20221103110418.ou6uj6k26fzookxr@heavy>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
 <20221006034421.1179141-5-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006034421.1179141-5-richard.henderson@linaro.org>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: c-3aQMMdDfPXhpqBvx1LKGSBe4JKkYSH
X-Proofpoint-GUID: c-3aQMMdDfPXhpqBvx1LKGSBe4JKkYSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 mlxscore=0
 mlxlogscore=966 suspectscore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211030076
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

On Wed, Oct 05, 2022 at 08:43:59PM -0700, Richard Henderson wrote:
> In most cases, this is a simple local allocate and free
> replaced by tcg_constant_*.  In three cases, a variable
> temp was initialized with a constant value -- reorg to
> localize the constant.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate_vx.c.inc | 45 +++++++++++++----------------
>  1 file changed, 20 insertions(+), 25 deletions(-)

...

> @@ -1359,7 +1359,7 @@ static DisasJumpType op_va(DisasContext *s, DisasOps *o)
>  static void gen_acc(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, uint8_t es)
>  {
>      const uint8_t msb_bit_nr = NUM_VEC_ELEMENT_BITS(es) - 1;
> -    TCGv_i64 msb_mask = tcg_const_i64(dup_const(es, 1ull << msb_bit_nr));
> +    TCGv_i64 msb_mask = tcg_constant_i64(dup_const(es, 1ull << msb_bit_nr));
>      TCGv_i64 t1 = tcg_temp_new_i64();
>      TCGv_i64 t2 = tcg_temp_new_i64();
>      TCGv_i64 t3 = tcg_temp_new_i64();

This also fixes a leak, right?

...

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>

