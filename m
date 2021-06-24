Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8933B3B34D8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 19:34:25 +0200 (CEST)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTFA-00008m-JY
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 13:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lwTAb-0001dA-1u
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:29:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lwTAR-0004sr-Jh
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 13:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624555770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W1inlmn3ydqLorGxeeeeRtSw6X1Q41HFsjOSZiAowPY=;
 b=hDuBuj5U3BDEQ6Ot8df1AW14cjE/wMF0l8W94HQK3ME5D0wl0Owl7G1pVWx9CvgTAXbviY
 kd3QHDU1JrKBMObHtQT+NPNzgDTBDq2EopMGGZo/to9MuyEd9pWoEcfA8Adyq47drZR80/
 3/S4IF9W1vXRk2YLxWYE7B1mD6AAriI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-quDXIzyhPdKaQxgK8PidLA-1; Thu, 24 Jun 2021 13:29:29 -0400
X-MC-Unique: quDXIzyhPdKaQxgK8PidLA-1
Received: by mail-il1-f197.google.com with SMTP id
 f4-20020a056e020c64b02901ee69c9b838so899597ilj.20
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 10:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W1inlmn3ydqLorGxeeeeRtSw6X1Q41HFsjOSZiAowPY=;
 b=HfVN59sHZvxCtsIoa+fTaiVfNy7ZqnAM+B4l9fRAZ95H5eN26V21IZXMnWKSa7DgeK
 WrUCTqUNIwYhsXhppUg7R1XSwYqB9IXRqE22V5cra1d+MeSYciEmVWRdPZ0ar/vlcUaB
 3zqdDKD4HkZykmW5s3b33L5SM6SeHijlN/8mwHL+c/nW+UeDJ/NTJXnPbgGk4vAX74wI
 QNemem1DNXiPAEj8MkpuuaEjaVHVN1KS5xo7vf7/51dl+giYhm0FoCNO7OEU90s7RneN
 F8e7Ccra2B4esfFVmXmgvKVFBckTYYRtnlDb5qMRzznC0Xh4AGkuqufEl35NbRG9jfER
 ZvKA==
X-Gm-Message-State: AOAM5307c7wd9/aTNvH/VAcnZtgc1eW1yFoHIb1ElyljUYpmKnWj5kau
 b66moG171wWCSPVsWWsT3YvyuVg5KcxxWJzC/UNDGv4J1OLvMSfFB3NOjv3IZzqQbLM4GMdk0yA
 pxe43OoRbc3jJls0=
X-Received: by 2002:a5d:8996:: with SMTP id m22mr4924788iol.6.1624555768712;
 Thu, 24 Jun 2021 10:29:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKVX5AeFCzs8LP8KdWrTaYmue9P9xl74j4jhXfPI7LHk6dcXKLBp7ethbt3y80ZOnR0+KMPg==
X-Received: by 2002:a5d:8996:: with SMTP id m22mr4924770iol.6.1624555768512;
 Thu, 24 Jun 2021 10:29:28 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id k3sm1836830ilv.83.2021.06.24.10.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 10:29:27 -0700 (PDT)
Date: Thu, 24 Jun 2021 13:29:26 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v1 1/1] migration: Unregister yank if migration setup fails
Message-ID: <YNTA9nEpWlQi6b2I@t490s>
References: <20210622024236.600347-1-leobras@redhat.com>
 <YNS9fwd/dNs5LJ/+@work-vm>
MIME-Version: 1.0
In-Reply-To: <YNS9fwd/dNs5LJ/+@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Leonardo Bras <leobras@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 06:14:39PM +0100, Dr. David Alan Gilbert wrote:
> * Leonardo Bras (leobras@redhat.com) wrote:
> > Currently, if a qemu instance is started with "-incoming defer" and
> > an incorect parameter is passed to "migrate_incoming", it will print the
> > expected error and reply with "duplicate yank instance" for any upcoming
> > "migrate_incoming" command.
> > 
> > This renders current qemu process unusable, and requires a new qemu
> > process to be started before accepting a migration.
> > 
> > This is caused by a yank_register_instance() that happens in
> > qemu_start_incoming_migration() but is never reverted if any error
> > happens.
> > 
> > Solves this by unregistering the instance if anything goes wrong
> > in the function, allowing a new "migrate_incoming" command to be
> > accepted.
> > 
> > Fixes: b5eea99ec2f ("migration: Add yank feature", 2021-01-13)
> > Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1974366
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > 
> > ---
> >  migration/migration.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/migration/migration.c b/migration/migration.c
> > index 4228635d18..ddcf9e1868 100644
> > --- a/migration/migration.c
> > +++ b/migration/migration.c
> > @@ -474,9 +474,13 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
> >      } else if (strstart(uri, "fd:", &p)) {
> >          fd_start_incoming_migration(p, errp);
> >      } else {
> > -        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> >          error_setg(errp, "unknown migration protocol: %s", uri);
> >      }
> > +
> > +    if (*errp) {
> > +        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> > +    }
> 
> My understanding is that testing *errp isn't allowed, because
> it's legal to pass NULL to ignore errors, or legal to pass
> &error_abort to mean that any error you do hit will cause the
> process to assert; so you need to have something separate you can test.

Per my understanding error_abort should be fine, as the value of error_abort is
still NULL (in error_setg() we only check against &error_abort as the pointer,
and its value seems to be better always be NULL..).

But indeed at least we need "errp && *errp", but that won't capture the case
when errp==NULL.

So I think we may need to define a local error, check here when unregister
yank, and do error_propagate() before return..

-- 
Peter Xu


