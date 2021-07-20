Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312953CFCA8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:52:00 +0200 (CEST)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5r6F-00043E-8r
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1m5r54-0001wK-P6
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1m5r51-0003e2-Vv
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 10:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626792641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XgbX8rVH427Cz6ZbO5n7zHC++M7Y+Cos4CHONVwNfW4=;
 b=jGEstp8Stwu73hqN2X9LSMUi2nyZcc/wDE5HslrqLR1X5VKPP6EB1uSDVSAUSB+fDXxUm/
 7rNjWbmsYWn0mNEx/6kmFe9DJ0TxhuFll5LbMO5ttnN1i2E/vATd89P5O724kvBExpmPal
 1W7XECBiB33VaDI4EESxpg07/jWMz0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-ImSRYipsNjaY_O_95lqBAw-1; Tue, 20 Jul 2021 10:50:40 -0400
X-MC-Unique: ImSRYipsNjaY_O_95lqBAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9BCD458DD
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:50:31 +0000 (UTC)
Received: from horse.redhat.com (ovpn-113-228.rdu2.redhat.com [10.10.113.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C7815D9DC;
 Tue, 20 Jul 2021 14:50:31 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 15CCD223E70; Tue, 20 Jul 2021 10:50:31 -0400 (EDT)
Date: Tue, 20 Jul 2021 10:50:31 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v2 7/9] virtiofsd: Add inodes_by_handle hash
 table
Message-ID: <YPbit/qbA4Ussaa5@redhat.com>
References: <20210609155551.44437-1-mreitz@redhat.com>
 <20210609155551.44437-8-mreitz@redhat.com>
 <20210611200459.GB767764@redhat.com>
 <9cea5642-e5ea-961f-d816-0998e52aad9f@redhat.com>
 <20210617212143.GD1142820@redhat.com>
 <1e5dafd2-34e0-1a25-2cb5-6822eaf2502c@redhat.com>
 <20210618182901.GB1252241@redhat.com>
 <eec1bcd6-957d-8e9f-457c-fb717b71336b@redhat.com>
 <eda4ee02-56f8-079d-0829-041ed3471aed@redhat.com>
MIME-Version: 1.0
In-Reply-To: <eda4ee02-56f8-079d-0829-041ed3471aed@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 13, 2021 at 05:07:31PM +0200, Max Reitz wrote:

[..]
> > The next question is, how do we detect temporary failure, because if we
> > look up some new inode, name_to_handle_at() fails, we ignore it, and
> > then it starts to work and we fail all further lookups, that’s not
> > good.  We should have the first lookup fail.  I suppose ENOTSUPP means
> > “OK to ignore”, and for everything else we should let lookup fail?  (And
> > that pretty much answers my "what if name_to_handle_at() works the first
> > time, but then fails" question.  If we let anything but ENOTSUPP let the
> > lookup fail, then we should do so every time.)
> 
> I don’t think this will work as cleanly as I’d hoped.
> 
> The problem I’m facing is that get_file_handle() doesn’t only call
> name_to_handle_at(), but also contains a lot of code managing mount_fds. 
> There are a lot of places that can fail, too, and I think we should have
> them fall back to using an O_PATH FD:
> 
> Say mount_fds doesn’t contain an FD for the new handle’s mount ID yet, so we
> want to add one.  However, it turns out that the file is not a regular file
> or directory, so we cannot open it as a regular FD and add it to mount_fds;

Hi Max,

So an fd opened using O_PATH can't be used as "mount_fd" in
open_by_handle_at()? (I see that you are already first opening O_PATH
fd and then verifying if this is a regular file/dir or not).

> or that it is a regular file, but without permission to open it O_RDONLY. 
> So we cannot return a file handle, because it will not be usable until a
> mount FD is added.
> 
> I think in such a case we should fall back to an O_PATH FD, because this is
> not some unexpected error, but just an unfortunate (but reproducible and
> valid) circumstance where using `-o inode_file_handles` fails to do
> something that works without it.
> 
> Now, however, this means that the next time we try to generate a handle for
> this file (to look it up), it will absolutely work if some other FD was
> added to mount_fds for this mount ID in the meantime.
> 
> 
> We could get around this by not trying to open the file for which we are to
> generate a handle to add its FD to mount_fds, but instead doing what the
> open_by_handle_at() man page suggests:
> 
> > The mount_id argument returns an identifier for the filesystem mount
> > that corresponds to pathname. This corresponds to the first field in one
> > of the records in /proc/self/mountinfo. Opening the pathname in the
> > fifth field of that record yields a file descriptor for the mount point;
> > that file descriptor can be used in a subsequent call to
> > open_by_handle_at().
> 
> However, I’d rather avoid parsing mountinfo.

Hmm.., not sure what's wrong with parsing mountinfo. Example code does
not look too bad. Also it mentions that libmount provides helpers
(if we don't want to write our own function to parse mountinfo).

I would think parsing mountinfo is a good idea because it solves
your problem of not wanting to open device nodes for mount_fds. And
in turn not relying on a fallback to O_PATH fds.

Few thoughts overall.

- We are primarily disagreeing on whether we should fallback to O_PATH
  fds or not if something goes wrong w.r.t handle generation.

  My preference is that atleast in the initial patches we should not try
  to fall back. EOPNOTSUPP is the only case we need to take care of.
  Otherwise if there is any temporary error (EMOMEM, running out of
  fds or something else), we return it to the caller. That's what
  rest of the code is doing. If some operation fails due to some
  temporary error (say ENOMEM), we return error to the caller.

- If above apporach creates problem, we can always add the fallback
  path later.

- If you have strong preference for fallback path, can we have it
  as last patch of the series and not bake it in from the beginning
  of the patch series.

- Even if we add fallback path, can we not make that assumption in
  other areas of the code. For example, can we not avoid parsing
  mountinfo to generate mount_fd, because we have a fallback path
  and we can afford to not generate handle. I mean if we were to
  remove fallback logic at some point of time, it will be much
  easier to do if dependency on this assumption did not spread
  too much.

Thanks
Vivek


> And as far as I understand,
> the only problem here is that we’ll have to cope with the fact that
> sometimes on lookups, we can generate a file handle, but the lo_inode we
> want to find has no file handle attached to it (because get_file_handle()
> failed the first time), and so we won’t find it by that handle but have to
> look it up by its inode ID. (Which is safe, because that lo_inode must have
> an O_PATH FD attached to it, so the inode ID cannot be reused.)  And that’s
> something that this series already does, so I tend to favor that over
> parsing mountinfo.

> 
> Max
> 


