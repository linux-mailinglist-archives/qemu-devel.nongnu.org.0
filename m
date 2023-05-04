Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5D76F7168
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:45:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoh-0007Cp-5j; Thu, 04 May 2023 13:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puapU-0001jB-4d
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:25:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puapQ-00073W-Sc
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:25:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683213905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xbK512Zh9Kd8FkTlqCFNZZCtt/bdEORbrCQ0+5OpYUo=;
 b=ZSkaV+zgU64XAcuKIzXff57F5PoVQg8aqFrFLpvvqT/AEtaoIUHvKxBsffqXJ4EJTunuBD
 P0kgCnk58N4FEj7ZjHXaT+21iU2X4UWshc2bRyty5XPWYfj//AjKRyuO41LuFJp5HZGMI/
 MnTlxnk/cNEqDcDGZeIeqRUCl0Lw02Y=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-Rna2iHoiM6yyHNNyCvwRbw-1; Thu, 04 May 2023 11:25:03 -0400
X-MC-Unique: Rna2iHoiM6yyHNNyCvwRbw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-61b6f717b6eso537376d6.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 08:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683213902; x=1685805902;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xbK512Zh9Kd8FkTlqCFNZZCtt/bdEORbrCQ0+5OpYUo=;
 b=VI6ApGHs4Pi9Lk9ineew6Z4t33KTqjqxhbILY9BgKjfMYkzRuomwRtzshuG7eVAZ2N
 vZb3UVj+R2qzs+IOu3NXhrN61o5Vv+1v2LJruEv8zKa5UoUZenw3Yc4ZySOrLWmGZims
 ZfUG+4Jmtwi/RJHhtqQ0JjCZeuPY6wIP+ZVSfh3EYxFiQ+szlM4AzDH68iFgFQPA/NjC
 zok5s405vIPYf5KKOCAQjKP41HNCPFjJmzHgpKQAcH0R5vx2i93z/ByKyY+nr369fQe+
 SYFuflNUtBB9aZkvFVYLW1wfiyxN0GQYLgfEIXIfcgurAQ6c4ReHjF62YjnYUQayZ+KV
 83VQ==
X-Gm-Message-State: AC+VfDyICPzqphmn8NBd8KmEFE12j/8bVnLgE3ZOLym48q4UD2sv0Ucn
 v63V6PWWWGoqD+aZTjR7xFTv0NlQJX7uT67mnsCQGg+s8aqoAOKi+YH7BXKoRPm6GYxxrjx6ZZ6
 3qY0H/jZgjwE3rI48mRDJV3o=
X-Received: by 2002:a05:6214:4104:b0:5ad:cd4b:3765 with SMTP id
 kc4-20020a056214410400b005adcd4b3765mr14303257qvb.1.1683213902352; 
 Thu, 04 May 2023 08:25:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7b48encragGTxecJ/81KnoH8CgIxFPqde9OYq3PwzIqhpEN5I7lMzkw+kqH5LLQQBJ6bcv0g==
X-Received: by 2002:a05:6214:3007:b0:5df:4d41:9560 with SMTP id
 ke7-20020a056214300700b005df4d419560mr14155431qvb.0.1683213879023; 
 Thu, 04 May 2023 08:24:39 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 y26-20020a05620a0e1a00b0074f4edb7007sm9112437qkm.112.2023.05.04.08.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 08:24:37 -0700 (PDT)
Date: Thu, 4 May 2023 11:24:35 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 0/9] QEMU file cleanups
Message-ID: <ZFPOMzR+zWODGcYY@x1n>
References: <20230504113841.23130-1-quintela@redhat.com> <ZFPFF4MB1j5wNnxe@x1n>
 <87ttwsp2kx.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ttwsp2kx.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

On Thu, May 04, 2023 at 04:56:46PM +0200, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > On Thu, May 04, 2023 at 01:38:32PM +0200, Juan Quintela wrote:
> >> - convince and review code to see that everything is uint64_t.
> >
> > One general question to patches regarding this - what's the major benefit
> > of using uint64_t?
> >
> > It doubles the possible numbers to hold, but it's already 64bits so I don't
> > think it matters a lot.
> 
> We were checking for negatives even when that can't be.
> And we are doing this dance of
> 
> int64_t x, y;
> uint64_t a, b;
> 
> x = a;
> b = y;
> 
> This is always confusing and not always right.

Yeah this is confusing, but if anything can go wrong with this I assume we
could have some bigger problem anyway..

> 
> > The thing is we're removing some code trying to
> > detect negative which seems to be still helpful to detect e.g. overflows
> > (even though I don't think it'll happen).  I just still think it's good to
> > know when overflow happens, and not sure what I missed on benefits of using
> > unsigned here.
> 
> If you grep through the code, you see that half of the things are
> int64_t and the other half is uint64_t.  I find it always confusing.

Right, I'm personally curious whether we should just use int64_t always
unless necessary. :) Another good thing with int64_t is it's also suitable
for error report when used in retvals.

But no strong opinion here, I don't think that's a huge deal for now.
Having such an alignment on types makes sense to me.

Thanks,

-- 
Peter Xu


