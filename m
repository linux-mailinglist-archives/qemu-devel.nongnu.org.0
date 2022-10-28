Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4E611672
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 17:56:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooRh5-0000vG-RI; Fri, 28 Oct 2022 11:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1ooRgv-0000uL-PU
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:54:42 -0400
Received: from sender4-op-o13.zoho.com ([136.143.188.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uwu@icenowy.me>) id 1ooRgt-0007mR-VW
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 11:54:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1666972473; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g6gSbjuHOJeHcy38U/VW0I6afrbHGcbYExpug2KnEpEfm+v6S36ZBFfUyzPnTITcOsOGN2JsGgQ/L6oCQP27r5Z/PhPPYYGbvBRkCOHVfFuJtDIDPMsbOMTGP7DwrXDEMBQBXcK6imuGcj6DuvIPU+fhqSn+tRViLsqnppF3MYg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1666972473;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=l00PUjGmzcZ7YM3IzdGIEfk4tRF7xLFOUxPO8DzTyv8=; 
 b=KiFCZbhhIXrGZpro59jWF4v1fJGlCBqlD+f7ZL1qhDvZ5xB6Aa/4+bfnf3HZzsGrnfHG4bOgnBha/0o9LGovMBcxaoWCxI7eurdINDFoowUex08zw0+IfjPZLIv+utM4Q2OZqeW17ELVJMwLi1c3+vZC7mA2JEAM0mQA4g8e7Ok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666972473; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=l00PUjGmzcZ7YM3IzdGIEfk4tRF7xLFOUxPO8DzTyv8=;
 b=eP3j4ctADfiOVwflhDGUutdDMpOxZ+x/YZGprdo7y3cOyIqE3E6zAAzyMTxA1QGB
 hj3neYjgitgHIsRMHHEIGtY4vOd7rXFW6Z2dMxTWA9SFiawyhSj2tlt7GpG/Wbdu/YO
 YBWMqsY0edid2qyTDeX5b45OdDaoNbikX0NmouHI=
Received: from edelgard.fodlan.icenowy.me (112.94.102.53 [112.94.102.53]) by
 mx.zohomail.com with SMTPS id 1666972470313693.268690504589;
 Fri, 28 Oct 2022 08:54:30 -0700 (PDT)
Message-ID: <bbfc9940d837e68e5c59ea441b0f5e564721b867.camel@icenowy.me>
Subject: Re: [PATCH] linux-user: always translate cmsg when recvmsg
From: Icenowy Zheng <uwu@icenowy.me>
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Date: Fri, 28 Oct 2022 23:54:24 +0800
In-Reply-To: <20221028081220.1604244-1-uwu@icenowy.me>
References: <20221028081220.1604244-1-uwu@icenowy.me>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.13; envelope-from=uwu@icenowy.me;
 helo=sender4-op-o13.zoho.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

=E5=9C=A8 2022-10-28=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 16:12 +0800=EF=BC=
=8CIcenowy Zheng=E5=86=99=E9=81=93=EF=BC=9A
> It's possible that a message contains both normal payload and
> ancillary
> data in the same message, and even if no ancillary data is available
> this information should be passed to the target, otherwise the target
> cmsghdr will be left uninitialized and the target is going to access
> uninitialized memory if it expects cmsg.

Here attaches an full example that utilizes RTNL and NETLINK_PKTINFO
cmsg:

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <linux/netlink.h>
#include <linux/rtnetlink.h>

struct rtnlreq {
        struct nlmsghdr nmh;
        struct rtgenmsg msg;
};

int main()
{
        int fd, len, sockopt;
        struct sockaddr_nl local, remote;
        struct rtnlreq req;
        struct nlmsghdr *resp;
        struct cmsghdr *cmh;
        struct iovec iov;
        struct msghdr mh;
        char respbuf[8192],cmsgbuf[32];

        fd =3D socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);

        memset(&local, 0, sizeof(local));
        local.nl_family =3D AF_NETLINK;
        local.nl_pid =3D getpid();
        local.nl_groups =3D 0;

        if (bind(fd, (struct sockaddr *)&local, sizeof(local)) < 0)
                abort();

        sockopt =3D 1;
        setsockopt(fd, SOL_NETLINK, NETLINK_PKTINFO, &sockopt,
	sizeof(sockopt));

        memset(&remote, 0, sizeof(remote));
        remote.nl_family =3D AF_NETLINK;
        remote.nl_groups =3D 0;

        memset(&req, 0, sizeof(req));
        req.nmh.nlmsg_len =3D NLMSG_LENGTH(sizeof(req.msg));
        req.nmh.nlmsg_type =3D RTM_GETLINK;
        req.nmh.nlmsg_flags =3D NLM_F_REQUEST | NLM_F_DUMP;=20
        req.nmh.nlmsg_seq =3D 1;
        req.nmh.nlmsg_pid =3D getpid();
        req.msg.rtgen_family =3D AF_INET;

        iov.iov_base =3D &req;
        iov.iov_len =3D req.nmh.nlmsg_len;

        memset(&mh, 0, sizeof(mh));
        mh.msg_iov =3D &iov;
        mh.msg_iovlen =3D 1;
        mh.msg_name =3D &remote;
        mh.msg_namelen =3D sizeof(remote);

        sendmsg(fd, &mh, 0);

        iov.iov_base =3D respbuf;
        iov.iov_len =3D 8192;

        memset(&mh, 0, sizeof(mh));
        mh.msg_iov =3D &iov;
        mh.msg_iovlen =3D 1;
        mh.msg_name =3D &remote;
        mh.msg_namelen =3D sizeof(remote);
        mh.msg_control =3D cmsgbuf;
        mh.msg_controllen =3D 32;

        len =3D recvmsg(fd, &mh, 0);
        if (!len)
                abort();

        resp =3D (struct nlmsghdr *)respbuf;
        cmh =3D CMSG_FIRSTHDR(&mh);
        if (NLMSG_OK(resp, len)) {
                printf("resp type %d len %zd\n",
                       resp->nlmsg_type, resp->nlmsg_len);
        }
        if (cmh) {
                printf("cmsg level %d type %d len %zd\n",
                       cmh->cmsg_level, cmh->cmsg_type, cmh->cmsg_len);
        }
}

On my machine, when it runs natively or runs under patched qemu, the
printed info is:
```
resp type 16 len 1392
cmsg level 270 type 3 len 20
```

However, with unpatched qemu it is:
```
resp type 16 len 1392
cmsg level 0 type 0 len 0
```

>=20
> Always call the function that translate cmsg when recvmsg, because
> that
> function should be empty-cmsg-safe (it creates an empty cmsg in the
> target).
>=20
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
> =C2=A0linux-user/syscall.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 8402c1399d..029a4e8b42 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3346,7 +3346,8 @@ static abi_long do_sendrecvmsg_locked(int fd,
> struct target_msghdr *msgp,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if (fd_trans_host_to_target_data(fd)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D fd_trans_host_to_target_data(fd)(msg.msg_i=
ov-
> >iov_base,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MIN(msg.msg_io=
v-
> >iov_len, len));
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } els=
e {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!=
is_error(ret)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D host_to_target_cmsg(msgp, &msg);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if (!is_error(ret)) {


