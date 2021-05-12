Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76237C294
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:12:35 +0200 (CEST)
Received: from localhost ([::1]:49070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqXK-0004B3-J9
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lgqVQ-0002tG-PQ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:10:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lgqVO-0004Gv-3e
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:10:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620832232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8zxBCpfgTN4i4/eL/ZTNPM0YT/TDrIunAP9mxeoKgIk=;
 b=boxu/HAya/OJgiKXGRf47oz0pFDm2Gl4LQboL2wLfmqemHf3ZVWRgxHJRI26ZNSCNC+HAx
 p/ZJ7pwNqWjUrHADUfBqIc8Ov28OnzkcJCOcvWUNJbfPi42vtnZOWr28i5dpuRl0MNgayg
 5FT9tGlFqQbv3lOgOe3ka5CtbGacSRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-nG0lj0drPlaor75IMtmyKg-1; Wed, 12 May 2021 11:10:30 -0400
X-MC-Unique: nG0lj0drPlaor75IMtmyKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CC7C801817;
 Wed, 12 May 2021 15:10:26 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-75.ams2.redhat.com [10.36.114.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2643A1001B2C;
 Wed, 12 May 2021 15:10:25 +0000 (UTC)
Date: Wed, 12 May 2021 17:10:23 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v2] block: Improve backing file validation
Message-ID: <YJvv34h42YF534Wa@merkur.fritz.box>
References: <20210511055518.31876-1-lizhijian@cn.fujitsu.com>
 <YJpB4IVbg8vHBiOZ@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YJpB4IVbg8vHBiOZ@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Li Zhijian <lizhijian@cn.fujitsu.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.05.2021 um 10:35 hat Daniel P. Berrangé geschrieben:
> On Tue, May 11, 2021 at 01:55:18PM +0800, Li Zhijian wrote:
> > Image below user cases:
> > case 1:
> > ```
> > $ qemu-img create -f raw source.raw 1G
> > $ qemu-img create -f qcow2 -F raw -b source.raw ./source.raw
> > qemu-img info source.raw
> > image: source.raw
> > file format: qcow2
> > virtual size: 193K (197120 bytes)
> > disk size: 196K
> > cluster_size: 65536
> > backing file: source.raw <<<<<<
> > backing file format: raw
> > Format specific information:
> >     compat: 1.1
> >     lazy refcounts: false
> >     refcount bits: 16
> >     corrupt: false
> > ```
> > 
> > case 2:
> > ```
> > $ qemu-img create -f raw source.raw 1G
> > $ ln -sf source.raw destination.qcow2
> > $ qemu-img create -f qcow2 -F raw -b source.raw ./destination.qcow2
> > qemu-img info source.raw
> > image: source.raw
> > file format: qcow2 <<<<<<
> > virtual size: 2.0G (2147483648 bytes)
> > disk size: 196K
> > cluster_size: 65536
> > backing file: source.raw
> > backing file format: raw
> > Format specific information:
> >     compat: 1.1
> >     lazy refcounts: false
> >     refcount bits: 16
> >     corrupt: false
> > ```
> > Generally, we don't expect to corrupte the source.raw anyway, while
> > actually it does.
> > 
> > Here we check their inode number instead of file name.
> > 
> > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> > 
> > ---
> > v2: utilize stat() instead of realpath() (Daniel)
> > 
> > Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
> > ---
> >  block.c | 39 ++++++++++++++++++++++++++++++++-------
> >  1 file changed, 32 insertions(+), 7 deletions(-)
> > 
> > diff --git a/block.c b/block.c
> > index 9ad725d205..db4ae57959 100644
> > --- a/block.c
> > +++ b/block.c
> > @@ -6431,6 +6431,37 @@ bool bdrv_op_blocker_is_empty(BlockDriverState *bs)
> >      return true;
> >  }
> >  
> > +static bool validate_backing_file(const char *filename,
> > +                                  const char *backing_file, Error **errp)
> > +{
> > +    struct stat filename_stat, backing_stat;
> > +
> > +    if (backing_file[0] == '\0') {
> > +        error_setg(errp, "Expected backing file name, got empty string");
> > +        goto out;
> > +    }
> > +
> > +    /* check whether filename and backing_file are refering to the same file */
> > +    if (stat(backing_file, &backing_stat) == -1) {
> > +        error_setg(errp, "Cannot stat backing file %s", backing_file);
> > +        goto out;
> > +    }
> > +    if (stat(filename, &filename_stat) == -1) {
> > +        /* Simply consider filename doesn't exist, no need to further check */
> > +        return true;
> > +    }
> > +    if ((filename_stat.st_dev == backing_stat.st_dev) &&
> > +        (filename_stat.st_ino == backing_stat.st_ino)) {
> > +        error_setg(errp, "Error: Trying to create an image with the "
> > +                         "same filename as the backing file");
> > +        goto out;
> > +    }
> > +
> > +    return true;
> > +out:
> > +    return false;
> > +}
> > +
> >  void bdrv_img_create(const char *filename, const char *fmt,
> >                       const char *base_filename, const char *base_fmt,
> >                       char *options, uint64_t img_size, int flags, bool quiet,
> > @@ -6507,13 +6538,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
> >  
> >      backing_file = qemu_opt_get(opts, BLOCK_OPT_BACKING_FILE);
> >      if (backing_file) {
> > -        if (!strcmp(filename, backing_file)) {
> > -            error_setg(errp, "Error: Trying to create an image with the "
> > -                             "same filename as the backing file");
> > -            goto out;
> > -        }
> > -        if (backing_file[0] == '\0') {
> > -            error_setg(errp, "Expected backing file name, got empty string");
> > +        if (!validate_backing_file(filename, backing_file, errp)) {
> >              goto out;
> >          }
> >      }
> 
> Thinking about this again, this seems to be quite high in the generic block
> layer code. As such I don't think we can assume that the backing file here
> is actually a plain file on disk. IIUC the backing file could still be any
> of the block drivers. Only once we get down into the protocol specific
> drivers can be validate the type of backend.

Yes, you definitely can't assume that filename is really a local file
name here. It could be any other protocol supported by QEMU, or even use
the json: pseudo-protocol.

> I'm not sure what the right way to deal with that is, so perhaps Kevin or
> Max can make a suggestion.

Can we just keep the backing file open with write permissions unshared
so that locking will fail for the new image? Or would that error
condition be detected too late so that the image would already be
truncated?

Kevin


