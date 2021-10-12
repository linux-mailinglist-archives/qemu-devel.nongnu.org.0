Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C352429D22
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 07:33:07 +0200 (CEST)
Received: from localhost ([::1]:39056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maAPR-0007i3-Jd
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 01:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1maANC-0006Cb-Ca
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1maAN8-00038f-Qk
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 01:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634016642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vpoPr78N1Yd2hSi1RNlFmVxVGK9xw6RPJFVyrudWQiE=;
 b=bhqPk4adSyeHhEkBpgc10YGLzq0Ua7G2UBZTcwWEjOqWKkQKoAYzXsd+t1SykjvtoQ6FCv
 3xhj76RlRtlfX8JJewUjl2k2yNnDderWO3LOmN9dRVffu/4X2f3hp3+VcGFhfV8SIJsV1Z
 IylF3amfZxjVLGo6LTU5QMBd4Sf4Zbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-xFTsvrtaPKS9ddBqwJXkzw-1; Tue, 12 Oct 2021 01:30:40 -0400
X-MC-Unique: xFTsvrtaPKS9ddBqwJXkzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6FEA362FA;
 Tue, 12 Oct 2021 05:30:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE8A019C79;
 Tue, 12 Oct 2021 05:30:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1AA391800393; Tue, 12 Oct 2021 07:30:34 +0200 (CEST)
Date: Tue, 12 Oct 2021 07:30:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 6/6] pcie: expire pending delete
Message-ID: <20211012053034.faskn5y6b2hbbfys@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211011120504.254053-7-kraxel@redhat.com>
 <20211011084310-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211011084310-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > index f3ac04399969..477c8776aa27 100644
> > --- a/hw/pci/pcie.c
> > +++ b/hw/pci/pcie.c
> > @@ -549,6 +549,8 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
> >      }
> >  
> >      dev->pending_deleted_event = true;
> > +    dev->pending_deleted_expires_ms =
> > +        qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 5000; /* 5 secs */
> >  
> >      /* In case user cancel the operation of multi-function hot-add,
> >       * remove the function that is unexposed to guest individually,
> 
> 
> Well this will be barely enough, right?
> 
> 	Once the Power
> 	Indicator begins blinking, a 5-second abort interval exists during which a second depression of the
> 	Attention Button cancels the operation.

Well, canceling the hot-plug is not supported in qemu right now (there
is no qmp command for that).  I'm also not sure it makes sense in the
first place for virtual machines.

> So I guess it needs to be more. Problem is of course if guest is
> busy because of interrupts and whatnot, it might not get to
> handling that in time ...

See patch #3, that one should take care of a busy guest ...

take care,
  Gerd


