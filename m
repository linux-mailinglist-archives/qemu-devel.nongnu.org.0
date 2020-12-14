Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A93C32D9D6B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 18:17:43 +0100 (CET)
Received: from localhost ([::1]:57494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1korTh-0006Zt-E4
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 12:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1korRA-0004nS-QG
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:15:07 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:41070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1korR4-0006tq-UX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 12:15:02 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 31A402E1444;
 Mon, 14 Dec 2020 20:14:48 +0300 (MSK)
Received: from localhost (localhost [::1])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 tUUdmUNxMq-Eiwe4RH9; Mon, 14 Dec 2020 20:14:48 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1607966088; bh=EMJQy4riOQELDRYIqG/Oh663lzAU68OaiIATC/Af2K0=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=QbV3F/QCYrPvTaLlTu44/k11r9ai8JLsvX0gLq+2spL7sVQGoTfHTIuNm826BVF4i
 uiaQbV68etKMNSnMGi/CLzn7pfzd6gsS5hQ3qgIzxJL9j7NZsFyNfGYLiwxsaiB7y9
 vxRUlPmkNnB8jCg5UZHSwe+7A22+BuhGyFMU7MYg=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net [2a02:6b8:c0c:2f26:0:640:d077:482f])
 by iva4-81f2a0d63507.qloud-c.yandex.net with LMTP id CGa5jlCOcp-Rqxjm6ea
 for <lekiravi@yandex-team.ru>; Mon, 14 Dec 2020 20:14:34 +0300
Received: by iva8-edafde7c849c.qloud-c.yandex.net with HTTP;
 Mon, 14 Dec 2020 20:14:33 +0300
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
In-Reply-To: <3e019e9d-2649-5df8-8f9c-8d76eb2615a5@redhat.com>
References: <20201108235952.107961-1-lekiravi@yandex-team.ru>
 <20201108235952.107961-4-lekiravi@yandex-team.ru>
 <3e019e9d-2649-5df8-8f9c-8d76eb2615a5@redhat.com>
Subject: Re: [PATCH v5 3/4] hmp: Use QMP query-netdev in hmp_info_network
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 14 Dec 2020 20:14:43 +0300
Message-Id: <159211607963975@mail.yandex-team.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

