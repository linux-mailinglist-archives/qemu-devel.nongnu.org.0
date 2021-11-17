Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD94542B2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 09:32:00 +0100 (CET)
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnGMJ-0003EL-Lr
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 03:31:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mnGL4-0002Nn-4u
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:30:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mnGKz-0002UW-S0
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 03:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637137834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qprotNl1bh1A0jEmpODsR0r4J4pArP38sC/EoXidvCs=;
 b=aLDV2gbWO4IxfNW1Pe3gw4lmTgVoxUw4zB5tNGaRRf8R8VUvQHWsoxjePjfw7FmBKAJtas
 NwgHYZQhkGpwNkoAeSzjSlSeZ+HWaTcpK4OZnYhkMGSCU87+/bPzO0mmuiSAjmW8YdAxcS
 IizVKILIEksRMoeImEEGzi2LYBMRG/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-ARRC5_9VPjuGzM3154pR3A-1; Wed, 17 Nov 2021 03:30:31 -0500
X-MC-Unique: ARRC5_9VPjuGzM3154pR3A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EF358799EE;
 Wed, 17 Nov 2021 08:30:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C469A57CAB;
 Wed, 17 Nov 2021 08:30:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4246B18000B2; Wed, 17 Nov 2021 09:30:02 +0100 (CET)
Date: Wed, 17 Nov 2021 09:30:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL 20/20] pcie: expire pending delete
Message-ID: <20211117083002.cf3lx4vdvihjbebo@sirius.home.kraxel.org>
References: <20211115163607.177432-1-mst@redhat.com>
 <20211115163607.177432-21-mst@redhat.com>
 <20211116203200.02fda064@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211116203200.02fda064@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> >      dev->pending_deleted_event = true;
> > +    dev->pending_deleted_expires_ms =
> > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
> 
> do we block migration if unplug was requested?

Not sure.

> (if not we might loose this state on destionatio, do we care about it?)

pending_deleted_event isn't transfered either, so it shouldn't be a
problem.  Worst case is that mgmt has to re-try sending device_del
on the migration target host.

take care,
  Gerd


