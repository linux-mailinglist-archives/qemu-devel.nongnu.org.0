Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADEB36F179
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 22:54:54 +0200 (CEST)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcDgT-0003Bx-Ih
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 16:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcDef-0002eZ-5J; Thu, 29 Apr 2021 16:53:01 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcDec-0006e1-LS; Thu, 29 Apr 2021 16:53:00 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TKYdh4178963; Thu, 29 Apr 2021 16:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=HRmrrcYxj+jKLC5sEDl4W2VuRv+tKMqyAAG/4Aer710=;
 b=jeSdfODJzIC0xbEkvHYz0nYW/i39anK0m/tbQONeISY5YCtmsjpgv0tlNSamJHM/h82Y
 reYTzUJCLV9JrKIuNGSAeoB0EhbjU9fjQ7t/7Mqcls+SbPW4YNMJAydD6w3YHhPR7rsG
 hsCUe/lrUXQUliIGh20ZErS8yUeM2Ykcwd77W10e+yUBhm0AwyFIjsyujwAxxm02Vkr3
 4MjOnSmP210J80dRJumpdQx0Sihtm5UD9IZyPFJE2lPR3YZ4tYe0tzbnZr/DTKEOLwlf
 rJUb+Z8e1vFdgb044qE70wBsnvQs9GrhEI5QwMKt/gQ+HHlTGWR84+F126ihp1SIZ8+t Dg== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3883gr92ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 16:52:48 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TKhDYE029295;
 Thu, 29 Apr 2021 20:52:47 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 384ay9y1p2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 20:52:47 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TKqke927525416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 20:52:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA9A2C6057;
 Thu, 29 Apr 2021 20:52:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4246C605A;
 Thu, 29 Apr 2021 20:52:45 +0000 (GMT)
Received: from localhost (unknown [9.211.156.251])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 29 Apr 2021 20:52:45 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 4/7] target/ppc: turned SPR R/W callbacks not static
In-Reply-To: <20210429162130.2412-5-bruno.larsen@eldorado.org.br>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-5-bruno.larsen@eldorado.org.br>
Date: Thu, 29 Apr 2021 17:52:43 -0300
Message-ID: <878s503jac.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1RLVLze7KXHiBU4fZHKGZgHo6GJL8x_C
X-Proofpoint-GUID: 1RLVLze7KXHiBU4fZHKGZgHo6GJL8x_C
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_11:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104290133
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

> To be able to compile translate_init.c.inc as a standalone file,
> we have to make the callbacks accessible outside of translate.c;
> This patch does that, making the callbacks not static and creating
> a new .h file
>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---

<snip>

> diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
> new file mode 100644
> index 0000000000..b573a23e7b
> --- /dev/null
> +++ b/target/ppc/spr_tcg.h
> @@ -0,0 +1,121 @@
> +#ifndef SPR_TCG_H
> +#define SPR_TCG_H
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/translator.h"
> +#include "tcg/tcg.h"

Why the last two?

> +
> +/* prototypes for readers and writers for SPRs */
> +
> +void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_lr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_ctr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_atbu(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
> +
> +#ifndef CONFIG_USER_ONLY
> +void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_clear(DisasContext *ctx, int sprn, int gprn);
> +void spr_access_nop(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_decr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_decr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_tbl(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_tbu(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_atbl(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_atbu(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_ibat(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_ibat_h(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_ibatu(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ibatu_h(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ibatl(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ibatl_h(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_dbat(DisasContext *ctx, int gprn, int sprn);
> +void spr_read_dbat_h(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_dbatu(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_dbatu_h(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_dbatl(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_dbatl_h(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_sdr1(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_601_rtcu(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_601_rtcl(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_hid0_601(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_601_ubat(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_601_ubatu(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_601_ubatl(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_40x_pit(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_40x_pit(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_40x_dbcr0(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_40x_sler(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_booke_tcr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_booke_tsr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_403_pbr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_403_pbr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_pir(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_excp_prefix(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_excp_vector(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_thrm(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_e500_l1csr0(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_e500_l1csr1(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_e500_l2csr0(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_booke206_mmucsr0(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_booke_pid(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_eplc(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_epsc(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_mas73(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_mas73(DisasContext *ctx, int gprn, int sprn);
> +#ifdef TARGET_PPC64
> +void spr_read_cfar(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_cfar(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ureg(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_purr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_purr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_hdecr(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_hdecr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_vtb(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_vtb(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_tbu40(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_pidr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_lpidr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_hior(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_hior(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_ptcr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_pcr(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_dpdes(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_dpdes(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_amr(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_uamor(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_iamr(DisasContext *ctx, int sprn, int gprn);
> +#endif
> +#endif
> +
> +#ifdef TARGET_PPC64
> +void spr_read_prev_upper32(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_prev_upper32(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_tar(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_tar(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_tm(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_tm(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_tm_upper32(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_tm_upper32(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_ebb(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_ebb(DisasContext *ctx, int sprn, int gprn);
> +void spr_read_ebb_upper32(DisasContext *ctx, int gprn, int sprn);
> +void spr_write_ebb_upper32(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_hmer(DisasContext *ctx, int sprn, int gprn);
> +void spr_write_lpcr(DisasContext *ctx, int sprn, int gprn);
> +#endif
> +
> +#endif

