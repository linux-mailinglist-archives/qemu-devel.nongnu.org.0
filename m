Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111F587CD1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:02:14 +0200 (CEST)
Received: from localhost ([::1]:53132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIrXJ-0002ff-2L
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <freude@linux.ibm.com>)
 id 1oIqTy-0008Gg-My; Tue, 02 Aug 2022 07:54:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <freude@linux.ibm.com>)
 id 1oIqTw-000057-4F; Tue, 02 Aug 2022 07:54:42 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 272BC3nE025075;
 Tue, 2 Aug 2022 11:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : date :
 from : to : cc : subject : reply-to : in-reply-to : references :
 message-id : content-type : content-transfer-encoding; s=pp1;
 bh=/o9ytq6JLggqKynYFH6Z8XLw6oFDoD/gLhSPfoikZr4=;
 b=cxi3+ypILQZrTi04drqNtpj3UJhLt7/3obEEvRZjDfoa79nzidj0KuiFBiCJScph+nd4
 oD1RuoNTdTlYdgKuvYYCi9s6ZfJbVoWDNzi7cp+a3k/CBXZ+7tCrVloQwPKUM823nYyu
 Nw8lIBx4JXuAlQv9sO2V+h+AV6v6Uxmv+euMNxs4c2ecNzBVG3zVJ9yc1A+NWmth2uav
 AYhUFX5NH066VKCJn1dFdhEmWAdunt7tIE4b9JAkYB7qvu4e3FR3IvoiVBBt5P4hcZvK
 iYE7wTzro0+FtMvWqdSA7+YqDqzVGwaGxeIijpefdoLQ47KZYOrD6HXsu+xG5yoWp/s3 dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hq2uc94hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 11:54:34 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 272BWSQ3005344;
 Tue, 2 Aug 2022 11:54:34 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hq2uc94h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 11:54:33 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 272Bpe09002405;
 Tue, 2 Aug 2022 11:54:33 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3hmv99e90v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Aug 2022 11:54:32 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 272BsVSj29557000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Aug 2022 11:54:31 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D85EE7805E;
 Tue,  2 Aug 2022 11:54:31 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FD687805C;
 Tue,  2 Aug 2022 11:54:31 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  2 Aug 2022 11:54:31 +0000 (GMT)
MIME-Version: 1.0
Date: Tue, 02 Aug 2022 13:54:31 +0200
From: Harald Freudenberger <freude@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, thuth@redhat.com,
 david@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Holger Dengler <dengler@linux.ibm.com>
Subject: Re: [PATCH v2] target/s390x: support PRNO_TRNG instruction
In-Reply-To: <20220719114307.102643-1-Jason@zx2c4.com>
References: <YtaUQkVUPVHt+v0Z@zx2c4.com>
 <20220719114307.102643-1-Jason@zx2c4.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c9b21f72ffa0415b31322ffc24ab438f@linux.ibm.com>
X-Sender: freude@linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KzDveUSmwVGPHFF9uSqMT9qxN9avMcBi
X-Proofpoint-ORIG-GUID: WoiMPUzCbdvgoF9v1jpWNMr_6RgMCaJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_07,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=994 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 spamscore=0 mlxscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208020053
Received-SPF: pass client-ip=148.163.156.1; envelope-from=freude@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 02 Aug 2022 08:58:31 -0400
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
Reply-To: freude@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-07-19 13:43, Jason A. Donenfeld wrote:
> In order for hosts running inside of TCG to initialize the kernel's
> random number generator, we should support the PRNO_TRNG instruction,
> backed in the usual way with the qemu_guest_getrandom helper. This is
> confirmed working on Linux 5.19-rc6.
> 
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Cc: Holger Dengler <dengler@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  target/s390x/cpu_models.c        |  2 --
>  target/s390x/gen-features.c      |  2 ++
>  target/s390x/tcg/crypto_helper.c | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 1a562d2801..90aac3d795 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -421,8 +421,6 @@ static void check_consistency(const S390CPUModel 
> *model)
>          { S390_FEAT_DFP_FAST, S390_FEAT_DFP },
>          { S390_FEAT_TRANSACTIONAL_EXE, S390_FEAT_STFLE_49 },
>          { S390_FEAT_EDAT_2, S390_FEAT_EDAT},
> -        { S390_FEAT_MSA_EXT_5, S390_FEAT_KIMD_SHA_512 },
> -        { S390_FEAT_MSA_EXT_5, S390_FEAT_KLMD_SHA_512 },
>          { S390_FEAT_MSA_EXT_4, S390_FEAT_MSA_EXT_3 },
>          { S390_FEAT_SIE_CMMA, S390_FEAT_CMM },
>          { S390_FEAT_SIE_CMMA, S390_FEAT_SIE_GSLS },
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> index ad140184b9..3d333e2789 100644
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -749,6 +749,8 @@ static uint16_t qemu_V7_0[] = {
>   */
>  static uint16_t qemu_MAX[] = {
>      S390_FEAT_VECTOR_ENH2,
> +    S390_FEAT_MSA_EXT_5,
> +    S390_FEAT_PRNO_TRNG,
>  };
> 
>  /****** END FEATURE DEFS ******/
> diff --git a/target/s390x/tcg/crypto_helper.c 
> b/target/s390x/tcg/crypto_helper.c
> index 138d9e7ad9..dccce7f707 100644
> --- a/target/s390x/tcg/crypto_helper.c
> +++ b/target/s390x/tcg/crypto_helper.c
> @@ -12,12 +12,30 @@
> 
>  #include "qemu/osdep.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/guest-random.h"
>  #include "s390x-internal.h"
>  #include "tcg_s390x.h"
>  #include "exec/helper-proto.h"
>  #include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
> 
> +static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
> +                            uint64_t buf, uint64_t len)
> +{
> +        uint8_t tmp[256];
> +
> +        if (!(env->psw.mask & PSW_MASK_64))
> +                len = (uint32_t)len;
> +
> +        while (len) {
> +                size_t block = MIN(len, sizeof(tmp));
> +                qemu_guest_getrandom_nofail(tmp, block);
> +                for (size_t i = 0; i < block; ++i)
> +                        cpu_stb_data_ra(env, wrap_address(env,
> buf++), tmp[i], ra);
> +                len -= block;
> +        }
> +}
> +
>  uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, 
> uint32_t r3,
>                       uint32_t type)
>  {
> @@ -52,6 +70,20 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t
> r1, uint32_t r2, uint32_t r3,
>              cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
>          }
>          break;
> +    case 114:
> +        if (r1 & 1 || !r1 || r2 & 1 || !r2) {
> +                tcg_s390_program_interrupt(env, PGM_SPECIFICATION, 
> ra);
> +                break;
> +        }
> +
> +        fill_buf_random(env, ra, env->regs[r1], env->regs[r1 + 1]);
> +        fill_buf_random(env, ra, env->regs[r2], env->regs[r2 + 1]);
> +
> +        env->regs[r1] += env->regs[r1 + 1];
> +        env->regs[r1 + 1] = 0;
> +        env->regs[r2] += env->regs[r2 + 1];
> +        env->regs[r2 + 1] = 0;
> +        break;
>      default:
>          /* we don't implement any other subfunction yet */
>          g_assert_not_reached();

