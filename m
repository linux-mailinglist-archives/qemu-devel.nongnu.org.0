Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1A42FA759
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:21:58 +0100 (CET)
Received: from localhost ([::1]:47258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YE1-00051P-7N
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1Xsi-0002pt-Kb
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:59:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1Xsd-0006yZ-HX
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 11:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610989189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jh9McZubgqjbpKGbxA4L2amcwsSoMLDEqNpDCJgKMa8=;
 b=KGLSb/eIjATHIe7+8+Lxu3zi3bMdYjMzaaaq+/Knu0cUHmAmTq1CSa7UAXJ7IFFyRQ6Zac
 WlB0mqE8UcZvAdD+T/HwDWSiHHD5EK+UaNnhX7vyrFDOiSbrXq5ExkpbNsIN/vqcRGe5PS
 NSi3My0qQt3uxpfXurCaQ5F+TjK4rr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-FfOqGngwPWK6ltZyeIugyg-1; Mon, 18 Jan 2021 11:59:43 -0500
X-MC-Unique: FfOqGngwPWK6ltZyeIugyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D349806660;
 Mon, 18 Jan 2021 16:59:42 +0000 (UTC)
Received: from work-vm (ovpn-115-197.ams2.redhat.com [10.36.115.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69D7E5D72E;
 Mon, 18 Jan 2021 16:59:37 +0000 (UTC)
Date: Mon, 18 Jan 2021 16:59:34 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH RFC 0/2] Add debug interface to kick/call on purpose
Message-ID: <20210118165934.GD9899@work-vm>
References: <20210115002730.1279-1-dongli.zhang@oracle.com>
 <20210115102727.GC1692978@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210115102727.GC1692978@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
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
Cc: ehabkost@redhat.com, mst@redhat.com, Dongli Zhang <dongli.zhang@oracle.com>,
 joe.jin@oracle.com, qemu-devel@nongnu.org, armbru@redhat.com,
 pbonzini@redhat.com, joao.m.martins@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Jan 14, 2021 at 04:27:28PM -0800, Dongli Zhang wrote:
> > The virtio device/driver (e.g., vhost-scsi and indeed any device including
> > e1000e) may hang due to the lost of IRQ or the lost of doorbell register
> > kick, e.g.,
> > 
> > https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html
> > 
> > The virtio-net was in trouble in above link because the 'kick' was not
> > taking effect (missed).
> > 
> > This RFC adds a new debug interface 'DeviceEvent' to DeviceClass to help
> > narrow down if the issue is due to lost of irq/kick. So far the new
> > interface handles only two events: 'call' and 'kick'. Any device (e.g.,
> > e1000e or vhost-scsi) may implement (e.g., via eventfd, MSI-X or legacy
> > IRQ).
> > 
> > The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
> > vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
> > on purpose by admin at QEMU/host side for a specific device.
> 
> I'm really not convinced that we want to give admins the direct ability to
> poke at internals of devices in a running QEMU. It feels like there is way
> too much potential for the admin to make a situation far worse by doing
> the wrong thing here,

We already do have commands to write to an iport, and to inject MCEs for
example; is this that much different?

> and people dealing with support tickets will have
> no idea that the admin has been poking internals of the device and broken
> it by doing something wrong.

You could add a one time log entry to say that this mischeivous command
had been used.

> You pointed to bug that hit where this could conceivably be useful, but
> that's a one time issue and should not a common occurrance that justifies
> making an official public API to poke at devices forever more IMHO.

I think where it might be practically useful is if you were debugging a
hung customers VM and need to find a way to get it to move again.
THat's something I'm not familiar with on the virtio side;
mst - is this useful from a virtio side?

Dave

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


