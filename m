Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE26405D04
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 20:51:28 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOP8x-0005Bi-P0
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 14:51:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mOP4W-0002NJ-JT
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 14:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mOP4T-0005ts-QP
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 14:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631213208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0pzbBYCWqbgRW+ufRHz+MM4Oqg466o5liD9bply3WTM=;
 b=hk2KUXtai3dGY3q2f+FQjSPlhOz7mjoB6KChoeopUMPE2JtkX3SMqp2OCl0mvBNuJMd0vY
 KhbIjB/X2Szt03uv9BMYydWh4+AJINX8PhvSTriwQkpM/HphCwYNl8ADfzIAkZhP5SIQu6
 VagWFccEzEKW/mXWS8d8jAlZAwTCFNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-C_EXj8nOOXekSgqTKAXzYA-1; Thu, 09 Sep 2021 14:46:44 -0400
X-MC-Unique: C_EXj8nOOXekSgqTKAXzYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1F44A0CAC;
 Thu,  9 Sep 2021 18:46:43 +0000 (UTC)
Received: from redhat.com (ovpn-112-181.phx2.redhat.com [10.3.112.181])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADCE05C1C5;
 Thu,  9 Sep 2021 18:46:39 +0000 (UTC)
Date: Thu, 9 Sep 2021 13:46:37 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 02/10] accel: Use qemu_security_policy_taint(), mark
 KVM and Xen as safe
Message-ID: <20210909184637.pmb6mo26ss6ldnoa@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-3-philmd@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 01:20:16AM +0200, Philippe Mathieu-Daudé wrote:
> Add the AccelClass::secure_policy_supported field to classify
> safe (within security boundary) vs unsafe accelerators.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/qemu/accel.h | 5 +++++
>  accel/kvm/kvm-all.c  | 1 +
>  accel/xen/xen-all.c  | 1 +
>  softmmu/vl.c         | 3 +++
>  4 files changed, 10 insertions(+)
> 
> diff --git a/include/qemu/accel.h b/include/qemu/accel.h
> index 4f4c283f6fc..895e30be0de 100644
> --- a/include/qemu/accel.h
> +++ b/include/qemu/accel.h
> @@ -44,6 +44,11 @@ typedef struct AccelClass {
>                         hwaddr start_addr, hwaddr size);
>  #endif
>      bool *allowed;
> +    /*
> +     * Whether the accelerator is withing QEMU security policy boundary.

within

> +     * See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool secure_policy_supported;
>      /*
>       * Array of global properties that would be applied when specific
>       * accelerator is chosen. It works like MachineClass.compat_props

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


