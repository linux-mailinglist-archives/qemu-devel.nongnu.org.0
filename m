Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38103178E70
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Mar 2020 11:31:24 +0100 (CET)
Received: from localhost ([::1]:60442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9RJC-0007yL-Sm
	for lists+qemu-devel@lfdr.de; Wed, 04 Mar 2020 05:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j9RIG-0007WF-Jk
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 05:30:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j9RIE-0001N4-Nl
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 05:30:23 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60310
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j9RIE-0001M1-JD
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 05:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583317821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PkiWkl9zdfaymB9Avb4mziDqZzp8wZxXmGXJHmt8OLA=;
 b=bq8FE44GYVXMHT4vARfWA/eH+qMfX9dQWPWIcRLaYzoEHPN2zMXMgV1Krx9rXuFHyheFva
 EGHwUA9wVf6QTA/nom0BfAuQMilK0DanSn98/52Av8gKJjlwGrNX59vtWmgk/b0fC1Xdh4
 sCvBDrRhaBhgsBXizR/1TLf+TSUNlyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-7snCtD7PMIuE3cY1RToNRQ-1; Wed, 04 Mar 2020 05:30:19 -0500
X-MC-Unique: 7snCtD7PMIuE3cY1RToNRQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C9DB13F5;
 Wed,  4 Mar 2020 10:30:17 +0000 (UTC)
Received: from work-vm (ovpn-116-225.ams2.redhat.com [10.36.116.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F32028F34E;
 Wed,  4 Mar 2020 10:30:01 +0000 (UTC)
Date: Wed, 4 Mar 2020 10:29:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 12/50] multi-process: remote process initialization
Message-ID: <20200304102959.GB4104@work-vm>
References: <cover.1582576372.git.jag.raman@oracle.com>
 <264de034fcdc1000bada4a93ac7e0856fef591f2.1582576372.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <264de034fcdc1000bada4a93ac7e0856fef591f2.1582576372.git.jag.raman@oracle.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, liran.alon@oracle.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, rth@twiddle.net,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jagannathan Raman (jag.raman@oracle.com) wrote:
> Adds the handler to process message from QEMU,
> Initialize remote process main loop, handles SYNC_SYSMEM
> message by updating its "system_memory" container using
> shared file descriptors received from QEMU.
>=20
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  v4 -> v5:
>   - We checked if we could use functions already defined in
>     util/main-loop.c instead of using g_main_loop_run. However,
>     we couldn't find a suitable function that's generic enough
>     to do this. All of them have emulator code embedded in them
>     which is not used by the remote process. We are therefore
>     not making any change to this patch
>=20
>  remote/remote-main.c | 85 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 85 insertions(+)
>=20
> diff --git a/remote/remote-main.c b/remote/remote-main.c
> index ecf30e0..56315cd 100644
> --- a/remote/remote-main.c
> +++ b/remote/remote-main.c
> @@ -12,6 +12,7 @@
>  #include "qemu-common.h"
> =20
>  #include <stdio.h>
> +#include <unistd.h>
> =20
>  #include "qemu/module.h"
>  #include "remote/pcihost.h"
> @@ -19,12 +20,96 @@
>  #include "hw/boards.h"
>  #include "hw/qdev-core.h"
>  #include "qemu/main-loop.h"
> +#include "remote/memory.h"
> +#include "io/mpqemu-link.h"
> +#include "qapi/error.h"
> +#include "qemu/main-loop.h"
> +#include "sysemu/cpus.h"
> +#include "qemu-common.h"
> +#include "hw/pci/pci.h"
> +#include "qemu/thread.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/config-file.h"
> +#include "sysemu/sysemu.h"
> +#include "block/block.h"
> +#include "exec/ramlist.h"
> +
> +static MPQemuLinkState *mpqemu_link;
> +PCIDevice *remote_pci_dev;
> +
> +static void process_msg(GIOCondition cond, MPQemuChannel *chan)
> +{
> +    MPQemuMsg *msg =3D NULL;
> +    Error *err =3D NULL;
> +
> +    if ((cond & G_IO_HUP) || (cond & G_IO_ERR)) {
> +        goto finalize_loop;
> +    }
> +
> +    msg =3D g_malloc0(sizeof(MPQemuMsg));
> +
> +    if (mpqemu_msg_recv(msg, chan) < 0) {
> +        error_setg(&err, "Failed to receive message");

Please give error messages more context, e.g. the device or process name
or something like that so that; it helps when we get a user
reporting a crash and they report 'Unknown command' in their log, but
then we have to figure out where to point them.

> +        goto finalize_loop;
> +    }
> +
> +    switch (msg->cmd) {
> +    case INIT:
> +        break;
> +    case PCI_CONFIG_WRITE:
> +        break;
> +    case PCI_CONFIG_READ:
> +        break;
> +    default:
> +        error_setg(&err, "Unknown command");
> +        goto finalize_loop;
> +    }
> +
> +    g_free(msg->data2);
> +    g_free(msg);
> +
> +    return;
> +
> +finalize_loop:
> +    if (err) {
> +        error_report_err(err);
> +    }
> +    g_free(msg);
> +    mpqemu_link_finalize(mpqemu_link);
> +    mpqemu_link =3D NULL;
> +}
> =20
>  int main(int argc, char *argv[])
>  {
> +    Error *err =3D NULL;
> +
>      module_call_init(MODULE_INIT_QOM);
> =20
> +    bdrv_init_with_whitelist();
> +
> +    if (qemu_init_main_loop(&err)) {
> +        error_report_err(err);
> +        return -EBUSY;
> +    }
> +
> +    qemu_init_cpu_loop();
> +
> +    page_size_init();
> +
> +    qemu_mutex_init(&ram_list.mutex);
> +

So these are some subset of the things from qemu_init; I guess
we'll have to be careful when we add stuff to vl.c to think what should
also be added here.

Dave

>      current_machine =3D MACHINE(REMOTE_MACHINE(object_new(TYPE_REMOTE_MA=
CHINE)));
> =20
> +    mpqemu_link =3D mpqemu_link_create();
> +    if (!mpqemu_link) {
> +        printf("Could not create MPQemu link\n");
> +        return -1;
> +    }
> +
> +    mpqemu_init_channel(mpqemu_link, &mpqemu_link->com, STDIN_FILENO);
> +    mpqemu_link_set_callback(mpqemu_link, process_msg);
> +
> +    mpqemu_start_coms(mpqemu_link);
> +
>      return 0;
>  }
> --=20
> 1.8.3.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


