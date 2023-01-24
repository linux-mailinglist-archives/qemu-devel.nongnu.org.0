Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6365A67A43C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 21:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKQCX-0003HS-7C; Tue, 24 Jan 2023 15:47:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKQCU-0003HI-S9
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:47:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKQCR-0001x1-NL
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 15:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674593242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QFcDzybwH3Xk+10x5SHm/c9/Yn+tUnrTi5Pr0jZ5h4w=;
 b=NivcmWxwWKnXMvUaqxj+mjKrl/3Qgm1XpqaO0e3Nbzzxz0P5ztN1I1uzbdp7Px8dl1sBET
 UbhdCX0/hLisijkWSoDcybSoDA/ERYmNq/bNDzPPZznUwkopjlovozikDcgy0Lz7rvTPif
 jvsbvAFr9DCDIQ62v7q9TiWhpziLS2k=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-581-16-u-JOEPQCCqyV3jASSpg-1; Tue, 24 Jan 2023 15:47:20 -0500
X-MC-Unique: 16-u-JOEPQCCqyV3jASSpg-1
Received: by mail-qt1-f198.google.com with SMTP id
 k8-20020ac84788000000b003b631e8cc4dso6547310qtq.16
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 12:47:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFcDzybwH3Xk+10x5SHm/c9/Yn+tUnrTi5Pr0jZ5h4w=;
 b=JMwb/IWa7He0hKmsv9lWjs9kRdg3xu4v7MAC6FbjxxUn+qNJz3g8mNznrTgUoBelK0
 NXwzh+bGzpNpYTtKBjWURV0ZpIVpzEJNzSFTYdu6tLNWV7VctJ2ikqJZ+AJ501ALQQy7
 1XuldhRc3bY1eNDMF/etSpMChcNP9NlRAqpda5+RG2EntPL9buEskRmWUKdcZMnYQted
 5oyi0rlA90XmFXsj5rynh9odsGfbBVerWrKCb3MCMaKHij2paJYskVUxr1j7/VikXd8T
 UZGj18aynWBO4r+t30csq1iIrZpH6QUt0OdkyvBa4Y/taaqjg81J6BWJu3PPhevPa3/1
 QgvA==
X-Gm-Message-State: AFqh2krdQshbBRbeAHz/TqikwwxIGR2W482+mBr3Bv54QD5ofOB+LCMn
 491jdJFeD12ZcQVC89AFHZk3QUw7s2QXKWqM8LrVNHaUc7gvrCb9819YSVLn1Sa/YYg9uQsmxcj
 aHJ85bTQDikSCPZs=
X-Received: by 2002:ac8:67c1:0:b0:3b6:8ad1:3be9 with SMTP id
 r1-20020ac867c1000000b003b68ad13be9mr31586484qtp.32.1674593240264; 
 Tue, 24 Jan 2023 12:47:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtL6pFFbF0aRnfGqKJmCj0JSMrQA9pB2lefwbPrhAoVgxeDrqsNvW0gqx4/xVkcAovVkwcuRA==
X-Received: by 2002:ac8:67c1:0:b0:3b6:8ad1:3be9 with SMTP id
 r1-20020ac867c1000000b003b68ad13be9mr31586464qtp.32.1674593239993; 
 Tue, 24 Jan 2023 12:47:19 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 h11-20020ac8776b000000b003b62e9c82ebsm1886647qtu.48.2023.01.24.12.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:47:19 -0800 (PST)
Date: Tue, 24 Jan 2023 15:47:18 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 10/21] ramblock: Add ramblock_file_map()
Message-ID: <Y9BD1jcBYzPDR9VX@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-11-peterx@redhat.com>
 <Y8+tuN1t9EWMIuzk@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8+tuN1t9EWMIuzk@work-vm>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 24, 2023 at 10:06:48AM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Add a helper to do mmap() for a ramblock based on the cached informations.
> > 
> > A trivial thing to mention is we need to move ramblock->fd setup to be
> > earlier, before the ramblock_file_map() call, because it'll need to
> > reference the fd being mapped.  However that should not be a problem at
> > all, majorly because the fd won't be freed if successful, and if it failed
> > the fd will be freeed (or to be explicit, close()ed) by the caller.
> > 
> > Export it - prepare to be used outside this file.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  include/exec/ram_addr.h |  1 +
> >  softmmu/physmem.c       | 25 +++++++++++++++++--------
> >  2 files changed, 18 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
> > index 0bf9cfc659..56db25009a 100644
> > --- a/include/exec/ram_addr.h
> > +++ b/include/exec/ram_addr.h
> > @@ -98,6 +98,7 @@ bool ramblock_is_pmem(RAMBlock *rb);
> >  
> >  long qemu_minrampagesize(void);
> >  long qemu_maxrampagesize(void);
> > +void *ramblock_file_map(RAMBlock *block);
> >  
> >  /**
> >   * qemu_ram_alloc_from_file,
> > diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> > index 6096eac286..cdda7eaea5 100644
> > --- a/softmmu/physmem.c
> > +++ b/softmmu/physmem.c
> > @@ -1532,17 +1532,31 @@ static int file_ram_open(const char *path,
> >      return fd;
> >  }
> >  
> > +/* Do the mmap() for a ramblock based on information already setup */
> > +void *ramblock_file_map(RAMBlock *block)
> > +{
> > +    uint32_t qemu_map_flags;
> > +
> > +    qemu_map_flags = (block->flags & RAM_READONLY) ? QEMU_MAP_READONLY : 0;
> > +    qemu_map_flags |= (block->flags & RAM_SHARED) ? QEMU_MAP_SHARED : 0;
> > +    qemu_map_flags |= (block->flags & RAM_PMEM) ? QEMU_MAP_SYNC : 0;
> > +    qemu_map_flags |= (block->flags & RAM_NORESERVE) ? QEMU_MAP_NORESERVE : 0;
> > +
> > +    return qemu_ram_mmap(block->fd, block->mmap_length, block->mr->align,
> > +                         qemu_map_flags, block->file_offset);
> > +}
> > +
> >  static void *file_ram_alloc(RAMBlock *block,
> >                              int fd,
> >                              bool truncate,
> >                              off_t offset,
> >                              Error **errp)
> >  {
> > -    uint32_t qemu_map_flags;
> >      void *area;
> >  
> >      /* Remember the offset just in case we'll need to map the range again */
> 
> Note that this comment is now wrong; you need to always set that for the
> map call.

This line is added in patch 7.  After this patch, a ramblock should always
be mapped with ramblock_file_map(), so it keeps being true?

> 
> Other than that,
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks,

-- 
Peter Xu


