Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045E9475612
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:18:08 +0100 (CET)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRMM-0001P7-Mp
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:18:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxRLA-0008QQ-Uz
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:16:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mxRL8-0003Zq-Tf
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:16:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639563407;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=uaKiWPhWcVv+1cn4ptwI3rwL2AvzvqyIbQhIBs5MIRY=;
 b=ONOSg9m0tUAtT3UMn3w92mg0Z6L0v4JkYaffAo6sGdboeiMOPDIDRIGOlr/k0WZ5DPuVlt
 i11FdZKPeWPkoG4UvHa51KFigbXvE7loC0MW0waaWUkoYgVA/U9QONjnJQkYhVNUPWqWgx
 227DTkJX+onBMit2Q68Z06kko0UC/jA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-sr1-ViNtNUGYXOnj1XMR2w-1; Wed, 15 Dec 2021 05:16:38 -0500
X-MC-Unique: sr1-ViNtNUGYXOnj1XMR2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05F7A84A619;
 Wed, 15 Dec 2021 10:16:37 +0000 (UTC)
Received: from redhat.com (unknown [10.22.8.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7BFC6E978;
 Wed, 15 Dec 2021 10:16:35 +0000 (UTC)
Date: Wed, 15 Dec 2021 10:16:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Building QEMU as a shared library
Message-ID: <YbnAgMC6sdyoDQID@redhat.com>
References: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
 <CAFEAcA8m0M2+=ZuBAXcRmyGMzjHdjCYWM+_KzFK_eoPdwX-vpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8m0M2+=ZuBAXcRmyGMzjHdjCYWM+_KzFK_eoPdwX-vpA@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 10:10:35AM +0000, Peter Maydell wrote:
> On Wed, 15 Dec 2021 at 08:18, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote:
> > My goal is to simulate a mixed architecture system.
> >
> > Today QEMU strongly assumes that the simulated system is a *single architecture*.
> > Changing this assumption and supporting mixed architecture in QEMU proved to be
> > non-trivial and may require significant development effort. Common code such as
> > TCG and others explicitly include architecture specific header files, for example.
> 
> Yeah. This is definitely something we'd like to fix some day. It's
> the approach I would prefer for getting multi-architecture machines.
> 
> > Instead, I would like to suggest a new approach we use at Neuroblade to achieve this:
> > Build QEMU as a shared library that can be loaded and used directly in a larger simulation.
> > Today we build qemu-system-nios2 shared library and load it from qemu-system-x86_64 in order
> > to simulate an x86_64 system that also consists of multiple nios2 cores.
> > In our simulation, two independent "main" functions are running on different threads, and
> > simulation synchronization is reduced to synchronizing threads.
> 
> I agree with Stefan that you should go ahead and send the code as
> an RFC patchset, but I feel like there is a lot of work required
> to really get the codebase into a state where it is a clean
> shared library...

I expect there could end up being a big difference between

   "clean for use with QEMU CLI config X"

vs

   "clean for use with all possible QEMU CLI configs"


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


