Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63E36B9E0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 21:17:32 +0200 (CEST)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb6ja-0002fn-TD
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 15:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lb6ht-00028p-Hk; Mon, 26 Apr 2021 15:15:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28602
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lb6hn-0004KP-6l; Mon, 26 Apr 2021 15:15:45 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QJBD1m114030; Mon, 26 Apr 2021 15:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=jUmUmCPKhQWbbYV83w76DNxlO9ty4qPWcu1Ka1be4Qo=;
 b=QrWleqom7SR/ovM7PcUsoFh00bl3o+Eum69Oo8YoixtwIykj6O9N4XGkDklFIllnFoOV
 kwVlHH/tiOB+jLUNhvgXgWYnbRekH0sAtWnG83EOuNZuspCP1DumiHTc/ODHsaR2KbZh
 t1KjW0Bhy4HccSiZP5Txgt7q+aqcmJ/aePi+NThncyFPT407YztVGJTNVZoZYs+Fvsg2
 feCy74DU5gsBRB9lQpg4Yw37tSiDVv7DideASh2xzce9ncX9tRna2xGDKFMCUYFdOlGl
 NP1XchfyVbiGQRFg6679fWYWgKJlyWua3iIIKe/9q0oWqDOJPrGm7TLIcls5rrbqLl7L qw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3863es83d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 15:15:29 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13QJ79aK024696;
 Mon, 26 Apr 2021 19:15:29 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 384ay8ve3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 19:15:29 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13QJFRCs53215614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 19:15:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A95B9AC066;
 Mon, 26 Apr 2021 19:15:27 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD04AAC07A;
 Mon, 26 Apr 2021 19:15:26 +0000 (GMT)
Received: from localhost (unknown [9.163.28.241])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 26 Apr 2021 19:15:26 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 1/4] target/ppc: move opcode table logic to translate.c
In-Reply-To: <20210423191807.77963-2-bruno.larsen@eldorado.org.br>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
 <20210423191807.77963-2-bruno.larsen@eldorado.org.br>
Date: Mon, 26 Apr 2021 16:15:23 -0300
Message-ID: <87pmyg3lis.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4v7hmuoXgWLzWWNzB7eF5pbp9GUmo8Rn
X-Proofpoint-ORIG-GUID: 4v7hmuoXgWLzWWNzB7eF5pbp9GUmo8Rn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_09:2021-04-26,
 2021-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104260147
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

> code motion to remove opcode callback table from
> translate_init.c.inc to translate.c in preparation
> to remove #include <translate_init.c.inc> from
> translate.c

I'd mention the creation of destroy_ppc_opcodes since this patch is not
strictly just moving code.

>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/internal.h           |   6 +
>  target/ppc/translate.c          | 394 ++++++++++++++++++++++++++++++++
>  target/ppc/translate_init.c.inc | 390 +------------------------------
>  3 files changed, 401 insertions(+), 389 deletions(-)

<snip>

> +void destroy_ppc_opcodes(PowerPCCPU *cpu)
> +{
> +    opc_handler_t **table, **table_2;
> +    int i, j, k;
> +
> +    for (i = 0; i < PPC_CPU_OPCODES_LEN; i++) {
> +        if (cpu->opcodes[i] == &invalid_handler) {
> +            continue;
> +        }
> +        if (is_indirect_opcode(cpu->opcodes[i])) {
> +            table = ind_table(cpu->opcodes[i]);
> +            for (j = 0; j < PPC_CPU_INDIRECT_OPCODES_LEN; j++) {
> +                if (table[j] == &invalid_handler) {
> +                    continue;
> +                }
> +                if (is_indirect_opcode(table[j])) {
> +                    table_2 = ind_table(table[j]);
> +                    for (k = 0; k < PPC_CPU_INDIRECT_OPCODES_LEN; k++) {
> +                        if (table_2[k] != &invalid_handler &&
> +                            is_indirect_opcode(table_2[k])) {
> +                            g_free((opc_handler_t *)((uintptr_t)table_2[k] &
> +                                                     ~PPC_INDIRECT));
> +                        }
> +                    }
> +                    g_free((opc_handler_t *)((uintptr_t)table[j] &
> +                                             ~PPC_INDIRECT));
> +                }
> +            }
> +            g_free((opc_handler_t *)((uintptr_t)cpu->opcodes[i] &
> +                ~PPC_INDIRECT));
> +        }
> +    }
> +}
> +
> +#if defined(PPC_DUMP_CPU)

