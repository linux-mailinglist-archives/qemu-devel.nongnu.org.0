Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25B7165C38
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 11:54:57 +0100 (CET)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4jTt-0003Qv-1K
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 05:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1j4jTD-0002ym-BL
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 05:54:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1j4jTC-0007M1-9u
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 05:54:15 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42262
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1j4jTC-0007Lv-6t
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 05:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582196053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CXHjN9vMUPnQgxY5bRMPFknfGrj97sP5BCyxpj3iefE=;
 b=RbbEv96E88NoyCMtsluhVlL32esiEsigGIRCo6aG8BEjqOwzGrMIht7alCnAuwDYWOM1CZ
 vgIz8DKm6itau+j/J2L2v+xdQeS2hbLNI2HjzB7FodmPfBSo6g5lErPRwInEe6FKi8HRN+
 8effF28V0UnmZrEeo0LdmfTVytJwM+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-Hk-fQKlAMLWd84Q5kdgCHQ-1; Thu, 20 Feb 2020 05:54:10 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6ACB8010F9;
 Thu, 20 Feb 2020 10:54:08 +0000 (UTC)
Received: from gondolin (ovpn-205-37.brq.redhat.com [10.40.205.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDC1B5C553;
 Thu, 20 Feb 2020 10:54:04 +0000 (UTC)
Date: Thu, 20 Feb 2020 11:54:01 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Janosch Frank <frankja@linux.ibm.com>
Subject: Re: [PATCH v3 09/17] s390: protvirt: Move STSI data over SIDAD
Message-ID: <20200220115401.50658d2c.cohuck@redhat.com>
In-Reply-To: <20200214151636.8764-10-frankja@linux.ibm.com>
References: <20200214151636.8764-1-frankja@linux.ibm.com>
 <20200214151636.8764-10-frankja@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Hk-fQKlAMLWd84Q5kdgCHQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-s390x@nongnu.org, mihajlov@linux.ibm.com, qemu-devel@nongnu.org,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Feb 2020 10:16:28 -0500
Janosch Frank <frankja@linux.ibm.com> wrote:

> For protected guests, we need to put the STSI emulation results into
> the SIDA, so SIE will write them into the guest at the next entry.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  target/s390x/kvm.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index eec0b92479..fe669ed24c 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -1772,11 +1772,16 @@ static int handle_tsch(S390CPU *cpu)
>  
>  static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
>  {
> +    CPUS390XState *env = &cpu->env;
>      SysIB_322 sysib;
>      int del;
>  
> -    if (s390_cpu_virt_mem_read(cpu, addr, ar, &sysib, sizeof(sysib))) {
> -        return;
> +    if (env->pv) {
> +        s390_cpu_pv_mem_read(cpu, 0, &sysib, sizeof(sysib));

This is only introduced by the next patch, right?

> +    } else {
> +        if (s390_cpu_virt_mem_read(cpu, addr, ar, &sysib, sizeof(sysib))) {
> +            return;
> +        }
>      }
>      /* Shift the stack of Extended Names to prepare for our own data */
>      memmove(&sysib.ext_names[1], &sysib.ext_names[0],
> @@ -1815,7 +1820,11 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
>      /* Insert UUID */
>      memcpy(sysib.vm[0].uuid, &qemu_uuid, sizeof(sysib.vm[0].uuid));
>  
> -    s390_cpu_virt_mem_write(cpu, addr, ar, &sysib, sizeof(sysib));
> +    if (env->pv) {
> +        s390_cpu_pv_mem_write(cpu, 0, &sysib, sizeof(sysib));
> +    } else {
> +        s390_cpu_virt_mem_write(cpu, addr, ar, &sysib, sizeof(sysib));
> +    }
>  }
>  
>  static int handle_stsi(S390CPU *cpu)


