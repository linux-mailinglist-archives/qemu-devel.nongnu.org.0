Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576BF2494C3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 07:59:52 +0200 (CEST)
Received: from localhost ([::1]:54782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8H8Z-0000az-C1
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 01:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8H1G-0000Z3-2G
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 01:52:18 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41331
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k8H1E-0007ER-Eh
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 01:52:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597816335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i3wKdi3uuHvVJEmE52wHEXnEjTlibhm5ByiVOyBhWwI=;
 b=AKXPoJWWN2rRo4GoWt+nMq2OwQB1HwEAEWWhfmVceqbLEspiVihqeMwr4BuDfibo/m3ucX
 6IXI+4onfXgKHwAhzT00tIM1KlZ+uJj6YfpIg2ec+Ae+r5hGYdSQtKldWmK6RBKIYOMDcd
 5OQHLPuoBpe+kPUMMDXpP7funC5g4QM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-GZUJHMaSNvmaKCWCav04OQ-1; Wed, 19 Aug 2020 01:52:13 -0400
X-MC-Unique: GZUJHMaSNvmaKCWCav04OQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA857801AE5;
 Wed, 19 Aug 2020 05:52:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 707F65D9E4;
 Wed, 19 Aug 2020 05:52:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3ADBB31E21; Wed, 19 Aug 2020 07:52:11 +0200 (CEST)
Date: Wed, 19 Aug 2020 07:52:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH] hw: dev-wacom: Support wacom tablet emulation in linux
 qemu
Message-ID: <20200819055211.bo4xim6cai7qzf2j@sirius.home.kraxel.org>
References: <20200812152149.260163-1-michael@amarulasolutions.com>
 <20200817064701.o3q3plnjhzyz3s42@sirius.home.kraxel.org>
 <CAOf5uwn94gZPZXChFDXWZ-1w0jOY_SxRqzF4Mk8hrtLq-r3yCg@mail.gmail.com>
 <20200817072841.lvbco4k7hzzimxsb@sirius.home.kraxel.org>
 <CAOf5uwn2KAajFo7oXYkZg5q3jbJyRC50hJafcoWCVzrdvkqXMw@mail.gmail.com>
 <20200818060214.z2irps623upmbe2w@sirius.home.kraxel.org>
 <CAOf5uwmKuRGf1F6SouBXcGTmErgCL=CL2RwL=CBbK0SkvOSH2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOf5uwmKuRGf1F6SouBXcGTmErgCL=CL2RwL=CBbK0SkvOSH2Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 23:06:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > > Have another small question. Do you know how force show cursor working
> > > in this case?
> >
> > Which display and which vga do you use?
> 
> -vga std \

So stdvga (has no hardware cursor support).

display not specified, so it is the default.
i.e. gtk or sdl depending on what configure finds.

> But I need to use the framebuffer. So what happens for instance in
> software like ts_calibrate you can not see the cursor

Does -vga virtio work better?

take care,
  Gerd


