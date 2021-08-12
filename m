Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC33EA2FA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 12:29:54 +0200 (CEST)
Received: from localhost ([::1]:49282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7yD-0001KD-6z
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 06:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mE7xQ-0000UL-3M
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:29:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mE7xO-0004Vz-E8
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 06:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628764141;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ekXdtRYuM5Ywp6wdYCSKlDffE4f+0F1Y+L+SUJJwp38=;
 b=dcDfwfw/wFq2aoAsSasj15srC/jqvAQkKlgWVvvG107Py3PQvfK2FL7edFG0XGrCr5+RBK
 ab5yGV403RRTMzL4RlEnDgIdYJ6sWi/9nu0omX27HDvnekyor8B/8cunWHeH43xhhKE8u1
 d68nS8VeRuOHr+Akq9blW0j3GQn/UO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-nOBoBm01M_STqT-m2nl27Q-1; Thu, 12 Aug 2021 06:28:57 -0400
X-MC-Unique: nOBoBm01M_STqT-m2nl27Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC391100A609
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 10:28:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBB7827CA6;
 Thu, 12 Aug 2021 10:28:47 +0000 (UTC)
Date: Thu, 12 Aug 2021 11:28:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] q35: catch invalid cpu hotplug configuration
Message-ID: <YRT33VufWIrhaS6j@redhat.com>
References: <20210812102341.3316254-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210812102341.3316254-1-kraxel@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 12, 2021 at 12:23:41PM +0200, Gerd Hoffmann wrote:
> Related: https://bugzilla.redhat.com//show_bug.cgi?id=1985924
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/isa/lpc_ich9.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 5f9de0239cf9..5f143dca17aa 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -31,6 +31,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "cpu.h"
> +#include "qapi/error.h"
>  #include "qapi/visitor.h"
>  #include "qemu/range.h"
>  #include "hw/isa/isa.h"
> @@ -676,6 +677,18 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
>      DeviceState *dev = DEVICE(d);
>      ISABus *isa_bus;
>  
> +    if ((lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) &&
> +        !(lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT))) {
> +        /*
> +         * smi_features_ok_callback() throws an error on this.
> +         *
> +         * So bail out here instead of advertizing the invalid
> +         * configuration and get obscure firmware failures from that.
> +         */
> +        error_setg(errp, "cpu hot-unplug requires cpu hot-plug");
> +        return;
> +    }

What does this actually mean in practice ? AFAIK from the libvirt side
we don't do anything special to enable/disable CPU hotplug. What QEMU
config setting is wrong to lead to this scenario, thta the user/mgmt
app has to fix ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


