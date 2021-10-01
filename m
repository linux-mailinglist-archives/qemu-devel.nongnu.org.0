Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF6241EB29
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 12:48:09 +0200 (CEST)
Received: from localhost ([::1]:45098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWG5H-0001Gl-RD
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 06:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mWG3L-0008BT-CV
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 06:46:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mWG3F-0000qG-IA
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 06:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633085159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JMYGxtoWLLUEl2M3taW6xZetbQYzsy1nZP/63r1J7zo=;
 b=SerwD2ZFejFwwGCusG4tzf5Dlb39646basmrUsGNROpUBT+tXAHE+1ep9lXPOi3KFy5eLW
 6rMH5wkS2+yGgNA3nc/BZbd4mxfyvWROg3tXKyNjN71kVZZa9imK2bZxAfotTPk/ex85am
 GMRMpizQeDNMqrN15vcidbXsxP01i2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-BLDFGbHvMbeRWGhlOM8AXA-1; Fri, 01 Oct 2021 06:45:55 -0400
X-MC-Unique: BLDFGbHvMbeRWGhlOM8AXA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 491DD1808312;
 Fri,  1 Oct 2021 10:45:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FB9D60BF4;
 Fri,  1 Oct 2021 10:45:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E4AC718007AC; Fri,  1 Oct 2021 12:45:14 +0200 (CEST)
Date: Fri, 1 Oct 2021 12:45:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v3] failover: fix unplug pending detection
Message-ID: <20211001104514.46bhlpenx4rz2qnm@sirius.home.kraxel.org>
References: <20211001082502.1342878-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211001082502.1342878-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 01, 2021 at 10:25:02AM +0200, Laurent Vivier wrote:
> Failover needs to detect the end of the PCI unplug to start migration
> after the VFIO card has been unplugged.
> 
> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
> pcie_unplug_device().

> +    /*
> +     * pending_deleted_event is used by virtio-net failover to detect the
> +     * end of the unplug operation, the flag is set to false in
> +     * acpi_pcihp_eject_slot() when the operation is completed.
> +     */
> +    pdev->qdev.pending_deleted_event = true;

This has the side effect of blocking a second 'device_del' command.

So, in case the first time didn't work (for example due to the guest not
listening because grub just doesn't do that), you can try a second time
once the linux kernel is up'n'running.

I suspect this patch will break that (didn't actually test though).


While being at it I'll throw in a link to a bunch of slightly related
pcie hotplug patches:
   https://gitlab.com/kraxel/qemu/-/commits/sirius/pcie-hotplug

I'll be offline next week, so not posting that series for discussion
yet, will probably do that when I'm back, but you might want have a
look nevertheless.

take care,
  Gerd


