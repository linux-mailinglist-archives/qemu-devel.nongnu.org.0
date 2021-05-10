Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101DB3797AE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:25:21 +0200 (CEST)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBWq-0005c1-4W
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lgBN0-0001mH-KC
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:15:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lgBMx-0008RC-VU
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620674107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pi7kECIiU4P0HxcADHixR9RjMXJxL4dLTLCibjs6LhI=;
 b=MBJ63oVkcntcg1bgxzlm1oqE+9qmUczo7QiVYBcmAKdgKfXg/0omV8vRw0FmheZ3r4XbZe
 tkAqExjZqs4nq6WTU++lyC6euUO3VlisfziCumViFSXDaIO0hM7aRHXVRj/2nfgsncskfd
 ipQZkkLV8yPeajHNOb6HMmvOHVIO9Xk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-O1pS-gAkMYSbkq86U1XWZg-1; Mon, 10 May 2021 15:15:05 -0400
X-MC-Unique: O1pS-gAkMYSbkq86U1XWZg-1
Received: by mail-qk1-f200.google.com with SMTP id
 u126-20020a3792840000b02902e769005fe1so12425171qkd.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 12:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pi7kECIiU4P0HxcADHixR9RjMXJxL4dLTLCibjs6LhI=;
 b=HqdhaXFzRcbKJq8S1/OJZ9M4G1x16NuCMCSPTqlsOrmFDXWcUqoOmSiIO1N2rjCCjI
 W2BjqYLTAKxBBGX19jP39ahZuDPM+WXYGGxFYZVQBgtK9Gs4qLB9brDmHdxcsnF25r05
 LrEcbw6Zc9iX/A5ct8mwjpCa3QnVzPAqstYsfufwyssc2dCc5FV742DHWKwvy+4SdiBQ
 2wgiqaC2T9GfDxDw9l6WePaupQ+1bZY5Bo234RfSB6PkJmKezFNoMtVMyN0tBhSraCWF
 OcjEqpjEcudFuYkPDfwL8rZr4RHzZh3StIkL/Rw4eSkyKbNWbA2kzoJssw0JRcV0RKEM
 0DFA==
X-Gm-Message-State: AOAM530fybZNrNUZcReO+uRB8FCouhh7px2M4wrA1DtB7erwaIaaqSDo
 /hRMXALCSQPcPQmdFeA4WsvAHAoG7rS5fWFrcvf62y9IxsJVDtocUXGjlrpaSbsFNiz/r9wfz//
 5njpOhhfGJuZD4mg=
X-Received: by 2002:ad4:46a9:: with SMTP id br9mr24989758qvb.35.1620674105086; 
 Mon, 10 May 2021 12:15:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC4/Eh4iP6ZZa602M9CC6+dYSn2WTAiLE6ttSzoUgYV0RDFRm5cEJfjmR4gnA1aVPnAwVSOQ==
X-Received: by 2002:ad4:46a9:: with SMTP id br9mr24989722qvb.35.1620674104749; 
 Mon, 10 May 2021 12:15:04 -0700 (PDT)
Received: from horse (pool-173-76-174-238.bstnma.fios.verizon.net.
 [173.76.174.238])
 by smtp.gmail.com with ESMTPSA id 26sm12402346qtd.73.2021.05.10.12.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 12:15:04 -0700 (PDT)
Date: Mon, 10 May 2021 15:15:02 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [for-6.1 v3 3/3] virtiofsd: Add support for FUSE_SYNCFS request
Message-ID: <20210510191502.GA193692@horse>
References: <20210510155539.998747-1-groug@kaod.org>
 <20210510155539.998747-4-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210510155539.998747-4-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 05:55:39PM +0200, Greg Kurz wrote:
