Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408CA2F4C43
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:34:49 +0100 (CET)
Received: from localhost ([::1]:59998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgIS-0004RR-AC
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzgFN-0003HS-R6
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:31:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kzgFK-0005hm-HM
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:31:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610544690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=myisOHKboOFME+Ha+jflHQEgPyhdb8aPfIquT4rkUj8=;
 b=K1j5zahsJv8VKAjGgBGcet9ZD1hrRykC8AL5F5J8mzzm3JEs6IYEMnzq9FAC/Aot3EjrUN
 5jyYz1nY4UZz4cmJXik+ORJQ4vfuW5NMADRIYOD0UP9fgfwpe2WO6bx89V12InXowL5O5i
 FnIciGd3SghdClAU/jMcwGDMkAwTszw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-xbsWHOpAMb2geg1sYhpLig-1; Wed, 13 Jan 2021 08:31:26 -0500
X-MC-Unique: xbsWHOpAMb2geg1sYhpLig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C234580DDF6;
 Wed, 13 Jan 2021 13:31:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-172.ams2.redhat.com
 [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA9CC5D741;
 Wed, 13 Jan 2021 13:31:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 55F4611386A7; Wed, 13 Jan 2021 14:31:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 7/7] qapi: More complex uses of QAPI_LIST_APPEND
References: <20201223221102.390740-1-eblake@redhat.com>
 <20201223221102.390740-8-eblake@redhat.com>
Date: Wed, 13 Jan 2021 14:31:07 +0100
In-Reply-To: <20201223221102.390740-8-eblake@redhat.com> (Eric Blake's message
 of "Wed, 23 Dec 2020 16:11:02 -0600")
Message-ID: <87k0shyndw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Mar?= =?utf-8?Q?c-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> These cases require a bit more thought to review; in each case, the
> code was appending to a list, but not with a FOOList **tail variable.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
[...]
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index a5058a3bd15e..10ee740eee1b 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2119,17 +2119,17 @@ void qmp_guest_suspend_hybrid(Error **errp)
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
> @@ -2198,7 +2198,7 @@ static int guest_get_network_stats(const char *name,
>   */
>  GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>  {
> -    GuestNetworkInterfaceList *head = NULL, *cur_item = NULL;
> +    GuestNetworkInterfaceList *head = NULL, **tail = &head;
>      struct ifaddrs *ifap, *ifa;
>
>      if (getifaddrs(&ifap) < 0) {
> @@ -2207,9 +2207,10 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
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
> @@ -2223,19 +2224,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
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

Unrelated line break removal.  I don't mind.

>              /* we haven't obtained HW address yet */
>              sock = socket(PF_INET, SOCK_STREAM, 0);
>              if (sock == -1) {
> @@ -2244,7 +2240,7 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>              }
>
>              memset(&ifr, 0, sizeof(ifr));
> -            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->value->name);
> +            pstrcpy(ifr.ifr_name, IF_NAMESIZE, info->name);
>              if (ioctl(sock, SIOCGIFHWADDR, &ifr) == -1) {
>                  error_setg_errno(errp, errno,
>                                   "failed to get MAC address of %s",
> @@ -2256,13 +2252,13 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
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
> @@ -2275,15 +2271,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
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
> @@ -2295,15 +2290,14 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
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
> @@ -2315,29 +2309,18 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
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
[...]


