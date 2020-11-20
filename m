Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B342BA955
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 12:40:04 +0100 (CET)
Received: from localhost ([::1]:34040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg4ln-0000SW-NQ
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 06:40:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kg4kd-00087a-Pu
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:38:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kg4kb-0002d1-Vb
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605872329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iw3V2z939ns+/qwexMKf0H6v3RzsXkNEQ3qucykXcFs=;
 b=CW7LYmN8FEZudNp2JP8kNqt/lCzdeGz3dcGS45QjzESf4jD7UlcullLVpQ+2SSBY96KJ0Z
 SQJHFcyeA0xIS7Udqo5+FkoCy3T0kz1UP5Zciua29NngIrDephe57uIN3/7H7CUq0FvIgj
 EmDbHn8pTnyIIsgWPefGk87he6jWplo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-lO9Ytiu8M2i3437agu6Oiw-1; Fri, 20 Nov 2020 06:38:44 -0500
X-MC-Unique: lO9Ytiu8M2i3437agu6Oiw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54E0C420E8;
 Fri, 20 Nov 2020 11:38:42 +0000 (UTC)
Received: from gondolin (ovpn-112-250.ams2.redhat.com [10.36.112.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C60B5D9C6;
 Fri, 20 Nov 2020 11:38:40 +0000 (UTC)
Date: Fri, 20 Nov 2020 12:38:37 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Availability of physical devices and migration (was: Re: [RFC PATCH
 2/2] vfio-ccw: Connect the device request notifier)
Message-ID: <20201120123837.0b4fc3be.cohuck@redhat.com>
In-Reply-To: <20201120035107.30688e2f.pasic@linux.ibm.com>
References: <20201117032605.56831-1-farman@linux.ibm.com>
 <20201117032605.56831-3-farman@linux.ibm.com>
 <20201120035107.30688e2f.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eric Farman <farman@linux.ibm.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 libvir-list@redhat.com, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Marc Hartmayer <mhartmay@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Nov 2020 03:51:07 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Tue, 17 Nov 2020 04:26:05 +0100
> Eric Farman <farman@linux.ibm.com> wrote:
> 
> > Now that the vfio-ccw code has a notifier interface to request that
> > a device be unplugged, let's wire that together.  
> 
> I'm aware of the fact that performing an unplug is what vfio-pci does,
> but I was not aware of this before, and I became curious with regards
> to how is this going to mesh with migration (in the future).
> 
> The sentence 'For this to work, QEMU has to be launched with the same
> arguments the two times.' form docs/devel/migration.rst should not
> be taken literally, I know, but the VM configuration changing not because
> it was changed via a management interface, but because of events that
> may not be under the control of whoever is managing the VM does
> make thinks harder to reason about.
> 
> I suppose, we now basically mandate that whoever manages the VM, either
> a) maintains his own model of the VM and listens to the events, to
> update it if such a device removal happens, or
> b) inspects the VM at some appropriate point in time, to figure out how
> the target VM is supposed to be started.
> 
> I think libvirt does a).

This seems like something that would be of general interest to libvirt
folks, adding the list on cc:.

For virtual devices, QEMU and any management software are in full
control, and can simply make sure that both source and target have the
device available.

For physical devices, we still can make sure that source and target
match when we do the setup, but device failures can happen at
inconvenient times. It may suddenly be no longer possible to access
state etc. Can we propagate changes like "device foobar, don't bother
migrating" even when we already started migration? Should the handling
be different if the target system uses a different (compatible) device?
Should we fail the migration?

> 
> I also suppose, such a device removal may not happen during device
> migration. That is, form the QEMU perspective I  believe taken care
> by the BQL.

Even if the device is not actually removed, it might still be
inaccessible.

> 
> But I'm in the dark regarding the management software/libivrt view. For
> example what happens if we get a req_notification on the target while
> pre-copy memory migration? At that point the destination is already
> receiving pages, thus it is already constructed.
> 
> My questions are not necessarily addressed to you Eric. Maybe the
> folks working on vfio migration can help us out. I'm also adding
> our libvirt guys.
> 
> Regards,
> Halil
> 


