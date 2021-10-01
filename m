Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A1741EB34
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 12:51:18 +0200 (CEST)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWG8L-0004nK-FU
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 06:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWG6E-0003TZ-Dp
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 06:49:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mWG6B-0003CE-CZ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 06:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633085342;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0Ymoiqo4eCWrodSwJn5/RYxWqLyl+T6HtvRkP8OGikg=;
 b=Sie9ORjzrWJBuIQXJ+Zcd6TyXxMY0sfDRrLXbHRq3quoXyZhrbp/ZE5Iu65kf7aeIPot/Z
 INt/Q+QZg64biXQMNkUM5X9d3ktaOQvuV/LYziHGYjpqiHJVhsYHTkYycCBHmXz0S0h0D5
 SPjU17/6EbzKIl4PI8hBqhyp52/zGZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-6opkCvETMSCoygVGkgjQ9w-1; Fri, 01 Oct 2021 06:49:01 -0400
X-MC-Unique: 6opkCvETMSCoygVGkgjQ9w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 356FBA40C9;
 Fri,  1 Oct 2021 10:49:00 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DA731972D;
 Fri,  1 Oct 2021 10:48:58 +0000 (UTC)
Date: Fri, 1 Oct 2021 11:48:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3] failover: fix unplug pending detection
Message-ID: <YVbnl7hcvNLMYj/e@redhat.com>
References: <20211001082502.1342878-1-lvivier@redhat.com>
 <20211001104514.46bhlpenx4rz2qnm@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211001104514.46bhlpenx4rz2qnm@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 01, 2021 at 12:45:14PM +0200, Gerd Hoffmann wrote:
> On Fri, Oct 01, 2021 at 10:25:02AM +0200, Laurent Vivier wrote:
> > Failover needs to detect the end of the PCI unplug to start migration
> > after the VFIO card has been unplugged.
> > 
> > To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
> > pcie_unplug_device().
> 
> > +    /*
> > +     * pending_deleted_event is used by virtio-net failover to detect the
> > +     * end of the unplug operation, the flag is set to false in
> > +     * acpi_pcihp_eject_slot() when the operation is completed.
> > +     */
> > +    pdev->qdev.pending_deleted_event = true;
> 
> This has the side effect of blocking a second 'device_del' command.
> 
> So, in case the first time didn't work (for example due to the guest not
> listening because grub just doesn't do that), you can try a second time
> once the linux kernel is up'n'running.
> 
> I suspect this patch will break that (didn't actually test though).

That's important because OpenStack will definitely trigger
multiple device_del commands in a row if they don't get a
success from an initial one.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


