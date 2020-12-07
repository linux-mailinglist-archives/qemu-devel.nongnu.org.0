Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E2E2D0A6E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 06:54:24 +0100 (CET)
Received: from localhost ([::1]:42538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km9Tb-0003af-Rv
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 00:54:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1km9Rr-0003Ae-9x
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:52:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1km9Rp-0005gG-AD
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607320352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lKMywr4Dlu9S1pxqn2ZSyHKOb0+QAdd9TbgB04hE7BQ=;
 b=bn8gbH2y/H5QZBOmnwxyFKNEHRvIPF6Y+TgAZpADyHtBmAHQtrmaI4EUQJ0MHOjsvtC/G9
 2tjM3+YXwIEPe0gB9fiuNwbXDMTXwD/KaWKv4rBVymoTJzjzFusxYxyOWLvQ5r11v7UNnJ
 uH/eVe1ovy4LWMax+5aVqzPN7cXzX78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-9O63DZsQPZOh7l4ilC2-3Q-1; Mon, 07 Dec 2020 00:52:30 -0500
X-MC-Unique: 9O63DZsQPZOh7l4ilC2-3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A94310054FF;
 Mon,  7 Dec 2020 05:52:27 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73768100239A;
 Mon,  7 Dec 2020 05:52:15 +0000 (UTC)
Subject: Re: [PATCH v5 3/4] hmp: Use QMP query-netdev in hmp_info_network
To: Alexey Kirillov <lekiravi@yandex-team.ru>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20201108235952.107961-1-lekiravi@yandex-team.ru>
 <20201108235952.107961-4-lekiravi@yandex-team.ru>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3e019e9d-2649-5df8-8f9c-8d76eb2615a5@redhat.com>
Date: Mon, 7 Dec 2020 13:52:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201108235952.107961-4-lekiravi@yandex-team.ru>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Vincenzo Maffione <v.maffione@gmail.com>, yc-core@yandex-team.ru,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/11/9 上午7:59, Alexey Kirillov wrote:
> +#ifdef CONFIG_SLIRP
> +        case NET_BACKEND_USER: {
> +            size_t len = strchr(ni->u.user.net, '/') - ni->u.user.net;
> +            char *net = g_strndup(ni->u.user.net, len);
> +
> +            info_str = g_strdup_printf("net=%s,restrict=%s",
> +                                       net,
> +                                       ni->u.user.q_restrict ? "on" : "off");
> +            g_free(net);
> +            break;
> +        }
> +#endif /* CONFIG_SLIRP */
> +        case NET_BACKEND_TAP: {
> +#ifndef _WIN32
> +            if (ni->u.tap.has_fds) {
> +                char **fds = g_strsplit(ni->u.tap.fds, ":", -1);
> +
> +                info_str = g_strdup_printf("fd=%s", fds[nc->queue_index]);
> +                g_strfreev(fds);
> +            } else if (ni->u.tap.has_helper) {
> +                info_str = g_strdup_printf("helper=%s", ni->u.tap.helper);
> +            } else {
> +                info_str = g_strdup_printf("ifname=%s,script=%s,downscript=%s",
> +                    ni->u.tap.ifname,
> +                    nc->queue_index == 0 ? ni->u.tap.script : "no",
> +                    nc->queue_index == 0 ? ni->u.tap.downscript : "no");
> +            }
> +#else
> +            info_str = g_strdup_printf("tap: ifname=%s", ni->u.tap.ifname);
> +#endif /* _WIN32 */
> +            break;
> +        }
> +#ifdef CONFIG_L2TPV3
> +        case NET_BACKEND_L2TPV3: {
> +            info_str = g_strdup_printf("l2tpv3: connected");
> +            break;
> +        }
> +#endif /* CONFIG_L2TPV3 */
> +        case NET_BACKEND_SOCKET: {
> +            if (ni->u.socket.has_listen) {
> +                if (ni->u.socket.has_fd) {
> +                    info_str = g_strdup_printf("socket: connection from %s",
> +                                               ni->u.socket.listen);
> +                } else {
> +                    info_str = g_strdup_printf("socket: wait from %s",
> +                                               ni->u.socket.listen);
> +                }
> +            } else if (ni->u.socket.has_connect && ni->u.socket.has_fd) {
> +                info_str = g_strdup_printf("socket: connect to %s",
> +                                           ni->u.socket.connect);
> +            } else if (ni->u.socket.has_mcast && ni->u.socket.has_fd) {
> +                info_str = g_strdup_printf("socket: mcast=%s",
> +                                           ni->u.socket.mcast);
> +            } else if (ni->u.socket.has_udp && ni->u.socket.has_fd) {
> +                info_str = g_strdup_printf("socket: udp=%s", ni->u.socket.udp);
> +            } else {
> +                g_assert(ni->u.socket.has_fd);
> +                int so_type = -1;
> +                int optlen = sizeof(so_type);
> +                int fd = atoi(ni->u.socket.fd);
> +
> +                getsockopt(fd, SOL_SOCKET, SO_TYPE, (char *)&so_type,
> +                           (socklen_t *)&optlen);
> +                if (so_type == SOCK_STREAM) {
> +                    info_str = g_strdup_printf("socket: fd=%s",
> +                                               ni->u.socket.fd);
> +                } else {
> +                    if (ni->u.socket.has_mcast) {
> +                        /*
> +                         * This branch is unreachable, according to how it is in
> +                         * net/socket.c at this moment
> +                         */
> +                        info_str = g_strdup_printf("socket: fd=%s "
> +                                                   "(cloned mcast=%s)",
> +                                                   ni->u.socket.fd,
> +                                                   ni->u.socket.mcast);
> +                    } else {
> +                        SocketAddress *sa = socket_local_address(fd, NULL);
> +
> +                        info_str = g_strdup_printf("socket: fd=%s %s",
> +                            ni->u.socket.fd,
> +                            SocketAddressType_str(sa->type));
> +                        qapi_free_SocketAddress(sa);
> +                    }
> +                }
> +            }
> +            break;
> +        }
> +#ifdef CONFIG_VDE
> +        case NET_BACKEND_VDE: {
> +            info_str = g_strdup_printf("sock=%s,fd=%d",
> +                                       ni->u.vde.sock,
> +                                       net_vde_get_fd(nc));
> +            break;
> +        }
> +#endif /* CONFIG_VDE */
> +#ifdef CONFIG_NET_BRIDGE
> +        case NET_BACKEND_BRIDGE: {
> +            info_str = g_strdup_printf("helper=%s,br=%s",
> +                                       ni->u.bridge.helper,
> +                                       ni->u.bridge.br);
> +            break;
> +        }
> +#endif /* CONFIG_NET_BRIDGE */
> +#ifdef CONFIG_NETMAP
> +        case NET_BACKEND_NETMAP: {
> +            info_str = g_strdup_printf("netmap: ifname=%s",
> +                                       ni->u.netmap.ifname);
> +            break;
> +        }
> +#endif /* CONFIG_NETMAP */
> +#ifdef CONFIG_VHOST_NET_USER
> +        case NET_BACKEND_VHOST_USER: {
> +            info_str = g_strdup_printf("vhost-user%d to %s",
> +                                       nc->queue_index,
> +                                       ni->u.vhost_user.chardev);
> +            break;
> +        }
> +#endif /* CONFIG_VHOST_NET_USER */
> +#ifdef CONFIG_VHOST_NET_VDPA
> +        case NET_BACKEND_VHOST_VDPA: {
> +            info_str = g_strdup("vhost-vdpa");
> +            break;
> +        }
> +#endif /* CONFIG_VHOST_NET_VDPA */


This will introduce burdens for new netdevs or new attributes since 
people can easily forget to add the routine here.

I think at least we need introduce callbacks for this.

One more stupid question, instead of generating the string via hard 
codes, is there any method (dict?) to iterate all the key/values 
automatically?

Thanks



