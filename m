Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CAA41C677
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:15:13 +0200 (CEST)
Received: from localhost ([::1]:41636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVaMZ-0002jP-SZ
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVaKn-0001Cx-H8
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVaKj-0000aO-Qd
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:13:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632924796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xog92VojsmCHBp3LYL8B8t8TCwukmomk3tQE56yUVWA=;
 b=hgdYhkbyaJT87Bc4JYVe0MHznwW8BqzIWUSaCpQBKCYSoyKQFcvU/0QeaMr+PlVirXB/On
 FHX0khsa+GeDUl9vzE1Z6WzzkK7EGxFvZ6d6I2pDiCK65OfquUwdsUY+xFNWJUov0Iqty+
 nWUa88+vxmLCiPcZY1AfDBn7zW2mbGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-dnPUWPu4MUictGiZ_s2sSQ-1; Wed, 29 Sep 2021 10:13:14 -0400
X-MC-Unique: dnPUWPu4MUictGiZ_s2sSQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E845B84A5E0;
 Wed, 29 Sep 2021 14:13:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8ECC4101E241;
 Wed, 29 Sep 2021 14:12:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2276E1800386; Wed, 29 Sep 2021 16:12:25 +0200 (CEST)
Date: Wed, 29 Sep 2021 16:12:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: marcel@redhat.com
Subject: Re: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
Message-ID: <20210929141225.2st6obnysi3euaiy@sirius.home.kraxel.org>
References: <20210803205043.165034-1-mst@redhat.com>
 <20210803205043.165034-2-mst@redhat.com>
 <YVGP9vdTtu5sRVpl@redhat.com>
 <20210927053932-mutt-send-email-mst@kernel.org>
 <CA+aaKfDO_KRZYova9fGkPAr0vgh=YygATZ87iwrfqeV=CyN=tg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+aaKfDO_KRZYova9fGkPAr0vgh=YygATZ87iwrfqeV=CyN=tg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > generally maybe we should just add an ACPI-hotplug capability and
> > teach seabios about it?
> 
> I suppose it is possible.

I doubt this solves the problem.  As I understand it linux will happily
assign io address space for pcie hotplug root ports but not for acpi
hotplug root ports.  So seabios simply not allocation io address space
isn't a problem for pcie hotplug root ports but is for acpi hotplug root
ports even though seabios doesn't make a difference.

So the patch asks seabios to allocate io address space, which in turn
leads to running out of io address space with many ports.

Changing the way to request io address space allocation doesn't fix the
underlying issue ...

take care,
  Gerd


