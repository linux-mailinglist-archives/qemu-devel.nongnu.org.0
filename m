Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D6F393514
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:46:01 +0200 (CEST)
Received: from localhost ([::1]:44178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmK52-0006mc-68
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lmK45-00067j-Rj
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:45:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lmK41-0003Yz-Ou
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:45:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622137495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/TOxkhdjH4pf1NTNVRTi2p40FjlI4iIqYlE61YjOEG0=;
 b=cKoAGbmhP6obnuEkGps6nj+NMVIRn7yDppDl23V27H/Tp3ATxFxrpLMQq5pyKPGJ8eqsAr
 NjrZ6rn3nY6QUK/fcxgvkhKaTOut4QR0bu0ftd3AA5SjZA1PPmW/PCRiX5oaIld2saRZTv
 8Rok02p5EXypfpIyr/uB9kB7mg+IJ0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-yOtOmR9xNxq507id-81fwQ-1; Thu, 27 May 2021 13:44:52 -0400
X-MC-Unique: yOtOmR9xNxq507id-81fwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF546180FD6B;
 Thu, 27 May 2021 17:44:51 +0000 (UTC)
Received: from work-vm (ovpn-114-249.ams2.redhat.com [10.36.114.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E7D12BFF7;
 Thu, 27 May 2021 17:44:44 +0000 (UTC)
Date: Thu, 27 May 2021 18:44:41 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 18/26] DAX/unmap: virtiofsd: Add VHOST_USER_SLAVE_FS_IO
Message-ID: <YK/aiXx52Oe2HV4C@work-vm>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-19-dgilbert@redhat.com>
 <YJQHRwkUhXT+PLtT@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YJQHRwkUhXT+PLtT@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Apr 28, 2021 at 12:00:52PM +0100, Dr. David Alan Gilbert (git) wrote:
> > @@ -220,6 +222,99 @@ uint64_t vhost_user_fs_slave_unmap(struct vhost_dev *dev, int message_size,
> >      return (uint64_t)res;
> >  }
> >  
> > +uint64_t vhost_user_fs_slave_io(struct vhost_dev *dev, int message_size,
> > +                                VhostUserFSSlaveMsg *sm, int fd)
> > +{
> > +    VHostUserFS *fs = (VHostUserFS *)object_dynamic_cast(OBJECT(dev->vdev),
> > +                          TYPE_VHOST_USER_FS);
> > +    if (!fs) {
> > +        error_report("%s: Bad fs ptr", __func__);
> > +        return (uint64_t)-1;
> > +    }
> > +    if (!check_slave_message_entries(sm, message_size)) {
> > +        return (uint64_t)-1;
> > +    }
> 
> These early error returns don't close(fd).

(as per followup, we don't need it and it's removed)

> > +
> > +    unsigned int i;
> > +    int res = 0;
> > +    size_t done = 0;
> > +
> > +    if (fd < 0) {
> > +        error_report("Bad fd for io");
> > +        return (uint64_t)-1;
> > +    }
> > +
> > +    for (i = 0; i < sm->count && !res; i++) {
> > +        VhostUserFSSlaveMsgEntry *e = &sm->entries[i];
> > +        if (e->len == 0) {
> > +            continue;
> > +        }
> > +
> > +        size_t len = e->len;
> > +        uint64_t fd_offset = e->fd_offset;
> > +        hwaddr gpa = e->c_offset;
> > +
> > +        while (len && !res) {
> > +            hwaddr xlat, xlat_len;
> > +            bool is_write = e->flags & VHOST_USER_FS_FLAG_MAP_W;
> > +            MemoryRegion *mr = address_space_translate(dev->vdev->dma_as, gpa,
> > +                                                       &xlat, &xlat_len,
> > +                                                       is_write,
> > +                                                       MEMTXATTRS_UNSPECIFIED);
> > +            if (!mr || !xlat_len) {
> > +                error_report("No guest region found for 0x%" HWADDR_PRIx, gpa);
> > +                res = -EFAULT;
> > +                break;
> > +            }
> > +
> > +            trace_vhost_user_fs_slave_io_loop(mr->name,
> > +                                          (uint64_t)xlat,
> > +                                          memory_region_is_ram(mr),
> > +                                          memory_region_is_romd(mr),
> > +                                          (size_t)xlat_len);
> > +
> > +            void *hostptr = qemu_map_ram_ptr(mr->ram_block,
> > +                                             xlat);
> > +            ssize_t transferred;
> 
> What happens when the MemoryRegion is not backed by RAM?

I've added a check for mr->ramblock being non-null that I think covers
it.

> > +            if (e->flags & VHOST_USER_FS_FLAG_MAP_R) {
> > +                /* Read from file into RAM */
> > +                if (mr->readonly) {
> > +                    res = -EFAULT;
> > +                    break;
> > +                }
> > +                transferred = pread(fd, hostptr, xlat_len, fd_offset);
> > +            } else if (e->flags & VHOST_USER_FS_FLAG_MAP_W) {
> > +                /* Write into file from RAM */
> > +                transferred = pwrite(fd, hostptr, xlat_len, fd_offset);
> > +            } else {
> > +                transferred = EINVAL;
> 
> I don't see how this is handled below by the error checking code. Should
> this be:
> 
>   errno = EINVAL;
>   transferred = -1;
> 
> ?

Thanks; I've gone with  res = - EINVAL; break;

Dave

> 
> > +            }
> > +
> > +            trace_vhost_user_fs_slave_io_loop_res(transferred);
> > +            if (transferred < 0) {
> > +                res = -errno;
> > +                break;
> > +            }
> > +            if (!transferred) {
> > +                /* EOF */
> > +                break;
> > +            }
> > +
> > +            done += transferred;
> > +            fd_offset += transferred;
> > +            gpa += transferred;
> > +            len -= transferred;
> > +        }
> > +    }
> > +    close(fd);
> > +
> > +    trace_vhost_user_fs_slave_io_exit(res, done);
> > +    if (res < 0) {
> > +        return (uint64_t)res;
> > +    }
> > +    return (uint64_t)done;
> > +}


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


