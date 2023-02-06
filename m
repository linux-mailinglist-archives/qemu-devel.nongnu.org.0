Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 120DA68C8DA
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 22:40:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9Dk-0006Xf-In; Mon, 06 Feb 2023 16:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pP9Df-0006XK-Lk
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:40:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pP9Dd-0002da-8y
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 16:40:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675719608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jHy9hp3DeG+V24hos/2fW2QpRlipHkCBPmgIdcRJP3I=;
 b=banoVOZQIy2niPgq1aWw8o9nBuhxe3HBGjP/BP84m5HDvdcBb5BbYj0FUcQ3SHDr8nlx0O
 y6OYfIdihigGubd6NRH+KBANH8yI6YAL/S3A3bQA0FfpvsOAbOXTdBjdRibeGbKhpIMFIV
 Dl54E2lwapNxC++CuaKdBCO0kYgBGuI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-Tn8pIriGMsCxCPv1gh7i0Q-1; Mon, 06 Feb 2023 16:40:07 -0500
X-MC-Unique: Tn8pIriGMsCxCPv1gh7i0Q-1
Received: by mail-qk1-f198.google.com with SMTP id
 a198-20020ae9e8cf000000b007259083a3c8so8657214qkg.7
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 13:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHy9hp3DeG+V24hos/2fW2QpRlipHkCBPmgIdcRJP3I=;
 b=Y/wfL6tKdjXR8an9VAxcvF6e78ItUUcsY/REy+78AwlPoQlXKJJfRmzGf61ctEd1Ss
 wLPXi4obfsZqAFB2Eil/UwKOYFLUGX2kOtzaFA7+TgsbhnaX3xpcYKVpyEs/kfhcnpzB
 rcJHo6YRJD8CJLlESlsnz4Qwrjle0ijyJ/6gakH7L8R/f4eFSQeRuhAmMHlRTLn6jfnv
 taMFTa7jH9lD9LZw387JgjMXVhIlP9eHt4b2BdlsiUlBPcEQpS7BDY8OR5rP99+TUeED
 rEL5E01BX6rdYLtod/i2WFZ+YfBs8vp5p6P3Drfryq4JuhG8OoeYkJbWUXPGVyQYCQlg
 WwrQ==
X-Gm-Message-State: AO0yUKVZdoJU2GcKPcOs390i2vkKmSLt89QfERYUbyWFDIYYERVYEzOo
 w/GV4HXsRaB3ayKLpPP1B2OeaGh9/eL4Uf7YGH+SIYsfX115f2Mu5WAuUS2G4VW4agA8E0Wvgkd
 LtS/iRmErsc+MZJc=
X-Received: by 2002:a05:622a:611:b0:3a9:7c58:3500 with SMTP id
 z17-20020a05622a061100b003a97c583500mr1822967qta.4.1675719606808; 
 Mon, 06 Feb 2023 13:40:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/+0qpiP84lLXgQvmmcYVR0Uw1TBJxuPcJta2DGMVDFrzUfrUguGSV6+du9Mdom5/ssFrZunA==
X-Received: by 2002:a05:622a:611:b0:3a9:7c58:3500 with SMTP id
 z17-20020a05622a061100b003a97c583500mr1822948qta.4.1675719606552; 
 Mon, 06 Feb 2023 13:40:06 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05620a450f00b006fa43e139b5sm8254692qkp.59.2023.02.06.13.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 13:40:05 -0800 (PST)
Date: Mon, 6 Feb 2023 16:40:04 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 14/21] migration: Map hugetlbfs ramblocks twice, and
 pre-allocate
Message-ID: <Y+FztLMi/uH8xJjR@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-15-peterx@redhat.com>
 <87edrciohn.fsf@secure.mitica> <Y9hGJCkD6sYbFSgi@x1n>
 <874js5xlnb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874js5xlnb.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Wed, Feb 01, 2023 at 07:53:28PM +0100, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > On Mon, Jan 30, 2023 at 06:24:20AM +0100, Juan Quintela wrote:
> >> I would consider here:
> >> 
> >>     uint8_t *host_doublemap;
> >> 
> >> as I have not a small name that means
> >>     uint8_t *host_map_smaller_size_pages;
> >> 
> >> That explains why we need it.
> >
> > Sure, I can rename this one if it helps.
> >
> > One thing worth mention is that, it's not mapping things in small page size
> > here with host_doublemap but in huge page size only.
> 
> Thanks.
> 
> 
> > It's just that UFFDIO_CONTINUE needs another mapping to resolve the page
> > faults. It'll be the guest hugetlb ramblocks that will be mapped in small
> > pages during postcopy.
> 
> ok
> >> Not initialized variables, remove the last two.
> >
> > I can do this.
> >
> >> 
> >> > +    if (!migrate_hugetlb_doublemap()) {
> >> > +        return 0;
> >> > +    }
> >> > +
> >> 
> >> I would move the declaration of the RAMBlock here.
> >
> > But isn't QEMU in most cases declaring variables at the start of any code
> > block, rather than after or in the middle of any code segments?  IIRC some
> > compiler should start to fail with it, even though not on the modern ones.
> 
> We can declare variables since c99.  Only 24 years have passed O:-)

Oh OK :)

> 
> Anyways:
> 
> Exhibit A: We already have that kind of code
> 
> static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
> {
>     MultiFDPages_t *pages = p->pages;
> 
>     for (int i = 0; i < p->normal_num; i++) {
>         p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
>         p->iov[p->iovs_num].iov_len = p->page_size;
>         p->iovs_num++;
>     }
> 
>     p->next_packet_size = p->normal_num * p->page_size;
>     p->flags |= MULTIFD_FLAG_NOCOMP;
>     return nocomp;
> }
> 
> Exhibit B:
> 
> from configure:
> 
> #if defined(__clang_major__) && defined(__clang_minor__)
> # ifdef __apple_build_version__
> #  if __clang_major__ < 10 || (__clang_major__ == 10 && __clang_minor__ < 0)
> #   error You need at least XCode Clang v10.0 to compile QEMU
> #  endif
> # else
> #  if __clang_major__ < 6 || (__clang_major__ == 6 && __clang_minor__ < 0)
> #   error You need at least Clang v6.0 to compile QEMU
> #  endif
> # endif
> #elif defined(__GNUC__) && defined(__GNUC_MINOR__)
> # if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
> #  error You need at least GCC v7.4.0 to compile QEMU
> # endif
> #else
> # error You either need GCC or Clang to compiler QEMU
> #endif
> int main (void) { return 0; }
> EOF
> 
> gcc-7.4.0: supports C11, so we are good here
> https://gcc.gnu.org/onlinedocs/gcc-7.4.0/gcc/Standards.html#C-Language
> 
> clang 6.0: supports c11 and c17 standard
> https://releases.llvm.org/6.0.0/tools/clang/docs/ReleaseNotes.html
> 
> 
> So as far as I can see, we are good here.

Thanks, I'll switch over.

-- 
Peter Xu


