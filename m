Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B1C56AC4A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:58:33 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Xdw-0005fK-Ct
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9XcO-0004hO-C6
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9XcL-0003ax-ML
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 15:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657223812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/asSPbrhhx2y5w2Hfi8JM9p+0ovv3nPLofeHNLC0NG8=;
 b=YJC/OcS/k9HNlO+L+wQyIkv0TQvsYxstefMHuae0uHLFhyEC2k4O/PMWjqsxAvgZw8eEtk
 0LQh2+oRaLdOita7PrOjvo9z8ROA843EbEsMpC0lI8xOKn6NIOuIUOqyLUd3wezfwAq9Mn
 AtVmLyUz07+Bhi8KjEbxpGMiKFfTA4Q=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-SSj9_bMuM6eyXvPXkOdIIg-1; Thu, 07 Jul 2022 15:56:50 -0400
X-MC-Unique: SSj9_bMuM6eyXvPXkOdIIg-1
Received: by mail-qt1-f199.google.com with SMTP id
 m6-20020ac866c6000000b002f52f9fb4edso16457511qtp.19
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 12:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/asSPbrhhx2y5w2Hfi8JM9p+0ovv3nPLofeHNLC0NG8=;
 b=B/O3hyQ/EOUZP7eLYLwkmCUHwcYJi7z1g2qEbNbb66f7MEynsQW8Wha6G3U5Ltgpm/
 /cMuMfvQFYMUdB6PNkacjZAHGQc39bBhtOIFG7X/wt+zhuhJehLHlGCRXWE4EbCui1e4
 XXT5xKBPe1Zjskrol62KHX/C/wolfDWHxLizsYkjQpH+6Fl84YLnJwsWRDL73rsPtc9B
 iZUosZNwDGwIvdxuChUGWcSmZhQaG83m0HYu7an0yQk9j0Kibnefe83qkdWJhspaMn43
 ZfEGjgy+pZh6g4e90Sha5bK09To19fnHosavLWvbsxufgSduHeqU/fA67SLm+Aolyr9D
 yc7Q==
X-Gm-Message-State: AJIora9ywvbdRN9DZ4z3yOsMrwvx/gpl9dfOTcdOsUrVANvc5yvyLSHl
 uWV4KzQqrdppNOXluvatagze9bNYWyy4QlchcjubMNhed2UuXw33J3J8jQSv9Z7CSQDu/dsZWZa
 yAhVkDOfj6Wc/CL0=
X-Received: by 2002:a05:620a:8002:b0:6b5:4f4e:15b9 with SMTP id
 ee2-20020a05620a800200b006b54f4e15b9mr3737038qkb.535.1657223810377; 
 Thu, 07 Jul 2022 12:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tJb+natlX6YlrluNPka7WIBcDcp5p5HIEXToxyLh56WuoHAYOxwbl8HjsX49b9Myiya0Utng==
X-Received: by 2002:a05:620a:8002:b0:6b5:4f4e:15b9 with SMTP id
 ee2-20020a05620a800200b006b54f4e15b9mr3737026qkb.535.1657223810177; 
 Thu, 07 Jul 2022 12:56:50 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 fx10-20020a05622a4aca00b002f9399ccefasm7664035qtb.34.2022.07.07.12.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 12:56:49 -0700 (PDT)
Date: Thu, 7 Jul 2022 15:56:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 2/3] Add dirty-sync-missed-zero-copy migration stat
Message-ID: <Ysc6gFpbuxW0GQFI@xz-m1.local>
References: <20220704202315.507145-1-leobras@redhat.com>
 <20220704202315.507145-3-leobras@redhat.com>
 <Yscdy/YZZ6H1Qpr3@xz-m1.local>
 <CAJ6HWG7CDKKWfyiPQqRtUzEmnB5gTzHdOMJMTH1VvV1wG6LVoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG7CDKKWfyiPQqRtUzEmnB5gTzHdOMJMTH1VvV1wG6LVoA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 07, 2022 at 04:50:47PM -0300, Leonardo Bras Soares Passos wrote:
> > I also think we should squash
> > patch 2/3 as patch 3 only started to provide meaningful values.
> 
> IIRC Previously in zero-copy-send implementation, I was asked to keep the
> property/capability in a separated patch in order to make it easier to review.
> So I thought it would be helpful now.

Ah, that's fine then.

> > > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > > index ca98df0495..5f3be9e405 100644
> > > --- a/monitor/hmp-cmds.c
> > > +++ b/monitor/hmp-cmds.c
> > > @@ -307,6 +307,10 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
> > >              monitor_printf(mon, "postcopy ram: %" PRIu64 " kbytes\n",
> > >                             info->ram->postcopy_bytes >> 10);
> > >          }
> > > +        if (info->ram->dirty_sync_missed_zero_copy) {
> > > +            monitor_printf(mon, "missed zero-copy on: %" PRIu64 " iterations\n",
> > > +                           info->ram->dirty_sync_missed_zero_copy);
> >
> > I suggest we don't call it "iterations" because it's not the generic mean
> > of iterations.
> 
> Yeah, I thought that too, but I could not think on anything better.
> What do you suggest instead?

"Zero-copy-send fallbacks happened: xxx times\n"?

-- 
Peter Xu


