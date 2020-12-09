Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5362D46B6
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 17:27:46 +0100 (CET)
Received: from localhost ([::1]:37362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2Jd-0005SO-66
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 11:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kn2D9-0000wB-Hz
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:21:03 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:39600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kn2D6-0003An-AR
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 11:21:03 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9G9vFM099077;
 Wed, 9 Dec 2020 16:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to;
 s=corp-2020-01-29; bh=qimwv7XR8dnQ0l8ZTHZH9btFqb6MJ/ERQNa3X9cMZ18=;
 b=FHGOw0QOeRe9pHC13ojx6k1C8Gal2C/8jttn21+6RgnrMQGI8HAZLIBHmg07pcvfdRMO
 5OY4gO1tk1Q8552gfV5BZY9xrS51STADdQG9/YgG6l6NQRXRCJ8Rkz7rbAmu8Zf0xo3w
 j+xxTep0NrtCzBEfVr3lSr2/7yM6qrkd023lSABywcJjXs8/6oCqrJZX2CbkUU2KwReo
 6CzKM49/lzxc0uprcq39EQbh3aQpkU2N4mabwFeQWa4y5H+MttgcWOKoWI5VPtI6ucq9
 aZyFGoHd4zxNQMkPzP+hc6C9m9M0qrSqPvwy59PVxr6iogR+F71pSafovIMR8tRUh/x5 ww== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 3581mr0xwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 16:20:45 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9GApU1067617;
 Wed, 9 Dec 2020 16:18:44 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 358ksqavwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 16:18:44 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B9GIgRI016059;
 Wed, 9 Dec 2020 16:18:42 GMT
Received: from [192.168.0.3] (/24.147.50.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 08:18:42 -0800
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v12 16/19] multi-process: Synchronize remote memory
From: Jag Raman <jag.raman@oracle.com>
In-Reply-To: <CAJ+F1C+oNxe3M1xg8LQJM-sBS4pPYyeYZ3j6wQzRs+pLbp3c+A@mail.gmail.com>
Date: Wed, 9 Dec 2020 11:18:39 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <DC9181AF-A1D6-487E-A594-2870E528359A@oracle.com>
References: <cover.1606853298.git.jag.raman@oracle.com>
 <de6b80ac6978fa217588f6e57bb09c28269433f5.1606853298.git.jag.raman@oracle.com>
 <CAJ+F1C+oNxe3M1xg8LQJM-sBS4pPYyeYZ3j6wQzRs+pLbp3c+A@mail.gmail.com>
To: =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=2
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090113
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Dec 8, 2020, at 8:57 AM, Marc-Andr=C3=A9 Lureau =
<marcandre.lureau@gmail.com> wrote:
>=20
> Hi
>=20
> On Wed, Dec 2, 2020 at 12:23 AM Jagannathan Raman =
<jag.raman@oracle.com> wrote:
> Add memory-listener object which is used to keep the view of the RAM
> in sync between QEMU and remote process.
> A MemoryListener is registered for system-memory AddressSpace. The
> listener sends SYNC_SYSMEM message to the remote process when memory
> listener commits the changes to memory, the remote process receives
> the message and processes it in the handler for SYNC_SYSMEM message.
>=20
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/remote/memory-sync.h |  27 ++++++
>  include/hw/remote/proxy.h       |   2 +
>  hw/remote/memory-sync.c         | 210 =
++++++++++++++++++++++++++++++++++++++++
>  hw/remote/message.c             |   5 +
>  hw/remote/proxy.c               |   6 ++
>  MAINTAINERS                     |   2 +
>  hw/remote/meson.build           |   1 +
>  7 files changed, 253 insertions(+)
>  create mode 100644 include/hw/remote/memory-sync.h
>  create mode 100644 hw/remote/memory-sync.c
>=20
> diff --git a/include/hw/remote/memory-sync.h =
b/include/hw/remote/memory-sync.h
> new file mode 100644
> index 0000000..785f76a
> --- /dev/null
> +++ b/include/hw/remote/memory-sync.h
> @@ -0,0 +1,27 @@
> +/*
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef MEMORY_SYNC_H
> +#define MEMORY_SYNC_H
> +
> +#include "exec/memory.h"
> +#include "io/channel.h"
> +
> +typedef struct RemoteMemSync {
> +    MemoryListener listener;
> +
> +    int n_mr_sections;
> +    MemoryRegionSection *mr_sections;
> +
> +    QIOChannel *ioc;
> +} RemoteMemSync;
> +
> +void configure_memory_sync(RemoteMemSync *sync, QIOChannel *ioc);
> +void deconfigure_memory_sync(RemoteMemSync *sync);
>=20
> RemoteMemSync vs MemorySync, and function with _memory_sync =
suffixes...
> Naming things is hard, but trying to be consistent generally helps.
>=20
> My understanding is that this is a proxy-dev helper to handle memory =
listening and sending SYNC_SYSMEM.
>=20
> I would thus suggest naming it ProxyMemoryListener. It could =
eventually be folded in proxy.c
>=20
> Please try to be consistent with header naming, structure naming, =
type, functions and enum prefixes etc.
>=20
> proxy_memory_listener isn't that long imho.
>=20
> +
> +#endif
> diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
> index e29c61b..a687b7d 100644
> --- a/include/hw/remote/proxy.h
> +++ b/include/hw/remote/proxy.h
> @@ -11,6 +11,7 @@
>=20
>  #include "hw/pci/pci.h"
>  #include "io/channel.h"
> +#include "hw/remote/memory-sync.h"
>=20
>  #define TYPE_PCI_PROXY_DEV "x-pci-proxy-dev"
>=20
> @@ -40,6 +41,7 @@ struct PCIProxyDev {
>      QemuMutex io_mutex;
>      QIOChannel *ioc;
>      Error *migration_blocker;
> +    RemoteMemSync sync;
>      ProxyMemoryRegion region[PCI_NUM_REGIONS];
>  };
>=20
> diff --git a/hw/remote/memory-sync.c b/hw/remote/memory-sync.c
> new file mode 100644
> index 0000000..2365e69
> --- /dev/null
> +++ b/hw/remote/memory-sync.c
> @@ -0,0 +1,210 @@
> +/*
> + * Copyright =C2=A9 2018, 2020 Oracle and/or its affiliates.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "qemu/compiler.h"
> +#include "qemu/int128.h"
> +#include "qemu/range.h"
> +#include "exec/memory.h"
> +#include "exec/cpu-common.h"
> +#include "cpu.h"
> +#include "exec/ram_addr.h"
> +#include "exec/address-spaces.h"
> +#include "hw/remote/mpqemu-link.h"
> +#include "hw/remote/memory-sync.h"
> +
> +static void proxy_ml_begin(MemoryListener *listener)
>=20
> I suggest to rename begin -> reset=20
>=20
> +{
> +    RemoteMemSync *sync =3D container_of(listener, RemoteMemSync, =
listener);
> +    int mrs;
> +
> +    for (mrs =3D 0; mrs < sync->n_mr_sections; mrs++) {
> +        memory_region_unref(sync->mr_sections[mrs].mr);
> +    }
> +
> +    g_free(sync->mr_sections);
> +    sync->mr_sections =3D NULL;
> +    sync->n_mr_sections =3D 0;
> +}
> +
> +static int get_fd_from_hostaddr(uint64_t host, ram_addr_t *offset)
>=20
> This function is very similar to vhost_user_get_mr_data(). That =
suggests we could factor the code.
>=20
> Perhaps a new memory_region_from_host_full(), or extend =
memory_region_from_host() with an extra optional "int *fd" argument.
> =20
> +{
> +    MemoryRegion *mr;
> +    ram_addr_t off;
> +
> +    /**
> +     * Assumes that the host address is a valid address as it's
> +     * coming from the MemoryListener system. In the case host
> +     * address is not valid, the following call would return
> +     * the default subregion of "system_memory" region, and
> +     * not NULL. So it's not possible to check for NULL here.
> +     */
> +    mr =3D memory_region_from_host((void *)(uintptr_t)host, &off);
> +
> +    if (offset) {
> +        *offset =3D off;
> +    }
> +
> +    return memory_region_get_fd(mr);
> +}
> +
> +static bool proxy_mrs_can_merge(uint64_t host, uint64_t prev_host, =
size_t size)
> +{
>=20
> This seems similar to vhost_user_can_merge().=20
>=20
> +    bool merge;
> +    int fd1, fd2;
> +
> +    fd1 =3D get_fd_from_hostaddr(host, NULL);
> +
> +    fd2 =3D get_fd_from_hostaddr(prev_host, NULL);
> +
> +    merge =3D (fd1 =3D=3D fd2);
>=20
> This could be written in a simpler manner, ex:
>=20
> if (get_fd_from_hostaddr(host, NULL) !=3D =
get_fd_from_hostaddr(prev_host, NULL))
>   return false
>=20
> +
> +    merge &=3D ((prev_host + size) =3D=3D host);
>=20
> That check could be done early on before doing the more expensive =
memory_region_from_host() calls
>=20
> +
> +    return merge;
> +}
> +
> +static bool try_merge(RemoteMemSync *sync, MemoryRegionSection =
*section)
> +{
> +    uint64_t mrs_size, mrs_gpa, mrs_page;
> +    MemoryRegionSection *prev_sec;
> +    bool merged =3D false;
> +    uintptr_t mrs_host;
> +    RAMBlock *mrs_rb;
> +
> +    if (!sync->n_mr_sections) {
> +        return false;
> +    }
> +
> +    mrs_rb =3D section->mr->ram_block;
> +    mrs_page =3D (uint64_t)qemu_ram_pagesize(mrs_rb);
> +    mrs_size =3D int128_get64(section->size);
> +    mrs_gpa =3D section->offset_within_address_space;
> +    mrs_host =3D (uintptr_t)memory_region_get_ram_ptr(section->mr) +
> +               section->offset_within_region;
> +
> +    if (get_fd_from_hostaddr(mrs_host, NULL) < 0) {
> +        return true;
> +    }
> +
> +    mrs_host =3D mrs_host & ~(mrs_page - 1);
> +    mrs_gpa =3D mrs_gpa & ~(mrs_page - 1);
> +    mrs_size =3D ROUND_UP(mrs_size, mrs_page);
> +
> +    prev_sec =3D sync->mr_sections + (sync->n_mr_sections - 1);
> +    uint64_t prev_gpa_start =3D =
prev_sec->offset_within_address_space;
> +    uint64_t prev_size =3D int128_get64(prev_sec->size);
> +    uint64_t prev_gpa_end   =3D range_get_last(prev_gpa_start, =
prev_size);
> +    uint64_t prev_host_start =3D
> +        (uintptr_t)memory_region_get_ram_ptr(prev_sec->mr) +
> +        prev_sec->offset_within_region;
> +    uint64_t prev_host_end =3D range_get_last(prev_host_start, =
prev_size);
> +
> +    if (mrs_gpa <=3D (prev_gpa_end + 1)) {
> +        g_assert(mrs_gpa > prev_gpa_start);
> +
> +        if ((section->mr =3D=3D prev_sec->mr) &&
> +            proxy_mrs_can_merge(mrs_host, prev_host_start,
> +                                (mrs_gpa - prev_gpa_start))) {
> +            uint64_t max_end =3D MAX(prev_host_end, mrs_host + =
mrs_size);
> +            merged =3D true;
> +            prev_sec->offset_within_address_space =3D
> +                MIN(prev_gpa_start, mrs_gpa);
> +            prev_sec->offset_within_region =3D
> +                MIN(prev_host_start, mrs_host) -
> +                (uintptr_t)memory_region_get_ram_ptr(prev_sec->mr);
> +            prev_sec->size =3D int128_make64(max_end - =
MIN(prev_host_start,
> +                                                         mrs_host));
> +        }
> +    }
> +
> +    return merged;
> +}
> +
> +static void proxy_ml_region_addnop(MemoryListener *listener,
> +                                   MemoryRegionSection *section)
> +{
> +    RemoteMemSync *sync =3D container_of(listener, RemoteMemSync, =
listener);
> +
> +    if (!(memory_region_is_ram(section->mr) &&
> +          !memory_region_is_rom(section->mr))) {
> +        return;
>=20
> A bit clearer in vhost.c:
> if (memory_region_is_ram(mr) && !memory_region_is_rom(mr)) {
> =20
> +    }
> +
> +    if (try_merge(sync, section)) {
> +        return;
> +    }
> +
> +    ++sync->n_mr_sections;
> +    sync->mr_sections =3D g_renew(MemoryRegionSection, =
sync->mr_sections,
> +                                sync->n_mr_sections);
> +    sync->mr_sections[sync->n_mr_sections - 1] =3D *section;
> +    sync->mr_sections[sync->n_mr_sections - 1].fv =3D NULL;
> +    memory_region_ref(section->mr);
> +}
> +
> +static void proxy_ml_commit(MemoryListener *listener)
> +{
> +    RemoteMemSync *sync =3D container_of(listener, RemoteMemSync, =
listener);
> +    MPQemuMsg msg;
> +    MemoryRegionSection *section;
> +    ram_addr_t offset;
> +    uintptr_t host_addr;
> +    int region;
> +    Error *local_err =3D NULL;
> +
> +    memset(&msg, 0, sizeof(MPQemuMsg));
> +
> +    msg.cmd =3D SYNC_SYSMEM;
> +    msg.num_fds =3D sync->n_mr_sections;
> +    msg.size =3D sizeof(SyncSysmemMsg);
> +    if (msg.num_fds > REMOTE_MAX_FDS) {
> +        error_report("Number of fds is more than %d", =
REMOTE_MAX_FDS);
> +        return;
> +    }
> +
> +    for (region =3D 0; region < sync->n_mr_sections; region++) {
> +        section =3D &sync->mr_sections[region];
> +        msg.data.sync_sysmem.gpas[region] =3D
> +            section->offset_within_address_space;
> +        msg.data.sync_sysmem.sizes[region] =3D =
int128_get64(section->size);
> +        host_addr =3D =
(uintptr_t)memory_region_get_ram_ptr(section->mr) +
> +                    section->offset_within_region;
> +        msg.fds[region] =3D get_fd_from_hostaddr(host_addr, &offset);
> +        msg.data.sync_sysmem.offsets[region] =3D offset;
> +    }
> +    mpqemu_msg_send(&msg, sync->ioc, &local_err);
> +    if (local_err) {
> +        error_report("Error in sending command %d", msg.cmd);
> +    }
> +}
>=20
> That whole complex code above duplicates much of the logic in vhost.c. =
Can we try to factorize it instead?

Hi Marc-Andre,

Thank you for sharing your feedback!

Would it be alright if we addressed this item alone in a separate patch =
in the future? Since
this refactoring affects vhost code, we=E2=80=99re wondering it would be =
better to address it in a
future patch to help with any regression analysis in the future.

Thank you!
=E2=80=94
Jag

>=20
> +
> +void deconfigure_memory_sync(RemoteMemSync *sync)
> +{
> +    memory_listener_unregister(&sync->listener);
> +
> +    proxy_ml_begin(&sync->listener);
> +}
> +
> +void configure_memory_sync(RemoteMemSync *sync, QIOChannel *ioc)
> +{
> +    sync->n_mr_sections =3D 0;
> +    sync->mr_sections =3D NULL;
> +
> +    sync->ioc =3D ioc;
> +
> +    sync->listener.begin =3D proxy_ml_begin;
> +    sync->listener.commit =3D proxy_ml_commit;
> +    sync->listener.region_add =3D proxy_ml_region_addnop;
> +    sync->listener.region_nop =3D proxy_ml_region_addnop;
> +    sync->listener.priority =3D 10;
> +
> +    memory_listener_register(&sync->listener, &address_space_memory);
> +}
> diff --git a/hw/remote/message.c b/hw/remote/message.c
> index 0f3e38a..454fd2d 100644
> --- a/hw/remote/message.c
> +++ b/hw/remote/message.c
> @@ -17,6 +17,7 @@
>  #include "sysemu/runstate.h"
>  #include "hw/pci/pci.h"
>  #include "exec/memattrs.h"
> +#include "hw/remote/memory.h"
>=20
>  static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
>                                   MPQemuMsg *msg);
> @@ -64,6 +65,10 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void =
*data)
>          case BAR_READ:
>              process_bar_read(com->ioc, &msg, &local_err);
>              break;
> +        case SYNC_SYSMEM:
> +            remote_sysmem_reconfig(&msg, &local_err);
> +            break;
> +
>          default:
>              error_setg(&local_err,
>                         "Unknown command (%d) received for device %s =
(pid=3D%d)",
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index 039347d..0f2d1aa 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -18,6 +18,8 @@
>  #include "migration/blocker.h"
>  #include "hw/remote/mpqemu-link.h"
>  #include "qemu/error-report.h"
> +#include "hw/remote/memory-sync.h"
> +#include "qom/object.h"
>=20
>  static void proxy_set_socket(PCIProxyDev *pdev, int fd, Error **errp)
>  {
> @@ -58,6 +60,8 @@ static void pci_proxy_dev_realize(PCIDevice *device, =
Error **errp)
>=20
>      qemu_mutex_init(&dev->io_mutex);
>      qio_channel_set_blocking(dev->ioc, true, NULL);
> +
> +    configure_memory_sync(&dev->sync, dev->ioc);
>  }
>=20
>  static void pci_proxy_dev_exit(PCIDevice *pdev)
> @@ -69,6 +73,8 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
>      migrate_del_blocker(dev->migration_blocker);
>=20
>      error_free(dev->migration_blocker);
> +
> +    deconfigure_memory_sync(&dev->sync);
>  }
>=20
>  static int config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t =
*val,
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ebd1d1d..5d78b78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3150,6 +3150,8 @@ F: include/hw/remote/memory.h
>  F: hw/remote/memory.c
>  F: hw/remote/proxy.c
>  F: include/hw/remote/proxy.h
> +F: hw/remote/memory-sync.c
> +F: include/hw/remote/memory-sync.h
>=20
>  Build and test automation
>  -------------------------
> diff --git a/hw/remote/meson.build b/hw/remote/meson.build
> index 569cd20..7d434a5 100644
> --- a/hw/remote/meson.build
> +++ b/hw/remote/meson.build
> @@ -7,5 +7,6 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: =
files('remote-obj.c'))
>  remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
>=20
>  specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: =
files('memory.c'))
> +specific_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: =
files('memory-sync.c'))
>=20
>  softmmu_ss.add_all(when: 'CONFIG_MULTIPROCESS', if_true: remote_ss)
> --=20
> 1.8.3.1
>=20
>=20
>=20
> --=20
> Marc-Andr=C3=A9 Lureau


