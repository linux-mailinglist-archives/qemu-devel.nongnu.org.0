Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F2331904
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 22:04:44 +0100 (CET)
Received: from localhost ([::1]:51002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJN3S-0007Qb-Ks
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 16:04:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJN2L-00070G-5Z
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 16:03:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJN2I-0006j1-9M
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 16:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615237408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yhk8ifhkRdPxCYLvtcrRrZR7BEDJNUVc+D/8Q5lCD+E=;
 b=f0hPp1x+6CX/PKhkaTEn/c/PiJqTHPEArYMljf8zN04tKz7e5wrZ5sBzNyGVddtoD8XsZ0
 HHOgKby5r+ZaW98mICkMxnuduT46rPoqrTqBo8CQOvrCRmYxd8AT9rmr4px6rcFOH6A2GQ
 ESK9W56xGeuFMUul0seKnMOlHMXv4EQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-cJ6GS8qpOESna8iH_bc2mQ-1; Mon, 08 Mar 2021 16:03:26 -0500
X-MC-Unique: cJ6GS8qpOESna8iH_bc2mQ-1
Received: by mail-qk1-f199.google.com with SMTP id h126so8354864qkd.4
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 13:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Yhk8ifhkRdPxCYLvtcrRrZR7BEDJNUVc+D/8Q5lCD+E=;
 b=EMGpYNDph2EYEqTKtl6wnqxEcgCDZcyjl+2TO87e6PgdZBGLvj9YpymOc1iv0yCFMZ
 /I1qa0EB3OMajhzQ9DsAIinUP5AOk7ar8/LCejEptRMc+xKoQEuMbT5q/MRX8qk43Idg
 cdBCDJZzHgu5yi2PBV4LXoaOMq/WiGnXOiEsJqFRntYr5jjKA7ZICClEdhRobV4vvtQY
 QZf4vFKUzYgL01lPC86wC9X00e7USAhaOhv3aMFVEw4s9xFc4+eH+2wci3LbLTlcm06B
 n/Qk7t1V0MJib647ZuH90ll0NrPBuTe21ewPvPuODO/wkJLuomFXu4l+/JyGzuRNMfhZ
 3SKw==
X-Gm-Message-State: AOAM530eGGzDAFGsQf61LeBb5TCEHryEW+BB3Rg447GrSOAx/4QlH6Df
 PswZy7hRlDJu2vDgrD8auCDhJBehxxe18yffqyy+OUBjMpze+MjdAnyMyjDLmq9t9IvFsgx2VvX
 WK6hCj+O8Ou8IECE=
X-Received: by 2002:a37:cc7:: with SMTP id 190mr22617185qkm.99.1615237406368; 
 Mon, 08 Mar 2021 13:03:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEWKrV+gO5A4iepuEzsXbZt+VIjjNDJ4rcGH+HhPwhLt5VAC0F8E0tpAd+ApmnK6okX2NRfg==
X-Received: by 2002:a37:cc7:: with SMTP id 190mr22617148qkm.99.1615237406017; 
 Mon, 08 Mar 2021 13:03:26 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id d70sm8789614qkg.30.2021.03.08.13.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:03:25 -0800 (PST)
Date: Mon, 8 Mar 2021 16:03:23 -0500
From: Peter Xu <peterx@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v3 1/3] migration/ram: Modify the code comment of
 ram_save_host_page()
Message-ID: <20210308210323.GK397383@xz-x1>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
 <20210305075035.1852-2-jiangkunkun@huawei.com>
 <20210305135923.GD397383@xz-x1>
 <d83522c5-a65c-d473-5759-de4a247388dc@huawei.com>
MIME-Version: 1.0
In-Reply-To: <d83522c5-a65c-d473-5759-de4a247388dc@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 08, 2021 at 06:33:56PM +0800, Kunkun Jiang wrote:
> Hi, Peter
> 
> On 2021/3/5 21:59, Peter Xu wrote:
> > On Fri, Mar 05, 2021 at 03:50:33PM +0800, Kunkun Jiang wrote:
> > > The ram_save_host_page() has been modified several times
> > > since its birth. But the comment hasn't been modified as it should
> > > be. It'd better to modify the comment to explain ram_save_host_page()
> > > more clearly.
> > > 
> > > Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> > > ---
> > >   migration/ram.c | 16 +++++++---------
> > >   1 file changed, 7 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/migration/ram.c b/migration/ram.c
> > > index 72143da0ac..a168da5cdd 100644
> > > --- a/migration/ram.c
> > > +++ b/migration/ram.c
> > > @@ -1970,15 +1970,13 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
> > >   }
> > >   /**
> > > - * ram_save_host_page: save a whole host page
> > > + * ram_save_host_page: save a whole host page or the rest of a RAMBlock
> > >    *
> > > - * Starting at *offset send pages up to the end of the current host
> > > - * page. It's valid for the initial offset to point into the middle of
> > > - * a host page in which case the remainder of the hostpage is sent.
> > > - * Only dirty target pages are sent. Note that the host page size may
> > > - * be a huge page for this block.

> > > - * The saving stops at the boundary of the used_length of the block
> > > - * if the RAMBlock isn't a multiple of the host page size.

[1]

> > > + * Send dirty pages between pss->page and either the end of that page
> > > + * or the used_length of the RAMBlock, whichever is smaller.
> > > + *
> > > + * Note that if the host page is a huge page, pss->page may be in the
> > > + * middle of that page.
> > It reads more like a shorter version of original comment..  Could you point out
> > what's the major difference?  Since the original comment looks still good to me.
> Sorry for late reply.
> The reason I want to modify the comment is that I think some parts of the
> comment
> don't match the code. (1) The brief description of ram_save_host_page()
> missed a
> situation that ram_save_host_page() will send dirty pages between pass->page
> and
> the used_length of the block, if the RAMBlock isn't a multiple of the host
> page
> size.

It seems it mentioned at [1] above.

> (2) '*offset' should be replaced with pss->page.

This one looks right as you mentioned.

> 
> So taking the chance of optimizing ram_save_host_page(), I modified the
> comment.
> This version comment is suggested by @David Edmondson. Compared with the
> original
> comment, I think it looks concise.

I think changing incorrect comments is nice; it's just that we should still
avoid rewritting comments with similar contents.

> > >    *
> > >    * Returns the number of pages written or negative on error
> > >    *
> > > @@ -2002,7 +2000,7 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
> > >       }
> > >       do {
> > > -        /* Check the pages is dirty and if it is send it */
> > > +        /* Check if the page is dirty and send it if it is */
> > This line fixes some English issues, it seems.  Looks okay, but normally I
> > won't change it unless the wording was too weird, so as to keep the git record
> > or the original lines.  Here the original looks still okay, no strong opinion.
> > 
> > Thanks,
> Yes, the original reads weird to me. Same reason as above, I modified this
> line.
> 
> If you think there is no need to modify the original commit, I do not insist
> on
> changing it.😁

As I mentioned I don't really have a strong preference, so feel free to keep
your own will. :) I would only to suggest avoid rewritting chunk of similar
meanings.

Thanks,

-- 
Peter Xu