> Honor the expected behavior of syncfs() to synchronously flush all data
> and metadata on linux systems. Simply loop on all known submounts and
> call syncfs() on them.
> 
> Note that syncfs() might suffer from a time penalty if the submounts
> are being hammered by some unrelated workload on the host. The only
> solution to avoid that is to avoid shared submounts.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  tools/virtiofsd/fuse_lowlevel.c       | 11 ++++++++
>  tools/virtiofsd/fuse_lowlevel.h       | 12 +++++++++
>  tools/virtiofsd/passthrough_ll.c      | 38 +++++++++++++++++++++++++++
>  tools/virtiofsd/passthrough_seccomp.c |  1 +
>  4 files changed, 62 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index 58e32fc96369..3be95ec903c9 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1870,6 +1870,16 @@ static void do_lseek(fuse_req_t req, fuse_ino_t nodeid,
>      }
>  }
>  
> +static void do_syncfs(fuse_req_t req, fuse_ino_t nodeid,
> +                      struct fuse_mbuf_iter *iter)
> +{
> +    if (req->se->op.syncfs) {
> +        req->se->op.syncfs(req);
> +    } else {
> +        fuse_reply_err(req, ENOSYS);
> +    }
> +}
> +
>  static void do_init(fuse_req_t req, fuse_ino_t nodeid,
>                      struct fuse_mbuf_iter *iter)
>  {
> @@ -2267,6 +2277,7 @@ static struct {
>      [FUSE_RENAME2] = { do_rename2, "RENAME2" },
>      [FUSE_COPY_FILE_RANGE] = { do_copy_file_range, "COPY_FILE_RANGE" },
>      [FUSE_LSEEK] = { do_lseek, "LSEEK" },
> +    [FUSE_SYNCFS] = { do_syncfs, "SYNCFS" },
>  };
>  
>  #define FUSE_MAXOP (sizeof(fuse_ll_ops) / sizeof(fuse_ll_ops[0]))
> diff --git a/tools/virtiofsd/fuse_lowlevel.h b/tools/virtiofsd/fuse_lowlevel.h
> index 3bf786b03485..890c520b195a 100644
> --- a/tools/virtiofsd/fuse_lowlevel.h
> +++ b/tools/virtiofsd/fuse_lowlevel.h
> @@ -1225,6 +1225,18 @@ struct fuse_lowlevel_ops {
>       */
>      void (*lseek)(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
>                    struct fuse_file_info *fi);
> +
> +    /**
> +     * Synchronize file system content
> +     *
> +     * If this request is answered with an error code of ENOSYS,
> +     * this is treated as success and future calls to syncfs() will
> +     * succeed automatically without being sent to the filesystem
> +     * process.
> +     *
> +     * @param req request handle
> +     */
> +    void (*syncfs)(fuse_req_t req);
>  };
>  
>  /**
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index dc940a1d048b..289900c6d274 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3153,6 +3153,43 @@ static void lo_lseek(fuse_req_t req, fuse_ino_t ino, off_t off, int whence,
>      }
>  }
>  
> +static void lo_syncfs(fuse_req_t req)
> +{
> +    struct lo_data *lo = lo_data(req);
> +    GHashTableIter iter;
> +    gpointer key, value;
> +    int err = 0;
> +
> +    pthread_mutex_lock(&lo->mutex);
> +
> +    g_hash_table_iter_init(&iter, lo->mnt_inodes);
> +    while (g_hash_table_iter_next(&iter, &key, &value)) {
> +        struct lo_inode *inode = value;
> +        int fd;
> +
> +        fuse_log(FUSE_LOG_DEBUG, "lo_syncfs(ino=%" PRIu64 ")\n",
> +                 inode->fuse_ino);
> +
> +        fd = lo_inode_open(lo, inode, O_RDONLY);
> +        if (fd < 0) {
> +            err = -fd;
> +            break;
> +        }
> +
> +        if (syncfs(fd) < 0) {

I don't have a good feeling about calling syncfs() with lo->mutex held.
This seems to be that global mutex which is held at so many places
and will serialize everything else. I think we agreed that syncfs()
can take 10s of seconds if fs is busy. And that means we will stall
other filesystem operations too.

So will be good if we can call syncfs() outside the lock. May be prepare
a list of inodes which are there, take a reference and drop the lock.
call syncfs and then drop the reference on inode.

Vivek

> +            err = errno;
> +            close(fd);
> +            break;
> +        }
> +
> +        close(fd);
> +    }
> +
> +    pthread_mutex_unlock(&lo->mutex);
> +
> +    fuse_reply_err(req, err);
> +}
> +
>  static void lo_destroy(void *userdata)
>  {
>      struct lo_data *lo = (struct lo_data *)userdata;
> @@ -3214,6 +3251,7 @@ static struct fuse_lowlevel_ops lo_oper = {
>      .copy_file_range = lo_copy_file_range,
>  #endif
>      .lseek = lo_lseek,
> +    .syncfs = lo_syncfs,
>      .destroy = lo_destroy,
>  };
>  
> diff --git a/tools/virtiofsd/passthrough_seccomp.c b/tools/virtiofsd/passthrough_seccomp.c
> index 62441cfcdb95..343188447901 100644
> --- a/tools/virtiofsd/passthrough_seccomp.c
> +++ b/tools/virtiofsd/passthrough_seccomp.c
> @@ -107,6 +107,7 @@ static const int syscall_allowlist[] = {
>      SCMP_SYS(set_robust_list),
>      SCMP_SYS(setxattr),
>      SCMP_SYS(symlinkat),
> +    SCMP_SYS(syncfs),
>      SCMP_SYS(time), /* Rarely needed, except on static builds */
>      SCMP_SYS(tgkill),
>      SCMP_SYS(unlinkat),
> -- 
> 2.26.3
> 


