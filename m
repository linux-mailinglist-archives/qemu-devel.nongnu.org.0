Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C095665EC8
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 16:08:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFcgS-0001co-Oa; Wed, 11 Jan 2023 10:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFcgI-0001cF-T8
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:06:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pFcgG-00088z-8o
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 10:06:22 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30BF0bbD004099; Wed, 11 Jan 2023 15:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=SGuc0Ie44qb/i1Yd94B65X38GoKVuHs+dS4PgayAeQc=;
 b=JliqqaDjZo2ubvIy+1LquQT1pjqkt5SmhnVjmneAJwt6S8t9M/vqa3j0J0Mub2l2E1kh
 DdCf6+MkG6zz/ZVwarMfU6mc2CQ+/IEcEMwp8JUS0RdDySpPrbSJEVoeQJ0YTQfsS5c1
 P6jAJaG0HoIsKonn8klgi1GUmpre0A55eXv8imVYiEo9PjFbyeNaTTJxXvZUvTsLfwWY
 JfkEfWSQ52qBNyPH6uRAiYPZf+NZUqwETnizagYtLQlBTPrF4anqFcSeFtmgCyrGpCwP
 nEjuy7xj1N+dXyF5EqDlNIvV01dk/MYo0rdul8heceqnljyRqJPHLuQzy64zfG5m+E5T sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1yck871m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 15:06:15 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30BF0Y5C003980;
 Wed, 11 Jan 2023 15:06:15 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1yck86yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 15:06:15 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30B23OX0031119;
 Wed, 11 Jan 2023 15:06:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n1kyx8r17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 15:06:13 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30BF6Ae318481498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Jan 2023 15:06:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F55D20040;
 Wed, 11 Jan 2023 15:06:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC22720049;
 Wed, 11 Jan 2023 15:06:09 +0000 (GMT)
Received: from [9.171.85.127] (unknown [9.171.85.127])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jan 2023 15:06:09 +0000 (GMT)
Message-ID: <5ea18eb8213350a666a945c9d97f7503542ac0db.camel@linux.ibm.com>
Subject: Re: [PATCH v3 3/3] tcg: add perfmap and jitdump
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org, 
 "Vanderson M . do Rosario" <vandersonmr2@gmail.com>
Date: Wed, 11 Jan 2023 16:06:09 +0100
In-Reply-To: <20230111014705.2275040-4-iii@linux.ibm.com>
References: <20230111014705.2275040-1-iii@linux.ibm.com>
 <20230111014705.2275040-4-iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dlu3u-ISi0wF4iwCqjQ5bixtMV84rqF2
X-Proofpoint-ORIG-GUID: LJVbVMtcqRJkKuZeV5Ah6c-v7DIctMd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_07,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110109
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 2023-01-11 at 02:47 +0100, Ilya Leoshkevich wrote:
> Add ability to dump /tmp/perf-<pid>.map and jit-<pid>.dump.
> The first one allows the perf tool to map samples to each individual
> translation block. The second one adds the ability to resolve symbol
> names, line numbers and inspect JITed code.
>=20
> Example of use:
>=20
> =C2=A0=C2=A0=C2=A0 perf record qemu-x86_64 -perfmap ./a.out
> =C2=A0=C2=A0=C2=A0 perf report
>=20
> or
>=20
> =C2=A0=C2=A0=C2=A0 perf record -k 1 qemu-x86_64 -jitdump ./a.out
> =C2=A0=C2=A0=C2=A0 DEBUGINFOD_URLS=3D perf inject -j -i perf.data -o perf=
.data.jitted
> =C2=A0=C2=A0=C2=A0 perf report -i perf.data.jitted
>=20
> Co-developed-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
> Co-developed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
> =C2=A0accel/tcg/meson.build=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0accel/tcg/perf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 366
> ++++++++++++++++++++++++++++++++++++++
> =C2=A0accel/tcg/perf.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 49 +++++
> =C2=A0accel/tcg/translate-all.c |=C2=A0=C2=A0 8 +
> =C2=A0docs/devel/tcg.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 23 +++
> =C2=A0linux-user/exit.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +
> =C2=A0linux-user/main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 15 ++
> =C2=A0qemu-options.hx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 20 +++
> =C2=A0softmmu/vl.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 ++
> =C2=A0tcg/tcg.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A010 files changed, 497 insertions(+)
> =C2=A0create mode 100644 accel/tcg/perf.c
> =C2=A0create mode 100644 accel/tcg/perf.h

...

> +void perf_report_code(unsigned long long guest_pc, size_t icount,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const void *start, s=
ize_t size)
> +{
> +=C2=A0=C2=A0=C2=A0 struct debuginfo_query *q;
> +=C2=A0=C2=A0=C2=A0 size_t insn;
> +
> +=C2=A0=C2=A0=C2=A0 if (!perfmap && !jitdump) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 q =3D g_try_malloc0_n(icount, sizeof(*q));
> +=C2=A0=C2=A0=C2=A0 if (!q) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +=C2=A0=C2=A0=C2=A0 }
> +
> +=C2=A0=C2=A0=C2=A0 debuginfo_lock();
> +
> +=C2=A0=C2=A0=C2=A0 /* Query debuginfo for each guest instruction. */
> +=C2=A0=C2=A0=C2=A0 for (insn =3D 0; insn < icount; insn++) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 q[insn].address =3D tcg_ctx->=
gen_insn_data[insn][0] +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (TARGET_TB_PCREL ? guest_pc : 0);

Currently this produces plausibly looking, but actually wrong
addresses. This needs to match restore_state_to_opc(), so at least:

--- a/accel/tcg/perf.c
+++ b/accel/tcg/perf.c
@@ -325,8 +325,10 @@ void perf_report_code(unsigned long long guest_pc,
size_t icount,
=20
     /* Query debuginfo for each guest instruction. */
     for (insn =3D 0; insn < icount; insn++) {
-        q[insn].address =3D tcg_ctx->gen_insn_data[insn][0] +
-                          (TARGET_TB_PCREL ? guest_pc : 0);
+        q[insn].address =3D tcg_ctx->gen_insn_data[insn][0];
+        if (TARGET_TB_PCREL) {
+            q[insn].address |=3D (guest_pc & TARGET_PAGE_MASK);
+        }
         q[insn].flags =3D DEBUGINFO_SYMBOL | (jitdump ? DEBUGINFO_LINE :
0);
     }
     debuginfo_query(q, icount);

Apparently even with this there are corner cases, e.g. in
x86_restore_state_to_opc() we have:

    if (TARGET_TB_PCREL) {
        env->eip =3D (env->eip & TARGET_PAGE_MASK) | data[0];
    } else {
        env->eip =3D data[0] - tb->cs_base;
    }

so if tb->cs_base !=3D 0, the result is still going to be wrong.

I wonder if it would make sense to create a new TCGCPUOps member
purely for resolving a PC from data[0]?


