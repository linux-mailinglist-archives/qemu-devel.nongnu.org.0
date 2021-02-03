Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0132130DE2D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 16:31:46 +0100 (CET)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7K89-0008Ki-1o
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 10:31:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l7K5e-0007TE-6c
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:29:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l7K5b-0005Iw-9P
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 10:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612366143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=edXCLStR7O8t8IGb8ol1L/35sP62jA1D/zG9wnzzgrU=;
 b=e2nvWY2bG82Dv32EmVQmEpVo6PSXOFRRJ4mGQYL8Df4yWw1JklUPuxbVHzPZqPH9SHhz1M
 A7X90wURUXsGZptIKhSMI8n1wgoexdQvwVjDUNVg4UCP5TOZ14FDT09Ycpzf5QnU7wyMx8
 h6SKixLahFoS3iInnJXTlF6KDxXbau8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-YAkZMDg7OLKAiJggSNbpRQ-1; Wed, 03 Feb 2021 10:29:02 -0500
X-MC-Unique: YAkZMDg7OLKAiJggSNbpRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20B72107ACC7;
 Wed,  3 Feb 2021 15:29:01 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-88.rdu2.redhat.com [10.10.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 147A060C5F;
 Wed,  3 Feb 2021 15:28:51 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 589ED22054F; Wed,  3 Feb 2021 10:28:50 -0500 (EST)
Date: Wed, 3 Feb 2021 10:28:50 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v4 3/3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
Message-ID: <20210203152850.GA3307@redhat.com>
References: <20210203113719.83633-1-stefanha@redhat.com>
 <20210203113719.83633-4-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210203113719.83633-4-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: mszeredi@redhat.com, Daniel Berrange <berrange@redhat.com>, slp@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Alex Xu <alex@alxu.ca>, P J P <ppandit@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 03, 2021 at 11:37:19AM +0000, Stefan Hajnoczi wrote:

[..]
> @@ -1727,36 +1764,38 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
>  
>      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
>  
> -    fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
> -                mode);
> +    /* Try to create a new file but don't open existing files */
> +    fd = openat(parent_inode->fd, name, fi->flags | O_CREAT | O_EXCL, mode);
>      err = fd == -1 ? errno : 0;
> +
>      lo_restore_cred(&old);
>  
> -    if (!err) {
> -        ssize_t fh;
> -
> -        pthread_mutex_lock(&lo->mutex);
> -        fh = lo_add_fd_mapping(lo, fd);
> -        pthread_mutex_unlock(&lo->mutex);
> -        if (fh == -1) {
> -            close(fd);
> -            err = ENOMEM;
> -            goto out;
> -        }
> +    /* Ignore the error if file exists and O_EXCL was not given */
> +    if (err && !(err == EEXIST && !(fi->flags & O_EXCL))) {

Can this check be simplified to.
       if (err && (err == EEXIST && (fi->flags & O_EXCL)) {
           goto out;
       }
> +        goto out;
> +    }


Vivek


