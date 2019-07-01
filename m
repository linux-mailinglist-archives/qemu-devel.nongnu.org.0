Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC417896
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 13:45:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35377 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOL0z-00059w-Gu
	for lists+qemu-devel@lfdr.de; Wed, 08 May 2019 07:45:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hOL03-0004lm-64
	for qemu-devel@nongnu.org; Wed, 08 May 2019 07:44:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hOL01-0004cT-UN
	for qemu-devel@nongnu.org; Wed, 08 May 2019 07:44:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54178)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hOKzx-0004Y4-UN; Wed, 08 May 2019 07:44:35 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84953C057E16;
	Wed,  8 May 2019 11:44:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24C8C1A267;
	Wed,  8 May 2019 11:44:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9AEE71132B35; Wed,  8 May 2019 13:44:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190427113625.46594-1-sgarzare@redhat.com>
	<877eb2hiwk.fsf@dusky.pond.sub.org>
	<20190507083615.as7shlq7fwjgwz54@steredhat>
Date: Wed, 08 May 2019 13:44:27 +0200
In-Reply-To: <20190507083615.as7shlq7fwjgwz54@steredhat> (Stefano Garzarella's
	message of "Tue, 7 May 2019 10:36:15 +0200")
Message-ID: <8736lp5fxg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 08 May 2019 11:44:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Use of PreallocMode in block drivers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Josh Durgin <jdurgin@redhat.com>,
	Peter Krempa <pkrempa@redhat.com>, qemu-block@nongnu.org,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefano Garzarella <sgarzare@redhat.com> writes:

