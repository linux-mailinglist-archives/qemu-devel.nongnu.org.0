Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3474C99C35
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 19:32:43 +0200 (CEST)
Received: from localhost ([::1]:46736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0qwz-0006CZ-S4
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 13:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37365)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1i0qum-0005Kb-NA
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 13:30:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1i0quh-0006fC-Vz
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 13:30:23 -0400
Received: from [192.146.154.1] (port=44720 helo=mcp01.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1i0quf-0006b2-KZ
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 13:30:18 -0400
Received: from raphael-norwitz.user.nutanix.com (unknown [10.41.25.241])
 by mcp01.nutanix.com (Postfix) with ESMTP id D6C6B1015883;
 Thu, 22 Aug 2019 17:30:13 +0000 (UTC)
Date: Thu, 22 Aug 2019 10:30:13 -0700
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190822173013.GB32489@raphael-norwitz.user.nutanix.com>
References: <1560299717-177734-1-git-send-email-raphael.norwitz@nutanix.com>
 <20190614091841.GE10957@stefanha-x1.localdomain>
 <44e330cb-fe17-6f22-523f-2ecc6e280859@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <44e330cb-fe17-6f22-523f-2ecc6e280859@redhat.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 192.146.154.1
Subject: Re: [Qemu-devel] [PATCH] vhost-user-scsi: prevent using
 uninitialized vqs
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
Cc: fam@euphon.net, pbonzini@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 22, 2019 at 10:58:02AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Raphael, Stefan,
>=20
> On 6/14/19 11:18 AM, Stefan Hajnoczi wrote:
> > On Tue, Jun 11, 2019 at 05:35:17PM -0700, Raphael Norwitz wrote:
> >> Of the 3 virtqueues, seabios only sets cmd, leaving ctrl
> >> and event without a physical address. This can cause
> >> vhost_verify_ring_part_mapping to return ENOMEM, causing
> >> the following logs:
> >>
> >> qemu-system-x86_64: Unable to map available ring for ring 0
> >> qemu-system-x86_64: Verify ring failure on region 0
> >>
> >> The qemu commit e6cc11d64fc998c11a4dfcde8fda3fc33a74d844
> >> has already resolved the issue for vhost scsi devices but
> >> the fix was never applied to vhost-user scsi devices.
> >>
> >> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> >> ---
> >>  hw/scsi/vhost-user-scsi.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> >=20
>=20
> What about backends/vhost-user.c and hw/block/vhost-user-blk.c?
>=20

It is clearly an issue for hw/block/vhost-user-blk.c The code is very
similar.

backends/vhost-user.c also fails to zero out the vqs.

I will send the patches.


