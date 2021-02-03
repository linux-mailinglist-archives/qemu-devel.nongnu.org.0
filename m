Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CD630E3DB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 21:09:05 +0100 (CET)
Received: from localhost ([::1]:55198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7OSW-0000wU-Qx
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 15:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l7OQM-0007ex-IW
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:06:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l7OQD-0003P5-Ak
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 15:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612382799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pxx7LQTlq5PMU9Ms8u53ICDlFM3CSEIjeSJU2iB1uJw=;
 b=DuaZIP3avspniSJaQdjaryxtJsdOIUbA+IrBU9/hJbmM3VmSgHBG/dIpn9A1kanteXnnbw
 FGQMw/4NUNJJUf7TJMilwJ4TVZuveWISLyaxlKf62K22oCEa+bmlllu9jxPlNgutES5pjQ
 0S6/9l+eNIQEhmQOAyeUOOdvW02RtAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-MQBIT6fUND2ZNg_Lbve3vQ-1; Wed, 03 Feb 2021 15:06:37 -0500
X-MC-Unique: MQBIT6fUND2ZNg_Lbve3vQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7712F107ACE3;
 Wed,  3 Feb 2021 20:06:36 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B4B4779D9;
 Wed,  3 Feb 2021 20:06:34 +0000 (UTC)
Date: Wed, 3 Feb 2021 21:06:31 +0100
From: Andrew Jones <drjones@redhat.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: Re: [PATCH] target/arm: Don't migrate CPUARMState.features
Message-ID: <20210203200631.ki2xr7ynhv3wturm@kamzik.brq.redhat.com>
References: <CAFEAcA-qq-Eue+ktR1tNO7FZdtCe428=5vdA5472W-16p=d75A@mail.gmail.com>
 <20210203161340.55210-1-aaron@os.amperecomputing.com>
MIME-Version: 1.0
In-Reply-To: <20210203161340.55210-1-aaron@os.amperecomputing.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 11:13:40AM -0500, Aaron Lindsay wrote:
> As feature flags are added or removed, the meanings of bits in the
> `features` field can change between QEMU versions, causing migration
> failures. Additionally, migrating the field is not useful because it is
> a constant function of the CPU being used.
> 
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index c9e9fd0a12..7f2511b6ed 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -834,7 +834,7 @@ const VMStateDescription vmstate_arm_cpu = {
>          VMSTATE_UINT64(env.exclusive_addr, ARMCPU),
>          VMSTATE_UINT64(env.exclusive_val, ARMCPU),
>          VMSTATE_UINT64(env.exclusive_high, ARMCPU),
> -        VMSTATE_UINT64(env.features, ARMCPU),
> +        VMSTATE_UNUSED(sizeof(uint64_t)),
>          VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
>          VMSTATE_UINT32(env.exception.fsr, ARMCPU),
>          VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
> -- 
> 2.17.1
>

I tested this with a KVM guest. Prior to this patch, a migration of a 4.1
guest from a 4.1 build of QEMU to a build of the latest bits of QEMU would
fail with a segmentation fault. With this patch, the migration succeeds.
However, migrating a virt-4.1 machine type from a QEMU of the latest bits
to a 4.1 build of QEMU still fails with

  qemu-system-aarch64: error while loading state for instance 0x0 of device 'pl011'
  qemu-system-aarch64: load of migration failed: No such file or directory

This means "ping-pong" migrations fail, which is another thing we would
prefer to work. But, as that appears to be a different bug, regarding this
patch

Reviewed-by: Andrew Jones <drjones@redhat.com>
Tested-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


