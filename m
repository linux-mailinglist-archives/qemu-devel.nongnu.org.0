Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B735AC17
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 11:01:42 +0200 (CEST)
Received: from localhost ([::1]:34708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV9Ur-0001R6-2J
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 05:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lV9TL-0000kP-VE
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 05:00:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lV9Sn-0002ly-Rl
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 05:00:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618045172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9RzP5WLLU7airNLllaymvy1+faXCz2XyNQlMpU3MchY=;
 b=M2r+174g5dlL1JWNsYSDeiTgIEOaDS36ecnZaLHDG5bVrWTfxE17vZbsMcV58bGvEynVj9
 dlBsoZ3Pkw1KDKJmkzPrtTtVBQTTDn18QJtBpH+4aFNq1wuFeMH1YHEFlw3hGE4gPexAm9
 HWIjwHD6L3jaD2z94tM6zhVYZvq9nn0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-0FzNzla2O_K0NNN97iHVHA-1; Sat, 10 Apr 2021 04:59:29 -0400
X-MC-Unique: 0FzNzla2O_K0NNN97iHVHA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F380C107ACC7;
 Sat, 10 Apr 2021 08:59:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8150E60BE5;
 Sat, 10 Apr 2021 08:59:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0166A113525D; Sat, 10 Apr 2021 10:59:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/2] qdev: Separate implementations of
 qdev_get_machine() for user and system
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
Date: Sat, 10 Apr 2021 10:59:25 +0200
In-Reply-To: <20210409160339.500167-2-groug@kaod.org> (Greg Kurz's message of
 "Fri, 9 Apr 2021 18:03:38 +0200")
Message-ID: <87zgy6cy6q.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Greg Kurz <groug@kaod.org> writes:

> Despite its simple name and common usage of "getting a pointer to
> the machine" in system-mode emulation, qdev_get_machine() has some
> subtilities.
>
> First, it can be called when running user-mode emulation : this is
> because user-mode partly relies on qdev to instantiate its CPU
> model.
>
> Second, but not least, it has a side-effect : if it cannot find an
> object at "/machine" in the QOM tree, it creates a dummy "container"
> object and put it there. A simple check on the type returned by
> qdev_get_machine() allows user-mode to run the common qdev code,
> skipping the parts that only make sense for system-mode.
>
> This side-effect turns out to complicate the use of qdev_get_machine()
> for the system-mode case though. Most notably, qdev_get_machine() must
> not be called before the machine object is added to the QOM tree by
> qemu_create_machine(), otherwise the existing dummy "container" object
> would cause qemu_create_machine() to fail with something like :

Stupid trap.

> Unexpected error in object_property_try_add() at ../../qom/object.c:1223:
> qemu-system-ppc64: attempt to add duplicate property 'machine' to
>  object (type 'container')
> Aborted (core dumped)
>
> This situation doesn't exist in the current code base, mostly because
> of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c1564
> and e2fb3fbbf9c for details).

I lacked the stamina to address the root problem: automatic creation of
dummy containers where real ones may be needed.

Is /machine the only such container?  Have you reviewed the other uses
of container_get()?

> A new kind of breakage was spotted very recently though :
>
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> /home/thuth/devel/qemu/include/hw/boards.h:24:
>  MACHINE: Object 0x5635bd53af10 is not an instance of type machine
> Aborted (core dumped)
>
> This comes from the change 3df261b6676b in QEMU 5.0. It unwillingly
> added a new condition for qdev_get_machine() to be called too early,
> breaking MACHINE(qdev_get_machine()) in generic cpu-core code this
> time.
>
> In order to avoid further subtle breakages like this, change the
> implentation of qdev_get_machine() to:
> - keep the existing behaviour of creating the dummy "container"
>   object for the user-mode case only ;
> - abort() if the machine doesn't exist yet in the QOM tree for
>   the system-mode case. This gives a precise hint to developpers
>   that calling qdev_get_machine() too early is a programming bug.

In other words, we fail right away instead of planting a landmine for
later.  Good.

The alternative would be mandating "must create /machine before first
use" for all programs, not just qemu-system-FOO, but that might be more
invasive.  Not sure.

> This is achieved with a new do_qdev_get_machine() function called

container_get() is a suboptimal name for a function that creates
containers, qdev_get_machine() is a suboptimal name for a function that
creates /machine, and so is do_qdev_get_machine().  Observation, not
demand.

> from qdev_get_machine(), with different implementations for system
> and user mode.
>
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> qemu-system-ppc64: ../../hw/core/machine.c:1290:
>  qdev_get_machine: Assertion `machine != NULL' failed.
> Aborted (core dumped)
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>


