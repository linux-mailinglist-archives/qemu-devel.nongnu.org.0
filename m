Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E114A8C69
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 20:28:09 +0100 (CET)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFhm4-0004FS-6Q
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 14:28:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFhI6-0006eV-Tw
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:57:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nFhI2-0004dd-J7
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 13:57:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643914624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y+4+4ixtIT6x2dmhA9cYXg0sP0x0ukNHDH9/0mQ4A9g=;
 b=hrBieZ3ADdXpezPwtmmjSBIgrzwuL6jkyPNON7/7uCgSNBl69UlgKSf39FX26Lm6eHGdEI
 VsY/J99hIFy4A9HFH/BJLkbSwv1qAP/F41lzy+gnXE3dzEafGiZcy66YYPVHAwkx6+lsxM
 EMjd05uU4piKAdJ1Etj86ViE2/gy+6k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-Fnru6TvsMPONZ5-9NB2shg-1; Thu, 03 Feb 2022 13:57:02 -0500
X-MC-Unique: Fnru6TvsMPONZ5-9NB2shg-1
Received: by mail-wr1-f70.google.com with SMTP id
 s25-20020adfa299000000b001d8d032255fso1029682wra.14
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 10:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y+4+4ixtIT6x2dmhA9cYXg0sP0x0ukNHDH9/0mQ4A9g=;
 b=Wq8wJ9CHjbvao8HEeLx9zgQSPZUVmUhKXKlf/EuJ4WR6qmoGCQrIRAHHkLD3CiMcUs
 Pp7sjJxVK0lVJT2Nrku7JNXoZE4K8PR4uNPSnUm32+vTOWHEYsnxHU6AZ6PmMr9N2OGL
 MotxXVU/+4HgpV1o8v0gxEzPUlPMc/NjhPy7zGZhdAXFgUEwst6QOiZQ9+Q5rER2y500
 6DwsgOylypYLm9GSAYKC+67iwIy4mlMJFjdYtP9OoLynLONcMp7KRKZZdpVy9h3d+pVX
 CrUfFnlrKDqoJC2bunPJBn10srxjM7GnR6M/24yO4a3PzaZpMteRu6Hbv6/lTxMSpMJY
 I1iA==
X-Gm-Message-State: AOAM533uV5++7ddhkyo+v2fHzgVP/+5WfsioyfTlDpQFqy4d1xDGEBKN
 s/1ehfHlXFvr+1cmgX6/VaNQgcFgXlhgFNbiL8EJjs34Whanrc5agiSWSAGXhqTUeq0SF8DeyX4
 MTPDx5bqaojSJRs4=
X-Received: by 2002:a7b:c217:: with SMTP id x23mr11566751wmi.177.1643914621588; 
 Thu, 03 Feb 2022 10:57:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy68EpYHrM4fOWI0JlMjF10VNgB1WYz0dtVop3iFUVwXK1QnS116WSpyeELKiM9Ot1Q8G2OnQ==
X-Received: by 2002:a7b:c217:: with SMTP id x23mr11566741wmi.177.1643914621297; 
 Thu, 03 Feb 2022 10:57:01 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m11sm7103993wmi.16.2022.02.03.10.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 10:57:00 -0800 (PST)
Date: Thu, 3 Feb 2022 18:56:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v5 3/9] virtiofsd: Parse extended "struct fuse_init_in"
Message-ID: <Yfwlekwcu35SN9MU@work-vm>
References: <20220202193935.268777-1-vgoyal@redhat.com>
 <20220202193935.268777-4-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220202193935.268777-4-vgoyal@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, qemu-devel@nongnu.org
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
>  tools/virtiofsd/fuse_lowlevel.c | 62 +++++++++++++++++++++------------
>  1 file changed, 40 insertions(+), 22 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index ce29a70253..1f10dcc75b 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1881,11 +1881,15 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>  {
>      size_t compat_size = offsetof(struct fuse_init_in, max_readahead);
>      size_t compat2_size = offsetof(struct fuse_init_in, flags) + sizeof(uint32_t);
> +    /* Fuse structure extended with minor version 36 */
> +    size_t compat3_size = offsetof(struct fuse_init_in, unused) +
> +                          (11 * sizeof(uint32_t));

Hmm that's actually quite difficult; what we have at the moment is:

struct fuse_init_in {
        uint32_t        major;
        uint32_t        minor;
        uint32_t        max_readahead;
        uint32_t        flags;
        uint32_t        flags2;
        uint32_t        unused[11];
};

so imagine someone comes along and changes that to:

struct fuse_init_in {    
        uint32_t        major;
        uint32_t        minor;
        uint32_t        max_readahead;
        uint32_t        flags;
        uint32_t        flags2;
        uint32_t        flags3;
        uint32_t        unused[10];
};

Then this code will break (oddly!), where the old code that didn't reference the
unusued field wouldn't.
It looks like qemu defines an 'endof' macro, so I think you can do:

  size_t compat3_size = endof(struct fuse_init_in, unused);

I think that should work as long as people nibble away at unused from
the top.

Dave


>      struct fuse_init_in *arg;
>      struct fuse_init_out outarg;
>      struct fuse_session *se = req->se;
>      size_t bufsize = se->bufsize;
>      size_t outargsize = sizeof(outarg);
> +    uint64_t flags = 0;
>  
>      (void)nodeid;
>  
> @@ -1902,11 +1906,25 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>              fuse_reply_err(req, EINVAL);
>              return;
>          }
> +        flags |= arg->flags;
> +    }
> +
> +    /*
> +     * fuse_init_in was extended again with minor version 36. Just read
> +     * current known size of fuse_init so that future extension and
> +     * header rebase does not cause breakage.
> +     */
> +    if (sizeof(*arg) > compat2_size && (arg->flags & FUSE_INIT_EXT)) {
> +        if (!fuse_mbuf_iter_advance(iter, compat3_size - compat2_size)) {
> +            fuse_reply_err(req, EINVAL);
> +            return;
> +        }
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
> @@ -1934,68 +1952,68 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
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
> @@ -2063,7 +2081,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>      if (se->conn.max_write < bufsize - FUSE_BUFFER_HEADER_SIZE) {
>          se->bufsize = se->conn.max_write + FUSE_BUFFER_HEADER_SIZE;
>      }
> -    if (arg->flags & FUSE_MAX_PAGES) {
> +    if (flags & FUSE_MAX_PAGES) {
>          outarg.flags |= FUSE_MAX_PAGES;
>          outarg.max_pages = (se->conn.max_write - 1) / getpagesize() + 1;
>      }
> -- 
> 2.34.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


