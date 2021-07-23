Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C273D3708
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:49:31 +0200 (CEST)
Received: from localhost ([::1]:48324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qs7-0005JQ-0d
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6qrM-0004bu-Ku
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:48:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6qrK-00007h-4v
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627030120;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=03VXxVp+kmULnxMdJECndRgRZw6KjlvZNVWSUKiZr/g=;
 b=AEj+kugpeFUVGJhnkk1btJGvzQUZw1EZOx4IQ1s6DYjSueYljMVaN4Qj3jNqg9T6UnDLT4
 OcgB81HmdpjLM9lfNyWgmSswgBO3xuIj1dF7nFwAK8ZNk/tD/BaNJ2mY3tLje/ThLHZQSk
 838JW1Wat8PfJwVaBXV6uhZXH811GNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-yZz4Fz6DORaNv84gJdSZ6Q-1; Fri, 23 Jul 2021 04:48:36 -0400
X-MC-Unique: yZz4Fz6DORaNv84gJdSZ6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C3FE107ACF5;
 Fri, 23 Jul 2021 08:48:35 +0000 (UTC)
Received: from redhat.com (ovpn-114-245.ams2.redhat.com [10.36.114.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E02765D9C6;
 Fri, 23 Jul 2021 08:48:26 +0000 (UTC)
Date: Fri, 23 Jul 2021 09:48:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/2] acpi: x86: pcihp: add support hotplug on
 multifunction bridges
Message-ID: <YPqCVwY0Y/+jUoWT@redhat.com>
References: <20210722105945.2080428-1-imammedo@redhat.com>
 <20210722105945.2080428-3-imammedo@redhat.com>
 <20210722133738-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210722133738-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 jusual@redhat.com, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 01:49:34PM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 22, 2021 at 06:59:45AM -0400, Igor Mammedov wrote:
> > Commit 17858a1695 (hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35)
> > switched PCI hotplug from native to ACPI one by default.
> > 
> > That however breaks ihotplug on following CLI that used to work:
> 
> s/ihotplug/hotplug/ ?
> 
> >    -nodefaults -machine q35 \
> >    -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
> >    -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2
> > 
> > where PCI device is hotplugged to pcie-root-port-1 with error on guest side:
> > 
> >   ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND (20201113/psargs-330)
> >   ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
> >   ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
> >   ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01] (20201113/evgpe-515)
> > 
> > cause is that QEMU's ACPI hotplug never supported functions other then 0
> > and due to bug it was generating notification entries for not described
> > functions.
> > 
> > Technically there is no reason not to describe cold-plugged bridges
> > (root ports) on functions other then 0, as they similaraly to bridge
> > on function 0 are unpluggable.
> > 
> > Fix consists of describing cold-plugged bridges[root ports] on functions
> > other than 0.
> 
> 
> I would add: since we need to describe multifunction devices
> 
> 
> > 
> > Fixes: 17858a169508609ca9063c544833e5a1adeb7b52
> 
> use short hash and include subject within ("subject here") please

Using short hashes isn't a good idea in commits IMHO. A git short
hash is only guaranteed unique at the time it is generated. In future
the repo might gain commits that result in a clashing short hash.
Using the full hash is good.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