07.12.2020, 08:52, "Jason Wang" <jasowang@redhat.com>:
> On 2020/11/9 上午7:59, Alexey Kirillov wrote:
>>  +#ifdef CONFIG_SLIRP
>>  + case NET_BACKEND_USER: {
>>  + size_t len = strchr(ni->u.user.net, '/') - ni->u.user.net;
>>  + char *net = g_strndup(ni->u.user.net, len);
>>  +
>>  + info_str = g_strdup_printf("net=%s,restrict=%s",
>>  + net,
>>  + ni->u.user.q_restrict ? "on" : "off");
>>  + g_free(net);
>>  + break;
>>  + }
>>  +#endif /* CONFIG_SLIRP */
>>  + case NET_BACKEND_TAP: {
>>  +#ifndef _WIN32
>>  + if (ni->u.tap.has_fds) {
>>  + char **fds = g_strsplit(ni->u.tap.fds, ":", -1);
>>  +
>>  + info_str = g_strdup_printf("fd=%s", fds[nc->queue_index]);
>>  + g_strfreev(fds);
>>  + } else if (ni->u.tap.has_helper) {
>>  + info_str = g_strdup_printf("helper=%s", ni->u.tap.helper);
>>  + } else {
>>  + info_str = g_strdup_printf("ifname=%s,script=%s,downscript=%s",
>>  + ni->u.tap.ifname,
>>  + nc->queue_index == 0 ? ni->u.tap.script : "no",
>>  + nc->queue_index == 0 ? ni->u.tap.downscript : "no");
>>  + }
>>  +#else
>>  + info_str = g_strdup_printf("tap: ifname=%s", ni->u.tap.ifname);
>>  +#endif /* _WIN32 */
>>  + break;
>>  + }
>>  +#ifdef CONFIG_L2TPV3
>>  + case NET_BACKEND_L2TPV3: {
>>  + info_str = g_strdup_printf("l2tpv3: connected");
>>  + break;
>>  + }
>>  +#endif /* CONFIG_L2TPV3 */
>>  + case NET_BACKEND_SOCKET: {
>>  + if (ni->u.socket.has_listen) {
>>  + if (ni->u.socket.has_fd) {
>>  + info_str = g_strdup_printf("socket: connection from %s",
>>  + ni->u.socket.listen);
>>  + } else {
>>  + info_str = g_strdup_printf("socket: wait from %s",
>>  + ni->u.socket.listen);
>>  + }
>>  + } else if (ni->u.socket.has_connect && ni->u.socket.has_fd) {
>>  + info_str = g_strdup_printf("socket: connect to %s",
>>  + ni->u.socket.connect);
>>  + } else if (ni->u.socket.has_mcast && ni->u.socket.has_fd) {
>>  + info_str = g_strdup_printf("socket: mcast=%s",
>>  + ni->u.socket.mcast);
>>  + } else if (ni->u.socket.has_udp && ni->u.socket.has_fd) {
>>  + info_str = g_strdup_printf("socket: udp=%s", ni->u.socket.udp);
>>  + } else {
>>  + g_assert(ni->u.socket.has_fd);
>>  + int so_type = -1;
>>  + int optlen = sizeof(so_type);
>>  + int fd = atoi(ni->u.socket.fd);
>>  +
>>  + getsockopt(fd, SOL_SOCKET, SO_TYPE, (char *)&so_type,
>>  + (socklen_t *)&optlen);
>>  + if (so_type == SOCK_STREAM) {
>>  + info_str = g_strdup_printf("socket: fd=%s",
>>  + ni->u.socket.fd);
>>  + } else {
>>  + if (ni->u.socket.has_mcast) {
>>  + /*
>>  + * This branch is unreachable, according to how it is in
>>  + * net/socket.c at this moment
>>  + */
>>  + info_str = g_strdup_printf("socket: fd=%s "
>>  + "(cloned mcast=%s)",
>>  + ni->u.socket.fd,
>>  + ni->u.socket.mcast);
>>  + } else {
>>  + SocketAddress *sa = socket_local_address(fd, NULL);
>>  +
>>  + info_str = g_strdup_printf("socket: fd=%s %s",
>>  + ni->u.socket.fd,
>>  + SocketAddressType_str(sa->type));
>>  + qapi_free_SocketAddress(sa);
>>  + }
>>  + }
>>  + }
>>  + break;
>>  + }
>>  +#ifdef CONFIG_VDE
>>  + case NET_BACKEND_VDE: {
>>  + info_str = g_strdup_printf("sock=%s,fd=%d",
>>  + ni->u.vde.sock,
>>  + net_vde_get_fd(nc));
>>  + break;
>>  + }
>>  +#endif /* CONFIG_VDE */
>>  +#ifdef CONFIG_NET_BRIDGE
>>  + case NET_BACKEND_BRIDGE: {
>>  + info_str = g_strdup_printf("helper=%s,br=%s",
>>  + ni->u.bridge.helper,
>>  + ni->u.bridge.br);
>>  + break;
>>  + }
>>  +#endif /* CONFIG_NET_BRIDGE */
>>  +#ifdef CONFIG_NETMAP
>>  + case NET_BACKEND_NETMAP: {
>>  + info_str = g_strdup_printf("netmap: ifname=%s",
>>  + ni->u.netmap.ifname);
>>  + break;
>>  + }
>>  +#endif /* CONFIG_NETMAP */
>>  +#ifdef CONFIG_VHOST_NET_USER
>>  + case NET_BACKEND_VHOST_USER: {
>>  + info_str = g_strdup_printf("vhost-user%d to %s",
>>  + nc->queue_index,
>>  + ni->u.vhost_user.chardev);
>>  + break;
>>  + }
>>  +#endif /* CONFIG_VHOST_NET_USER */
>>  +#ifdef CONFIG_VHOST_NET_VDPA
>>  + case NET_BACKEND_VHOST_VDPA: {
>>  + info_str = g_strdup("vhost-vdpa");
>>  + break;
>>  + }
>>  +#endif /* CONFIG_VHOST_NET_VDPA */
>
> This will introduce burdens for new netdevs or new attributes since
> people can easily forget to add the routine here.
>
> I think at least we need introduce callbacks for this.

Thanks for pointing. I can't remember why exactly I chose to not do it.
So it's definitely better to split this chunk to several callbacks.
I'll do it in the next version of series.

> One more stupid question, instead of generating the string via hard
> codes, is there any method (dict?) to iterate all the key/values
> automatically?
>
> Thanks

Oh yes, that the point.
Now there are no common format for info_str.
This patch is aimed to keep old HMP command mostly untouched.
But if we can drop old format, all this mess can be generalized as JSON
lines replacing old info_str stuff.

What do you think about that?

Originally I wanted to completely drop old info_str and use
QAPI to store and provide information about netdevs (and NICs too).

Thanks!

-- 
Alexey Kirillov
Yandex.Cloud

