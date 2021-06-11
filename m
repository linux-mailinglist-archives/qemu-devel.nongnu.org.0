Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57903A47E4
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 19:29:04 +0200 (CEST)
Received: from localhost ([::1]:48810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrkxr-0003pd-Cz
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 13:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrktZ-0008MD-J2
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:24:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrktW-0006FK-H6
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 13:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623432274;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yItp2iXtM7lDtWbu5pbOg/WA643hZbf/CUaS2lpuMq0=;
 b=aBWE0VHodSjooB5vPC43BQkgq8HxdS2CW2p+863jyu89aWwElPhlPvDImGqYge0KzafJwe
 OCu+eM3yXBdTx8TjIgTFdN3tHVQ9GLME35BSrl+fRNcsnMu9apwvldiKezImCI/HRcUklo
 Tu26sRicHl0QJNdpxm2K2+1Kg+eTBKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-DhF_p_cBNu-YbMMSsrdasA-1; Fri, 11 Jun 2021 13:24:30 -0400
X-MC-Unique: DhF_p_cBNu-YbMMSsrdasA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B04291850606;
 Fri, 11 Jun 2021 17:24:29 +0000 (UTC)
Received: from redhat.com (ovpn-115-90.ams2.redhat.com [10.36.115.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E181819C84;
 Fri, 11 Jun 2021 17:24:17 +0000 (UTC)
Date: Fri, 11 Jun 2021 18:24:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnichenko <andrew@daynix.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
Message-ID: <YMOcP1m4rD/EkEJp@redhat.com>
References: <20210609100457.142570-1-andrew@daynix.com>
 <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
 <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 07:49:21PM +0300, Andrew Melnichenko wrote:
> Hi,
> 
> > So I think the series is for unprivileged_bpf disabled. If I'm not
> > wrong, I guess the policy is to grant CAP_BPF but do fine grain checks
> > via LSM.
> >
> 
> The main idea is to run eBPF RSS with qemu without any permission.
> Libvirt should handle everything and pass proper eBPF file descriptors.
> For current eBPF RSS, CAP_SYS_ADMIN(bypass some limitations)
> also required, and in the future may be other permissions.
> 
> I'm not sure this is the best. We have several examples that let libvirt
> > to involve. Examples:
> >
> > 1) create TAP device (and the TUN_SETIFF)
> >
> > 2) open vhost devices
> >
> 
> Technically TAP/vhost not related to a particular qemu emulator. So common
> TAP creation should fit any modern qemu. eBPF fds(program and maps) should
> suit the interface for current qemu, g.e. some qemu builds may have
> different map
> structures or their count. It's necessary that the qemu got fds prepared by
> the helper
> that was built with the qemu.
> 
> I think we need an example on the detail steps for how libvirt is
> > expected to use this.
> >
> 
> The simplified workflow looks like this:
> 
>    1. Libvirt got "emulator" from domain document.
>    2. Libvirt queries for qemu capabilities.
>    3. One of the capabilities is "qemu-ebpf-rss-helper" path(if present).
>    4. On NIC preparation Libvirt checks for virtio-net + rss configurations.
>    5. If required, the "qemu-ebpf-rss-helper" called and fds are received
>    through unix fd.
>    6. Those fds are for eBPF RSS, which passed to child process - qemu.
>    7. Qemu launched with virtio-net-pci property "rss" and "ebpf_rss_fds".

So this basically works in the same way as the qemu bridge
helper, with the extra advantage that we can actually query
QEMU for the right helper instead of libvirt hardcoding te
helper path.  We should make your QMP query command also
return the paths for the existing QEMU helpers (bridge helper,
and pr helper) too.

Anyway, this approach is obviously viable for libvirt, since
it matches what we already do for other features.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


