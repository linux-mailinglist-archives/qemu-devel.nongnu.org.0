Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638456E7D5E
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 16:47:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp954-00030u-Ln; Wed, 19 Apr 2023 10:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pp952-00030L-Jw
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 10:46:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pp950-00085V-Rm
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 10:46:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681915602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EU4rXKi03l6AzX0HQukdgmKqcrNnA5DIgG8JfTSsI1w=;
 b=KxN+CzQHhq2xoNhY3rg0DzEbnkL46BhB3GI2HoetzljwFXPHkMPgyIkrojeCKygrvHxpyT
 n4QBpQXzDTajDjr0Alfl8C//BI31CP4wdqI36JxoEHJo77Eii9Z8Sy8FSCwQZx5HjjS7kk
 Ko6m+C/5cW9L/8Zn7GFSEC3+SmiLEqM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-36viH6fgNF2StK53VKlWmA-1; Wed, 19 Apr 2023 10:46:40 -0400
X-MC-Unique: 36viH6fgNF2StK53VKlWmA-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-74cf009f476so1310585a.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 07:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915599; x=1684507599;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EU4rXKi03l6AzX0HQukdgmKqcrNnA5DIgG8JfTSsI1w=;
 b=gg2evo6DAR9SPfmj/5Qqet+rVi+ftihNgvAFNDa12UIqqplo/2Pf3PGmcPFE1xrdCF
 X4mLPG052hEGgGvLWBB8Vg1wRhyHN3YEL8V7J9Drl6TVwuI5HVWHDTIGW79lfhLZxkgy
 mtAq2DwHeFynWjwqo9NGuJWvafs3CHtmTMShKRjQSel5+OuHp1sZr9foVJvdKC401KRn
 HuYdSjYMQhwVz0QaJo1UEkIVmEV/QA6N2FSkWCUYHO6GdtPgiywX6qxSIOF9b4c6059T
 vitk6pr1bVv6BUb2oYqnpE82qg5yVXWX2OArYQSuSC9ncf8473Ad1oEqHulsEgJx8nv9
 QXkA==
X-Gm-Message-State: AAQBX9cKzWaKYK+R0HLRnjgzZCVhO0UMX+1RqRAi2t7pBRI9+MFK0ny9
 hrq/Wqy3gWtFyl/FXLRl+mEMx7Xv8JPbjF+8NDb1RBANK/J8ElRNWL4i187MFVY5w+s1U8j/EFk
 m3DMni8e/CcXx0TI=
X-Received: by 2002:ad4:5ba7:0:b0:5f1:31eb:1f0e with SMTP id
 7-20020ad45ba7000000b005f131eb1f0emr9436494qvq.4.1681915599745; 
 Wed, 19 Apr 2023 07:46:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZpDCdcIhHl1x9pVe3kb1EjXqKazoX2yYAUv6oc5MwZOqe2V66W6MaVQXbENKLICiNID81PXA==
X-Received: by 2002:ad4:5ba7:0:b0:5f1:31eb:1f0e with SMTP id
 7-20020ad45ba7000000b005f131eb1f0emr9436477qvq.4.1681915599515; 
 Wed, 19 Apr 2023 07:46:39 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 r2-20020a0cf802000000b005ef5b1006c5sm3568575qvn.38.2023.04.19.07.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:46:38 -0700 (PDT)
Date: Wed, 19 Apr 2023 10:46:38 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH 1/3] hostmem: Detect and cache fs type for file hostmem
Message-ID: <ZD/+zlPnZWCA7Crn@x1n>
References: <20230418225749.1049185-1-peterx@redhat.com>
 <20230418225749.1049185-2-peterx@redhat.com>
 <cdec800a-80ab-18f7-2667-9bc7a8917f09@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cdec800a-80ab-18f7-2667-9bc7a8917f09@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Apr 19, 2023 at 09:28:21AM +0200, David Hildenbrand wrote:
> On 19.04.23 00:57, Peter Xu wrote:
> > Detect the file system for a memory-backend-file object and cache it within
> > the object if possible when CONFIG_LINUX (using statfs).
> > 
> > Only support the two important types of memory (tmpfs, hugetlbfs) and keep
> > the rest as "unknown" for now.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   backends/hostmem-file.c  | 37 ++++++++++++++++++++++++++++++++++++-
> >   include/sysemu/hostmem.h |  1 +
> >   2 files changed, 37 insertions(+), 1 deletion(-)
> > 
> > diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> > index 25141283c4..2484e45a11 100644
> > --- a/backends/hostmem-file.c
> > +++ b/backends/hostmem-file.c
> > @@ -18,13 +18,17 @@
> >   #include "sysemu/hostmem.h"
> >   #include "qom/object_interfaces.h"
> >   #include "qom/object.h"
> > +#ifdef CONFIG_LINUX
> > +#include <sys/vfs.h>
> > +#include <linux/magic.h>
> > +#endif
> >   OBJECT_DECLARE_SIMPLE_TYPE(HostMemoryBackendFile, MEMORY_BACKEND_FILE)
> >   struct HostMemoryBackendFile {
> >       HostMemoryBackend parent_obj;
> > -
> > +    __fsword_t fs_type;
> >       char *mem_path;
> >       uint64_t align;
> >       bool discard_data;
> > @@ -52,6 +56,15 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
> >           return;
> >       }
> > +#ifdef CONFIG_LINUX
> > +    struct statfs fs;
> > +    if (!statfs(fb->mem_path, &fs)) {
> > +        fb->fs_type = fs.f_type;
> > +    } else {
> > +        fb->fs_type = 0;
> > +    }
> > +#endif
> > +
> 
> 
> Instead of using statfs, why not implement something like
> qemu_fd_getpagesize(), that also relies on HUGETLBFS_MAGIC already, meaning
> 
> 	size_t qemu_fd_type(int fd)
> 
> which uses fstatfs() instead? As an abstraction, as Daniel suggests, use a
> new enum to return the type -- "0" meaning "unknown".
> 
> Then you can even avoid the caching in hostmem code and simply call it
> directly from uffd code.

Yeah, can do.

I think it depends on whether this can also be useful for other users of a
file memory backend object where the fd may not be on hand.  So far this's
indeed the only one that needs it, though, so I can switch.

Thanks,

-- 
Peter Xu


