Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3E010D4C1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Nov 2019 12:26:58 +0100 (CET)
Received: from localhost ([::1]:57342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaeQI-0001ac-Rv
	for lists+qemu-devel@lfdr.de; Fri, 29 Nov 2019 06:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iaeDv-0002vP-0K
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 06:14:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iae55-0001Mk-O6
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 06:05:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27625
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iae54-00015h-KH
 for qemu-devel@nongnu.org; Fri, 29 Nov 2019 06:04:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575025494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=CuniD5dlIlu4vXcm/G2gBvB7rS1uABDxmqF4GAK8I4I=;
 b=Hzm+40O1513JW++HXYYqa+atQx+FFZoX+x9/bajzMiog8T0dUVr5uNtceqpc6oZqPCfduB
 G9SlCEJmrrHvLLwFgeSLs6uo0WwV07z7ez2KMTRrGR4baItq3Dv9aiLUOIoI6zUmSLpNcH
 cS7BLvVyrikBd1sT7mVzBmGfjFAR+1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-FELRzENvPryPpxFLpcJfzw-1; Fri, 29 Nov 2019 06:04:50 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 851831005502;
 Fri, 29 Nov 2019 11:04:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-159.ams2.redhat.com [10.36.116.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDCFA5C1BB;
 Fri, 29 Nov 2019 11:04:44 +0000 (UTC)
Subject: Re: [PATCH v2 13/13] s390x: protvirt: Handle SIGP store status
 correctly
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191129094809.26684-1-frankja@linux.ibm.com>
 <20191129094809.26684-14-frankja@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <95062d3b-425f-1df4-8e33-1db0b883bd2f@redhat.com>
Date: Fri, 29 Nov 2019 12:04:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191129094809.26684-14-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: FELRzENvPryPpxFLpcJfzw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/11/2019 10.48, Janosch Frank wrote:
> Status storing is obviously not done by qemu anymore.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  target/s390x/helper.c | 4 ++++
>  target/s390x/sigp.c   | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index a3a49164e4..3800c4b395 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c
> @@ -246,6 +246,10 @@ int s390_store_status(S390CPU *cpu, hwaddr addr, bool store_arch)
>      hwaddr len = sizeof(*sa);
>      int i;
>  
> +    if (cpu->env.pv) {
> +        return 0;
> +    }
> +
>      sa = cpu_physical_memory_map(addr, &len, 1);
>      if (!sa) {
>          return -EFAULT;
> diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
> index 727875bb4a..2007946299 100644
> --- a/target/s390x/sigp.c
> +++ b/target/s390x/sigp.c
> @@ -497,6 +497,7 @@ void do_stop_interrupt(CPUS390XState *env)
>      if (s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu) == 0) {
>          qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>      }
> +    /* Storing will occur on next SIE entry for fmt 4 */
>      if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
>          s390_store_status(cpu, S390_STORE_STATUS_DEF_ADDR, true);
>      }
> 

I'd suggest to move the comment to the if-statement in helper.c, too.

 Thomas


