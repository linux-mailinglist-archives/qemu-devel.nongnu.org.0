Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E20399505
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 22:56:36 +0200 (CEST)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loXum-00012n-0v
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 16:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loXsl-00006H-Ti; Wed, 02 Jun 2021 16:54:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24970
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1loXsi-0008WR-FH; Wed, 02 Jun 2021 16:54:31 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152KYHFS163521; Wed, 2 Jun 2021 16:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=tqe+IgjMIBN6vHVbRwgKYDaDW3cj2UjgIip9UmgSM8s=;
 b=LkHr5BX6F38jJZARIxyIkSV7tOThz1och922OL9yX9dtJo6NRCPrOvThQpkqms2O3bs+
 /rC+G5hj/fJP/sht3Y2Ax82BykrE1rzMfmz0UW1PT0teqN7ZjhpyhGeSUOWdOowloKf2
 0kD6koQi7Lb8fcM3rl/UjCN3u902l3OUVNr7e7CHMk5T9z2O7hyHTE/GLFo661orHn40
 H+yNiv5bixY8D3lo06cUOeMOZtlsieX8AUoH1ff9InqwGlwEY5Kkm84etORcaP6sFjd9
 ObZ3higRGjMlCqGpUxc92lVHbojUoCKCPCY7oPv6lrsqlglss2iEIo1WVqS9Dycy/TnR KA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38xgf8sjnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 16:54:19 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 152KqlX8028726;
 Wed, 2 Jun 2021 20:54:18 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 38ud89tgs3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 20:54:18 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 152KsHlN37355862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Jun 2021 20:54:17 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C120DAE060;
 Wed,  2 Jun 2021 20:54:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00A2EAE062;
 Wed,  2 Jun 2021 20:54:16 +0000 (GMT)
Received: from localhost (unknown [9.211.44.140])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  2 Jun 2021 20:54:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH 1/4] target/ppc: Don't compile ppc_tlb_invalid_all
 without TCG
In-Reply-To: <20210602192604.90846-2-lucas.araujo@eldorado.org.br>
References: <20210602192604.90846-1-lucas.araujo@eldorado.org.br>
 <20210602192604.90846-2-lucas.araujo@eldorado.org.br>
Date: Wed, 02 Jun 2021 17:54:14 -0300
Message-ID: <8735u0vvgp.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 94tgJDEgEZFoJd8o3ImU2sdTPmLs5XZs
X-Proofpoint-ORIG-GUID: 94tgJDEgEZFoJd8o3ImU2sdTPmLs5XZs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_10:2021-06-02,
 2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=878
 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106020129
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: luis.pires@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 fernando.valle@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br> writes:

> The function ppc_tlb_invalid_all is not compiled anymore in a TCG-less
> environment, and the call to that function has been disabled in this
> situation.
>
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
> Is there a better way than to deal with the
> ppc_tlb_invalidate_all call than ifdef? I couldn't think of one.
> ---
>  target/ppc/cpu_init.c   | 4 ++++
>  target/ppc/mmu_helper.c | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 74a397ad6c..2051f24467 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9114,7 +9114,11 @@ static void ppc_cpu_reset(DeviceState *dev)
>  #if !defined(CONFIG_USER_ONLY)
>      env->nip = env->hreset_vector | env->excp_prefix;
>      if (env->mmu_model != POWERPC_MMU_REAL) {
> +#if defined(CONFIG_TCG)
>          ppc_tlb_invalidate_all(env);
> +#else
> +	cpu_abort(env_cpu(env),"PowerPC not in real mode, invalid in this build\n");

This looks like it would always abort when !TCG with most processors
since their mmu_model would be different from POWERPC_MMU_REAL. Leaving
the whole if statement out would be better and there's no need for an
error.

> +#endif
>      }
>  #endif
>  
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 1ecb36e85a..803b66f2b0 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -825,6 +825,7 @@ static int mmubooke_get_physical_address(CPUPPCState *env, mmu_ctx_t *ctx,
>      return ret;
>  }
>  
> +#ifdef CONFIG_TCG
>  static void booke206_flush_tlb(CPUPPCState *env, int flags,
>                                 const int check_iprot)
>  {
> @@ -846,6 +847,7 @@ static void booke206_flush_tlb(CPUPPCState *env, int flags,
>  
>      tlb_flush(env_cpu(env));
>  }
> +#endif
>  
>  static hwaddr booke206_tlb_to_page_size(CPUPPCState *env,
>                                          ppcmas_tlb_t *tlb)
> @@ -1952,6 +1954,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
>  }
>  #endif
>  
> +#ifdef CONFIG_TCG
>  /*****************************************************************************/
>  /* TLB management */
>  void ppc_tlb_invalidate_all(CPUPPCState *env)
> @@ -1995,6 +1998,7 @@ void ppc_tlb_invalidate_all(CPUPPCState *env)
>          break;
>      }
>  }
> +#endif
>  
>  #ifdef CONFIG_TCG
>  void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)

