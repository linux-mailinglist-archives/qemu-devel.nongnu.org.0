Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B8A49EA3F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 19:18:51 +0100 (CET)
Received: from localhost ([::1]:46652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD9MA-0002Zo-8t
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 13:18:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD8vF-000595-9d
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:51:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nD8vA-0002J1-OB
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:50:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643305855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G6zwxs0Jd0DZEDfB6H9M6AeSwj7PdN0XFzfjRkGHg7A=;
 b=fSo8/iQVhep7HfycTtxUbFrjQa1aLir7Wl22VrigtBAuE7nEJayrpZdZVCPqXn9Pzl6vmn
 iT7ssoYme2tVN3A2CWn7ocqy3ce4vWUkrlmnuJk7p4VHCWYv8BcfsPa8oJwsEbYYc/0wV4
 r6jnjh2P6mUf4N/V1Fwt4a0kcT+ugoQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-TfxUaGWuMfqlVJVfM7thgg-1; Thu, 27 Jan 2022 12:50:54 -0500
X-MC-Unique: TfxUaGWuMfqlVJVfM7thgg-1
Received: by mail-wm1-f69.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso1817463wmb.6
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 09:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G6zwxs0Jd0DZEDfB6H9M6AeSwj7PdN0XFzfjRkGHg7A=;
 b=P8nxTdKDXfJnAbsyPVdk2kKfePJGOAgm/PPwJxbkQwUSwJMXtf4bVx65LA5G0ZfSkc
 DVMJBQfieVB/x9HLa9UvXh30bJXpq0cLcC8jk/CvIKZ/BVyY2A04Lsez7fKfo9jZTFvu
 2/tsOaFA41gxhlfHoFb9Xh8M6BwUtZFaj4rss4HlA+pmsSrLZMO9JBtWzUW483bldik4
 a8ktG2UFvAqFyk/IiJP9WSOUVnFlS4FzDrAfvy+6tKF4tFD3K2dn5oHDMjqa6kfhnfWU
 Uau//aL2I5IvLsuPJesVwT5dAyaFOA4O+zIZMe8DVOwwKUzFxa6fZTRzO7nf+HU3+Q+W
 PUDQ==
X-Gm-Message-State: AOAM53277g5IH80zkujaO3sJc+GIChTfY5UHfFcwXOzsxXjcWE4XzZTT
 48hDo4peOT3NbSbn9TtiUncYrU/SemIr3bKQs7AWCZMPxYvBNVAe+jJbumsMM+sPcI2PXt5DxiI
 qNrm2IDqhwxZ5tv0=
X-Received: by 2002:a05:600c:22c3:: with SMTP id
 3mr4044080wmg.21.1643305853003; 
 Thu, 27 Jan 2022 09:50:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeSiK2Z/9empX5v4URbgsauDqd3qZ4+kRnYfB1P3HzHhQz9AoEyObuHiSf1pEmiRUOcWgDWA==
X-Received: by 2002:a05:600c:22c3:: with SMTP id
 3mr4044067wmg.21.1643305852766; 
 Thu, 27 Jan 2022 09:50:52 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m8sm2523717wrn.106.2022.01.27.09.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 09:50:52 -0800 (PST)
Date: Thu, 27 Jan 2022 17:50:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v4 3/9] virtiofsd: Parse extended "struct fuse_init_in"
Message-ID: <YfLberQgn4DV4MYS@work-vm>
References: <20220124212455.83968-1-vgoyal@redhat.com>
 <20220124212455.83968-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220124212455.83968-4-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Add some code to parse extended "struct fuse_init_in". And use a local
