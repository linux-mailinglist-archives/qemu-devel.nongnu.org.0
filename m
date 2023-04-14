Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3246E22CA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 14:04:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnI8j-00073T-3o; Fri, 14 Apr 2023 08:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amit@infradead.org>)
 id 1pnI8X-0006uB-QG
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 08:02:44 -0400
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amit@infradead.org>)
 id 1pnI8S-000714-To
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 08:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
 :Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=P5gRnS2yY2gUWUg8EMggPHA3CTT26K8NE5a42z4vLGQ=; b=TsLzSvaRR05341DLoU1GtPA/rX
 nTfmN8TEa+bq7nFX3uspUmBBMqqHozzHm/5vGM4daxxrutY/QvB1h9xuMcxOx3MCYm7jaglihvshz
 b6WTG18Y5gBUeGIaCJGZnGC7ood7TKhd0J9DKlknabMzAL88iAFJi2NugQE+q05x+rTsPoCzZsEPH
 EZRAW7OdfKR93qpBuA/3opl9FGi+cM9CY11l18R1ffbVoiz2qL+Te8xt9XsbyF1eIaLSFS+YN9kx9
 ws70vRzVwMEFBhRU5Imd++jzygex2cRmmrZCB4+VwgzHDec2rso58r/Yq0zB1GsCIdHqHh3HFFz7y
 elS9O8SA==;
Received: from [54.239.6.189] (helo=edge-cache-132.e-iad53.amazon.com)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pnI86-00FZCj-0X; Fri, 14 Apr 2023 12:02:14 +0000
Message-ID: <f21f646279d07be8ecd07096654176f32b44d90f.camel@infradead.org>
Subject: Re: [RFC PATCH 0/1] Implement entropy leak reporting for virtio-rng
From: Amit Shah <amit@infradead.org>
To: Babis Chalios <bchalios@amazon.es>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>,  Amit Shah <amit@kernel.org>, qemu-devel@nongnu.org,
 sgarzare@redhat.com, graf@amazon.de,  xmarcalx@amazon.co.uk
Date: Fri, 14 Apr 2023 14:02:12 +0200
In-Reply-To: <ddcb2bd7-964a-331a-d847-494c74a31667@amazon.es>
References: <20230403105245.29499-1-bchalios@amazon.es>
 <b6724d973b276a3252e640cf687cad484fe3fbff.camel@infradead.org>
 <CAHmME9ru1tONrB+SV2sXBLBDZey9AuLi1D7R_wzH3y00uUshQg@mail.gmail.com>
 <ddcb2bd7-964a-331a-d847-494c74a31667@amazon.es>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=amit@infradead.org; helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2023-04-13 at 15:36 +0200, Babis Chalios wrote:
>=20
> On 11/4/23 18:20, Jason A. Donenfeld wrote:
> > CAUTION: This email originated from outside of the organization. Do not=
 click links or open attachments unless you can confirm the sender and know=
 the content is safe.
> >=20
> >=20
> >=20
> > On Tue, Apr 11, 2023 at 6:19=E2=80=AFPM Amit Shah <amit@infradead.org> =
wrote:
> > > Hey Babis,
> > >=20
> > > On Mon, 2023-04-03 at 12:52 +0200, Babis Chalios wrote:
> > > > This patchset implements the entropy leak reporting feature proposa=
l [1]
> > > > for virtio-rng devices.
> > > >=20
> > > > Entropy leaking (as defined in the specification proposal) typicall=
y
> > > > happens when we take a snapshot of a VM or while we resume a VM fro=
m a
> > > > snapshot. In these cases, we want to let the guest know so that it =
can
> > > > reset state that needs to be uniqueue, for example.
> > > >=20
> > > > This feature is offering functionality similar to what VMGENID does=
.
> > > > However, it allows to build mechanisms on the guest side to notify
> > > > user-space applications, like VMGENID for userspace and additionall=
y for
> > > > kernel.
> > > >=20
> > > > The new specification describes two request types that the guest mi=
ght
> > > > place in the queues for the device to perform, a fill-on-leak reque=
st
> > > > where the device needs to fill with random bytes a buffer and a
> > > > copy-on-leak request where the device needs to perform a copy betwe=
en
> > > > two guest-provided buffers. We currently trigger the handling of gu=
est
> > > > requests when saving the VM state and when loading a VM from a snap=
shot
> > > > file.
> > > >=20
> > > > This is an RFC, since the corresponding specification changes have =
not
> > > > yet been merged. It also aims to allow testing a respective patch-s=
et
> > > > implementing the feature in the Linux front-end driver[2].
> > > >=20
> > > > However, I would like to ask the community's opinion regarding the
> > > > handling of the fill-on-leak requests. Essentially, these requests =
are
> > > > very similar to the normal virtio-rng entropy requests, with the ca=
tch
> > > > that we should complete these requests before resuming the VM, so t=
hat
> > > > we avoid race-conditions in notifying the guest about entropy leak
> > > > events. This means that we cannot rely on the RngBackend's API, whi=
ch is
> > > > asynchronous. At the moment, I have handled that using getrandom(),=
 but
> > > > I would like a solution which doesn't work only with (relatively ne=
w)
> > > > Linux hosts. I am inclined to solve that by extending the RngBacken=
d API
> > > > with a synchronous call to request for random bytes and I'd like to=
 hear
> > > > opinion's on this approach.
> > > The patch looks OK - I suggest you add a new sync call that also prob=
es
> > > for the availability of getrandom().
> > qemu_guest_getrandom_nofail?
>=20
> That should work, I think. Any objections to this Amit?

That's one way to do it - and is fine too - but still needs probing
before calling in that function to ensure it's not going to fail.

		Amit

