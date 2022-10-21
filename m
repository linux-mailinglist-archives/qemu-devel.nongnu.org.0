Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 071D5607549
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:44:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpWE-0000wV-13
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:44:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpSv-0006KQ-Gx
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1olpS1-0005Pf-3i; Fri, 21 Oct 2022 06:40:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1olpRy-0002mh-S1; Fri, 21 Oct 2022 06:40:28 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29LAbIqA025998;
 Fri, 21 Oct 2022 10:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=v2Fp76MMuzfJYNAvRhCF0EUzw/SrdY7ZjXqH1UwAumQ=;
 b=AXqdABf6tJ+jm0NgLS/8fEsLWvf60xhnBtp1Wl+N8Qv8bAhPozUQw39ZpR/SKoOfsUzZ
 D4hXtDHZZ0NJB/A9+/o73hUktiotLEWTv2VnohGmXRmuGxigDkSUf4/sA9tszsPr0xUs
 q+3gxuZ2ryAEStWXkvj6sUGizPEg4K8cGaoBgpVHTBT4G2nKK3rR6IUW/buR16QrYbj0
 r4mv4Xj6qb2z2hZLIna+lw9zR0X05zsp9jsXhO7shpwC4IIRH7y+rT4ilzG53y5wqVAn
 c7MItnoXrrph41MAGMgvoisOIlcK2fKVGaTx6hBLOvVTIuNbhObOcNfHGWwed2Y5ZiAO UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbsfcgnxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 10:40:07 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29LAcf6a002920;
 Fri, 21 Oct 2022 10:40:07 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kbsfcgnvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 10:40:07 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29LAb67s015538;
 Fri, 21 Oct 2022 10:40:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3k99fn5a01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 10:40:04 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29LAe1hl9372140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Oct 2022 10:40:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA538AE057;
 Fri, 21 Oct 2022 10:35:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0B3BAE056;
 Fri, 21 Oct 2022 10:35:53 +0000 (GMT)
Received: from [9.171.39.72] (unknown [9.171.39.72])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Oct 2022 10:35:53 +0000 (GMT)
Message-ID: <47845fe1fefa760ce11b687f85c5f631ea0a8646.camel@linux.ibm.com>
Subject: Re: [PATCH  v3 23/26] target/s390x: don't use ld_code2 to probe
 next pc
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, David
 Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Thomas
 Huth <thuth@redhat.com>, "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Date: Fri, 21 Oct 2022 12:35:53 +0200
In-Reply-To: <20221020115209.1761864-24-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: C3YmXTdBHvhwpL85NMHlvvuNWbM0FkHv
X-Proofpoint-GUID: GcNqeVo7Qs0gERCMmxziMNQBkot9UUR_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=958
 lowpriorityscore=0 phishscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2022-10-20 at 12:52 +0100, Alex Bennée wrote:
> This isn't an translator picking up an instruction so we shouldn't
> use
> the translator_lduw function which has side effects for plugins.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/translate.c
> b/target/s390x/tcg/translate.c
> index 1d2dddab1c..f4de8efe3a 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -6612,7 +6612,7 @@ static void
> s390x_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
>  static target_ulong get_next_pc(CPUS390XState *env, DisasContext *s,
>                                  uint64_t pc)
>  {
> -    uint64_t insn = ld_code2(env, s, pc);
> +    uint64_t insn = cpu_lduw_code(env, pc);
>  
>      return pc + get_ilen((insn >> 8) & 0xff);
>  }

Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>

