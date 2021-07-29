Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6407C3DA01F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 11:14:07 +0200 (CEST)
Received: from localhost ([::1]:38964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m927C-0000gZ-Fr
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 05:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m925V-0007ZK-Dh
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m925R-00079C-DI
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627549934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uRDmncyMMkK8+8qZAynTW+/0u539CjobOsXanHW4mis=;
 b=F7Yn2qDW/WtaURBu1inI8em+WZaxgu5gFx0VtOmpgru8vedZ702Crq/gLFx3rR76MOxX/u
 iR0zNcEEyuHpzNQ+DhlTJ8mra6xgtlwYKcJNeXB6Yg7G51YoMaki++nOcApch7WpLKnqOk
 +fHoSJmnO0eYf0c5jnhQAKxeQx2Irgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-jiGDyIzONZiXeQNH4iVItQ-1; Thu, 29 Jul 2021 05:12:13 -0400
X-MC-Unique: jiGDyIzONZiXeQNH4iVItQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAE69180FCCC;
 Thu, 29 Jul 2021 09:12:11 +0000 (UTC)
Received: from localhost (unknown [10.39.192.140])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42DCA60843;
 Thu, 29 Jul 2021 09:12:06 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH for-6.2 v3 06/11] machine: Prefer cores over sockets in
 smp parsing since 6.2
In-Reply-To: <20210728034848.75228-7-wangyanan55@huawei.com>
Organization: Red Hat GmbH
References: <20210728034848.75228-1-wangyanan55@huawei.com>
 <20210728034848.75228-7-wangyanan55@huawei.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Thu, 29 Jul 2021 11:12:05 +0200
Message-ID: <87pmv132my.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 28 2021, Yanan Wang <wangyanan55@huawei.com> wrote:

> In the real SMP hardware topology world, it's much more likely that
> we have high cores-per-socket counts and few sockets totally. While
> the current preference of sockets over cores in smp parsing results
> in a virtual cpu topology with low cores-per-sockets counts and a
> large number of sockets, which is just contrary to the real world.
>
> Given that it is better to make the virtual cpu topology be more
> reflective of the real world and also for the sake of compatibility,
> we start to prefer cores over sockets over threads in smp parsing
> since machine type 6.2 for different arches.
>
> In this patch, a boolean "smp_prefer_sockets" is added, and we only
> enable the old preference on older machines and enable the new one
> since type 6.2 for all arches by using the machine compat mechanism.
>
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c              |  1 +
>  hw/core/machine.c          | 36 ++++++++++++++++++++++++++----------
>  hw/i386/pc.c               | 36 ++++++++++++++++++++++++++----------
>  hw/i386/pc_piix.c          |  1 +
>  hw/i386/pc_q35.c           |  1 +
>  hw/ppc/spapr.c             |  1 +
>  hw/s390x/s390-virtio-ccw.c |  1 +
>  include/hw/boards.h        |  1 +
>  qemu-options.hx            |  3 ++-
>  9 files changed, 60 insertions(+), 21 deletions(-)

Acked-by: Cornelia Huck <cohuck@redhat.com>


