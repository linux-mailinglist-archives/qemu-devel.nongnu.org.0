Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F5218A20A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 18:59:26 +0100 (CET)
Received: from localhost ([::1]:56778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEcyT-0001A9-CE
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 13:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jEcxA-00007T-Vb
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 13:58:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jEcx9-0005Vp-6b
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 13:58:04 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:28520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jEcx8-0005Nt-Sl
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 13:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584554282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ZvkZv8+DmskGvLW+6hjyuf00/9hmWoiE1K9VMDf/fk=;
 b=SOUy3dkVeblLM888XIK1a6NM8lIDEBniG69Pt/8fWNw9aEyJjyEtJxCTUiQqVSHie8/FVR
 pLrbvG8rju5R6VVtFt2aBabCWG24kaiLaMS+ILXBDtHWxTaxIYSmaGVSPmIpkXbUM+P6hN
 VV/YCeAgHuwZSPOYaAOF3WodwsC49RQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-pFBnAdLnNfaNoM4DoaY7yw-1; Wed, 18 Mar 2020 13:58:00 -0400
X-MC-Unique: pFBnAdLnNfaNoM4DoaY7yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 127EF1005509;
 Wed, 18 Mar 2020 17:57:59 +0000 (UTC)
Received: from gondolin (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24C41627D8;
 Wed, 18 Mar 2020 17:57:54 +0000 (UTC)
Date: Wed, 18 Mar 2020 18:57:50 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v10 08/16] s390x: protvirt: Move STSI data over SIDAD
Message-ID: <20200318185750.0bdf7ad4.cohuck@redhat.com>
In-Reply-To: <20200318143047.2335-9-frankja@linux.ibm.com>
References: <20200318143047.2335-1-frankja@linux.ibm.com>
 <20200318143047.2335-9-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Mar 2020 10:30:39 -0400
Janosch Frank <frankja@linux.ibm.com> wrote:

> For protected guests, we need to put the STSI emulation results into
> the SIDA, so SIE will write them into the guest at the next entry.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>  target/s390x/kvm.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index cfca4c58df60eb85..462a1d70ee78104c 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -50,6 +50,7 @@
>  #include "exec/memattrs.h"
>  #include "hw/s390x/s390-virtio-ccw.h"
>  #include "hw/s390x/s390-virtio-hcall.h"
> +#include "hw/s390x/pv.h"
>  
>  #ifndef DEBUG_KVM
>  #define DEBUG_KVM  0
> @@ -1806,7 +1807,9 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
>      SysIB_322 sysib;
>      int del;
>  
> -    if (s390_cpu_virt_mem_read(cpu, addr, ar, &sysib, sizeof(sysib))) {
> +    if (s390_is_pv()) {
> +        s390_cpu_pv_mem_read(cpu, 0, &sysib, sizeof(sysib));

The only minor issue I have here is that it is not obvious that this
function either succeeds or aborts, as we only call it in the pv case.
But it probably does not make that much sense to sprinkle comments
everywhere, either.

> +    } else if (s390_cpu_virt_mem_read(cpu, addr, ar, &sysib, sizeof(sysib))) {
>          return;
>      }
>      /* Shift the stack of Extended Names to prepare for our own data */
> @@ -1846,7 +1849,11 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
>      /* Insert UUID */
>      memcpy(sysib.vm[0].uuid, &qemu_uuid, sizeof(sysib.vm[0].uuid));
>  
> -    s390_cpu_virt_mem_write(cpu, addr, ar, &sysib, sizeof(sysib));
> +    if (s390_is_pv()) {
> +        s390_cpu_pv_mem_write(cpu, 0, &sysib, sizeof(sysib));
> +    } else {
> +        s390_cpu_virt_mem_write(cpu, addr, ar, &sysib, sizeof(sysib));
> +    }
>  }
>  
>  static int handle_stsi(S390CPU *cpu)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


