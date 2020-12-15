Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926D12DA714
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 05:18:28 +0100 (CET)
Received: from localhost ([::1]:54138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp1n9-0003YW-3M
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 23:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kp1m1-00037E-RY
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 23:17:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kp1ly-000455-SZ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 23:17:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608005832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWe5PBFgf5iw9zbPvWsaXySZFlb0O9zpSwp9RIkXcC0=;
 b=HsD1g8Dm5M1W84PIGveLL8FPHkV/ak7/6650ftZwuBYH/sV/YMDzJYVG4DVM61qxw0buZ1
 QAIMRJSb5WTfPkljRrBTJQyC0rmoPJzugu4TNoak9qFSEOqMnMAzDb7A1NOh7H5zqtnr+W
 Ug5O5FaPUSifBwhZcPKdvRhzhHBusfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-LTDqoeu4PA6lsSM5ysHRow-1; Mon, 14 Dec 2020 23:17:08 -0500
X-MC-Unique: LTDqoeu4PA6lsSM5ysHRow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D5BA107ACE4;
 Tue, 15 Dec 2020 04:17:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CA5860C15;
 Tue, 15 Dec 2020 04:17:05 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
 (zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B10E918095C7;
 Tue, 15 Dec 2020 04:17:03 +0000 (UTC)
Date: Mon, 14 Dec 2020 23:16:44 -0500 (EST)
From: Jason Wang <jasowang@redhat.com>
To: Alexey Kirillov <lekiravi@yandex-team.ru>
Message-ID: <283553782.35654895.1608005804570.JavaMail.zimbra@redhat.com>
In-Reply-To: <159211607963975@mail.yandex-team.ru>
References: <20201108235952.107961-1-lekiravi@yandex-team.ru>
 <20201108235952.107961-4-lekiravi@yandex-team.ru>
 <3e019e9d-2649-5df8-8f9c-8d76eb2615a5@redhat.com>
 <159211607963975@mail.yandex-team.ru>
Subject: Re: [PATCH v5 3/4] hmp: Use QMP query-netdev in hmp_info_network
MIME-Version: 1.0
X-Originating-IP: [10.68.5.20, 10.4.195.30]
Thread-Topic: Use QMP query-netdev in hmp_info_network
Thread-Index: wJzvmE1H0GGYZHeZVf5Ed4MBLJQ9XA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>,
 Vincenzo Maffione <v.maffione@gmail.com>, qemu-devel@nongnu.org,
 Luigi Rizzo <rizzo@iet.unipi.it>, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> Hi!
>=20
> 07.12.2020, 08:52, "Jason Wang" <jasowang@redhat.com>:
> > On 2020/11/9 =E4=B8=8A=E5=8D=887:59, Alexey Kirillov wrote:
> >> =C2=A0+#ifdef CONFIG_SLIRP
> >> =C2=A0+ case NET_BACKEND_USER: {
> >> =C2=A0+ size_t len =3D strchr(ni->u.user.net, '/') - ni->u.user.net;
> >> =C2=A0+ char *net =3D g_strndup(ni->u.user.net, len);
> >> =C2=A0+
> >> =C2=A0+ info_str =3D g_strdup_printf("net=3D%s,restrict=3D%s",
> >> =C2=A0+ net,
> >> =C2=A0+ ni->u.user.q_restrict ? "on" : "off");
> >> =C2=A0+ g_free(net);
> >> =C2=A0+ break;
> >> =C2=A0+ }
> >> =C2=A0+#endif /* CONFIG_SLIRP */
> >> =C2=A0+ case NET_BACKEND_TAP: {
> >> =C2=A0+#ifndef _WIN32
> >> =C2=A0+ if (ni->u.tap.has_fds) {
> >> =C2=A0+ char **fds =3D g_strsplit(ni->u.tap.fds, ":", -1);
> >> =C2=A0+
> >> =C2=A0+ info_str =3D g_strdup_printf("fd=3D%s", fds[nc->queue_index]);
> >> =C2=A0+ g_strfreev(fds);
> >> =C2=A0+ } else if (ni->u.tap.has_helper) {
> >> =C2=A0+ info_str =3D g_strdup_printf("helper=3D%s", ni->u.tap.helper);
> >> =C2=A0+ } else {
> >> =C2=A0+ info_str =3D g_strdup_printf("ifname=3D%s,script=3D%s,downscri=
pt=3D%s",
> >> =C2=A0+ ni->u.tap.ifname,
> >> =C2=A0+ nc->queue_index =3D=3D 0 ? ni->u.tap.script : "no",
> >> =C2=A0+ nc->queue_index =3D=3D 0 ? ni->u.tap.downscript : "no");
> >> =C2=A0+ }
> >> =C2=A0+#else
> >> =C2=A0+ info_str =3D g_strdup_printf("tap: ifname=3D%s", ni->u.tap.ifn=
ame);
> >> =C2=A0+#endif /* _WIN32 */
> >> =C2=A0+ break;
> >> =C2=A0+ }
> >> =C2=A0+#ifdef CONFIG_L2TPV3
> >> =C2=A0+ case NET_BACKEND_L2TPV3: {
> >> =C2=A0+ info_str =3D g_strdup_printf("l2tpv3: connected");
> >> =C2=A0+ break;
> >> =C2=A0+ }
> >> =C2=A0+#endif /* CONFIG_L2TPV3 */
> >> =C2=A0+ case NET_BACKEND_SOCKET: {
> >> =C2=A0+ if (ni->u.socket.has_listen) {
> >> =C2=A0+ if (ni->u.socket.has_fd) {
> >> =C2=A0+ info_str =3D g_strdup_printf("socket: connection from %s",
> >> =C2=A0+ ni->u.socket.listen);
> >> =C2=A0+ } else {
> >> =C2=A0+ info_str =3D g_strdup_printf("socket: wait from %s",
> >> =C2=A0+ ni->u.socket.listen);
> >> =C2=A0+ }
> >> =C2=A0+ } else if (ni->u.socket.has_connect && ni->u.socket.has_fd) {
> >> =C2=A0+ info_str =3D g_strdup_printf("socket: connect to %s",
> >> =C2=A0+ ni->u.socket.connect);
> >> =C2=A0+ } else if (ni->u.socket.has_mcast && ni->u.socket.has_fd) {
> >> =C2=A0+ info_str =3D g_strdup_printf("socket: mcast=3D%s",
> >> =C2=A0+ ni->u.socket.mcast);
> >> =C2=A0+ } else if (ni->u.socket.has_udp && ni->u.socket.has_fd) {
> >> =C2=A0+ info_str =3D g_strdup_printf("socket: udp=3D%s", ni->u.socket.=
udp);
> >> =C2=A0+ } else {
> >> =C2=A0+ g_assert(ni->u.socket.has_fd);
> >> =C2=A0+ int so_type =3D -1;
> >> =C2=A0+ int optlen =3D sizeof(so_type);
> >> =C2=A0+ int fd =3D atoi(ni->u.socket.fd);
> >> =C2=A0+
> >> =C2=A0+ getsockopt(fd, SOL_SOCKET, SO_TYPE, (char *)&so_type,
> >> =C2=A0+ (socklen_t *)&optlen);
> >> =C2=A0+ if (so_type =3D=3D SOCK_STREAM) {
> >> =C2=A0+ info_str =3D g_strdup_printf("socket: fd=3D%s",
> >> =C2=A0+ ni->u.socket.fd);
> >> =C2=A0+ } else {
> >> =C2=A0+ if (ni->u.socket.has_mcast) {
> >> =C2=A0+ /*
> >> =C2=A0+ * This branch is unreachable, according to how it is in
> >> =C2=A0+ * net/socket.c at this moment
> >> =C2=A0+ */
> >> =C2=A0+ info_str =3D g_strdup_printf("socket: fd=3D%s "
> >> =C2=A0+ "(cloned mcast=3D%s)",
> >> =C2=A0+ ni->u.socket.fd,
> >> =C2=A0+ ni->u.socket.mcast);
> >> =C2=A0+ } else {
> >> =C2=A0+ SocketAddress *sa =3D socket_local_address(fd, NULL);
> >> =C2=A0+
> >> =C2=A0+ info_str =3D g_strdup_printf("socket: fd=3D%s %s",
> >> =C2=A0+ ni->u.socket.fd,
> >> =C2=A0+ SocketAddressType_str(sa->type));
> >> =C2=A0+ qapi_free_SocketAddress(sa);
> >> =C2=A0+ }
> >> =C2=A0+ }
> >> =C2=A0+ }
> >> =C2=A0+ break;
> >> =C2=A0+ }
> >> =C2=A0+#ifdef CONFIG_VDE
> >> =C2=A0+ case NET_BACKEND_VDE: {
> >> =C2=A0+ info_str =3D g_strdup_printf("sock=3D%s,fd=3D%d",
> >> =C2=A0+ ni->u.vde.sock,
> >> =C2=A0+ net_vde_get_fd(nc));
> >> =C2=A0+ break;
> >> =C2=A0+ }
> >> =C2=A0+#endif /* CONFIG_VDE */
> >> =C2=A0+#ifdef CONFIG_NET_BRIDGE
> >> =C2=A0+ case NET_BACKEND_BRIDGE: {
> >> =C2=A0+ info_str =3D g_strdup_printf("helper=3D%s,br=3D%s",
> >> =C2=A0+ ni->u.bridge.helper,
> >> =C2=A0+ ni->u.bridge.br);
> >> =C2=A0+ break;
> >> =C2=A0+ }
> >> =C2=A0+#endif /* CONFIG_NET_BRIDGE */
> >> =C2=A0+#ifdef CONFIG_NETMAP
> >> =C2=A0+ case NET_BACKEND_NETMAP: {
> >> =C2=A0+ info_str =3D g_strdup_printf("netmap: ifname=3D%s",
> >> =C2=A0+ ni->u.netmap.ifname);
> >> =C2=A0+ break;
> >> =C2=A0+ }
> >> =C2=A0+#endif /* CONFIG_NETMAP */
> >> =C2=A0+#ifdef CONFIG_VHOST_NET_USER
> >> =C2=A0+ case NET_BACKEND_VHOST_USER: {
> >> =C2=A0+ info_str =3D g_strdup_printf("vhost-user%d to %s",
> >> =C2=A0+ nc->queue_index,
> >> =C2=A0+ ni->u.vhost_user.chardev);
> >> =C2=A0+ break;
> >> =C2=A0+ }
> >> =C2=A0+#endif /* CONFIG_VHOST_NET_USER */
> >> =C2=A0+#ifdef CONFIG_VHOST_NET_VDPA
> >> =C2=A0+ case NET_BACKEND_VHOST_VDPA: {
> >> =C2=A0+ info_str =3D g_strdup("vhost-vdpa");
> >> =C2=A0+ break;
> >> =C2=A0+ }
> >> =C2=A0+#endif /* CONFIG_VHOST_NET_VDPA */
> >
> > This will introduce burdens for new netdevs or new attributes since
> > people can easily forget to add the routine here.
> >
> > I think at least we need introduce callbacks for this.
>=20
> Thanks for pointing. I can't remember why exactly I chose to not do it.
> So it's definitely better to split this chunk to several callbacks.
> I'll do it in the next version of series.
>=20
> > One more stupid question, instead of generating the string via hard
> > codes, is there any method (dict?) to iterate all the key/values
> > automatically?
> >
> > Thanks
>=20
> Oh yes, that the point.
> Now there are no common format for info_str.
> This patch is aimed to keep old HMP command mostly untouched.
> But if we can drop old format, all this mess can be generalized as JSON
> lines replacing old info_str stuff.
>=20
> What do you think about that?

I think it works and there's no need for sticking to the old HMP
format since it's not an ABI. And it would be better if you can
generate more human readable format from JSON.

Thanks


>=20
> Originally I wanted to completely drop old info_str and use
> QAPI to store and provide information about netdevs (and NICs too).
>=20
> Thanks!
>=20
> --
> Alexey Kirillov
> Yandex.Cloud
>=20
>=20


