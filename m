Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CD1340511
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 13:01:34 +0100 (CET)
Received: from localhost ([::1]:47462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMrLG-00076a-1D
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 08:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lMrJ9-0006Xa-9y
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:59:19 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:36275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lMrJ7-00024C-4R
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=FVNGMxw1Tu/ULPujLuXi4JIfnYLOLclI5Uy/fyQzbQo=; b=P1N1JMy4JcgwxiBIzw2XDOV80y
 A9esKRmwwbaLQdFVNiBefUYR6kNiwask4eGVHk9U/E9UwVLjyX9IwOdPTVSwZoO11NuC4GftfGMf4
 +LmVKMGMOKGHLts4awWHocsalKgD+bZ6tNJHz96fIUNmYLqXWdSws3GTNXCUxEFL1PbhrocNtWkmj
 udXL2WuENOAqgYjU9+1/tPBOfACYVXAtDvxZTqm5X85pGGD+nh/ljBUvrajppS6TxeC2j7lwWPbkX
 a8iJ/d2JdRw+P0ZhX5FRDY7LRrXoQsQEfZSSxEiqyY55x4cloGL72T25RXgQZsmtr4rq4zzuk9CBZ
 mVibXmekJS5jzV3lOVxUdeKtoq/tL3m5n5rXBIwzrRN2kX3UVpk73CvzEeqwOXCTW6Q56u8sbcVX0
 yVoSwWoGMdIKDhRaPZsJRdYrKWnbVuAQrK4zKw+VVOJNQxhksPgxsTBiGE47cxhA51ARXyKD1cBZo
 78JrS1Z2/WvjH21/IZa0AKVnrATuoLU9KvjtclPSsxgfAajvwYIhMVBCFREofH1wkR40jb3a8o4he
 hU/CHaI1ErtHqo2d28bX32fynavSR8qtGF3drQOaUX/IbywdnhoClCyotH5cModT2GUF+sefBJQ7e
 GdGdBsRhbsG+DRt47R5AieJjZZDLoJ+f4Rt0hYgk0=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, slp@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Xie Yongji <xieyongji@bytedance.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [External] Re: [RFC PATCH 0/9] Support for Virtio-fs daemon crash
 reconnection
Date: Thu, 18 Mar 2021 12:58:46 +0100
Message-ID: <1711593.yAA9ihpmTb@silver>
In-Reply-To: <CAFQAk7jmvzL3tT=7ExcUKyo9SKNdhT29F5y3f4K8YigA08=BWQ@mail.gmail.com>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <1709993.NBFj2RoZ23@silver>
 <CAFQAk7jmvzL3tT=7ExcUKyo9SKNdhT29F5y3f4K8YigA08=BWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 17. M=E4rz 2021 13:57:47 CET Jiachen Zhang wrote:
> On Wed, Mar 17, 2021 at 7:50 PM Christian Schoenebeck <
>=20
> qemu_oss@crudebyte.com> wrote:
> > On Mittwoch, 17. M=E4rz 2021 11:05:32 CET Stefan Hajnoczi wrote:
> > > On Fri, Dec 18, 2020 at 05:39:34PM +0800, Jiachen Zhang wrote:
> > > > Thanks for the suggestions. Actually, we choose to save all state
> > > > information to QEMU because a virtiofsd has the same lifecycle as i=
ts
> > > > QEMU master. However, saving things to a file do avoid communication
> >=20
> > with
> >=20
> > > > QEMU, and we no longer need to increase the complexity of vhost-user
> > > > protocol. The suggestion to save fds to the systemd is also very
> > > > reasonable
> > > > if we don't consider the lifecycle issues, we will try it.
> > >=20
> > > Hi,
> > > We recently discussed crash recovery in the virtio-fs bi-weekly call =
and
> > > I read some of this email thread because it's a topic I'm interested =
in.
> >=20
> > I just had a quick fly over the patches so far. Shouldn't there be some
> > kind
> > of constraint for an automatic reconnection feature after a crash to
> > prevent
> > this being exploited by ROP brute force attacks?
> >=20
> > E.g. adding some (maybe continuously increasing) delay and/or limiting =
the
> > amount of reconnects within a certain time frame would come to my mind.
> >=20
> > Best regards,
> > Christian Schoenebeck
>=20
> Thanks, Christian. I am still trying to figure out the details of the ROP
> attacks.
>=20
> However, QEMU's vhost-user reconnection is based on chardev socket
> reconnection. The socket reconnection can be enabled by the "--chardev
> socket,...,reconnect=3DN" in QEMU command options, in which N means QEMU =
will
> try to connect the disconnected socket every N seconds. We can increase N
> to increase the reconnect delay. If we want to change the reconnect delay
> dynamically, I think we should change the chardev socket reconnection cod=
e.
> It is a more generic mechanism than vhost-user-fs and vhost-user backend.
>=20
> By the way, I also considered the socket reconnection delay time in the
> performance aspect. As the reconnection delay increase, if an application
> in the guest is doing I/Os, it will suffer larger tail latency. And for
> now, the smallest delay is 1 second, which is rather large for
> high-performance virtual I/O devices today. I think maybe a more performa=
nt
> and safer reconnect delay adjustment mechanism should be considered in the
> future. What are your thoughts?

So with N=3D1 an attacker could e.g. bypass a 16-bit PAC by brute-force in =
~18=20
hours (e.g. on Arm if PAC + MTE was enabled). With 24-bit PAC (no MTE) it=20
would be ~194 days. Independent of what architecture and defend mechanism i=
s=20
used, there is always the possibility though that some kind of side channel=
=20
attack exists that might require a much lower amount of attempts. So in an=
=20
untrusted environment I would personally limit the amount of automatic=20
reconnects and rather accept a down time for further investigation if a=20
suspicious high amount of crashes happened.

And yes, if a dynamic delay scheme was deployed in future then starting wit=
h a=20
value smaller than 1 second would make sense.

Best regards,
Christian Schoenebeck



