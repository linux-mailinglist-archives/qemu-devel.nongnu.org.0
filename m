Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C1719F212
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 11:08:36 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLNkA-0001HA-He
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 05:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39825)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1jLNgm-0008Kp-JO
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 05:05:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1jLNgi-0000pE-CY
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 05:05:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47518
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1jLNgi-0000nx-89
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 05:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586163898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ajpIlefWlG55M1OnpVNWQLlkGsdJC4zc1T2xbHcx4eA=;
 b=Tmy6l2aPwaGOs2UvQAQJOYAjlNj2poud5NyzxX+5YLwqhEAP1ZdeNoZqRiWDfuSMRHYYCH
 EI7H7f1NCDqs6THidRKsDGDFNLYL5l6BResRRqBpHpteA2+bCisdQc6z2JWl3BaAFi/gwn
 n22c/62qypEQq4neqNodLU6ws1tGfKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-paumOWszOtyVdt789BfefA-1; Mon, 06 Apr 2020 05:04:56 -0400
X-MC-Unique: paumOWszOtyVdt789BfefA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 414F5801E53;
 Mon,  6 Apr 2020 09:04:55 +0000 (UTC)
Received: from gondolin (ovpn-113-129.ams2.redhat.com [10.36.113.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E7E6118F3F;
 Mon,  6 Apr 2020 09:04:50 +0000 (UTC)
Date: Mon, 6 Apr 2020 11:04:47 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 1/1] s390x/s390-virtio-ccw: Fix build on systems without
 KVM
Message-ID: <20200406110447.5ad97f62.cohuck@redhat.com>
In-Reply-To: <20200406075931.26232-2-borntraeger@de.ibm.com>
References: <20200406075931.26232-1-borntraeger@de.ibm.com>
 <20200406075931.26232-2-borntraeger@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Bruce Rogers <brogers@suse.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  6 Apr 2020 03:59:31 -0400
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> linux/kvm.h is not available on all platforms. Let us move
> s390_machine_inject_pv_error into pv.c as it uses KVM structures.
> 
> Fixes: 49fc3220175e ("s390x: protvirt: Support unpack facility")
> Reported-by: Bruce Rogers <brogers@suse.com>
> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  hw/s390x/ipl.h             |  1 +
>  hw/s390x/pv.c              | 11 +++++++++++
>  hw/s390x/s390-virtio-ccw.c | 10 ----------
>  include/hw/s390x/pv.h      |  3 +++
>  4 files changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
> index 89b3044d7a..53cc9eb5ac 100644
> --- a/hw/s390x/ipl.h
> +++ b/hw/s390x/ipl.h
> @@ -14,6 +14,7 @@
>  #define HW_S390_IPL_H
>  
>  #include "cpu.h"
> +#include "exec/address-spaces.h"

Hm, what is now requiring including this? (No objection, but I don't
see it.)

>  #include "hw/qdev-core.h"
>  
>  struct IPLBlockPVComp {

(...)

> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index b268907395..0e8b0c63a1 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -45,7 +45,6 @@
>  #include "sysemu/sysemu.h"
>  #include "sysemu/balloon.h"
>  #include "hw/s390x/pv.h"
> -#include <linux/kvm.h>

In hindsight, that should have been obvious :)

>  #include "migration/blocker.h"
>  
>  static Error *pv_mig_blocker;