The commented out define for this was left behind.

> +static void dump_ppc_insns(CPUPPCState *env)
> +{
> +    opc_handler_t **table, *handler;
> +    const char *p, *q;
> +    uint8_t opc1, opc2, opc3, opc4;
> +
> +    printf("Instructions set:\n");
> +    /* opc1 is 6 bits long */
> +    for (opc1 = 0x00; opc1 < PPC_CPU_OPCODES_LEN; opc1++) {
> +        table = env->opcodes;
> +        handler = table[opc1];
> +        if (is_indirect_opcode(handler)) {
> +            /* opc2 is 5 bits long */
> +            for (opc2 = 0; opc2 < PPC_CPU_INDIRECT_OPCODES_LEN; opc2++) {
> +                table = env->opcodes;
> +                handler = env->opcodes[opc1];
> +                table = ind_table(handler);
> +                handler = table[opc2];
> +                if (is_indirect_opcode(handler)) {
> +                    table = ind_table(handler);
> +                    /* opc3 is 5 bits long */
> +                    for (opc3 = 0; opc3 < PPC_CPU_INDIRECT_OPCODES_LEN;
> +                            opc3++) {
> +                        handler = table[opc3];
> +                        if (is_indirect_opcode(handler)) {
> +                            table = ind_table(handler);
> +                            /* opc4 is 5 bits long */
> +                            for (opc4 = 0; opc4 < PPC_CPU_INDIRECT_OPCODES_LEN;
> +                                 opc4++) {
> +                                handler = table[opc4];
> +                                if (handler->handler != &gen_invalid) {
> +                                    printf("INSN: %02x %02x %02x %02x -- "
> +                                           "(%02d %04d %02d) : %s\n",
> +                                           opc1, opc2, opc3, opc4,
> +                                           opc1, (opc3 << 5) | opc2, opc4,
> +                                           handler->oname);
> +                                }
> +                            }
> +                        } else {
> +                            if (handler->handler != &gen_invalid) {
> +                                /* Special hack to properly dump SPE insns */
> +                                p = strchr(handler->oname, '_');
> +                                if (p == NULL) {
> +                                    printf("INSN: %02x %02x %02x (%02d %04d) : "
> +                                           "%s\n",
> +                                           opc1, opc2, opc3, opc1,
> +                                           (opc3 << 5) | opc2,
> +                                           handler->oname);
> +                                } else {
> +                                    q = "speundef";
> +                                    if ((p - handler->oname) != strlen(q)
> +                                        || (memcmp(handler->oname, q, strlen(q))
> +                                            != 0)) {
> +                                        /* First instruction */
> +                                        printf("INSN: %02x %02x %02x"
> +                                               "(%02d %04d) : %.*s\n",
> +                                               opc1, opc2 << 1, opc3, opc1,
> +                                               (opc3 << 6) | (opc2 << 1),
> +                                               (int)(p - handler->oname),
> +                                               handler->oname);
> +                                    }
> +                                    if (strcmp(p + 1, q) != 0) {
> +                                        /* Second instruction */
> +                                        printf("INSN: %02x %02x %02x "
> +                                               "(%02d %04d) : %s\n", opc1,
> +                                               (opc2 << 1) | 1, opc3, opc1,
> +                                               (opc3 << 6) | (opc2 << 1) | 1,
> +                                               p + 1);
> +                                    }
> +                                }
> +                            }
> +                        }
> +                    }
> +                } else {
> +                    if (handler->handler != &gen_invalid) {
> +                        printf("INSN: %02x %02x -- (%02d %04d) : %s\n",
> +                               opc1, opc2, opc1, opc2, handler->oname);
> +                    }
> +                }
> +            }
> +        } else {
> +            if (handler->handler != &gen_invalid) {
> +                printf("INSN: %02x -- -- (%02d ----) : %s\n",
> +                       opc1, opc1, handler->oname);
> +            }
> +        }
> +    }
> +}
> +#endif

