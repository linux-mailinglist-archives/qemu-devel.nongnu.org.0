Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4B54694F1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:23:02 +0100 (CET)
Received: from localhost ([::1]:56806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muC5F-0005gs-AC
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:23:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1muC4I-0004ya-ME
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:22:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1muC47-0006UL-Kp
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 06:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638789707;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ZbqE0bhv7nJe9NPtuiJFNbJMKyLndTX6atJVIebxxEs=;
 b=aMNKqvXrxmUkMYsqNdfVjjorAN5zLppfbecMTZfBCT8qmv+c57ipQCDEqpBqt8h9FHYt3f
 GuvAEmYe8OAux6zVj70AF0baL4dE9vee+hu918YqVcXwN3FK/BPsdqxnqQ3wIGgZM/MsnI
 2bsaKXzhntJry+zk91QkxCBo7Mefmjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-p-L4QX_3Pr6hpU_gnFOoAg-1; Mon, 06 Dec 2021 06:21:44 -0500
X-MC-Unique: p-L4QX_3Pr6hpU_gnFOoAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85D9F10144E1;
 Mon,  6 Dec 2021 11:21:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D7A026A023;
 Mon,  6 Dec 2021 11:21:12 +0000 (UTC)
Date: Mon, 6 Dec 2021 11:21:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH v1 1/1] osdep: asynchronous teardown for shutdown on Linux
Message-ID: <Ya3yJoUh97+B2EYJ@redhat.com>
References: <20211206110611.27283-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20211206110611.27283-1-imbrenda@linux.ibm.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, frankja@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 06, 2021 at 12:06:11PM +0100, Claudio Imbrenda wrote:
> This patch adds support for asynchronously tearing down a VM on Linux.
> 
> When qemu terminates, either naturally or because of a fatal signal,
> the VM is torn down. If the VM is huge, it can take a considerable
> amount of time for it to be cleaned up. In case of a protected VM, it
> might take even longer than a non-protected VM (this is the case on
> s390x, for example).
> 
> Some users might want to shut down a VM and restart it immediately,
> without having to wait. This is especially true if management
> infrastructure like libvirt is used.
> 
> This patch implements a simple trick on Linux to allow qemu to return
> immediately, with the teardown of the VM being performed
> asynchronously.
> 
> If the new commandline option -async-teardown is used, a new process is
> spawned from qemu using the clone syscall, so that it will share its
> address space with qemu.
> 
> The new process will then wait until qemu terminates, and then it will
> exit itself.
> 
> This allows qemu to terminate quickly, without having to wait for the
> whole address space to be torn down. The teardown process will exit
> after qemu, so it will be the last user of the address space, and
> therefore it will take care of the actual teardown.
> 
> The teardown process will share the same cgroups as qemu, so both
> memory usage and cpu time will be accounted properly.

If this suggested workaround has any benefit to the shutdown of a VM
with libvirt, then it is a bug in libvirt IMHO.

When libvirt tears down a QEMU VM, it should be waiting for *every*
process in the VM's cgroup to be terminated before it reports that
the VM is shutoff. IOW, the fact that this workaround lets the main
QEMU process exit quickly should not matter. libvirt should still
be blocked in exactly the same place in its code, waiting for the
"async" cleanup process to exit. IOW, this should not be async at
all from libvirt's POV.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


