Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34809106CF2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 11:57:00 +0100 (CET)
Received: from localhost ([::1]:49422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY6cV-0004oi-9V
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 05:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iY6bZ-0003wO-Ew
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 05:56:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iY6bY-0004q7-H0
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 05:56:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34006
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iY6bY-0004pK-DI
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 05:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574420159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/LOhM0MSQkLA/XgxhRrqdzIIaP01awrupSqFYlvhrs=;
 b=BCxUyFyXqPNShOAWIHaJdZ3aPjVXGfgy1ChK7kyDgPlcNpRFKr7l/w1Ulae5hs6egsX4Gj
 upyLyZUTgalkYNxJz8tFYRuA1yCSUcSQ+ddMYkOVCDaitBzkZ2tpW3zezNG5fnGCJpzpi7
 kevJGpViILAJ7Dpgk55T+QR2pqKnYtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-Cfs5lriBOWmAxL7B8rd3-A-1; Fri, 22 Nov 2019 05:55:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB061005514;
 Fri, 22 Nov 2019 10:55:56 +0000 (UTC)
Received: from [10.36.118.121] (unknown [10.36.118.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69E0961B62;
 Fri, 22 Nov 2019 10:55:55 +0000 (UTC)
Subject: Re: [PATCH 1/4] s390x: Don't do a normal reset on the initial cpu
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20191122075218.23935-1-frankja@linux.ibm.com>
 <20191122075218.23935-2-frankja@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <34d497af-3fd5-cba0-cb36-b8885e09a019@redhat.com>
Date: Fri, 22 Nov 2019 11:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191122075218.23935-2-frankja@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Cfs5lriBOWmAxL7B8rd3-A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.11.19 08:52, Janosch Frank wrote:
> The initiating cpu needs to be reset with an initial reset. While
> doing a normal reset followed by a initial reset is not wron per-se,
> the Ultravisor will only allow the correct reset to be performed.
>=20
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   hw/s390x/s390-virtio-ccw.c | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index d3edeef0ad..c1d1440272 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -348,6 +348,9 @@ static void s390_machine_reset(MachineState *machine)
>           break;
>       case S390_RESET_LOAD_NORMAL:
>           CPU_FOREACH(t) {
> +            if (t =3D=3D cs) {
> +                continue;
> +            }
>               run_on_cpu(t, s390_do_cpu_reset, RUN_ON_CPU_NULL);
>           }
>           subsystem_reset();
>=20

Right, AFAIKS, s390_cpu_initial_reset() does a s390_cpu_reset() right=20
no, so nothing should change.

Reviewed-by: David Hildenbrand <david@redhat.com>

--=20

Thanks,

David / dhildenb


