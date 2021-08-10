Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651AD3E7C1C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:25:01 +0200 (CEST)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTci-00045L-E8
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mDTbA-0001eO-WB
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:23:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mDTb9-0004te-8q
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628609002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3JIt2juOOLjvq3KCjc6QFbMHHqKbsLOcbngDiMWsF8=;
 b=ZRhciUmQt5tP6SGW0rG3BW01eP+9WOdPFp+tj8z3AXFAXnSH0cv62MGC82NvSGc1isO3PR
 t/EPKpk26UKlNuhY5Lfyu2XkwA5FBFdt8RTKGvAvKM87RRRdrcwKzt2Or6bcoWud6x0OSJ
 7XkZuMXqCDa0QV2h0c1GYFj2NpxkbWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-G7E3-coeNPCJS0TUNOwIBA-1; Tue, 10 Aug 2021 11:23:18 -0400
X-MC-Unique: G7E3-coeNPCJS0TUNOwIBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7F7A1934131;
 Tue, 10 Aug 2021 15:23:16 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D48E7A3FD;
 Tue, 10 Aug 2021 15:23:16 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id A9FDC2237F5; Tue, 10 Aug 2021 11:23:15 -0400 (EDT)
Date: Tue, 10 Aug 2021 11:23:15 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v3 09/10] virtiofsd: Optionally fill lo_inode.fhandle
Message-ID: <YRKZ415xrDtcYaQR@redhat.com>
References: <20210730150134.216126-1-mreitz@redhat.com>
 <20210730150134.216126-10-mreitz@redhat.com>
 <YRF2xjwSKOiqB/Al@redhat.com>
 <df64553c-c03d-076a-bcef-bec8554977a4@redhat.com>
MIME-Version: 1.0
In-Reply-To: <df64553c-c03d-076a-bcef-bec8554977a4@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Ioannis Angelakopoulos <jaggel@bu.edu>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 10:32:55AM +0200, Hanna Reitz wrote:
> On 09.08.21 20:41, Vivek Goyal wrote:
> > On Fri, Jul 30, 2021 at 05:01:33PM +0200, Max Reitz wrote:
> > > When the inode_file_handles option is set, try to generate a file handle
> > > for new inodes instead of opening an O_PATH FD.
> > > 
> > > Being able to open these again will require CAP_DAC_READ_SEARCH, so the
> > > description text tells the user they will also need to specify
> > > -o modcaps=+dac_read_search.
> > > 
> > > Generating a file handle returns the mount ID it is valid for.  Opening
> > > it will require an FD instead.  We have mount_fds to map an ID to an FD.
> > > get_file_handle() fills the hash map by opening the file we have
> > > generated a handle for.  To verify that the resulting FD indeed
> > > represents the handle's mount ID, we use statx().  Therefore, using file
> > > handles requires statx() support.
> > So opening the file and storing that fd in mount_fds table might be
> > a potential problem with inotify work Ioannis is doing.
> > 
> > So say a file foo.txt was opened O_RDONLY and fd stored in mount_fs. Now
> > say user unlinks foo.txt. If notifications are enabled, final notification
> > will not be generated till this mount_fds fd is closed.
> > 
> > Now question is when will this fd be closed? If it closed at some
> > later point and then notification is generated, that will break
> > notificaitons.
> 
> Currently, it is never closed.
> 
> > In fact even O_PATH fd is delaying notifications due to same reason.
> > But its not too bad as we close O_PATH fd pretty quickly after
> > unlinking. And we were hoping that file handle support will get rid
> > of this problem because we will not keep O_PATH fd open.
> > 
> > But, IIUC, mount_fds stuff will make it even worse. I did not see
> > the code which removes this fd from mount_fds. So I am not sure what's
> > the life time of this fd.
> 
> The lifetime is forever.  If we wanted to remove it at some point, we’d need
> to track how many file handles we have open for the given mount fd and then
> remove it from the table once the count reaches 0, so it would still be
> delayed.
> 
> I think in practice the first thing that is looked up from some mount will
> probably be the root directory, which cannot be deleted before everything
> else on the mount is gone, so that would work.  We track how many handles
> are there, if the whole mount were to be deleted, I hope all lo_inodes are
> evicted, the count goes to 0, and we can drop the mount fd.

Keeping a reference count on mount_fd object make sense. So we probably
maintain this hash table and lookup using mount_id (as you are already
doing). All subsequent inodes from same filesystem will use same
object. Once all inodes have been flushed out, then mount_fd object
should go away as well (allowing for unmount on host).

> 
> I think we can make the assumption that the mount fd is the root directory
> certain by, well, looking into mountinfo...  That would result in us always
> opening the root node of the filesystem, so that first the whole filesystem
> needs to disappear before it can be deleted (and our mount fd closed) –
> which should work, I guess?

This seems more reasonable. And I think that's what man page seems to 
suggest.

       The  mount_id  argument  returns an identifier for the filesystem mount
       that corresponds to pathname.  This corresponds to the first  field  in
       one  of  the  records in /proc/self/mountinfo.  Opening the pathname in
       the fifth field of that record yields a file descriptor for  the  mount
       point;  that  file  descriptor  can  be  used  in  a subsequent call to
       open_by_handle_at().

Fifth field seems to be the mount point. man proc says.

              (5)  mount  point:  the  pathname of the mount point relative to
                   the process's root directory.

So opening mount point and saving as mount_fd (if it is not already
in hash table) and then take a per inode reference count on mount_fd
object looks like will solve the life time issue of mount_fd as
well as the issue of temporary failures arising because we can't
open a device special file.

> 
> It’s a bit tricky because our sandboxing prevents easy access to mountinfo,
> but if that’s the only way...

yes. We already have lo->proc_self_fd. Maybe we need to keep
/proc/self/mountinfo open in lo->proc_self_mountinfo. I am assuming
that any mount table changes will still be visible despite the fact
I have fd open (and don't have to open new fd to notice new mount/unmount
changes).

Vivek


