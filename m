Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA7E6922A1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 16:49:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVdc-000508-WF; Fri, 10 Feb 2023 10:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQVdZ-0004zS-10
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:48:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pQVdX-0007BW-EP
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676044110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMVOtYugOWR0vORIoTsICJzFiXPyZrbDScepc2BcXe0=;
 b=OX72cU50nVquc81yd6ynuCrEONHMVyt0McblF4dNUeCVYyR+3SMf0NFrk8x78MV/8BHT6+
 WxQU+5NSbNcd4vWi2mshf5SW4SsigU+Un+xdRGZ01yAnBUdeuuHUpdUM1hCGpsT/UIFx2o
 YMG1yjB3WRjW8QwQv+zxst4z8xQHeVo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-5J_GbOZrO4-Th1LvZStLhg-1; Fri, 10 Feb 2023 10:48:29 -0500
X-MC-Unique: 5J_GbOZrO4-Th1LvZStLhg-1
Received: by mail-qk1-f200.google.com with SMTP id
 bp30-20020a05620a459e00b00738e1fe2470so3522928qkb.23
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 07:48:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bMVOtYugOWR0vORIoTsICJzFiXPyZrbDScepc2BcXe0=;
 b=tM6NFDuVGL3K1dTJ9pfTKfcKJZx+kw3HUSR355Ka4vrSisVkwp7TO2GwomjUZWF9Dw
 6DI1Scxo7crN3DK92yy9MJ4pEYxRiWN3sF0j8YaErLS1nBQUlktCXF9nYBfj2IoZyCpo
 pEkghAc5lHsKUla7sh/0CK2mq2P2OPikpVG/OTHevcTWrwGQwsG6eWHdyYwWEmjuZwRC
 Ri3y5dvVv6nd4C/hyA89LzHM77LLLWacFN9UfzqviC2HA0b1CmsBl9+vYNJ8WkucdxYa
 eMLs/EKoSMIevjNl73eHCZGGGhKCv4oYU9rr7t3fJFjuJYskzc4PPvRj7P8SlEoVUQqT
 SrJw==
X-Gm-Message-State: AO0yUKWSeM/Ci9vXRvKIpGKTMfCHN0DDpav2qu0Z1enku5k/6RvRcYaE
 HI2Ye5pD6QJgS9PJxu5gABqfxCF6UBEnfcqlFLgwUHqbFJHtPyDEee07J8nQLuWQbjuopoIVBQ+
 jTQQ9Yt+vx+LJevQ=
X-Received: by 2002:a05:622a:4d2:b0:3b8:58d0:b4d4 with SMTP id
 q18-20020a05622a04d200b003b858d0b4d4mr29358734qtx.2.1676044108626; 
 Fri, 10 Feb 2023 07:48:28 -0800 (PST)
X-Google-Smtp-Source: AK7set+qS+kpY9EHux5e51QFsvWDXvZ4AM53GEOHPhWHDG5wEWpcHKG/Z8mEWOEhZlyLKavjHpw4Fw==
X-Received: by 2002:a05:622a:4d2:b0:3b8:58d0:b4d4 with SMTP id
 q18-20020a05622a04d200b003b858d0b4d4mr29358708qtx.2.1676044108379; 
 Fri, 10 Feb 2023 07:48:28 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t23-20020ac87397000000b003ab7aee56a0sm3540523qtp.39.2023.02.10.07.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 07:48:27 -0800 (PST)
Date: Fri, 10 Feb 2023 10:48:26 -0500
From: Peter Xu <peterx@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Subject: Re: [PULL 01/30] migration: Fix migration crash when target psize
 larger than host
Message-ID: <Y+ZnSivyNX1WxzDc@x1n>
References: <20230207005650.1810-1-quintela@redhat.com>
 <20230207005650.1810-2-quintela@redhat.com>
 <0dd85902-0071-a915-2655-8aff8d0074d1@msgid.tls.msk.ru>
 <87ilg9iutl.fsf@secure.mitica> <Y+ZcVkhRr8rYU6Az@x1n>
 <357699ba-2949-2c4e-fd65-1ff078718792@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <357699ba-2949-2c4e-fd65-1ff078718792@msgid.tls.msk.ru>
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

On Fri, Feb 10, 2023 at 06:28:36PM +0300, Michael Tokarev wrote:
> 10.02.2023 18:01, Peter Xu пишет:
> 
> > Thanks, Juan.
> > 
> > I think Michael was correct that d9e474ea56 is only merged after our most
> > recent release (which is v7.2.0).  So it doesn't need to have stable copied
> > (aka, it doesn't need to be applied to any QEMU's stable tree).
> > 
> > Juan, could you help drop the "cc: stable" line if the pull is going to
> > have a new version?
> 
> It has been applied to master already, - this is where I picked it from.

Ah I didn't notice that.

> 
> > Side note: I think in the case where we have wrongly have the cc:stable it
> > shouldn't hurt either, because when the stable tree tries to pick it up
> > it'll find it doesn't apply at all, then a downstream-only patch will be
> > needed, then we'll also figure all things out, just later.
> 
> There's absolutely nothing wrong with that.  I was just not sure about my
> own sanity here, and decided to ask.  Maybe the problem was deeper and a
> more careful backport is needed.

Thanks for raising this.

The old tree should be good with guest psize > host psize not only because
the assertion was not there before, but also because we used the right
boundary (as hostpage_boundary here):

     size_t pagesize_bits =
         qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
     unsigned long hostpage_boundary =
         QEMU_ALIGN_UP(pss->page + 1, pagesize_bits);

And it also matches with Thomas's bisection result, where the bug report
came from.

TL;DR: I'm pretty sure the old code was good, hence no explicit backport
needed.

> 
> Speaking of -stable, on my view, it is better if "too many" things will be
> tagged for it and filtered out, than some important things will not be
> tagged.

Agreed.

I guess we shouldn't blindly apply cc:stable because it'll add unnecessary
burden to the stable tree maintainers on figuring things out later, IOW it
should be a question being thought thoroughly when the developer was
working on the patch.

Normally it should be the maintainers' role to double check especially when
one patch should apply stable but it got missing (which should happen more
frequently..).

In the ideal world of perfect developers and active tree maintainers, the
cc:stable should be 100% accurate because the judgement should be able to
have been made with existing knowledge, then stable maintainance should be
hopefully even smoother than the reality.

In this case definitely my fault to applied the cc:stable wrongly, luckily
in the healthy way rather than losing one of them when really needed.

> 
> Thank you!

Thanks again to both!

-- 
Peter Xu


