Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2165BD403
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:45:46 +0200 (CEST)
Received: from localhost ([::1]:44382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKq1-00066I-4z
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oaKf6-0002Kx-RL; Mon, 19 Sep 2022 13:34:28 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:53269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oaKf4-0002oG-Qj; Mon, 19 Sep 2022 13:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=j0yzm5k4SBKdrUlByb5xvdCvmT1k+Cx/cLPKtwctChM=; b=wh+JYrfw5V4ySsPoLg/RaK0qFh
 NKwFcNNFOyCPIUfO1JyVduqBq7VoU5cQMLOiZHBnHJ/OVWPX4adVdcsDMh///YqBnXo97bcMMiF/p
 GP+svqp8f/5BjYF9792bTZi13vbE28YMZYU+JMwpIo6koyuGzRlUSMquwJJR3+h6RXvLNd1jGkt5n
 qAHkhLhGKL2Gi4uI7X58+6OzydmZfEGSB8d/h08qlLMerFbbhfjrqGMabYRaEoiCR72Fr9HaZHGB3
 O1r8DQI4OGqhYFTH2kMvZLfx5Fvhum4bU4+21mcbMgN9xefv6PSyE8mmi67qmACwqTK1DoPGpv7ZT
 kVSd5bRQ+a74daXGRvfnzu2Fxj5v8kExmm8XY5ylKfBy/1OFv61YIw0ImjxtJ4wRWFKRNcmR/LBGo
 GE2TvJgrZ48yVUTPqHkpjg/LqjOQ3z/mBim7TtBgaaAAWdv/Zhiz1ZCvMy52DRMNcU8HVkLsbwHp1
 XnGXIA8ptA7WxwzL3X7qEAsu2YMQixOtNMw7lTjmDHUrup34qefQV91OGyAsh3z0HBzo1ASNBuFIt
 xSMqlms1ZBVx3SaE/JKTkTGtb8S1IVOjpVG/S0uLafJZ84w6M+j/1qtX5L7f7K/Q3osNxAB2bk60U
 sV7sbEmrn9I4+9sQbT+vq07QA/QyuHIOIdMqZrO+g=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Linus Heckemann <git@sphalerite.org>
Cc: Qemu-block <qemu-block@nongnu.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 Daniel P =?ISO-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v3] 9pfs: use GHashTable for fid table
Date: Mon, 19 Sep 2022 19:34:21 +0200
Message-ID: <1754509.KvSVDBIHpc@silver>
In-Reply-To: <1948479.BV7xhjtDqn@silver>
References: <20220908112353.289267-1-git@sphalerite.org>
 <1948479.BV7xhjtDqn@silver>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Freitag, 9. September 2022 15:10:48 CEST Christian Schoenebeck wrote:
> On Donnerstag, 8. September 2022 13:23:53 CEST Linus Heckemann wrote:
> > The previous implementation would iterate over the fid table for
> > lookup operations, resulting in an operation with O(n) complexity on
> > the number of open files and poor cache locality -- for every open,
> > stat, read, write, etc operation.
> >=20
> > This change uses a hashtable for this instead, significantly improving
> > the performance of the 9p filesystem. The runtime of NixOS's simple
> > installer test, which copies ~122k files totalling ~1.8GiB from 9p,
> > decreased by a factor of about 10.
> >=20
> > Signed-off-by: Linus Heckemann <git@sphalerite.org>
> > Reviewed-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> > ---
>=20
> Queued on 9p.next:
> https://github.com/cschoenebeck/qemu/commits/9p.next
>=20
> I retained the BUG_ON() in get_fid(), Greg had a point there that continu=
ing
> to work on a clunked fid would still be a bug.
>=20
> I also added the suggested TODO comment for g_hash_table_steal_extended(),
> the actual change would be outside the scope of this patch.
>=20
> And finally I gave this patch a whirl, and what can I say: that's just si=
ck!
> Compiling sources with 9p is boosted by around factor 6..7 here! And
> running 9p as root fs also no longer feels sluggish as before. I mean I
> knew that this fid list traversal performance issue existed and had it on
> my TODO list, but the actual impact exceeded my expectation by far.

Linus, there is still something cheesy. After more testing, at a certain po=
int
running the VM, the terminal is spilled with this message:

  GLib: g_hash_table_iter_next: assertion 'ri->version =3D=3D ri->hash_tabl=
e->version' failed

Looking at the glib sources, I think this warning means the iterator got
invalidated. Setting a breakpoint at glib function g_return_if_fail_warning=
 I
got:

  Thread 1 "qemu-system-x86" hit Breakpoint 1, 0x00007ffff7aa9d80 in g_retu=
rn_if_fail_warning () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
  (gdb) bt
  #0  0x00007ffff7aa9d80 in g_return_if_fail_warning () at /lib/x86_64-linu=
x-gnu/libglib-2.0.so.0
  #1  0x00007ffff7a8ea18 in g_hash_table_iter_next () at /lib/x86_64-linux-=
gnu/libglib-2.0.so.0
  #2  0x0000555555998a7a in v9fs_mark_fids_unreclaim (pdu=3D0x555557a34c90,=
 path=3D0x7ffba8ceff30) at ../hw/9pfs/9p.c:528
  #3  0x000055555599f7a0 in v9fs_unlinkat (opaque=3D0x555557a34c90) at ../h=
w/9pfs/9p.c:3170
  #4  0x000055555606dc4b in coroutine_trampoline (i0=3D1463900480, i1=3D218=
45) at ../util/coroutine-ucontext.c:177
  #5  0x00007ffff7749d40 in __start_context () at /lib/x86_64-linux-gnu/lib=
c.so.6
  #6  0x00007fffffffd5f0 in  ()
  #7  0x0000000000000000 in  ()
  (gdb)

The while loop in v9fs_mark_fids_unreclaim() holds the hash table iterator
while the hash table is modified during the loop.

Would you please fix this? If you do, please use my already queued patch
version as basis.

Best regards,
Christian Schoenebeck



