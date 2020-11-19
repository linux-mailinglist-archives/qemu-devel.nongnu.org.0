Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2482B8DF2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 09:53:53 +0100 (CET)
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kffhQ-00053t-9U
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 03:53:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kffeJ-0002sh-CW
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:50:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kffeF-00044G-Fd
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605775834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nSOkSaaObmll1x4yLCAoN4DjP9gylznzABYsG5hG9b0=;
 b=DD5mDRKPuNo5+Pc7NkCa7jBMjmVDzF8wZa5yyLt3kZwENeCu+Wt2WUmznTmqBMBnRbz1zP
 /rX86UvCBhtQZ4XpKf8XjP9aj6J8UVWijO740jcDHYBiQ7QBflUy6qwipuDKBVwgwNS3v1
 oepkP4IZEYhpXucArGuO28F6e0OAHe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-moH7za-qP6uZ5xboo0AB-Q-1; Thu, 19 Nov 2020 03:50:32 -0500
X-MC-Unique: moH7za-qP6uZ5xboo0AB-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FDC06D585;
 Thu, 19 Nov 2020 08:50:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A429A2C24D;
 Thu, 19 Nov 2020 08:50:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B2E2011358BA; Thu, 19 Nov 2020 09:50:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 7/7] qapi: More complex uses of QAPI_LIST_APPEND
References: <20201113011340.463563-1-eblake@redhat.com>
 <20201113011340.463563-8-eblake@redhat.com>
Date: Thu, 19 Nov 2020 09:50:19 +0100
In-Reply-To: <20201113011340.463563-8-eblake@redhat.com> (Eric Blake's message
 of "Thu, 12 Nov 2020 19:13:40 -0600")
Message-ID: <871rgpg27o.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open
 list:GLUSTER" <integration@gluster.org>, Eduardo Habkost <ehabkost@redhat.com>,
 "open list:GLUSTER" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org, armbru@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> These cases require a bit more thought to review; in each case, the
