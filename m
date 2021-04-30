Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1469370425
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 01:40:26 +0200 (CEST)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcckD-0008Fh-Oa
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 19:40:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcciH-0007jC-Mq; Fri, 30 Apr 2021 19:38:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcciD-0007Hf-He; Fri, 30 Apr 2021 19:38:24 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13UNXKX2127310; Fri, 30 Apr 2021 19:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=NQdmhh8Bw7O40WSt91f/zCyfoytpA7LHbyUxfDU+Egg=;
 b=MpSqWofu5SLWqSS2NAP7vtbugRX0Ul214LbkTUtF+yOXhiY5cGIEHdxbuZZKBNy2XsX3
 42Mn66J9NyaUohqzrc50WG5TKfiA7dkLHiCt2KUXq+SjIcHVZvvdGkFEkouu47HpiXhO
 fA3ZhBy+mMsBqGwXAwLq3Fz6DyskMpQvwhi5c6l3adh/uktV37W/WltOqOdGqUAbhpZj
 tfsA8qboleMsAxzs1bnYD7UjxU/GzlvTESVK5webdBnF2RxvSUK767EH+RUC/5InVf1m
 pzgrQAQlw8dWrfVfEeu6/6uL/FlPvlTk3KdjZ/gzlV1TJz8Zur5ddfqtg7LgWD1lUdZK FQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388u13gsw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 19:38:11 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13UNXPTC022760;
 Fri, 30 Apr 2021 23:38:10 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 388gtrw4as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 23:38:10 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13UNc9wD27722194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 23:38:09 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94AED112066;
 Fri, 30 Apr 2021 23:38:09 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3B35112062;
 Fri, 30 Apr 2021 23:38:08 +0000 (GMT)
Received: from localhost (unknown [9.163.27.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 30 Apr 2021 23:38:08 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH v2 2/2] hw/ppc: Moved TCG code to spapr_hcall_tcg
In-Reply-To: <20210430184047.81653-3-lucas.araujo@eldorado.org.br>
References: <20210430184047.81653-1-lucas.araujo@eldorado.org.br>
 <20210430184047.81653-3-lucas.araujo@eldorado.org.br>
Date: Fri, 30 Apr 2021 20:38:05 -0300
Message-ID: <87wnsj1gyq.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yhh01U8BpoHwzFhMZt058eQcr7astB73
X-Proofpoint-GUID: yhh01U8BpoHwzFhMZt058eQcr7astB73
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_15:2021-04-30,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 clxscore=1015
 phishscore=0 mlxscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300167
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br> writes:

> Also spapr_hcall_tcg.c only has 2 duplicated functions (valid_ptex and
> is_ram_address), what is the advised way to deal with these
> duplications?

valid_ptex is only needed by the TCG hcalls isn't it?

is_ram_address could in theory stay where it is but be exposed via
hw/ppc/spapr.h since spapr_hcall.c will always be present.

> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
> ---
>  hw/ppc/meson.build       |   3 +
>  hw/ppc/spapr_hcall.c     | 300 ++--------------------------------
>  hw/ppc/spapr_hcall_tcg.c | 343 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 363 insertions(+), 283 deletions(-)
>  create mode 100644 hw/ppc/spapr_hcall_tcg.c

<snip>

> @@ -2021,14 +1752,17 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, target_ulong opcode,
>  
>  static void hypercall_register_types(void)
>  {
> +
> +#ifndef CONFIG_TCG
>      /* hcall-pft */
> -    spapr_register_hypercall(H_ENTER, h_enter);
> -    spapr_register_hypercall(H_REMOVE, h_remove);
> -    spapr_register_hypercall(H_PROTECT, h_protect);
> -    spapr_register_hypercall(H_READ, h_read);
> +    spapr_register_hypercall(H_ENTER, h_tcg_only);
> +    spapr_register_hypercall(H_REMOVE, h_tcg_only);
> +    spapr_register_hypercall(H_PROTECT, h_tcg_only);
> +    spapr_register_hypercall(H_READ, h_tcg_only);
>  
>      /* hcall-bulk */
> -    spapr_register_hypercall(H_BULK_REMOVE, h_bulk_remove);
> +    spapr_register_hypercall(H_BULK_REMOVE, h_tcg_only);
> +#endif /* !CONFIG_TCG */

My suggestion for this was:

#ifndef CONFIG_TCG
static target_ulong h_tcg_only(PowerPCCPU *cpu, SpaprMachineState *spapr,
                               target_ulong opcode, target_ulong *args)
{
    g_assert_not_reached();
}

static void hypercall_register_tcg(void)
{
    spapr_register_hypercall(H_ENTER, h_tcg_only);
    spapr_register_hypercall(H_REMOVE, h_tcg_only);
    spapr_register_hypercall(H_PROTECT, h_tcg_only);
    spapr_register_hypercall(H_READ, h_tcg_only);
    (...)
}
#endif

static void hypercall_register_types(void)
{
    hypercall_register_tcg();

    <register KVM hcalls>
}
type_init(hypercall_register_types);

> +static void hypercall_register_types(void)
> +{
> +    /* hcall-pft */
> +    spapr_register_hypercall(H_ENTER, h_enter);
> +    spapr_register_hypercall(H_REMOVE, h_remove);
> +    spapr_register_hypercall(H_PROTECT, h_protect);
> +    spapr_register_hypercall(H_READ, h_read);
> +
> +    /* hcall-bulk */
> +    spapr_register_hypercall(H_BULK_REMOVE, h_bulk_remove);
> +}
> +
> +type_init(hypercall_register_types)

And here:

void hypercall_register_tcg(void)
{
    /* hcall-pft */
    spapr_register_hypercall(H_ENTER, h_enter);
    spapr_register_hypercall(H_REMOVE, h_remove);
    spapr_register_hypercall(H_PROTECT, h_protect);
    spapr_register_hypercall(H_READ, h_read);
    (...)
}

Because the TCG and KVM builds are not mutually exlusive, so you would
end up calling type_init twice (which I don't know much about but I
assume is not allowed).


