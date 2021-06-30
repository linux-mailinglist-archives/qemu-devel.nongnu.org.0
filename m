Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9833B88D0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:57:13 +0200 (CEST)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfOZ-0002d0-Pg
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:57:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyfAz-0004nW-Bt
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyfAs-0007d7-Mi
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625078580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zjPi2QtrPkKKTzmU1jQFMxKuCPKpXIZijSgCcld2sZk=;
 b=WcfRPncmUu0ihPoTlilVaEh88rPODE6OMaRqlMQgWWglfL+8WhMdd7Qb2UfxZGlHcOl5mF
 cWbLSNm76RVXpWJlpHM5q9eG1ggg9Or06QaKISM4jPbVPuxNDQbCVJadwMH9EsoKPq1TQO
 3hlJjcS2k6ddaZlxUr97EP81H5R8G+I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-8iVcuGNSPQK6hOuVEWoPdg-1; Wed, 30 Jun 2021 14:42:58 -0400
X-MC-Unique: 8iVcuGNSPQK6hOuVEWoPdg-1
Received: by mail-wr1-f69.google.com with SMTP id
 i17-20020a5d43910000b02901258b767ad5so1313837wrq.2
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zjPi2QtrPkKKTzmU1jQFMxKuCPKpXIZijSgCcld2sZk=;
 b=pr5VC4e30Hp1GtGL9+3u+UI/InnzsmfXDmIMmuMbJbDy1gyqxjgNr8SN2WvnJu8V42
 ihhvX9x6EaSSY1VX777KvfFKV37ZQekorsm+jpXQ+KM4PtChWRZAnRnBxeWax243akD0
 vGzoclA0uT2YMeksSEuQWALfj1O9emOn/87HhyNLSaBiTKRy9m4iC6YeOsj1Dw5zDYjt
 PdIqJOV/GJk4XDHhs8VvQL+TFCVM19dUNk3O9lAra/3gQMsYfCm1j6F3j8kylowKmTU2
 T2RJVw9RjNi99yN1IZdWjVaG0O3jxdxBdel8ktyP47Nz4cQRee32Rp1mXbziqJipG//a
 6Mdg==
X-Gm-Message-State: AOAM530S+ylGRtiVyMX7ly7xUT8by6ky6AdTYPCWMRR7tNcMh7lBFtw2
 CJb6SQtxXWbmjmurqb8u0z85YyXNN8wodiTIJU5BU4wS9M+7vnM/zRziBV4Wj8KQqrFAiyUwwJt
 TiDPj0MFdBt1Lcd4=
X-Received: by 2002:a05:6000:114a:: with SMTP id
 d10mr40829330wrx.7.1625078577787; 
 Wed, 30 Jun 2021 11:42:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5apesTRzSPnTdgzYPWidwGVX4zSO+HUUZ676FS2w5UkDXuTiQJ+GjYOIDP4JQtVsJ6JCBKw==
X-Received: by 2002:a05:6000:114a:: with SMTP id
 d10mr40829307wrx.7.1625078577549; 
 Wed, 30 Jun 2021 11:42:57 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id d3sm22518742wrx.28.2021.06.30.11.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:42:57 -0700 (PDT)
Date: Wed, 30 Jun 2021 19:42:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2] virtiofsd: Don't allow file creation with FUSE_OPEN
Message-ID: <YNy7L/9ofbz6QoBB@work-vm>
References: <20210624101809.48032-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210624101809.48032-1-groug@kaod.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Greg Kurz (groug@kaod.org) wrote:
> A well behaved FUSE client uses FUSE_CREATE to create files. It isn't
> supposed to pass O_CREAT along a FUSE_OPEN request, as documented in
> the "fuse_lowlevel.h" header :
> 
>     /**
>      * Open a file
>      *
>      * Open flags are available in fi->flags. The following rules
>      * apply.
>      *
>      *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
>      *    filtered out / handled by the kernel.
> 
> But if the client happens to do it anyway, the server ends up passing
> this flag to open() without the mandatory mode_t 4th argument. Since
> open() is a variadic function, glibc will happily pass whatever it
> finds on the stack to the syscall. If this file is compiled with
> -D_FORTIFY_SOURCE=2, glibc will even detect that and abort:
> 
> *** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: terminated
> 
> Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
> in do_open(), print out a message and return an error to the client,
> EINVAL like we already do when fuse_mbuf_iter_advance() fails.
> 
> The FUSE filesystem doesn't currently support O_TMPFILE, but the very
> same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
> that as well.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Queued

> ---
> 
> v2:
>  - do the check in core FUSE code instead of passthrough_ll (libfuse folks)
> 
> 
>  tools/virtiofsd/fuse_lowlevel.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
> index 7fe2cef1eb3b..3d725bcba2ca 100644
> --- a/tools/virtiofsd/fuse_lowlevel.c
> +++ b/tools/virtiofsd/fuse_lowlevel.c
> @@ -1084,6 +1084,12 @@ static void do_open(fuse_req_t req, fuse_ino_t nodeid,
>          return;
>      }
>  
> +    /* File creation is handled by do_create() or do_mknod() */
> +    if (arg->flags & (O_CREAT | O_TMPFILE)) {
> +        fuse_reply_err(req, EINVAL);
> +        return;
> +    }
> +
>      memset(&fi, 0, sizeof(fi));
>      fi.flags = arg->flags;
>      fi.kill_priv = arg->open_flags & FUSE_OPEN_KILL_SUIDGID;
> -- 
> 2.31.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


