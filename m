Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189344BA18F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 14:42:55 +0100 (CET)
Received: from localhost ([::1]:43688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKh3e-0007QC-5z
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 08:42:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKgxx-0004Co-Hx
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:37:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nKgxv-0001Lz-2N
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645105017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LK2eLRH1TqyBFmiR9BklW/jr3YLNDhaAE/MeiB9B1oU=;
 b=ho19ikiUlOc72LdcutQXkH3He3G/uNgbYJpz2JLGEAT4/ELczG9Fh4OuNUxGAPUpgEjuuE
 7zykWEPU01uHLetKzZTH0Lq7VZM9eVCJQ/DBT6JjYImD/o9Z/Iv2fG8uC86M1PSHEzwPpm
 +LGmvnuwuXcade4C+IkPvXfB3rBNqsA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-rR5y2mpvNDqTmEy9I1mqyg-1; Thu, 17 Feb 2022 08:36:56 -0500
X-MC-Unique: rR5y2mpvNDqTmEy9I1mqyg-1
Received: by mail-wm1-f71.google.com with SMTP id
 7-20020a1c1907000000b003471d9bbe8dso2776129wmz.0
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 05:36:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LK2eLRH1TqyBFmiR9BklW/jr3YLNDhaAE/MeiB9B1oU=;
 b=b/wpnOX3zKflBvAozi3Lahr4FkbKpLrRlstlol073AEL2/PDcCwrNsBUY2EtDhbH0T
 /fOmjtlW8+P4gX3DbmsOQomWQTyTF+jKWoCLgZwqNf8Fx8DfUS8nRsq/4PVk3VwxhKnP
 LxKadxgAAyESGnCZ+uU1NJBFYUc+vDteuE+4Z6Z+AdV59UNl+UsYc7haFoeMBh+BU506
 5HtrvT6lVeMymuOPeSFsZCy45mnB2ROlGM8hH+hhpL1dItvJY4BhJeoJlAZkF4s9rbe1
 FwY5rNsdGZWOxqNJlYi73v5hFSBIEiD+eXSfCcXeODl/mdJU86UxKC4JSe3aQjhYPyNn
 hBkw==
X-Gm-Message-State: AOAM531ax6NJqkevEorWrCXWvBRpUr/D+0XLCIFB5lJgfaSB4/B9M75T
 0fRP6+RWExQqidH+Iq8+pK/DSp84MxmlavRb02q3hcl6mI2UYVMHHTD2msv8dbdNPTRNURHdLX2
 ipPj2Obp1PntqJbE=
X-Received: by 2002:a7b:c44c:0:b0:37b:baaf:ae36 with SMTP id
 l12-20020a7bc44c000000b0037bbaafae36mr2751991wmi.81.1645105014855; 
 Thu, 17 Feb 2022 05:36:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzgOvICHk+lw5Yt3ZOpcfPVmP/K2K0rQkzsrHGmzOg7oYskVOG/SMDaTVmuWhxxBcAH+SPLQ==
X-Received: by 2002:a7b:c44c:0:b0:37b:baaf:ae36 with SMTP id
 l12-20020a7bc44c000000b0037bbaafae36mr2751973wmi.81.1645105014632; 
 Thu, 17 Feb 2022 05:36:54 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id m8sm1388784wms.4.2022.02.17.05.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 05:36:54 -0800 (PST)
Date: Thu, 17 Feb 2022 13:36:52 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PULL 00/12] virtiofs queue
Message-ID: <Yg5PdHX0+0GJ2Si5@work-vm>
References: <20220216173625.128109-1-dgilbert@redhat.com>
 <Yg1THoNoxjSAcK7u@work-vm> <Yg1nFPqBnOf+4pDi@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yg1nFPqBnOf+4pDi@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: virtio-fs@redhat.com, sebastian.hasler@stuvus.uni-stuttgart.de,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Wed, Feb 16, 2022 at 07:40:14PM +0000, Dr. David Alan Gilbert wrote:
> > * Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > > 
> > > The following changes since commit c13b8e9973635f34f3ce4356af27a311c993729c:
> > > 
> > >   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220216' into staging (2022-02-16 09:57:11 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   https://gitlab.com/dagrh/qemu.git tags/pull-virtiofs-20220216
> > > 
> > > for you to fetch changes up to 47cc3ef597b2ee926c13c9433f4f73645429e128:
> > > 
> > >   virtiofsd: Add basic support for FUSE_SYNCFS request (2022-02-16 17:29:32 +0000)
> > 
> > NAK
> > this doesn't build on older Linuxes.
> > 
> > Rework version in the works.
> 
> Hi David,
> 
> I think it is patch 8 which is using gettid(). I have updated that
> patch and now I am using syscall(NR_gettid) instead. Here is the
> updated patch. I hope this solves the build on older Linux issue.
> 
> 
> Subject: virtiofsd: Add helpers to work with /proc/self/task/tid/attr/fscreate
> 
> Soon we will be able to create and also set security context on the file
> atomically using /proc/self/task/tid/attr/fscreate knob. If this knob
> is available on the system, first set the knob with the desired context
> and then create the file. It will be created with the context set in
> fscreate. This works basically for SELinux and its per thread.
> 
> This patch just introduces the helper functions. Subsequent patches will
> make use of these helpers.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Thanks, I'll merge that in.

Dave