> code was appending to a list, but not with a FOOList **tail variable.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  block/gluster.c            |  13 +---
>  block/qapi.c               |  14 +----
>  dump/dump.c                |  22 ++-----
>  hw/core/machine-qmp-cmds.c | 125 +++++++++++++++----------------------
>  hw/mem/memory-device.c     |  12 +---
>  hw/pci/pci.c               |  60 ++++++------------
>  migration/migration.c      |  20 ++----
>  monitor/hmp-cmds.c         |  23 +++----
>  net/net.c                  |  13 +---
>  qga/commands-posix.c       | 101 +++++++++++-------------------
>  qga/commands-win32.c       |  88 +++++++++-----------------
>  softmmu/tpm.c              |  38 ++---------
>  ui/spice-core.c            |  27 +++-----
>  13 files changed, 180 insertions(+), 376 deletions(-)
>
> diff --git a/block/gluster.c b/block/gluster.c
> index 1f8699b93835..4963642d6e6b 100644
> --- a/block/gluster.c
> +++ b/block/gluster.c
> @@ -514,7 +514,7 @@ static int qemu_gluster_parse_json(BlockdevOptionsGluster *gconf,
>  {
>      QemuOpts *opts;
>      SocketAddress *gsconf = NULL;
> -    SocketAddressList *curr = NULL;
> +    SocketAddressList **curr;

Looks like "a FOOList **tail variable" to me.  Hmm, unlike the ones in
PATCH 6, its initializer is garbage, and ...

>      QDict *backing_options = NULL;
>      Error *local_err = NULL;
>      char *str = NULL;
> @@ -547,6 +547,7 @@ static int qemu_gluster_parse_json(BlockdevOptionsGluster *gconf,
>      }
>      gconf->path = g_strdup(ptr);
>      qemu_opts_del(opts);
> +    curr = &gconf->server;
>
>      for (i = 0; i < num_servers; i++) {
>          str = g_strdup_printf(GLUSTER_OPT_SERVER_PATTERN"%d.", i);
> @@ -655,15 +656,7 @@ static int qemu_gluster_parse_json(BlockdevOptionsGluster *gconf,
>              qemu_opts_del(opts);
>          }
>
> -        if (gconf->server == NULL) {
> -            gconf->server = g_new0(SocketAddressList, 1);
> -            gconf->server->value = gsconf;
> -            curr = gconf->server;
> -        } else {
> -            curr->next = g_new0(SocketAddressList, 1);
> -            curr->next->value = gsconf;
> -            curr = curr->next;
> -        }
> +        QAPI_LIST_APPEND(curr, gsconf);

... it is used only from the second list element on.  Okay, I see why
this is not in PATCH 6.

>          gsconf = NULL;
>
>          qobject_unref(backing_options);
[...]
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index ca39d15d93a2..711814be2312 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
[...]
> @@ -294,41 +281,31 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
>  static int query_memdev(Object *obj, void *opaque)
>  {
>      MemdevList **list = opaque;
> -    MemdevList *m = NULL;
> +    Memdev *m;
>      QObject *host_nodes;
>      Visitor *v;
>
>      if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND)) {
>          m = g_malloc0(sizeof(*m));
>
> -        m->value = g_malloc0(sizeof(*m->value));
> +        m->id = g_strdup(object_get_canonical_path_component(obj));
> +        m->has_id = !!m->id;
>
> -        m->value->id = g_strdup(object_get_canonical_path_component(obj));
> -        m->value->has_id = !!m->value->id;
> -
> -        m->value->size = object_property_get_uint(obj, "size",
> -                                                  &error_abort);
> -        m->value->merge = object_property_get_bool(obj, "merge",
> -                                                   &error_abort);
> -        m->value->dump = object_property_get_bool(obj, "dump",
> -                                                  &error_abort);
> -        m->value->prealloc = object_property_get_bool(obj,
> -                                                      "prealloc",
> -                                                      &error_abort);
> -        m->value->policy = object_property_get_enum(obj,
> -                                                    "policy",
> -                                                    "HostMemPolicy",
> -                                                    &error_abort);
> +        m->size = object_property_get_uint(obj, "size", &error_abort);
> +        m->merge = object_property_get_bool(obj, "merge", &error_abort);
> +        m->dump = object_property_get_bool(obj, "dump", &error_abort);
> +        m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
> +        m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
> +                                             &error_abort);
>          host_nodes = object_property_get_qobject(obj,
>                                                   "host-nodes",
>                                                   &error_abort);
>          v = qobject_input_visitor_new(host_nodes);
> -        visit_type_uint16List(v, NULL, &m->value->host_nodes, &error_abort);
> +        visit_type_uint16List(v, NULL, &m->host_nodes, &error_abort);
>          visit_free(v);
>          qobject_unref(host_nodes);
>
> -        m->next = *list;
> -        *list = m;
> +        QAPI_LIST_APPEND(list, m);

The old code prepends, doesn't it?

>      }
>
>      return 0;
> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
> index cf0627fd01c1..1afcc29a0649 100644
> --- a/hw/mem/memory-device.c
> +++ b/hw/mem/memory-device.c
> @@ -199,7 +199,7 @@ out:
>  MemoryDeviceInfoList *qmp_memory_device_list(void)
>  {
>      GSList *devices = NULL, *item;
> -    MemoryDeviceInfoList *list = NULL, *prev = NULL;
> +    MemoryDeviceInfoList *list = NULL, **prev = &list;

Here, you reuse the old name for the new variable.

>
>      object_child_foreach(qdev_get_machine(), memory_device_build_list,
>                           &devices);
> @@ -207,19 +207,11 @@ MemoryDeviceInfoList *qmp_memory_device_list(void)
>      for (item = devices; item; item = g_slist_next(item)) {
>          const MemoryDeviceState *md = MEMORY_DEVICE(item->data);
>          const MemoryDeviceClass *mdc = MEMORY_DEVICE_GET_CLASS(item->data);
> -        MemoryDeviceInfoList *elem = g_new0(MemoryDeviceInfoList, 1);
>          MemoryDeviceInfo *info = g_new0(MemoryDeviceInfo, 1);
>
>          mdc->fill_device_info(md, info);
>
> -        elem->value = info;
> -        elem->next = NULL;
> -        if (prev) {
> -            prev->next = elem;
> -        } else {
> -            list = elem;
> -        }
> -        prev = elem;
> +        QAPI_LIST_APPEND(prev, info);
>      }
>
>      g_slist_free(devices);
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 0131d9d02c16..43f19e4ab219 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -1681,41 +1681,34 @@ static PciDeviceInfoList *qmp_query_pci_devices(PCIBus *bus, int bus_num);
>
>  static PciMemoryRegionList *qmp_query_pci_regions(const PCIDevice *dev)
>  {
> -    PciMemoryRegionList *head = NULL, *cur_item = NULL;
> +    PciMemoryRegionList *head = NULL, **tail = &head;

Here, you use a new and better name.

I'd like to encourage you to name tail pointer variables @tail
elsewhere, too.

>      int i;
>
>      for (i = 0; i < PCI_NUM_REGIONS; i++) {
>          const PCIIORegion *r = &dev->io_regions[i];
> -        PciMemoryRegionList *region;
> +        PciMemoryRegion *region;
>
>          if (!r->size) {
>              continue;
>          }
>
>          region = g_malloc0(sizeof(*region));
> -        region->value = g_malloc0(sizeof(*region->value));
>
>          if (r->type & PCI_BASE_ADDRESS_SPACE_IO) {
> -            region->value->type = g_strdup("io");
> +            region->type = g_strdup("io");
>          } else {
> -            region->value->type = g_strdup("memory");
> -            region->value->has_prefetch = true;
> -            region->value->prefetch = !!(r->type & PCI_BASE_ADDRESS_MEM_PREFETCH);
> -            region->value->has_mem_type_64 = true;
> -            region->value->mem_type_64 = !!(r->type & PCI_BASE_ADDRESS_MEM_TYPE_64);
> +            region->type = g_strdup("memory");
> +            region->has_prefetch = true;
> +            region->prefetch = !!(r->type & PCI_BASE_ADDRESS_MEM_PREFETCH);
> +            region->has_mem_type_64 = true;
> +            region->mem_type_64 = !!(r->type & PCI_BASE_ADDRESS_MEM_TYPE_64);
>          }
>
> -        region->value->bar = i;
> -        region->value->address = r->addr;
> -        region->value->size = r->size;
> +        region->bar = i;
> +        region->address = r->addr;
> +        region->size = r->size;
>
> -        /* XXX: waiting for the qapi to support GSList */
> -        if (!cur_item) {
> -            head = cur_item = region;
> -        } else {
> -            cur_item->next = region;
> -            cur_item = region;
> -        }
> +        QAPI_LIST_APPEND(tail, region);
>      }
>
>      return head;
[...]
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index d8bc40ea9f6e..55087e268cda 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2118,17 +2118,17 @@ void qmp_guest_suspend_hybrid(Error **errp)
>      guest_suspend(SUSPEND_MODE_HYBRID, errp);
>  }
>
> -static GuestNetworkInterfaceList *
> +static GuestNetworkInterface *
>  guest_find_interface(GuestNetworkInterfaceList *head,
>                       const char *name)
>  {
>      for (; head; head = head->next) {
>          if (strcmp(head->value->name, name) == 0) {
> -            break;
> +            return head->value;
>          }
>      }
>
> -    return head;
> +    return NULL;
>  }
>
>  static int guest_get_network_stats(const char *name,
> @@ -2197,7 +2197,7 @@ static int guest_get_network_stats(const char *name,
>   */
>  GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>  {
> -    GuestNetworkInterfaceList *head = NULL, *cur_item = NULL;
> +    GuestNetworkInterfaceList *head = NULL, **tail = &head;
>      struct ifaddrs *ifap, *ifa;
>
>      if (getifaddrs(&ifap) < 0) {
> @@ -2206,9 +2206,10 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>      }
>
>      for (ifa = ifap; ifa; ifa = ifa->ifa_next) {
> -        GuestNetworkInterfaceList *info;
> -        GuestIpAddressList **address_list = NULL, *address_item = NULL;
> -        GuestNetworkInterfaceStat  *interface_stat = NULL;
> +        GuestNetworkInterface *info;
> +        GuestIpAddressList **address_tail;
> +        GuestIpAddress *address_item = NULL;
> +        GuestNetworkInterfaceStat *interface_stat = NULL;
>          char addr4[INET_ADDRSTRLEN];
>          char addr6[INET6_ADDRSTRLEN];
>          int sock;
> @@ -2222,19 +2223,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>
>          if (!info) {
>              info = g_malloc0(sizeof(*info));
> -            info->value = g_malloc0(sizeof(*info->value));
> -            info->value->name = g_strdup(ifa->ifa_name);
> +            info->name = g_strdup(ifa->ifa_name);
>
> -            if (!cur_item) {
> -                head = cur_item = info;
> -            } else {
> -                cur_item->next = info;
> -                cur_item = info;
> -            }
> +            QAPI_LIST_APPEND(tail, info);
>          }
>
> -        if (!info->value->has_hardware_address &&
> -            ifa->ifa_flags & SIOCGIFHWADDR) {
> +        address_tail = &info->ip_addresses;
> +
> +        if (!info->has_hardware_address && ifa->ifa_flags & SIOCGIFHWADDR) {

Unrelated line break removal.

>              /* we haven't obtained HW address yet */
>              sock = socket(PF_INET, SOCK_STREAM, 0);
>              if (sock == -1) {
> @@ -2243,7 +2239,7 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>              }
>
>              memset(&ifr, 0, sizeof(ifr));
> -            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->value->name);
> +            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
>              if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
>                  error_setg_errno(errp, errno,
>                                   "failed to get MAC address of %s",
> @@ -2255,13 +2251,13 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>              close(sock);
>              mac_addr = (unsigned char *) &ifr.ifr_hwaddr.sa_data;
>
> -            info->value->hardware_address =
> +            info->hardware_address =
>                  g_strdup_printf("%02x:%02x:%02x:%02x:%02x:%02x",
>                                  (int) mac_addr[0], (int) mac_addr[1],
>                                  (int) mac_addr[2], (int) mac_addr[3],
>                                  (int) mac_addr[4], (int) mac_addr[5]);
>
> -            info->value->has_hardware_address = true;
> +            info->has_hardware_address = true;
>          }
>
>          if (ifa->ifa_addr &&
> @@ -2274,15 +2270,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>              }
>
>              address_item = g_malloc0(sizeof(*address_item));
> -            address_item->value = g_malloc0(sizeof(*address_item->value));
> -            address_item->value->ip_address = g_strdup(addr4);
> -            address_item->value->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;
> +            address_item->ip_address = g_strdup(addr4);
> +            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV4;
>
>              if (ifa->ifa_netmask) {
>                  /* Count the number of set bits in netmask.
>                   * This is safe as '1' and '0' cannot be shuffled in netmask. */
>                  p = &((struct sockaddr_in *)ifa->ifa_netmask)->sin_addr;
> -                address_item->value->prefix = ctpop32(((uint32_t *) p)[0]);
> +                address_item->prefix = ctpop32(((uint32_t *) p)[0]);
>              }
>          } else if (ifa->ifa_addr &&
>                     ifa->ifa_addr->sa_family == AF_INET6) {
> @@ -2294,15 +2289,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>              }
>
>              address_item = g_malloc0(sizeof(*address_item));
> -            address_item->value = g_malloc0(sizeof(*address_item->value));
> -            address_item->value->ip_address = g_strdup(addr6);
> -            address_item->value->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;
> +            address_item->ip_address = g_strdup(addr6);
> +            address_item->ip_address_type = GUEST_IP_ADDRESS_TYPE_IPV6;
>
>              if (ifa->ifa_netmask) {
>                  /* Count the number of set bits in netmask.
>                   * This is safe as '1' and '0' cannot be shuffled in netmask. */
>                  p = &((struct sockaddr_in6 *)ifa->ifa_netmask)->sin6_addr;
> -                address_item->value->prefix =
> +                address_item->prefix =
>                      ctpop32(((uint32_t *) p)[0]) +
>                      ctpop32(((uint32_t *) p)[1]) +
>                      ctpop32(((uint32_t *) p)[2]) +
> @@ -2314,29 +2308,18 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>              continue;
>          }
>
> -        address_list = &info->value->ip_addresses;
> +        QAPI_LIST_APPEND(address_tail, address_item);
>
> -        while (*address_list && (*address_list)->next) {
> -            address_list = &(*address_list)->next;
> -        }
> +        info->has_ip_addresses = true;
>
> -        if (!*address_list) {
> -            *address_list = address_item;
> -        } else {
> -            (*address_list)->next = address_item;
> -        }
> -
> -        info->value->has_ip_addresses = true;

Before the patch:

           address_list = &info->value->ip_addresses;

           while (*address_list && (*address_list)->next) {
               address_list = &(*address_list)->next;
           }

           if (!*address_list) {
               *address_list = address_item;
           } else {
               (*address_list)->next = address_item;
           }

Note the loop to advance address list to the tail.

Afterwards (info->value has become info):

           address_tail = &info->ip_addresses;
           [...]
           QAPI_LIST_APPEND(address_tail, address_item);

Not the same, I'm afraid: QAPI_LIST_APPEND() blindly overwrites
info->ip_addresses.

> -
> -        if (!info->value->has_statistics) {
> +        if (!info->has_statistics) {
>              interface_stat = g_malloc0(sizeof(*interface_stat));
> -            if (guest_get_network_stats(info->value->name,
> -                interface_stat) == -1) {
> -                info->value->has_statistics = false;
> +            if (guest_get_network_stats(info->name, interface_stat) == -1) {
> +                info->has_statistics = false;
>                  g_free(interface_stat);
>              } else {
> -                info->value->statistics = interface_stat;
> -                info->value->has_statistics = true;
> +                info->statistics = interface_stat;
> +                info->has_statistics = true;
>              }
>          }
>      }
> @@ -2863,7 +2846,6 @@ qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)
>
>      while (mem_blks != NULL) {
>          GuestMemoryBlockResponse *result;
> -        GuestMemoryBlockResponseList *entry;
>          GuestMemoryBlock *current_mem_blk = mem_blks->value;
>
>          result = g_malloc0(sizeof(*result));
> @@ -2872,11 +2854,7 @@ qmp_guest_set_memory_blocks(GuestMemoryBlockList *mem_blks, Error **errp)
>          if (local_err) { /* should never happen */
>              goto err;
>          }
> -        entry = g_malloc0(sizeof *entry);
> -        entry->value = result;
> -
> -        *link = entry;
> -        link = &entry->next;
> +        QAPI_LIST_APPEND(link, result);
>          mem_blks = mem_blks->next;
>      }
>

This one looks like a candidate for PATCH 6.

> @@ -3107,11 +3085,10 @@ static double ga_get_login_time(struct utmpx *user_info)
>  GuestUserList *qmp_guest_get_users(Error **errp)
>  {
>      GHashTable *cache = NULL;
> -    GuestUserList *head = NULL, *cur_item = NULL;
> +    GuestUserList *head = NULL, **tail = &head;
>      struct utmpx *user_info = NULL;
>      gpointer value = NULL;
>      GuestUser *user = NULL;
> -    GuestUserList *item = NULL;
>      double login_time = 0;
>
>      cache = g_hash_table_new(g_str_hash, g_str_equal);
> @@ -3134,19 +3111,13 @@ GuestUserList *qmp_guest_get_users(Error **errp)
>              continue;
>          }
>
> -        item = g_new0(GuestUserList, 1);
> -        item->value = g_new0(GuestUser, 1);
> -        item->value->user = g_strdup(user_info->ut_user);
> -        item->value->login_time = ga_get_login_time(user_info);
> +        user = g_new0(GuestUser, 1);
> +        user->user = g_strdup(user_info->ut_user);
> +        user->login_time = ga_get_login_time(user_info);
>
> -        g_hash_table_insert(cache, item->value->user, item->value);
> +        g_hash_table_insert(cache, user->user, user);
>
> -        if (!cur_item) {
> -            head = cur_item = item;
> -        } else {
> -            cur_item->next = item;
> -            cur_item = item;
> -        }
> +        QAPI_LIST_APPEND(tail, user);
>      }
>      endutxent();
>      g_hash_table_destroy(cache);
[...]


