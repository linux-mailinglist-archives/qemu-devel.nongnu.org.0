Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2687135AAF2
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 06:57:22 +0200 (CEST)
Received: from localhost ([::1]:38692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV5gP-0003tq-8R
	for lists+qemu-devel@lfdr.de; Sat, 10 Apr 2021 00:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV5fM-0003Ol-5L
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 00:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lV5fK-0006BL-6V
 for qemu-devel@nongnu.org; Sat, 10 Apr 2021 00:56:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618030573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HehfS8YfIcLflDZM9bjP+jUrvDfmQWop4v9u4wYK/dA=;
 b=PpOWa5mbDkM64jetorwvJfz6m9rvrfjSbQRez6Dey9MeVW/yo63Kzl8TccSP7EXt1p8vIt
 PKnprq7jSNTOHF3xuOyrAVjayCenhyoerGlRfmj+YJHgPvFAgMJZ4pp7Wo1ZokwupW014z
 bYhVnGK2/kRvHatgDwlFyeq4J9l+JG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-tgBah-IFNSyWHY4gFS0bBw-1; Sat, 10 Apr 2021 00:56:10 -0400
X-MC-Unique: tgBah-IFNSyWHY4gFS0bBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19E8C1883520;
 Sat, 10 Apr 2021 04:56:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AC675D768;
 Sat, 10 Apr 2021 04:56:06 +0000 (UTC)
Subject: Re: [PATCH 1/2] qdev: Separate implementations of qdev_get_machine()
 for user and system
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210409160339.500167-1-groug@kaod.org>
 <20210409160339.500167-2-groug@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ef62bfb8-0db6-2b00-0407-d3e97a27b636@redhat.com>
Date: Sat, 10 Apr 2021 06:56:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210409160339.500167-2-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/04/2021 18.03, Greg Kurz wrote:
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
> 
> Unexpected error in object_property_try_add() at ../../qom/object.c:1223:
> qemu-system-ppc64: attempt to add duplicate property 'machine' to
>   object (type 'container')
> Aborted (core dumped)
> 
> This situation doesn't exist in the current code base, mostly because
> of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c1564
> and e2fb3fbbf9c for details).
> 
> A new kind of breakage was spotted very recently though :
> 
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> /home/thuth/devel/qemu/include/hw/boards.h:24:
>   MACHINE: Object 0x5635bd53af10 is not an instance of type machine
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
>    object for the user-mode case only ;
> - abort() if the machine doesn't exist yet in the QOM tree for
>    the system-mode case. This gives a precise hint to developpers
>    that calling qdev_get_machine() too early is a programming bug.
> 
> This is achieved with a new do_qdev_get_machine() function called
> from qdev_get_machine(), with different implementations for system
> and user mode.
> 
> $ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
> qemu-system-ppc64: ../../hw/core/machine.c:1290:
>   qdev_get_machine: Assertion `machine != NULL' failed.
> Aborted (core dumped)
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   hw/core/machine.c        | 14 ++++++++++++++
>   hw/core/qdev.c           |  2 +-
>   include/hw/qdev-core.h   |  1 +
>   stubs/meson.build        |  1 +
>   stubs/qdev-get-machine.c | 11 +++++++++++
>   5 files changed, 28 insertions(+), 1 deletion(-)
>   create mode 100644 stubs/qdev-get-machine.c
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 40def78183a7..fecca4023105 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1293,6 +1293,20 @@ void qdev_machine_creation_done(void)
>       register_global_state();
>   }
>   
> +Object *do_qdev_get_machine(void)
> +{
> +    Object *machine;
> +
> +    machine = object_resolve_path_component(object_get_root(), "machine");
> +    /*
> +     * qdev_get_machine() shouldn't be called before qemu_create_machine()
> +     * has created the "/machine" path.
> +     */
> +    assert(machine != NULL);
> +
> +    return machine;
> +}
> +
>   static const TypeInfo machine_info = {
>       .name = TYPE_MACHINE,
>       .parent = TYPE_OBJECT,
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a92..1122721b2bf0 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1131,7 +1131,7 @@ Object *qdev_get_machine(void)
>       static Object *dev;
>   
>       if (dev == NULL) {
> -        dev = container_get(object_get_root(), "/machine");
> +        dev = do_qdev_get_machine();
>       }
>   
>       return dev;
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bafc311bfa1b..90e295e0bc1a 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -782,6 +782,7 @@ const char *qdev_fw_name(DeviceState *dev);
>   
>   void qdev_assert_realized_properly(void);
>   Object *qdev_get_machine(void);
> +Object *do_qdev_get_machine(void);
>   
>   /* FIXME: make this a link<> */
>   bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp);
> diff --git a/stubs/meson.build b/stubs/meson.build
> index be6f6d609e58..b99ee2b33e94 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -54,3 +54,4 @@ if have_system
>   else
>     stub_ss.add(files('qdev.c'))
>   endif
> +stub_ss.add(files('qdev-get-machine.c'))
> diff --git a/stubs/qdev-get-machine.c b/stubs/qdev-get-machine.c
> new file mode 100644
> index 000000000000..ed4cdaa01900
> --- /dev/null
> +++ b/stubs/qdev-get-machine.c
> @@ -0,0 +1,11 @@
> +#include "qemu/osdep.h"
> +#include "hw/qdev-core.h"
> +
> +Object *do_qdev_get_machine(void)
> +{
> +    /*
> +     * This will create a "container" and add it to the QOM tree, if there
> +     * isn't one already.
> +     */
> +    return container_get(object_get_root(), "/machine");
> +}
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

... but I think I agree with Eduardo, we should likely add this only after 
6.0 has been released.


