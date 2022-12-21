Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CA6537EA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 22:02:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p86Cz-0001r8-Je; Wed, 21 Dec 2022 16:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1p86Cx-0001qa-CP; Wed, 21 Dec 2022 16:00:59 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1p86Cv-0000Xo-65; Wed, 21 Dec 2022 16:00:59 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLKfh8n028198; Wed, 21 Dec 2022 21:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=XpuC6buLRIWsGo2HwD+fuX1oGZ26UgX9K/2WWbQTKa4=;
 b=NzO7r2za1ZOpETSs27vHggSlQY7usa5kTf3mnQFurUNsplYC6in9UGJlVRhkXxDfZn04
 2Luq0x2QgeIu46uFweCz/XhXBf1p4xIUYc++mZl19rH2bHiSQ5dslSdnxFuOOLkUgOdJ
 PVNfKO8AtVo6g01xHfK5v8EVV190xjpnua4ISv+nVIZJ2XfHk+qAG0G/m5hv1x5yLu/L
 LO8BfNfY41arA1HSmC+764KN2HtLxO+eIf87hrOBSPyDg/v5WqWuJcNTot9nYLEL1vI+
 sO6jrcqRnz8XbQVs4oJ7A83LAAftSt9TZGb+K1TQRuzYu/PZbLGiat93CBgnmdjNQD7x uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mm9de0cr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 21:00:52 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BLL0pYY030024;
 Wed, 21 Dec 2022 21:00:51 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mm9de0cqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 21:00:51 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLJGDTG005611;
 Wed, 21 Dec 2022 21:00:50 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3mh6yw4t5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 21:00:50 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BLL0miU3539684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Dec 2022 21:00:48 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B7035804C;
 Wed, 21 Dec 2022 21:00:48 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D52B58056;
 Wed, 21 Dec 2022 21:00:47 +0000 (GMT)
Received: from li-479af74c-31f9-11b2-a85c-e4ddee11713b.ibm.com (unknown
 [9.60.89.68]) by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 21 Dec 2022 21:00:47 +0000 (GMT)
Message-ID: <80495767440d9a8402535f69ac28280b3f0a99a5.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/5] exec/memory: Expose memory_region_access_valid()
From: Eric Farman <farman@linux.ibm.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, David
 Hildenbrand <david@redhat.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>
Date: Wed, 21 Dec 2022 16:00:47 -0500
In-Reply-To: <20221217152454.96388-2-philmd@linaro.org>
References: <20221217152454.96388-1-philmd@linaro.org>
 <20221217152454.96388-2-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gocLx9BZCGMBRadGs0_YNKgxO9qNty56
X-Proofpoint-ORIG-GUID: zuFKlBjhgEEb6YqTZAgZDsgRt4JCJZ0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_11,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=818 bulkscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212210174
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On Sat, 2022-12-17 at 16:24 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> Instead of having hardware device poking into memory
> internal API, expose memory_region_access_valid().
>=20
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

That's the only memory_region_ function s390 calls that isn't already
in memory.h, so makes sense to me.

Reviewed-by: Eric Farman <farman@linux.ibm.com>

> ---
> =C2=A0hw/s390x/s390-pci-inst.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0include/exec/memory-internal.h | 4 ----
> =C2=A0include/exec/memory.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ++++
> =C2=A03 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 66e764f901..35db7777e4 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -13,7 +13,7 @@
> =C2=A0
> =C2=A0#include "qemu/osdep.h"
> =C2=A0#include "exec/memop.h"
> -#include "exec/memory-internal.h"
> +#include "exec/memory.h"
> =C2=A0#include "qemu/error-report.h"
> =C2=A0#include "sysemu/hw_accel.h"
> =C2=A0#include "hw/s390x/s390-pci-inst.h"
> diff --git a/include/exec/memory-internal.h b/include/exec/memory-
> internal.h
> index 9fcc2af25c..100c1237ac 100644
> --- a/include/exec/memory-internal.h
> +++ b/include/exec/memory-internal.h
> @@ -38,10 +38,6 @@ void flatview_unref(FlatView *view);
> =C2=A0
> =C2=A0extern const MemoryRegionOps unassigned_mem_ops;
> =C2=A0
> -bool memory_region_access_valid(MemoryRegion *mr, hwaddr addr,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned size, bool is_write,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemTxAttrs attrs);
> -
> =C2=A0void flatview_add_to_dispatch(FlatView *fv, MemoryRegionSection
> *section);
> =C2=A0AddressSpaceDispatch *address_space_dispatch_new(FlatView *fv);
> =C2=A0void address_space_dispatch_compact(AddressSpaceDispatch *d);
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 91f8a2395a..c37ffdbcd1 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2442,6 +2442,10 @@ void memory_global_dirty_log_stop(unsigned int
> flags);
> =C2=A0
> =C2=A0void mtree_info(bool flatview, bool dispatch_tree, bool owner, bool
> disabled);
> =C2=A0
> +bool memory_region_access_valid(MemoryRegion *mr, hwaddr addr,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned size, bool is_write,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MemTxAttrs attrs);
> +
> =C2=A0/**
> =C2=A0 * memory_region_dispatch_read: perform a read directly to the
> specified
> =C2=A0 * MemoryRegion.


