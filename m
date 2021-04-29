Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC836F0C8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 22:05:17 +0200 (CEST)
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcCuS-0007XC-7T
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 16:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcCsW-0006ys-Um; Thu, 29 Apr 2021 16:03:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcCsU-0003Ss-Gw; Thu, 29 Apr 2021 16:03:16 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TK2wOP102587; Thu, 29 Apr 2021 16:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=jZtbfR0ippCDOWQD+mDDez9EsbbHEs7TxD8noTY/lrc=;
 b=lX9UAD2jVJgCSArrQj4cAmcp+e02SQjd+JozBOZDCq1NU6gmqMOIEcOXGgog22/FUF4e
 jO9K/ozyGOe1jy/sid0nHPBo175t0qXtgDM4PqFFpKIENZ0tTNrZo7Pf3fRXpSEI8zuV
 fJDLTyBP3aDMDEe8Vh1hXbvIqbdEsvyyPY8Mq+D0GoQuROT0mNAGr0rYqd2QCCc2GS8o
 8u7zmtiPq2oG1Ddy1TWB04Np9RHRJrEmC/Q7LUH0j+S8Kzp+hL1XGEw2oBfci9c8sNja
 +088MTOa2ptOr0dY4QDtME+BTYgDuYqalVBWuQLmx6bqhT8nRurd4f9dAUBx8aIZ3I/w Nw== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38802562qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 16:03:04 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TJpUw6022197;
 Thu, 29 Apr 2021 20:03:03 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 387r6qw35c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 20:03:03 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TK32Zh30147040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 20:03:02 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 866B4AC05E;
 Thu, 29 Apr 2021 20:03:02 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8A9FAC062;
 Thu, 29 Apr 2021 20:03:01 +0000 (GMT)
Received: from localhost (unknown [9.211.156.251])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 29 Apr 2021 20:03:01 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/7] target/ppc: Created !TCG SPR registration macro
In-Reply-To: <20210429162130.2412-3-bruno.larsen@eldorado.org.br>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-3-bruno.larsen@eldorado.org.br>
Date: Thu, 29 Apr 2021 17:02:59 -0300
Message-ID: <87eees3ll8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: i3L8pAb1lc_3L7lzRGQhwjmrB39XbBNb
X-Proofpoint-ORIG-GUID: i3L8pAb1lc_3L7lzRGQhwjmrB39XbBNb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_10:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290128
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org, "Bruno Larsen
 \(billionai\)" <bruno.larsen@eldorado.org.br>, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:

> Added macros for spr_register and spr_register_kvm that can
> ignore SPR RW callbacks, in preparation to support building
> without TCG.
>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/translate_init.c.inc | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
> index 6235eb7536..3ddcfefb62 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -720,6 +720,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>      helper_mtvscr(env, val);
>  }
>  
> +#ifdef CONFIG_TCG
>  #ifdef CONFIG_USER_ONLY
>  #define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
>                           oea_read, oea_write, one_reg_id, initial_value)       \
> @@ -728,7 +729,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>                              oea_read, oea_write, hea_read, hea_write,          \
>                              one_reg_id, initial_value)                         \
>      _spr_register(env, num, name, uea_read, uea_write, initial_value)
> -#else
> +#else /*CONFIG_USER_ONLY */

Missing a space after the first *

>  #if !defined(CONFIG_KVM)
>  #define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
>                           oea_read, oea_write, one_reg_id, initial_value)       \
> @@ -739,7 +740,7 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>                              one_reg_id, initial_value)                         \
>      _spr_register(env, num, name, uea_read, uea_write,                         \
>                    oea_read, oea_write, hea_read, hea_write, initial_value)
> -#else
> +#else /* CONFIG_KVM */
>  #define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
>                           oea_read, oea_write, one_reg_id, initial_value)       \
>      _spr_register(env, num, name, uea_read, uea_write,                         \

This won't work if you don't include the change to _spr_register as well.

> @@ -751,8 +752,21 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>      _spr_register(env, num, name, uea_read, uea_write,                         \
>                    oea_read, oea_write, hea_read, hea_write,                    \
>                    one_reg_id, initial_value)
> -#endif
> -#endif
> +#endif /* CONFIG_KVM */
> +#endif /* CONFIG_USER_ONLY */
> +#else /* CONFIG_TCG */
> +#ifdef CONFIG_KVM /* sanity check. should always enter this */
> +#define spr_register_kvm(env, num, name, uea_read, uea_write,                  \
> +                         oea_read, oea_write, one_reg_id, initial_value)       \
> +    _spr_register(env, num, name, one_reg_id, initial_value)
> +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,               \
> +                            oea_read, oea_write, hea_read, hea_write,          \
> +                            one_reg_id, initial_value)                         \
> +    _spr_register(env, num, name, one_reg_id, initial_value)
> +#else /* CONFIG_KVM */
> +#error "Either TCG or KVM should be condigured"

configured

> +#endif /* CONFIG_KVM */
> +#endif /* CONFIG_TCG */
>  
>  #define spr_register(env, num, name, uea_read, uea_write,                      \
>                       oea_read, oea_write, initial_value)                       \

