Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3F307F1E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:06:10 +0100 (CET)
Received: from localhost ([::1]:43974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5DYP-0006TG-6X
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l5DVB-0005Z0-8k
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:02:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l5DV7-0006Wu-AY
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 15:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611864164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Yw+CxTJiwhviO2vWCtUF8T2PlqR8s06c7/qgVPsiU4=;
 b=goEQlGHYJaKfGgdq0AvzlqMV3IE2dI3FikMwp8bk3KZ65KryEywp4iXaztEZH15wqRdBOf
 IDmxQoOvbcEgltZ6IvfJysrtSs0K/+I3QziXj9/ApfkgCVdlRAUjkkvyyusaq7pP0zHZMJ
 TVoN8Qz4gUlxHwcYzUfcei6bODZY5s0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-VHC5ONVENnWCf8m1qw9T-A-1; Thu, 28 Jan 2021 15:02:42 -0500
X-MC-Unique: VHC5ONVENnWCf8m1qw9T-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7805C107ACE4;
 Thu, 28 Jan 2021 20:02:40 +0000 (UTC)
Received: from work-vm (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79DEE5D9F4;
 Thu, 28 Jan 2021 20:02:25 +0000 (UTC)
Date: Thu, 28 Jan 2021 20:02:23 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vfio/migrate: Move switch of dirty tracking into
 vfio_memory_listener
Message-ID: <20210128200223.GJ2951@work-vm>
References: <20210111073439.20236-1-zhukeqian1@huawei.com>
 <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e5f27643-441c-039c-a20c-a32c11b8d84c@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
 Eduardo Habkost <ehabkost@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 jiangkunkun@huawei.com, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, wanghaibin.wang@huawei.com,
 Zenghui Yu <yuzenghui@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 11/01/21 08:34, Keqian Zhu wrote:
> > +static void vfio_listener_log_start(MemoryListener *listener,
> > +                                    MemoryRegionSection *section,
> > +                                    int old, int new)
> > +{
> > +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> > +
> > +    vfio_set_dirty_page_tracking(container, true);
> > +}
> > +
> > +static void vfio_listener_log_stop(MemoryListener *listener,
> > +                                   MemoryRegionSection *section,
> > +                                   int old, int new)
> > +{
> > +    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
> > +
> > +    vfio_set_dirty_page_tracking(container, false);
> > +}
> > +
> 
> This would enable dirty page tracking also just for having a framebuffer
> (DIRTY_MEMORY_VGA).  Technically it would be correct, but it would also be
> more heavyweight than expected.

Wouldn't that only happen on emulated video devices?

> In order to only cover live migration, you can use the log_global_start and
> log_global_stop callbacks instead.
> 
> If you want to use log_start and log_stop, you need to add respectively
> 
>     if (old != 0) {
>         return;
>     }
> 
> and
> 
>     if (new != 0) {
>         return;
>     }

Why 0, wouldn't you be checking for DIRTY_LOG_MIGRATION somewhere?

Dave

> before the calls to vfio_set_dirty_page_tracking.  But I think it's more
> appropriate for VFIO to use log_global_*.
> 
> Thanks,
> 
> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


