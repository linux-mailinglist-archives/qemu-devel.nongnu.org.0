Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD6133EFCF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 12:51:55 +0100 (CET)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMUiQ-0007xc-VA
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 07:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lMUgg-0006dc-J1
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:50:06 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:50587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lMUgc-0008Ig-Qs
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 07:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=WEz1d/e2FD0Bb0jqfPmPixKcTTK0zElGy1qtD/uutw4=; b=e6VZHa0ehiWNW2azoEfh57Fe81
 w6yfNMssKw9JSlLqXclxE7MyqDhVyzx+effkHOjH5VKSqSOgpfuQ4QrbvTYidGGa0QycvE2Vyt3px
 7QD6Tc+H4jUVovMSFjI3fQIK4/Ag9zUgfksL2LcrMgVMU8iQLO1pwdR2HG/NTOGTSlsKPmtfEG14C
 y8DXZpa3eWLKj5AGh3QrbxiLAI61kwT1CCEVgUMU27EWTI07LdHiRG9pmIpmHK4IajXLWDtSnv4F4
 UnJs8B82GxvoR89jJl7Gc9MTENOZZsFkzFqNtnJAOqqJwTZmT81gV0sOWJOIShgnDZryqAtZO+D4o
 I+RbA6Dx49JlFrOSlZt+eEwm3rNSGZOhSZCABiFkZ5FYb+/oQdE4CdK1tBDr4MYmKNzif9Srftxs0
 +L8OB0RAuOcaPrcUNz3cNkbROR9qyp693T5xfXA0C85y81Hgn66FJ2f1bJQErOlmo7tsmtRIpNQpC
 LBARVO2qVjwxrNh+LzygwlwbWIiNRJDmojVvpLTKmn3Pp5V6hlG9UvzGijGSRrsrVZqpetfmAJXmi
 a8QHHAN4YRAzuom7qzQOIMgThHsfVgpznONXIA/2g+8NoUc9uVNw9s2qedFxhKYP1mCf+Mc7JxBga
 KCljkb/oKljv3bIMZKQlzWgMMO6mWz9vvSgHpOL9Y=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, slp@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Xie Yongji <xieyongji@bytedance.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [External] Re: [RFC PATCH 0/9] Support for Virtio-fs daemon crash
 reconnection
Date: Wed, 17 Mar 2021 12:49:37 +0100
Message-ID: <1709993.NBFj2RoZ23@silver>
In-Reply-To: <YFHUbEdszo4nursr@stefanha-x1.localdomain>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <CAFQAk7hCqSMMfRjUO8vtK-B2cKxJZZTJgSDAbRycd1AOSktM_w@mail.gmail.com>
 <YFHUbEdszo4nursr@stefanha-x1.localdomain>
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

On Mittwoch, 17. M=E4rz 2021 11:05:32 CET Stefan Hajnoczi wrote:
> On Fri, Dec 18, 2020 at 05:39:34PM +0800, Jiachen Zhang wrote:
> > Thanks for the suggestions. Actually, we choose to save all state
> > information to QEMU because a virtiofsd has the same lifecycle as its
> > QEMU master. However, saving things to a file do avoid communication wi=
th
> > QEMU, and we no longer need to increase the complexity of vhost-user
> > protocol. The suggestion to save fds to the systemd is also very
> > reasonable
> > if we don't consider the lifecycle issues, we will try it.
>=20
> Hi,
> We recently discussed crash recovery in the virtio-fs bi-weekly call and
> I read some of this email thread because it's a topic I'm interested in.

I just had a quick fly over the patches so far. Shouldn't there be some kin=
d=20
of constraint for an automatic reconnection feature after a crash to preven=
t=20
this being exploited by ROP brute force attacks?

E.g. adding some (maybe continuously increasing) delay and/or limiting the=
=20
amount of reconnects within a certain time frame would come to my mind.

Best regards,
Christian Schoenebeck



