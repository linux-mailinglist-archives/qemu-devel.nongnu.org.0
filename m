Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37532600D7C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:14:28 +0200 (CEST)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okO4h-00051B-1F
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okNwQ-0001jn-60
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okNwM-0001NF-9X
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666004744;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=52cZZDekhvrKjA8ZHFNj1ougYaujCQwFC9GRdVBampw=;
 b=K+R/6RqaPA68PXnu6JISJPK1psZgVUIOZJuuqPYKf3oRNrskUlbuAthfKKU8upMuB38RKO
 zwUyoLcW6v8B4kw1+kJqJjRDJnUSOUN2jBVqWKd2vcMn2kzbxCNa8jD9qk1ZULBBkQxiVf
 l91mn8TebfsC/1IVPEpG2qD0rG/HC3g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-DV5vVIJlNjy7NgDfDgWXaQ-1; Mon, 17 Oct 2022 07:05:41 -0400
X-MC-Unique: DV5vVIJlNjy7NgDfDgWXaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E985101E9B9;
 Mon, 17 Oct 2022 11:05:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF3ED207B344;
 Mon, 17 Oct 2022 11:05:20 +0000 (UTC)
Date: Mon, 17 Oct 2022 12:05:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: qemu-devel@nongnu.org, Steve Sistare <steven.sistare@oracle.com>,
 yc-core@yandex-team.ru, Tony Krowiak <akrowiak@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 0/4] Allow to pass pre-created VFIO container/group to QEMU
Message-ID: <Y0027XOMm/lfftGK@redhat.com>
References: <20221017105407.3858-1-arbn@yandex-team.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221017105407.3858-1-arbn@yandex-team.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 17, 2022 at 01:54:03PM +0300, Andrey Ryabinin wrote:
> These patches add possibility to pass VFIO device to QEMU using file
> descriptors of VFIO container/group, instead of creating those by QEMU.
> This allows to take away permissions to open /dev/vfio/* from QEMU and
> delegate that to managment layer like libvirt.
> 
> The VFIO API doen't allow to pass just fd of device, since we also need to have
> VFIO container and group. So these patches allow to pass created VFIO container/group
> to QEMU via command line/QMP, e.g. like this:
>             -object vfio-container,id=ct,fd=5 \
>             -object vfio-group,id=grp,fd=6,container=ct \
>             -device vfio-pci,host=05:00.0,group=grp
> 
> A bit more detailed example can be found in the test:
> tests/avocado/vfio.py
> 
>  *Possible future steps*
> 
> Also these patches could be a step for making local migration (within one host)
> of the QEMU with VFIO devices.
> I've built some prototype on top of these patches to try such idea.
> In short the scheme of such migration is following:
>  - migrate source VM to file.
>  - retrieve fd numbers of VFIO container/group/device via new property and qom-get command
>  - get the actual file descriptor via SCM_RIGHTS using new qmp command 'returnfd' which
>    sends fd from QEMU by the number: { 'command': 'returnfd', 'data': {'fd': 'int'}}
>  - shutdown source VM
>  - launch destination VM, plug VFIO devices using obtained file descriptors.
>  - PCI device reset duriing plugging the device avoided with the help of new parameter
>     on vfio-pci device.

Is there a restriction by VFIO on how many processes can have the FD
open concurrently ? I guess it must be, as with SCM_RIGHTS, both src
QEMU and libvirt will have the FD open concurrently for at least a
short period, as you can't atomically close the FD at the exact same
time as SCM_RIGHTS sends it.

With migration it is *highly* desirable to never stop the source VM's
QEMU until the new QEMU has completed migration and got its vCPUs
running, in order to have best chance of successful rollback upon
failure

So assuming both QEMU's can have the FD open, provided they don't
both concurrently operate on it, could src QEMU just pass the FDs
to the target QEMU as part of the migration stream. eg use a UNIX
socket between the 2 QEMUs, and SCM_RIGHTS to pass the FDs across,
avoiding libvirt needing to be in the middle of the FD passing
dance. Since target QEMU gets the FDs as part of the migration
stream, it would inherantly know that it shold skip device reset
in that flow, without requiring any new param.


> This is alternative to 'cpr-exec' migration scheme proposed here:
>    https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/
> Unlike cpr-exec it doesn't require new kernel flags VFIO_DMA_UNMAP_FLAG_VADDR/VFIO_DMA_MAP_FLAG_VADDR
> And doesn't require new migration mode, just some additional steps from management layer.

Avoiding creating a whole new set of mgmt commands in QMP does
make this appealing as an option instead of cpr-exec. If we can
layer FD passing into the migration stream too, that'd be even
more compelling IMHO.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


