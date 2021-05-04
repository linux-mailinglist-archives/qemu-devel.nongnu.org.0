Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6BA37318C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 22:39:40 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le1pS-0006FC-WA
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 16:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1le1oO-0005iH-F6; Tue, 04 May 2021 16:38:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:2558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1le1oM-0006lK-Ci; Tue, 04 May 2021 16:38:32 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144KXNHQ083949; Tue, 4 May 2021 16:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y42hTc5rySZN1zwbNL33luCrBA6wggn1SfpbngdPRJI=;
 b=gjJjB082+MXcvxpqEVUaflyFVkerrRoU5lmCCtf9RtUeGuugrZXg8OLWFMtpuGUT3Koj
 GxYLNY0doSQbQXG+12qysuMEAgfHzufbdeHGZQk0Fi1iYP0p3RsiVrkbaSaNjjVuJtzj
 QMCl+//Vb/xApHe3fK8hmNidUIyqIVphNPrk7r23gYR4GH6y60MCLkNa15Sdjki2rla4
 xLIt8U5fnuyAg5w6VXPrJol+AfWFaC0GTZ7NSZOp/WWZaflRYGW6Q5RcJ4iw3+DJp10l
 ZFaYaxRtBwt70+0yUr66JZv0FkriPwWOMNg71ZaasWx0OloEI2TbX7BNslLC6xi4lLXR zw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38bd6v0c9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 16:38:20 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 144KaXNC021397;
 Tue, 4 May 2021 20:38:19 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 388xm9816j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 20:38:16 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 144KcFWB19071386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 20:38:15 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1FAFBE054;
 Tue,  4 May 2021 20:38:15 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B6D8BE04F;
 Tue,  4 May 2021 20:38:15 +0000 (GMT)
Received: from localhost (unknown [9.211.49.100])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  4 May 2021 20:38:14 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 0/5] target/ppc: Untangle CPU init from translation
In-Reply-To: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
References: <20210504140157.76066-1-bruno.larsen@eldorado.org.br>
Date: Tue, 04 May 2021 17:38:12 -0300
Message-ID: <87im3y1bgr.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7Rvfg6cETk4eOVGfK7c4DbMEY6is9nqp
X-Proofpoint-ORIG-GUID: 7Rvfg6cETk4eOVGfK7c4DbMEY6is9nqp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_15:2021-05-04,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 mlxscore=0 impostorscore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2105040138
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
Cc: richard.henderson@linaro.org, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> writes:

> Based-on: ppc-for-6.1 tree
>
> This patch series aims to remove the logic of initializing CPU from
> the file related to TCG translation. To achieve this, we have to make
> it so registering SPRs isn't directly tied to TCG, and move code only
> related to translation out of translate_init.c.inc and into translate.c.
> This is in preparation to compile this target without TCG.
>
> Changes for v4:
>  * reordered patches, to make partially applying simpler
>  * removed patches that were already applied
>  * undone creation of spt_tcg.c.inc, now waiting for further cleanup
>  * moved SPR_NOACCESS motion to last patch, and to spr_tcg.h
>
> Changes for v3:
>  * fixed the parameters of _spr_register
>  * remove some redundant #include statements
>  * removed some functions that were mentioned in v2 as unnecessary
>  * added copyright header to relevant files
>  * removed first patch, that was already applied
>  * removed a changed that would add a regression
>
>  Changes for v2:
>  * split and reordered patches, to make it easier to review
>  * improved commit messages=20
>  * Undid creation of spr_common, as it was unnecessary
>  * kept more functions as static
>  * ensured that the project builds after every commit
>
> Bruno Larsen (billionai) (5):
>   target/ppc: Fold gen_*_xer into their callers
>   target/ppc: renamed SPR registration functions
>   target/ppc: move SPR R/W callbacks to translate.c
>   target/ppc: turned SPR R/W callbacks not static
>   target/ppc: isolated cpu init from translation logic
>
>  .../ppc/{translate_init.c.inc =3D> cpu_init.c}  | 1848 ++++-------------
>  target/ppc/meson.build                        |    1 +
>  target/ppc/spr_tcg.h                          |  136 ++
>  target/ppc/translate.c                        | 1072 +++++++++-
>  4 files changed, 1598 insertions(+), 1459 deletions(-)
>  rename target/ppc/{translate_init.c.inc =3D> cpu_init.c} (89%)
>  create mode 100644 target/ppc/spr_tcg.h

We're still missing some changes:

- some files (hw/ppc/pnv.c, hw/ppc/spapr.c) use oea_read to check if an
SPR exists. This needs to be changed to something that is present in
both configs (I believe Bruno is working on this).

- The commit 6113563982 ("target/ppc: Clean up _spr_register et al")
from the ppc-for-6.1 branch missed some TCG-specific code in
gen_spr_BookE206:

$ ../configure --target-list=3Dppc64-softmmu --disable-tcg
$ make
(...)
[193/264] Compiling C object libqemu-ppc64-softmmu.fa.p/target_ppc_cpu_init=
.c.o
FAILED: libqemu-ppc64-softmmu.fa.p/target_ppc_cpu_init.c.o=20
(...)
../target/ppc/cpu_init.c: In function =E2=80=98register_BookE206_sprs=E2=80=
=99:
../target/ppc/cpu_init.c:1207:16: error: variable =E2=80=98uea_write=E2=80=
=99 set but not used [-Werror=3Dunused-but-set-variable]
         void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =3D
                ^~~~~~~~~
cc1: all warnings being treated as errors

We need something like:

--- a/target/ppc/translate_init.c.inc   2021-05-04 16:24:53.549556292 -0400
+++ b/target/ppc/translate_init.c.inc   2021-05-04 16:26:41.005280971 -0400
@@ -2025,11 +2025,13 @@
     /* TLB assist registers */
     /* XXX : not implemented */
     for (i =3D 0; i < 8; i++) {
+#ifdef CONFIG_TCG
         void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =3D
             &spr_write_generic32;
         if (i =3D=3D 2 && (mas_mask & (1 << i)) && (env->insns_flags & PPC=
_64B)) {
             uea_write =3D &spr_write_generic;
         }
+#endif
         if (mas_mask & (1 << i)) {
             spr_register(env, mas_sprn[i], mas_names[i],
                          SPR_NOACCESS, SPR_NOACCESS,
---

