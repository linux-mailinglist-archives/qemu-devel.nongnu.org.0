Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C44422601
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 14:10:49 +0200 (CEST)
Received: from localhost ([::1]:37268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXjHT-0008Is-Al
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 08:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXj8F-0000GD-Cr; Tue, 05 Oct 2021 08:01:22 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:49907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mXj8C-0003nN-53; Tue, 05 Oct 2021 08:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=oReEq7Yo56DFtHntIV6d5KmDT6OgjuS82n4nCjQNi8U=; b=oMlAqIAaW90Iv4PJ5eCPyC9Dvp
 w9Uly/n8xSkO5kWhjEilimFdvL9Uvss7JxkDpfdIneox3t9oaA5dWcetKUEBfYZ424fktxRIzAOmp
 DW/1aX5izX4gyViUA15NDwzKZ/E0eKYlM/5fwy9hxHbeH8nHzDIgFoVNO1KZUAqwcGAtx1d+I7/H0
 TLK4f3I5cUJUWHHlPiftBswh272KJujAwNIYN/JzPJUoa8VHijqpOZcrT98seurG2y/SnyPK8VE3Y
 anUSIuXafsmZil83WVeP1lzL3mRT5pLqG3FFAGeRkwqyJ9CTfnP/Ku43gx2IxYrsr83wIbNLiPnRn
 aj1yMaawGPbHtg01pfP6g1dqclLdLML9H/lEVHwSXILQs2mf/86KLn2xORE8c/qepzFp6vfaIO5VF
 k+ZcbXFIo51yJ3uRJL8OaP7D+NDw8QPLmIXD17OE4JM1m2JGsjXe7/m2OM2JXLNhTteskxzV+b0Zh
 PSGiTd/48oamd+grBEbNhzdxQLYFNnTAOekt7rWf1rYZ3rs3NvkEhA7P8NvMiFLThfjRhVjXaA5dj
 nNDV7soxy/BcNGsbwbhncZA289zIly9X5SBy66z1NhsAlWlnuCLfFx0PFHrUrQBO05yEuoH1HBh67
 JS4ua0mhbh/5lH5BXxJVBBukVtIwYsp6ogHf9PDAk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org,
 Amit Shah <amit@kernel.org>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 2/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Date: Tue, 05 Oct 2021 14:01:00 +0200
Message-ID: <3198295.vc1OghKV7D@silver>
In-Reply-To: <20211005072243-mutt-send-email-mst@kernel.org>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <2365616.UHP9OR3mgr@silver> <20211005072243-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Dienstag, 5. Oktober 2021 13:24:36 CEST Michael S. Tsirkin wrote:
> On Tue, Oct 05, 2021 at 01:17:59PM +0200, Christian Schoenebeck wrote:
> > On Dienstag, 5. Oktober 2021 09:16:07 CEST Michael S. Tsirkin wrote:
> > > On Mon, Oct 04, 2021 at 09:38:08PM +0200, Christian Schoenebeck wrote:
> > > > Raise the maximum possible virtio transfer size to 128M
> > > > (more precisely: 32k * PAGE_SIZE). See previous commit for a
> > > > more detailed explanation for the reasons of this change.
> > > > 
> > > > For not breaking any virtio user, all virtio users transition
> > > > to using the new macro VIRTQUEUE_LEGACY_MAX_SIZE instead of
> > > > VIRTQUEUE_MAX_SIZE, so they are all still using the old value
> > > > of 1k with this commit.
> > > > 
> > > > On the long-term, each virtio user should subsequently either
> > > > switch from VIRTQUEUE_LEGACY_MAX_SIZE to VIRTQUEUE_MAX_SIZE
> > > > after checking that they support the new value of 32k, or
> > > > otherwise they should replace the VIRTQUEUE_LEGACY_MAX_SIZE
> > > > macro by an appropriate value supported by them.
> > > > 
> > > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > 
> > > I don't think we need this. Legacy isn't descriptive either.  Just leave
> > > VIRTQUEUE_MAX_SIZE alone, and come up with a new name for 32k.
> > 
> > Does this mean you disagree that on the long-term all virtio users should
> > transition either to the new upper limit of 32k max queue size or
> > introduce
> > their own limit at their end?
> 
> depends. if 9pfs is the only one unhappy, we can keep 4k as
> the default. it's sure a safe one.
> 
> > Independent of the name, and I would appreciate for suggestions for an
> > adequate macro name here, I still think this new limit should be placed in
> > the shared virtio.h file. Because this value is not something invented on
> > virtio user side. It rather reflects the theoretical upper limited
> > possible with the virtio protocol, which is and will be common for all
> > virtio users.
> We can add this to the linux uapi headers, sure.

Well, then I wait for few days, and if nobody else cares about this issue, 
then I just hard code 32k on 9pfs side exclusively in v3 for now and that's 
it.

Best regards,
Christian Schoenebeck



