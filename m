Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1047730583F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 11:23:17 +0100 (CET)
Received: from localhost ([::1]:54694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4hym-00016G-45
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 05:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l4hwC-0008RC-6f
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:20:36 -0500
Received: from 5.mo52.mail-out.ovh.net ([188.165.45.220]:43543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l4hw9-0004BY-7Z
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 05:20:35 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 17AA9239BFB;
 Wed, 27 Jan 2021 11:20:27 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 27 Jan
 2021 11:20:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0059139cf95-1ed2-42f5-9944-12fa685b7642,
 E0AEAA2FFBCC539F7495E66DC8DC75F2C85CA1F9) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 27 Jan 2021 11:20:23 +0100
From: Greg Kurz <groug@kaod.org>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v2] virtiofsd: prevent opening of special
 files (CVE-2020-35517)
Message-ID: <20210127112023.0e97f909@bahia.lan>
In-Reply-To: <CAOssrKdh3kqKN4uGE=s5eiymd2MXKsRXUegqRH-TFhqYOK7WOA@mail.gmail.com>
References: <20210126103502.260758-1-stefanha@redhat.com>
 <20210126181604.1a4c69c6@bahia.lan>
 <CAOssrKdh3kqKN4uGE=s5eiymd2MXKsRXUegqRH-TFhqYOK7WOA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 95185988-f01f-4759-8dd4-724b21eafff9
X-Ovh-Tracer-Id: 4497688653907663151
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehvghhohigrlhesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=188.165.45.220; envelope-from=groug@kaod.org;
 helo=5.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 virtio-fs-list <virtio-fs@redhat.com>, Alex Xu <alex@alxu.ca>,
 Stefan Hajnoczi <stefanha@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 10:25:28 +0100
Miklos Szeredi <mszeredi@redhat.com> wrote:

> On Tue, Jan 26, 2021 at 6:18 PM Greg Kurz <groug@kaod.org> wrote:
> >
> > On Tue, 26 Jan 2021 10:35:02 +0000
> > Stefan Hajnoczi <stefanha@redhat.com> wrote:
> 
> > The patch looks pretty good to me. It just seems to be missing a change in
> > lo_create():
> >
> >     fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
> >                 mode);
> >
> > A malicious guest could have created anything called ${name} in this directory
> > before calling FUSE_CREATE and we'll open it blindly, or I'm missing something ?
> 
> Right, this seems like an omission.
> 
> Also the "& ~O_NOFOLLOW" looks like a copy-paste bug, since unlike
> lo_open(), lo_create() is not opening a proc symlink.
> 
> So that should be replaced with "| O_NOFOLLOW"
> 


Yes, I've realized that later on. We should definitely enforce O_NOFOLLOW
to avoid symlink escapes.

Then comes the case of special files... A well-known case is the FIFO that
causes openat() to block as described in my response. FWIW, we addressed
this one in 9P by adding O_NONBLOCK and fixing the flags to the client
expectation with fcntl(F_SETFL). But this is just a protection against
being blocked. Blindly opening a special file can lead to any kind of
troubles you can think of... so it really looks that the only sane way
to be safe from such an attack is to forbid openat() of special files at
the filesystem level.

> Thanks,
> Miklos
> 