> On Tue, May 07, 2019 at 08:34:51AM +0200, Markus Armbruster wrote:
>> Cc: Peter for a libvirt perspective.
>> 
>> Stefano Garzarella <sgarzare@redhat.com> writes:
>> 
>> > This patch adds the support of preallocation (off/full) for the RBD
>> > block driver.
>> > If available, we use rbd_writesame() to quickly fill the image when
>> > full preallocation is required.
>> >
>> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> > ---
>> >  block/rbd.c          | 149 ++++++++++++++++++++++++++++++++++++++-----
>> >  qapi/block-core.json |   4 +-
>> >  2 files changed, 136 insertions(+), 17 deletions(-)
>> >
>> > diff --git a/block/rbd.c b/block/rbd.c
>> > index 0c549c9935..29dd1bb040 100644
>> > --- a/block/rbd.c
>> > +++ b/block/rbd.c
>> > @@ -13,6 +13,7 @@
>> >  
>> >  #include "qemu/osdep.h"
>> >  
>> > +#include "qemu/units.h"
>> >  #include <rbd/librbd.h>
>> >  #include "qapi/error.h"
>> >  #include "qemu/error-report.h"
>> > @@ -331,6 +332,110 @@ static void qemu_rbd_memset(RADOSCB *rcb, int64_t offs)
>> >      }
>> >  }
>> >  
>> > +static int qemu_rbd_do_truncate(rbd_image_t image, int64_t offset,
>> > +                                PreallocMode prealloc, Error **errp)
>> > +{
>> > +    uint64_t current_length;
>> > +    char *buf = NULL;
>> > +    int ret;
>> > +
>> > +    ret = rbd_get_size(image, &current_length);
>> > +    if (ret < 0) {
>> > +        error_setg_errno(errp, -ret, "Failed to get file length");
>> > +        goto out;
>> > +    }
>> > +
>> > +    if (current_length > offset && prealloc != PREALLOC_MODE_OFF) {
>> > +        error_setg(errp, "Cannot use preallocation for shrinking files");
>> > +        ret = -ENOTSUP;
>> > +        goto out;
>> > +    }
>> > +
>> > +    switch (prealloc) {
>> > +    case PREALLOC_MODE_FULL: {
>> [...]
>> > +    case PREALLOC_MODE_OFF:
>> [...]
>> > +    default:
>> > +        error_setg(errp, "Unsupported preallocation mode: %s",
>> > +                   PreallocMode_str(prealloc));
>> > +        ret = -ENOTSUP;
>> > +        goto out;
>> > +    }
>> 
>> Other block drivers also accept only some values of PreallocMode.  Okay.
>> 
>> I wonder whether management applications need to know which values are
>> supported.
>
> Good point!

We can continue to assume they don't until somebody tells us otherwise.

>> Let me review support in drivers:
>> 
>> * file (file-win32.c)
>> * iscsi
>> * nfs
>> * qed
>> * ssh
>> 
>>   - Reject all but PREALLOC_MODE_OFF
>> 
>> * copy-on-read
>> * luks (crypto.c)
>> * raw
>> 
>>   - Pass through only
>> 
>> * file host_cdrom host_device (file-posix.c)
>> 
>>   - Reject all but PREALLOC_MODE_OFF when shrinking and for non-regular
>>     files
>>   - Reject PREALLOC_MODE_FALLOC unless CONFIG_POSIX_FALLOCATE
>>   - Reject PREALLOC_MODE_METADATA
>> 
>> * gluster
>> 
>>   - Reject all but PREALLOC_MODE_OFF when shrinking
>>   - Reject PREALLOC_MODE_FALLOC unless CONFIG_GLUSTERFS_FALLOCATE
>>   - Reject PREALLOC_MODE_FULL unless CONFIG_GLUSTERFS_ZEROFILL
>>   - Reject PREALLOC_MODE_METADATA
>> 
>> * qcow2
>> 
>>   - Reject all but PREALLOC_MODE_OFF when shrinking and with a backing
>>     file
>>   
>> * rbd with this patch
>> 
>>   - Reject all but PREALLOC_MODE_OFF when shrinking
>>   - Reject PREALLOC_MODE_METADATA and PREALLOC_MODE_FALLOC
>> 
>> * sheepdog
>> 
>>   - Reject PREALLOC_MODE_METADATA and PREALLOC_MODE_FALLOC
>>   - Doesn't support shrinking
>> 
>> * vdi
>> 
>>   - Reject PREALLOC_MODE_FALLOC and PREALLOC_MODE_FULL
>>   - Doesn't support shrinking
>> 
>> * blkdebug
>> * blklogwrites
>> * blkverify
>> * bochs
>> * cloop
>> * dmg
>> * ftp
>> * ftps
>> * http
>> * https
>> * luks
>> * nbd
>> * null-aio
>> * null-co
>> * nvme
>> * parallels
>> * qcow
>> * quorum
>> * replication
>> * throttle
>> * vhdx
>> * vmdk
>> * vpc
>> * vvfat
>> * vxhs
>> 
>>   - These appear not to use PreallocMode: they don't implement
>>     .bdrv_co_truncate(), and either don't implement .bdrv_co_create() or
>>     implement it without a prealloc parameter.
>> 
>> Looks good to me.
>>
>
> Thanks for the analysis!
>
>> > +
>> > +    ret = 0;
>> > +
>> > +out:
>> > +    g_free(buf);
>> > +    return ret;
>> > +}
>> > +
>> >  static QemuOptsList runtime_opts = {
>> >      .name = "rbd",
>> >      .head = QTAILQ_HEAD_INITIALIZER(runtime_opts.head),
>> [...]
>> > diff --git a/qapi/block-core.json b/qapi/block-core.json
>> > index 7ccbfff9d0..db25a4065b 100644
>> > --- a/qapi/block-core.json
>> > +++ b/qapi/block-core.json
>> > @@ -4277,13 +4277,15 @@
>> >  #                   point to a snapshot.
>> >  # @size             Size of the virtual disk in bytes
>> >  # @cluster-size     RBD object size
>> > +# @preallocation    Preallocation mode (allowed values: off, full)
>> >  #
>> >  # Since: 2.12
>> >  ##
>> >  { 'struct': 'BlockdevCreateOptionsRbd',
>> >    'data': { 'location':         'BlockdevOptionsRbd',
>> >              'size':             'size',
>> > -            '*cluster-size' :   'size' } }
>> > +            '*cluster-size' :   'size',
>> > +            '*preallocation':   'PreallocMode' } }
>> >  
>> >  ##
>> >  # @BlockdevVmdkSubformat:
>> 
>> The non-support of values 'metadata' and 'falloc' is not visible in
>> introspection, only in documentation.  No reason to block this patch, as
>> the other block drivers have the same introspection weakness (only
>> sheepdog and vdi bother to document).
>> 
>> Should we address the introspection weakness?  Only if there's a use for
>> the information, I think.
>
> If the management applications will use that information (or maybe also
> our help pages), could be useful to have an array of 'PreallocMode'
> supported per-driver.

Ideally, query-qmp-schema would show only the supported values.

Not hard to do, just tedious: we'd get a number of sub-enums in addition
to the full one, and we'd have to map from sub-enum to the full one.

QAPI language support for sub-enums would remove most of the tedium.
Not worthwhile unless the need for sub-enums is actually common.

>> Should we improve documentation for the other block drivers?
>> 
>
> Yes, e.g. for Gluster it is not updated.
> If you agree, I can check and update the documentation of all drivers following
> your analysis.

Yes, please!