I am absolutely no expert in this qemu code - in fact seen in just now 
but
my feeling is that there should be some more than just handling then 114 
subfunction.
For example something like this:

diff --git a/target/s390x/tcg/crypto_helper.c 
b/target/s390x/tcg/crypto_helper.c
index 138d9e7ad9..a0163675b2 100644
--- a/target/s390x/tcg/crypto_helper.c
+++ b/target/s390x/tcg/crypto_helper.c
@@ -12,12 +12,30 @@

  #include "qemu/osdep.h"
  #include "qemu/main-loop.h"
+#include "qemu/guest-random.h"
  #include "s390x-internal.h"
  #include "tcg_s390x.h"
  #include "exec/helper-proto.h"
  #include "exec/exec-all.h"
  #include "exec/cpu_ldst.h"

+static void fill_buf_random(CPUS390XState *env, uintptr_t ra,
+                            uint64_t buf, uint64_t len)
+{
+        uint8_t tmp[256];
+
+        if (!(env->psw.mask & PSW_MASK_64))
+                len = (uint32_t)len;
+
+        while (len) {
+                size_t block = MIN(len, sizeof(tmp));
+                qemu_guest_getrandom_nofail(tmp, block);
+                for (size_t i = 0; i < block; ++i)
+                        cpu_stb_data_ra(env, wrap_address(env, buf++), 
tmp[i], ra);
+                len -= block;
+        }
+}
+
  uint32_t HELPER(msa)(CPUS390XState *env, uint32_t r1, uint32_t r2, 
uint32_t r3,
                       uint32_t type)
  {
@@ -45,16 +63,39 @@ uint32_t HELPER(msa)(CPUS390XState *env, uint32_t 
r1, uint32_t r2, uint32_t r3,
          tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
      }

-    switch (fc) {
-    case 0: /* query subfunction */
+    /* handle query subfunction */
+    if (fc == 0) {
          for (i = 0; i < 16; i++) {
              param_addr = wrap_address(env, env->regs[1] + i);
              cpu_stb_data_ra(env, param_addr, subfunc[i], ra);
          }
+        return 0;
+    }
+
+    switch (type) {
+    case S390_FEAT_PRNO_TRNG:
+        switch (fc) {
+        case 114: /* CPACF_PRNO_TRNG */
+            if (r1 & 1 || !r1 || r2 & 1 || !r2) {
+                tcg_s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+                break;
+            }
+            fill_buf_random(env, ra, env->regs[r1], env->regs[r1 + 1]);
+            fill_buf_random(env, ra, env->regs[r2], env->regs[r2 + 1]);
+            env->regs[r1] += env->regs[r1 + 1];
+            env->regs[r1 + 1] = 0;
+            env->regs[r2] += env->regs[r2 + 1];
+            env->regs[r2 + 1] = 0;
+            break;
+        default:
+            /* we don't implement any other subfunctions yet */
+            g_assert_not_reached();
+        }
          break;
      default:
-        /* we don't implement any other subfunction yet */
-        g_assert_not_reached();
+            /* we don't implement any other functions yet */
+            g_assert_not_reached();
+        }
      }

      return 0;

And ... it is valid to have each of the two buffer pointers NULL. Not 
sure
how this env->regs[x] thing here handles this.