> variable "flag" to represent 64 bit flags. This will make it easier
> to add more features without having to worry about two 32bit flags (->flags
> and ->flags2) in "fuse_struct_in".
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> ---
>  tools/virtiofsd/fuse_lowlevel.c | 55 ++++++++++++++++++++-------------
>  1 file changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index ce29a70253..c3af5ede08 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1886,6 +1886,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>      struct fuse_session *se = req->se;
>      size_t bufsize = se->bufsize;
>      size_t outargsize = sizeof(outarg);
> +    uint64_t flags = 0;
>  
>      (void)nodeid;
>  
> @@ -1902,11 +1903,21 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>              fuse_reply_err(req, EINVAL);
>              return;
>          }
> +        flags |= arg->flags;
> +    }
> +
> +    /* fuse_init_in was extended again with minor version 36 */
> +    if (sizeof(*arg) > compat2_size && (arg->flags & FUSE_INIT_EXT)) {
> +        if (!fuse_mbuf_iter_advance(iter, sizeof(*arg) - compat2_size)) {
> +            fuse_reply_err(req, EINVAL);
> +            return;
> +        }

Instead of reading upto sizeof(*arg) should we actually read up to the
size of the last field we know about?  That way if fuse_init_in grows
again this wont break?

(Other than that OK)

> +        flags |= (uint64_t) arg->flags2 << 32;
>      }
>  
>      fuse_log(FUSE_LOG_DEBUG, "INIT: %u.%u\n", arg->major, arg->minor);
>      if (arg->major == 7 && arg->minor >= 6) {
> -        fuse_log(FUSE_LOG_DEBUG, "flags=0x%08x\n", arg->flags);
> +        fuse_log(FUSE_LOG_DEBUG, "flags=0x%016llx\n", flags);
>          fuse_log(FUSE_LOG_DEBUG, "max_readahead=0x%08x\n", arg->max_readahead);
>      }
>      se->conn.proto_major = arg->major;
> @@ -1934,68 +1945,68 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>      if (arg->max_readahead < se->conn.max_readahead) {
>          se->conn.max_readahead = arg->max_readahead;
>      }
> -    if (arg->flags & FUSE_ASYNC_READ) {
> +    if (flags & FUSE_ASYNC_READ) {
>          se->conn.capable |= FUSE_CAP_ASYNC_READ;
>      }
> -    if (arg->flags & FUSE_POSIX_LOCKS) {
> +    if (flags & FUSE_POSIX_LOCKS) {
>          se->conn.capable |= FUSE_CAP_POSIX_LOCKS;
>      }
> -    if (arg->flags & FUSE_ATOMIC_O_TRUNC) {
> +    if (flags & FUSE_ATOMIC_O_TRUNC) {
>          se->conn.capable |= FUSE_CAP_ATOMIC_O_TRUNC;
>      }
> -    if (arg->flags & FUSE_EXPORT_SUPPORT) {
> +    if (flags & FUSE_EXPORT_SUPPORT) {
>          se->conn.capable |= FUSE_CAP_EXPORT_SUPPORT;
>      }
> -    if (arg->flags & FUSE_DONT_MASK) {
> +    if (flags & FUSE_DONT_MASK) {
>          se->conn.capable |= FUSE_CAP_DONT_MASK;
>      }
> -    if (arg->flags & FUSE_FLOCK_LOCKS) {
> +    if (flags & FUSE_FLOCK_LOCKS) {
>          se->conn.capable |= FUSE_CAP_FLOCK_LOCKS;
>      }
> -    if (arg->flags & FUSE_AUTO_INVAL_DATA) {
> +    if (flags & FUSE_AUTO_INVAL_DATA) {
>          se->conn.capable |= FUSE_CAP_AUTO_INVAL_DATA;
>      }
> -    if (arg->flags & FUSE_DO_READDIRPLUS) {
> +    if (flags & FUSE_DO_READDIRPLUS) {
>          se->conn.capable |= FUSE_CAP_READDIRPLUS;
>      }
> -    if (arg->flags & FUSE_READDIRPLUS_AUTO) {
> +    if (flags & FUSE_READDIRPLUS_AUTO) {
>          se->conn.capable |= FUSE_CAP_READDIRPLUS_AUTO;
>      }
> -    if (arg->flags & FUSE_ASYNC_DIO) {
> +    if (flags & FUSE_ASYNC_DIO) {
>          se->conn.capable |= FUSE_CAP_ASYNC_DIO;
>      }
> -    if (arg->flags & FUSE_WRITEBACK_CACHE) {
> +    if (flags & FUSE_WRITEBACK_CACHE) {
>          se->conn.capable |= FUSE_CAP_WRITEBACK_CACHE;
>      }
> -    if (arg->flags & FUSE_NO_OPEN_SUPPORT) {
> +    if (flags & FUSE_NO_OPEN_SUPPORT) {
>          se->conn.capable |= FUSE_CAP_NO_OPEN_SUPPORT;
>      }
> -    if (arg->flags & FUSE_PARALLEL_DIROPS) {
> +    if (flags & FUSE_PARALLEL_DIROPS) {
>          se->conn.capable |= FUSE_CAP_PARALLEL_DIROPS;
>      }
> -    if (arg->flags & FUSE_POSIX_ACL) {
> +    if (flags & FUSE_POSIX_ACL) {
>          se->conn.capable |= FUSE_CAP_POSIX_ACL;
>      }
> -    if (arg->flags & FUSE_HANDLE_KILLPRIV) {
> +    if (flags & FUSE_HANDLE_KILLPRIV) {
>          se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV;
>      }
> -    if (arg->flags & FUSE_NO_OPENDIR_SUPPORT) {
> +    if (flags & FUSE_NO_OPENDIR_SUPPORT) {
>          se->conn.capable |= FUSE_CAP_NO_OPENDIR_SUPPORT;
>      }
> -    if (!(arg->flags & FUSE_MAX_PAGES)) {
> +    if (!(flags & FUSE_MAX_PAGES)) {
>          size_t max_bufsize = FUSE_DEFAULT_MAX_PAGES_PER_REQ * getpagesize() +
>                               FUSE_BUFFER_HEADER_SIZE;
>          if (bufsize > max_bufsize) {
>              bufsize = max_bufsize;
>          }
>      }
> -    if (arg->flags & FUSE_SUBMOUNTS) {
> +    if (flags & FUSE_SUBMOUNTS) {
>          se->conn.capable |= FUSE_CAP_SUBMOUNTS;
>      }
> -    if (arg->flags & FUSE_HANDLE_KILLPRIV_V2) {
> +    if (flags & FUSE_HANDLE_KILLPRIV_V2) {
>          se->conn.capable |= FUSE_CAP_HANDLE_KILLPRIV_V2;
>      }
> -    if (arg->flags & FUSE_SETXATTR_EXT) {
> +    if (flags & FUSE_SETXATTR_EXT) {
>          se->conn.capable |= FUSE_CAP_SETXATTR_EXT;
>      }
>  #ifdef HAVE_SPLICE
> @@ -2063,7 +2074,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>      if (se->conn.max_write < bufsize - FUSE_BUFFER_HEADER_SIZE) {
>          se->bufsize = se->conn.max_write + FUSE_BUFFER_HEADER_SIZE;
>      }
> -    if (arg->flags & FUSE_MAX_PAGES) {
> +    if (flags & FUSE_MAX_PAGES) {
>          outarg.flags |= FUSE_MAX_PAGES;
>          outarg.max_pages = (se->conn.max_write - 1) / getpagesize() + 1;
>      }
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


