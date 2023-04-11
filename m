Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A26DE34B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 20:00:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmIGb-00048t-F0; Tue, 11 Apr 2023 13:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amit@infradead.org>)
 id 1pmGia-0006av-I9
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 12:19:40 -0400
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amit@infradead.org>)
 id 1pmGiW-0000xh-O1
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 12:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=uHJ08p2oh+uSAEQk2d6TH8JaqamLVWzgdYLouGJ9L24=; b=l5wqAlaq6FBaVyhfmgcXVInIOb
 kjxLuxqVWLWFBHF2It/Td2a1gEuLKmzkfpevy3shLpGB6pVaDnsg1m9i0NIpjfzKxq1ExT81woxH+
 br+gnXYbJwM3//KeNSvjaGsBMVBSQmow5kC8cdgyoVYlZivpWZKb7QYW71FAx89V0dFzgE+EdyTTl
 a4O1qrwJ4BoFFh2wcJ6QEk7v8zmMCASIiZqiAO+2qF4nQoyEAKAjgsAK3XCc4+U081e0wfw4DkgYk
 PIlt5mJ41U12pzssL8YNHJcbKAzqaraLwpUQGf8S/Tsw62LQg6IrM8D38Un89KU6I2fSiOqBWE2mG
 FMoaKpVQ==;
Received: from [54.239.6.190] (helo=iad51-en-hct-f1t2-r4.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pmGiE-0063n3-LP; Tue, 11 Apr 2023 16:19:18 +0000
Message-ID: <b6724d973b276a3252e640cf687cad484fe3fbff.camel@infradead.org>
Subject: Re: [RFC PATCH 0/1] Implement entropy leak reporting for virtio-rng
From: Amit Shah <amit@infradead.org>
To: Babis Chalios <bchalios@amazon.es>, "Michael S. Tsirkin"
 <mst@redhat.com>,  Laurent Vivier <lvivier@redhat.com>, Amit Shah
 <amit@kernel.org>, qemu-devel@nongnu.org
Cc: sgarzare@redhat.com, graf@amazon.de, Jason@zx2c4.com, xmarcalx@amazon.co.uk
Date: Tue, 11 Apr 2023 18:19:15 +0200
In-Reply-To: <20230403105245.29499-1-bchalios@amazon.es>
References: <20230403105245.29499-1-bchalios@amazon.es>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=amit@infradead.org; helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 11 Apr 2023 13:58:48 -0400
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

Hey Babis,

On Mon, 2023-04-03 at 12:52 +0200, Babis Chalios wrote:
> This patchset implements the entropy leak reporting feature proposal [1]
> for virtio-rng devices.
>=20
> Entropy leaking (as defined in the specification proposal) typically
> happens when we take a snapshot of a VM or while we resume a VM from a
> snapshot. In these cases, we want to let the guest know so that it can
> reset state that needs to be uniqueue, for example.
>=20
> This feature is offering functionality similar to what VMGENID does.
> However, it allows to build mechanisms on the guest side to notify
> user-space applications, like VMGENID for userspace and additionally for
> kernel.
>=20
> The new specification describes two request types that the guest might
> place in the queues for the device to perform, a fill-on-leak request
> where the device needs to fill with random bytes a buffer and a
> copy-on-leak request where the device needs to perform a copy between
> two guest-provided buffers. We currently trigger the handling of guest
> requests when saving the VM state and when loading a VM from a snapshot
> file.
>=20
> This is an RFC, since the corresponding specification changes have not
> yet been merged. It also aims to allow testing a respective patch-set
> implementing the feature in the Linux front-end driver[2].
>=20
> However, I would like to ask the community's opinion regarding the
> handling of the fill-on-leak requests. Essentially, these requests are
> very similar to the normal virtio-rng entropy requests, with the catch
> that we should complete these requests before resuming the VM, so that
> we avoid race-conditions in notifying the guest about entropy leak
> events. This means that we cannot rely on the RngBackend's API, which is
> asynchronous. At the moment, I have handled that using getrandom(), but
> I would like a solution which doesn't work only with (relatively new)
> Linux hosts. I am inclined to solve that by extending the RngBackend API
> with a synchronous call to request for random bytes and I'd like to hear
> opinion's on this approach.

The patch looks OK - I suggest=C2=A0you add a new sync call that also probe=
s
for the availability of getrandom().  If that doesn't exist, your new
code should figure out a way to deal with the lack of that call.

On older Linux or non-Linux, there are other ways of getting random
numbers, so I expect that sync backend you introduce get more capable.

		Amit

