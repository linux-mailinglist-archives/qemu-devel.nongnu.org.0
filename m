Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBEB36F1F4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 23:24:54 +0200 (CEST)
Received: from localhost ([::1]:32888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcE9V-00038e-GX
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 17:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcE89-0002XG-0A; Thu, 29 Apr 2021 17:23:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1lcE86-0007dE-R1; Thu, 29 Apr 2021 17:23:28 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TL3I1e074507; Thu, 29 Apr 2021 17:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=dUJIAEtZQlwompIQv4utOelRucgAcG72jfWrdA7buj8=;
 b=nz7/2J/9q9PFtBg0vEAUK0qG3iIYR4dJIwbPHue9Sfaabl/4Bk5AATds8OF6lMmMgpNF
 4hxRU/usQ5a9ScCjM1MYimQeefUqLy59Pd79KEyOR5Uh9E7XnWDoK9hLAZWavCbOi8Vh
 uIUNSxkleSpslWBUf0n7A+zBOB7MKVut9YcZ1EeluJ3UcdoiWn3WEt21FIPBv4qcgn3W
 zgIGiNiqf0LFJwXqowCxdSn+JOU8lOmZc9FPqKvYu8VdBejZ61lST027hTht/JRGAjpl
 F9RZrySWbGnYC70EdxhHqwcdquhj+k4BPvjHA6YJyOz+Cdgt3TP/aD4Uclu3aAH116cj og== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3883cvhx4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 17:23:19 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TL7TR3024009;
 Thu, 29 Apr 2021 21:23:18 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 387r6qwk78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 21:23:18 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TLNHsq22413812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 21:23:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8036C6059;
 Thu, 29 Apr 2021 21:23:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F23B6C605F;
 Thu, 29 Apr 2021 21:23:16 +0000 (GMT)
Received: from localhost (unknown [9.211.156.251])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 29 Apr 2021 21:23:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 7/7] target/ppc: isolated cpu init from translation
 logic
In-Reply-To: <20210429162130.2412-8-bruno.larsen@eldorado.org.br>
References: <20210429162130.2412-1-bruno.larsen@eldorado.org.br>
 <20210429162130.2412-8-bruno.larsen@eldorado.org.br>
Date: Thu, 29 Apr 2021 18:23:14 -0300
Message-ID: <874kfo3hvh.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LGvHTdR9WRWEVVOs8S_IuyZZTXM9Grd2
X-Proofpoint-ORIG-GUID: LGvHTdR9WRWEVVOs8S_IuyZZTXM9Grd2
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_11:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290135
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

> finished isolation of CPU initialization logic from
> translation logic. CPU initialization now only has common code
> which may or may not call accelerator-specific code, as the
> build options require, and is compiled separately.
>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/{translate_init.c.inc => cpu_init.c} | 12 +++++++++++-
>  target/ppc/meson.build                          |  1 +
>  target/ppc/translate.c                          |  4 +++-
>  3 files changed, 15 insertions(+), 2 deletions(-)
>  rename target/ppc/{translate_init.c.inc => cpu_init.c} (99%)
>
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/cpu_init.c
> similarity index 99%
> rename from target/ppc/translate_init.c.inc
> rename to target/ppc/cpu_init.c
> index b329e953cb..f0f8fc481e 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/cpu_init.c
> @@ -18,6 +18,7 @@
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include "qemu/osdep.h"
>  #include "disas/dis-asm.h"
>  #include "exec/gdbstub.h"
>  #include "kvm_ppc.h"
> @@ -42,6 +43,10 @@
>  #include "fpu/softfloat.h"
>  #include "qapi/qapi-commands-machine-target.h"
>  
> +#include "helper_regs.h"
> +#include "internal.h"
> +#include "spr_tcg.h"

These two includes look like they belong in patch 3 and 4 respectively.

And we probably want an #ifdef CONFIG_TCG around them.

> +
>  /* #define PPC_DEBUG_SPR */
>  /* #define USE_APPLE_GDB */
>  
> @@ -49,7 +54,12 @@ static inline void vscr_init(CPUPPCState *env, uint32_t val)
>  {
>      /* Altivec always uses round-to-nearest */
>      set_float_rounding_mode(float_round_nearest_even, &env->vec_status);
> -    helper_mtvscr(env, val);
> +    /*
> +     * This comment is here just so the project will build.
> +     * The current solution is in another patch and will be
> +     * added when we figure out an internal fork of qemu
> +     */
> +    /* helper_mtvscr(env, val); */
>  }
>  
>  #ifdef CONFIG_TCG
> diff --git a/target/ppc/meson.build b/target/ppc/meson.build
> index bbfef90e08..ad53629298 100644
> --- a/target/ppc/meson.build
> +++ b/target/ppc/meson.build
> @@ -2,6 +2,7 @@ ppc_ss = ss.source_set()
>  ppc_ss.add(files(
>    'cpu-models.c',
>    'cpu.c',
> +  'cpu_init.c',
>    'dfp_helper.c',
>    'excp_helper.c',
>    'fpu_helper.c',
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index a6e677fa6d..afb8a2aa27 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -38,6 +38,9 @@
>  #include "qemu/atomic128.h"
>  #include "internal.h"
>  
> +#include "qemu/qemu-print.h"
> +#include "qapi/error.h"
> +#include "internal.h"

This one is already included.

>  
>  #define CPU_SINGLE_STEP 0x1
>  #define CPU_BRANCH_STEP 0x2
> @@ -7595,7 +7598,6 @@ GEN_HANDLER2_E(trechkpt, "trechkpt", 0x1F, 0x0E, 0x1F, 0x03FFF800, \
>  
>  #include "helper_regs.h"
>  #include "spr_tcg.c.inc"
> -#include "translate_init.c.inc"
>  
>  /*****************************************************************************/
>  /* Misc PowerPC helpers */

