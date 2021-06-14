Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE393A714F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 23:27:29 +0200 (CEST)
Received: from localhost ([::1]:60986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsu7E-0008Sb-2p
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 17:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lsu5y-0007GK-2B; Mon, 14 Jun 2021 17:26:10 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lsu5u-0001DU-BV; Mon, 14 Jun 2021 17:26:09 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ELJY6A110511; Mon, 14 Jun 2021 17:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=WqgFrh74XMT7gRwktpuSFTjsyC3xMFedATIcq/4227c=;
 b=thdhBf6yrXBg7G1LCcaYN3PO/+HQo6w+BoG8KxrtAb1wKFn0/x1d426uv+FTTeJcXrsj
 KAvDR1AywsjqCL0lFnlS0Vs8zxqhg9yfRS2efUv3RnMURGLiGBCPBgHiK+f0a2Rqeanq
 y+icMjiO1CbbHgSCobi/4eBZsvW4F/pvgJhv5e8zcaLxsd4/yYYJCSPOpWNzmOatDKKf
 cC5d4Ey1l0bbcVABKJfKgkXIU7AcL8+rNZ+bYKmwuDKezR1Otx4nnZMmW6AL3It/zDMt
 BuoDR2/y+5vp6EldXrRfC+bgKymLyB4ZYjZOeh8Tb+qMqv8k3zT1Ye6snCejCKEORuFZ cA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396ex8r2uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 17:25:56 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15ELDCdh008293;
 Mon, 14 Jun 2021 21:25:55 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 3954gjx4jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 21:25:55 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15ELPsnS18284994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Jun 2021 21:25:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACB8DAC05B;
 Mon, 14 Jun 2021 21:25:54 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBD33AC059;
 Mon, 14 Jun 2021 21:25:53 +0000 (GMT)
Received: from localhost (unknown [9.211.148.118])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 14 Jun 2021 21:25:53 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 2/2] target/ppc: make gdb able to translate
 priviledged addresses
In-Reply-To: <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
References: <20210614191630.101304-1-bruno.larsen@eldorado.org.br>
 <20210614191630.101304-2-bruno.larsen@eldorado.org.br>
Date: Mon, 14 Jun 2021 18:25:51 -0300
Message-ID: <87o8c8uoio.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lKkQRgkoJL_-AvKv-yfo5Km55ZmoApeD
X-Proofpoint-ORIG-GUID: lKkQRgkoJL_-AvKv-yfo5Km55ZmoApeD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_13:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140133
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: richard.henderson@linaro.org, luis.pires@eldorado.org.br,
 Greg Kurz <groug@kaod.org>, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:

> This patch changes ppc_cpu_get_phys_page_debug so that it is now
> able to translate both, priviledged and real mode addresses
> independently of whether the CPU executing it has those permissions
>
> This was mentioned by Fabiano as something that would be very useful to
> help with debugging, but could possibly constitute a security issue if
> that debug function can be called in some way by prodution code.

Thinking a bit more about this, I think we just need to make sure that
this is not called during the regular operation of the virtual
machine. So not as much a security issue, more of a correctness one.

> the
> solution was implemented such that it would be trivial to wrap it around
> ifdefs for building only with --enable-debug, for instance, but we are
> not sure this is the best approach, hence why it is an RFC.
>
> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/mmu_helper.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
> index 9dcdf88597..41c727c690 100644
> --- a/target/ppc/mmu_helper.c
> +++ b/target/ppc/mmu_helper.c
> @@ -2947,6 +2947,29 @@ hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>                    cpu_mmu_index(&cpu->env, true), false)) {
>          return raddr & TARGET_PAGE_MASK;
>      }
> +
> +    /*
> +     * This is a fallback, in case we're asking for priviledged memory to
> +     * be printed, but the PCU is not executing in a priviledged manner.
> +     *
> +     * The code could be considered a security vulnerability if
> +     * this function can be called in a scenario that does not involve
> +     * debugging.
> +     * Given the name and how useful using real addresses may be for
> +     * actually debugging, however, we decided to include it anyway and
> +     * discuss how to best avoid the possible security concerns.
> +     * The current plan is that, if there is a chance this code is called in
> +     * a production environment, we can surround it with ifdefs so that it
> +     * is only compiled with --enable-debug
> +     */
> +        /* attempt to translate first with virtual addresses */
> +    if (ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 1, false) ||
> +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 1, false) ||
> +        /* if didn't work, attempt to translate with real addresses */
> +        ppc_xlate(cpu, addr, MMU_DATA_LOAD, &raddr, &s, &p, 3, false) ||
> +        ppc_xlate(cpu, addr, MMU_INST_FETCH, &raddr, &s, &p, 3, false)) {
> +        return raddr & TARGET_PAGE_MASK;
> +    }

If this is only used during debug we could just give it the highest
mmu_idx, no need for a fallback.

Now, it might be possible that people use GDB to debug some aspect of
the MMU emulation, in which case it would be more useful to have the GDB
access fail just as the CPU would. But from my perspective it would be
better to have GDB access all of the guest memory without restriction.

>      return -1;
>  }

