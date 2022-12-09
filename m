Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C1C6481F5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:52:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3buy-0003TM-UV; Fri, 09 Dec 2022 06:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1p3buw-0003Qx-QN
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:51:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1p3buv-0007Ue-AR
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670586708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IZgqHYKvPVQJ6IFDWpBa1T/aNW7UsbfIEP5D6DVuVHM=;
 b=DQVNRtCpQY+vrslWzTHuNFVVHHcFkb31KK78r0BKv6w2+6up/xJodqBXQgIkde7kxjxVFM
 W11tWOzCRJE4a+CtspSqmGGmvwsGcQOUlhCd6vfPWT5MF1LKa2WURCcZI6OQJnv9dUdkO6
 bszOUadH/m8JC6sjS/DEJcf1N7EzSxI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-SlNH-mjjMtuH4YI5gaOj9w-1; Fri, 09 Dec 2022 06:51:46 -0500
X-MC-Unique: SlNH-mjjMtuH4YI5gaOj9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 644C185A588;
 Fri,  9 Dec 2022 11:51:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F3C31759E;
 Fri,  9 Dec 2022 11:51:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D77C4180099D; Fri,  9 Dec 2022 12:51:42 +0100 (CET)
Date: Fri, 9 Dec 2022 12:51:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Kevin O'Connor <kevin@koconnor.net>, seabios@seabios.org,
 qemu-devel@nongnu.org
Subject: Re: [SeaBIOS] Re: [PATCH 4/4] be less conservative with the 64bit
 pci io window
Message-ID: <20221209115142.6rznxl6zb4c6qudg@sirius.home.kraxel.org>
References: <20221121103213.1675568-1-kraxel@redhat.com>
 <20221121103213.1675568-5-kraxel@redhat.com>
 <Y30YREAQZY8twJA/@morn>
 <20221123102508.zagkzmxlk3zdln5c@sirius.home.kraxel.org>
 <20221208170139.634adabd@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221208170139.634adabd@imammedo.users.ipa.redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  Hi,

> > Well, the idea is to adapt to the world moving forward.  Running a
> > 64-bit capable OS is standard these days, and the resources needed
> > by devices (especially GPUs) are becoming larger and larger.
> > 
> > Yes, there is the risk that (old) guests are unhappy with their
> > PCI bars suddenly being mapped above 4G.  Can happen only in case
> > seabios handles pci initialization (i.e. when running on qemu,
> > otherwise coreboot initializes the pci bars).  I hope the memory
> > check handles the 'old guest' case: when the guest can't handle
> > addresses above 4G it is unlikely that qemu is configured to have
> > memory mapped above 4G ...
> 
> does it break 32-bit PAE enabled guests
> (which can have more then 4Gb RAM configured)?

Well, depends on the guest OS I guess.  Modern linux copes just fine,
either uses PAE paging to access the PCI bars (seen with debian, works
even in case the PCI bars are above the 64G limit of 32bit processors),
or or it remaps the bars to places below 4G (seen with alpine which
compiles i386 kernels with PAE=n).

take care,
  Gerd