> ---
>  tools/virtiofsd/passthrough_ll.c |   92 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
> ===================================================================
> --- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2022-02-16 15:53:13.657015138 -0500
> +++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2022-02-16 15:55:14.911234993 -0500
> @@ -173,10 +173,14 @@ struct lo_data {
>  
>      /* An O_PATH file descriptor to /proc/self/fd/ */
>      int proc_self_fd;
> +    /* An O_PATH file descriptor to /proc/self/task/ */
> +    int proc_self_task;
>      int user_killpriv_v2, killpriv_v2;
>      /* If set, virtiofsd is responsible for setting umask during creation */
>      bool change_umask;
>      int user_posix_acl, posix_acl;
> +    /* Keeps track if /proc/<pid>/attr/fscreate should be used or not */
> +    bool use_fscreate;
>  };
>  
>  static const struct fuse_opt lo_opts[] = {
> @@ -257,6 +261,72 @@ static struct lo_data *lo_data(fuse_req_
>  }
>  
>  /*
> + * Tries to figure out if /proc/<pid>/attr/fscreate is usable or not. With
> + * selinux=0, read from fscreate returns -EINVAL.
> + *
> + * TODO: Link with libselinux and use is_selinux_enabled() instead down
> + * the line. It probably will be more reliable indicator.
> + */
> +static bool is_fscreate_usable(struct lo_data *lo)
> +{
> +    char procname[64];
> +    int fscreate_fd;
> +    size_t bytes_read;
> +
> +    sprintf(procname, "%ld/attr/fscreate", syscall(SYS_gettid));
> +    fscreate_fd = openat(lo->proc_self_task, procname, O_RDWR);
> +    if (fscreate_fd == -1) {
> +        return false;
> +    }
> +
> +    bytes_read = read(fscreate_fd, procname, 64);
> +    close(fscreate_fd);
> +    if (bytes_read == -1) {
> +        return false;
> +    }
> +    return true;
> +}
> +
> +/* Helpers to set/reset fscreate */
> +__attribute__((unused))
> +static int open_set_proc_fscreate(struct lo_data *lo, const void *ctx,
> +                                  size_t ctxlen,int *fd)
> +{
> +    char procname[64];
> +    int fscreate_fd, err = 0;
> +    size_t written;
> +
> +    sprintf(procname, "%ld/attr/fscreate", syscall(SYS_gettid));
> +    fscreate_fd = openat(lo->proc_self_task, procname, O_WRONLY);
> +    err = fscreate_fd == -1 ? errno : 0;
> +    if (err) {
> +        return err;
> +    }
> +
> +    written = write(fscreate_fd, ctx, ctxlen);
> +    err = written == -1 ? errno : 0;
> +    if (err) {
> +        goto out;
> +    }
> +
> +    *fd = fscreate_fd;
> +    return 0;
> +out:
> +    close(fscreate_fd);
> +    return err;
> +}
> +
> +__attribute__((unused))
> +static void close_reset_proc_fscreate(int fd)
> +{
> +    if ((write(fd, NULL, 0)) == -1) {
> +        fuse_log(FUSE_LOG_WARNING, "Failed to reset fscreate. err=%d\n", errno);
> +    }
> +    close(fd);
> +    return;
> +}
> +
> +/*
>   * Load capng's state from our saved state if the current thread
>   * hadn't previously been loaded.
>   * returns 0 on success
> @@ -3522,6 +3592,15 @@ static void setup_namespaces(struct lo_d
>          exit(1);
>      }
>  
> +    /* Get the /proc/self/task descriptor */
> +    lo->proc_self_task = open("/proc/self/task/", O_PATH);
> +    if (lo->proc_self_task == -1) {
> +        fuse_log(FUSE_LOG_ERR, "open(/proc/self/task, O_PATH): %m\n");
> +        exit(1);
> +    }
> +
> +    lo->use_fscreate = is_fscreate_usable(lo);
> +
>      /*
>       * We only need /proc/self/fd. Prevent ".." from accessing parent
>       * directories of /proc/self/fd by bind-mounting it over /proc. Since / was
> @@ -3738,6 +3817,14 @@ static void setup_chroot(struct lo_data
>          exit(1);
>      }
>  
> +    lo->proc_self_task = open("/proc/self/task", O_PATH);
> +    if (lo->proc_self_fd == -1) {
> +        fuse_log(FUSE_LOG_ERR, "open(\"/proc/self/task\", O_PATH): %m\n");
> +        exit(1);
> +    }
> +
> +    lo->use_fscreate = is_fscreate_usable(lo);
> +
>      /*
>       * Make the shared directory the file system root so that FUSE_OPEN
>       * (lo_open()) cannot escape the shared directory by opening a symlink.
> @@ -3923,6 +4010,10 @@ static void fuse_lo_data_cleanup(struct
>          close(lo->proc_self_fd);
>      }
>  
> +    if (lo->proc_self_task >= 0) {
> +        close(lo->proc_self_task);
> +    }
> +
>      if (lo->root.fd >= 0) {
>          close(lo->root.fd);
>      }
> @@ -3950,6 +4041,7 @@ int main(int argc, char *argv[])
>          .posix_lock = 0,
>          .allow_direct_io = 0,
>          .proc_self_fd = -1,
> +        .proc_self_task = -1,
>          .user_killpriv_v2 = -1,
>          .user_posix_acl = -1,
>      };
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


