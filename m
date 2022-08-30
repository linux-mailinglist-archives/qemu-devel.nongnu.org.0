Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E48A5A68F9
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 18:59:14 +0200 (CEST)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT4a0-0003Jl-Nf
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 12:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oT3wY-0004K6-IF
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:18:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oT3wJ-0002IO-AN
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 12:18:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661876290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0wV/Lj5VYLi1IVSdofHtFUJWQkJXYcfeBG+DZXnwzLg=;
 b=LFTMvxZwn3Xb1WoOpk3+38JazsFf8Z1uJ6apOhpQ0grNrx8QkQQIo1icTV73Yo2YdszQUW
 QSE/Ja1mxv+uT5vvMEbq3OI9/AENxarc3u1jnmgEMBOQ00PiIslEa/KqPeq8IltOnEFjwj
 gLdIP0NnksUWHXaIuwyqwPDHPWIUmB0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-h1wLp7czP4q8GfGRltvdAQ-1; Tue, 30 Aug 2022 12:18:09 -0400
X-MC-Unique: h1wLp7czP4q8GfGRltvdAQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 v5-20020ac873c5000000b003434ef0a8c7so9260422qtp.21
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 09:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=0wV/Lj5VYLi1IVSdofHtFUJWQkJXYcfeBG+DZXnwzLg=;
 b=1wuFnDLQP5LVld6ZroR1uFAXeIAMeoZ4M7UvCHNW6zdqjThjCX+a0e9XC8RM9wFeZS
 K0Onb3cE0MZ9k/uC3cUSDrHAayKmkYQVXqnYhLMdL+oP/Eb8iZtB/67JGPd5JhcvBiXB
 P+nmO49vn9EwdyEGnI8FFU115eIWXPhXXhre34PfQBK9Yluv7O6EBHAvxVBJshLBymHq
 F7qRt1AGNAm2CUnBGi3llcqqerfn3SnbuMpH1mvUJOXCcUrNOXJzjAYiVu7UwvtliG1f
 JEX/1nNpuaNbg5eJAwoiftHgXpJfMoBecJLdkkpOGOE2lEBI1W9x8zZZYJ1IR52LnYns
 539Q==
X-Gm-Message-State: ACgBeo0nIxYbqrav1bQiA2sRlyDxicSrnuY/rI/jFU1jAiNroXLUEM7P
 w8lzSf23caMxxbHGMe6A65BUVazTj2nJrj5dx5bTbYKj87qTsIzrjfo9ajwex3fWRUayTVakhvt
 LRxuDhzkTHZZeQJw=
X-Received: by 2002:a05:6214:5181:b0:478:69bd:38c5 with SMTP id
 kl1-20020a056214518100b0047869bd38c5mr15692603qvb.59.1661876288742; 
 Tue, 30 Aug 2022 09:18:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6diVo9iwLuc+wLP+m7XgtZxJc/o4VqHvDR5wFFuPdh8ca/H2Ay8B3kq1OerLa4D3AOcluTjA==
X-Received: by 2002:a05:6214:5181:b0:478:69bd:38c5 with SMTP id
 kl1-20020a056214518100b0047869bd38c5mr15692585qvb.59.1661876288540; 
 Tue, 30 Aug 2022 09:18:08 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 bk42-20020a05620a1a2a00b006aedb35d8a1sm8580576qkb.74.2022.08.30.09.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 09:18:07 -0700 (PDT)
Date: Tue, 30 Aug 2022 12:18:06 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
Message-ID: <Yw44PpN0CfVt+OJm@xz-m1.local>
References: <20220826160927.322797-1-afaria@redhat.com>
 <YwppmYUOLTqQ7K25@xz-m1.local>
 <f79cbf92-bb68-67c2-7e7d-a4ac2e09151a@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f79cbf92-bb68-67c2-7e7d-a4ac2e09151a@amsat.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 30, 2022 at 02:06:32PM +0200, Philippe Mathieu-Daudé wrote:
> On 27/8/22 20:59, Peter Xu wrote:
> > Hi, Alberto,
> > 
> > On Fri, Aug 26, 2022 at 05:09:27PM +0100, Alberto Faria wrote:
> > > Apply cache->xlat to addr before passing it to
> > > flatview_(read|write)_continue(), to convert it from the
> > > MemoryRegionCache's address space to the FlatView's.
> > 
> > Any bug encountered?  It'll be great to add more information into the
> > commit message if there is.  We could also mention the issue was observed
> > by code review or so.
> 
> Agreed.
> 
> > > 
> > > Fixes: 48564041a7 ("exec: reintroduce MemoryRegion caching")
> > > Co-Developed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > Signed-off-by: Alberto Faria <afaria@redhat.com>
> > > ---
> > >   softmmu/physmem.c | 12 ++++++------
> > >   1 file changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> > > index dc3c3e5f2e..95d4c77cc3 100644
> > > --- a/softmmu/physmem.c
> > > +++ b/softmmu/physmem.c
> > > @@ -3450,9 +3450,9 @@ address_space_read_cached_slow(MemoryRegionCache *cache, hwaddr addr,
> > >       l = len;
> > >       mr = address_space_translate_cached(cache, addr, &addr1, &l, false,
> > >                                           MEMTXATTRS_UNSPECIFIED);
> > > -    return flatview_read_continue(cache->fv,
> > > -                                  addr, MEMTXATTRS_UNSPECIFIED, buf, len,
> > > -                                  addr1, l, mr);
> > > +    return flatview_read_continue(cache->fv, cache->xlat + addr,
> 
> So this is just addr1...

It may not; note that in address_space_translate_cached() the xlat pointer
will also be passed over to address_space_translate_iommu(), so it can be
further modified to point to the real MR address behind the IOMMU.

> 
> > > +                                  MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
> > > +                                  mr);
> > >   }
> > >   /* Called from RCU critical section. address_space_write_cached uses this
> > > @@ -3468,9 +3468,9 @@ address_space_write_cached_slow(MemoryRegionCache *cache, hwaddr addr,
> > >       l = len;
> > >       mr = address_space_translate_cached(cache, addr, &addr1, &l, true,
> > >                                           MEMTXATTRS_UNSPECIFIED);
> > > -    return flatview_write_continue(cache->fv,
> > > -                                   addr, MEMTXATTRS_UNSPECIFIED, buf, len,
> > > -                                   addr1, l, mr);
> > > +    return flatview_write_continue(cache->fv, cache->xlat + addr,
> > > +                                   MEMTXATTRS_UNSPECIFIED, buf, len, addr1, l,
> > > +                                   mr);
> > >   }
> > 
> > The issue looks correct, but I hesitate on the fix.. since afaict
> > cache->xlat is per memory region not flat view, so the new calculation is
> > offset within memory region but not flat view too.
> > 
> > So I'm wondering whether it should become:
> > 
> >    cache->xlat + addr - cache.mrs.offset_within_region +
> >      cache.mrs.offset_within_address_space
> 
> If so, shouldn't this be calculated [*] within
> address_space_translate_cached() instead of the caller?
> 
> [*] Maybe passed as another pointer to hwaddr

No strong opinion, but that looks like a duplication of information we
have.  Maybe we can also have a helper to convert the cache address space
to global address space.

-- 
Peter Xu


