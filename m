Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8B5406806
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 09:53:25 +0200 (CEST)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mObLg-0000GV-Ex
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 03:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mObKn-0007wp-P9
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mObKm-0002Xh-Cl
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631260347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B8rSGd3ORTLwlzuIY4r/sviUr6oVdgbaEg+WpIPbC0E=;
 b=hqWUb6OLBagcWaNG8gFJXI/S4anJz6unABt3cHE2ks4hRY0NAFUEeLwsd1UFrzlURTWEHD
 USdtCeCFONovk00JIs90VrU5sFj+7oySWV0+fDACuR8eYUcgBPH1XdsW0+yAan7eMo7SQr
 rf8QgyvXRqvKwnFE6KNOkz6ilUjKG+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-rzJvQHNLNKeaUCDQG0VXww-1; Fri, 10 Sep 2021 03:52:26 -0400
X-MC-Unique: rzJvQHNLNKeaUCDQG0VXww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6927115962B;
 Fri, 10 Sep 2021 07:51:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FAE36A902;
 Fri, 10 Sep 2021 07:51:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 03C8918000AA; Fri, 10 Sep 2021 09:51:26 +0200 (CEST)
Date: Fri, 10 Sep 2021 09:51:25 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: Implementing isochronous transfers in hw/hcd-ohci.c
Message-ID: <20210910075125.myuh7swdwd2mpgv4@sirius.home.kraxel.org>
References: <263FF66A-21D7-4D0D-BE37-2D44B484A1EE@gmail.com>
 <20210910050740.pgdcwhe5scohepps@sirius.home.kraxel.org>
 <CABLmASHenOBj-15oOYvsai8YJuJHbnpVCXW3vAwF3kA=eoPiyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABLmASHenOBj-15oOYvsai8YJuJHbnpVCXW3vAwF3kA=eoPiyQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > >  * TODO:
> > >  *  o Isochronous transfers

> > Most likely yes, audio devices typically use iso endpints.

> The usb-audio device works for the fedora guest, so would this not indicate
> that the iso endpoints are already working?

Indeed, so probably the comment is just outdated.

take care,
  Gerd


