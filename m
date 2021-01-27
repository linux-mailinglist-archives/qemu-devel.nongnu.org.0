Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653D305C66
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 14:04:30 +0100 (CET)
Received: from localhost ([::1]:56366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4kUm-0004cp-K6
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 08:04:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4kSz-0004AB-75
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 08:02:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mszeredi@redhat.com>)
 id 1l4kSv-0003cP-Q5
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 08:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611752551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OnxnXzDV1MxW5Z00jA0DpmhMGDy8KqF/k7TYcUfKm8A=;
 b=TASlYlI6ABTbOVU3i0PbeBv0TxqjwuKwwffnFcnfdKaqjCGepyFcrs3rF6IqQXngxe7qJy
 Ct8UBnHPSA6/SZMBZDAu5eoyJsnQmmTO/qpI9gWxi0YtbhzayA+hzWckDwVnCQyxGsmeyJ
 YKQiQK3DMru9Tks3vDDBHID/9vVe35c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-l0xoojGEOyG59xHJ1y3qkw-1; Wed, 27 Jan 2021 08:02:06 -0500
X-MC-Unique: l0xoojGEOyG59xHJ1y3qkw-1
Received: by mail-qt1-f199.google.com with SMTP id w3so1018917qti.17
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 05:02:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OnxnXzDV1MxW5Z00jA0DpmhMGDy8KqF/k7TYcUfKm8A=;
 b=SJOfZB83pVhPWCoRVTZ8QAXrqG9FQfaNwpnS7odjiV1BvurEGmQ87arz8ih9XE/7C3
 yNwobvu1HhnLiXjuaLVIkjm7okcy65OvizPiXWWrv8JgZPf2Mvp6OeUzoJexIY0s75IF
 YeDorkUD412TCvnTe58y+Ms2l2DEEg+CpggyrmtPxM3DBBjakZAGybtcI3BiKAi3e8rX
 Rmg7kA+zlAMPFRPbj9NHrT5fKU2FgmzwqeYkDkdn5Xv7vnyNpKQ8LGcbAzaHRO1p6t8W
 liey/olHD7Ty45J+orEhqf5zmfB+0eO5rBG6A/+enN07bxNeR6VpvL1l2hkEVihyJgMh
 bmpg==
X-Gm-Message-State: AOAM530jAeSIlhypAgpGqPsHivvKDWoGHc7OgGrMwzYcwQE6M76WuPI9
 q36zq5tuUfsU9WSYMV1MDlCRz95IAVwa1TJJFpL6qYePuZOJpwK3fumuuRYuMUwNCQz4JNHWEuj
 ZW1xD5tb5TjtdL3HSjVE/N1/QSu1PlRY=
X-Received: by 2002:a05:620a:2155:: with SMTP id
 m21mr9994517qkm.395.1611752526183; 
 Wed, 27 Jan 2021 05:02:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC3voFklNH3zfW1DO+hrT4gNo1VAHXmh52ufkqnaYeW07XjVghOwt22tsyMQ8Py0HQRDO/mKBKThSbRfKKblo=
X-Received: by 2002:a05:620a:2155:: with SMTP id
 m21mr9994468qkm.395.1611752525784; 
 Wed, 27 Jan 2021 05:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20210127112131.308451-1-stefanha@redhat.com>
In-Reply-To: <20210127112131.308451-1-stefanha@redhat.com>
From: Miklos Szeredi <mszeredi@redhat.com>
Date: Wed, 27 Jan 2021 14:01:54 +0100
Message-ID: <CAOssrKfY7zDOH3NNbtyARHMCdJJN1tKQJri8ec=igjBf=K6Dog@mail.gmail.com>
Subject: Re: [PATCH v3] virtiofsd: prevent opening of special files
 (CVE-2020-35517)
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mszeredi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mszeredi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>,
 Sergio Lopez Pascual <slp@redhat.com>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>, virtio-fs-list <virtio-fs@redhat.com>,
 Alex Xu <alex@alxu.ca>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 P J P <ppandit@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 12:21 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
              }
> @@ -1654,9 +1677,11 @@ static void update_open_flags(int writeback, int allow_direct_io,
>  static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
>                        mode_t mode, struct fuse_file_info *fi)
>  {
> +    int open_flags = (fi->flags | O_CREAT) & ~O_NOFOLLOW;
>      int fd;
>      struct lo_data *lo = lo_data(req);
>      struct lo_inode *parent_inode;
> +    struct lo_inode *existing_inode = NULL;
>      struct fuse_entry_param e;
>      int err;
>      struct lo_cred old = {};
> @@ -1682,11 +1707,23 @@ static void lo_create(fuse_req_t req, fuse_ino_t parent, const char *name,
>
>      update_open_flags(lo->writeback, lo->allow_direct_io, fi);
>
> -    fd = openat(parent_inode->fd, name, (fi->flags | O_CREAT) & ~O_NOFOLLOW,
> -                mode);
> +    /* First, try to create a new file but don't open existing files */
> +    fd = openat(parent_inode->fd, name, open_flags | O_EXCL, mode);
>      err = fd == -1 ? errno : 0;
> +
>      lo_restore_cred(&old);
>
> +    /* Second, open existing files if O_EXCL was not specified */
> +    if (err == EEXIST && !(fi->flags & O_EXCL)) {
> +        existing_inode = lookup_name(req, parent, name);
> +        if (existing_inode) {
> +            fd = lo_inode_open(lo, existing_inode, open_flags);
> +            if (fd < 0) {
> +                err = -fd;
> +            }
> +        }
> +    }
> +
>      if (!err) {
>          ssize_t fh;

It's more of a mess than I thought.

The problem here is there can also be a race between the open and the
subsequent lo_do_lookup().

At this point it's probably enough to verify that fuse_entry_param
refers to the same object as the fh (using fstat and comparing st_dev
and st_ino).

Also O_CREAT open is not supposed to return ENOENT, so failure to open
without O_CREAT (race between O_CREAT open and plain open) should at
least translate error to ESTALE or EIO.

Thanks,
Miklos


