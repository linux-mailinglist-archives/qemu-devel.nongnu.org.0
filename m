Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53A47C07C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 14:12:11 +0100 (CET)
Received: from localhost ([::1]:48142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzew5-0003BJ-MF
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 08:12:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzet6-0002Rm-9p
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:09:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mzet2-00062x-N8
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:09:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640092134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+H0snWjbE4wdwVi9kzGKSFgNPpapyoaZPJ8CJ0hNqyc=;
 b=HPURF4WiZhoMTRu2SP91piP8sDSBovlECzj2pxbAdtZ2TXuFYSVmcWbGEG3kvOrWbbKawB
 P6WmGmZcik8oLWhdN0oGMpXxVd0ZuX6DWyoUrGEU2Ks1sTHMle39nkYoUcnRqQQyJSZ/XL
 6PgUv3hBNGAQTXdOsSwe12y1uvTZEkM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-3O8HQ2qyN9il4u5ACZ0c0Q-1; Tue, 21 Dec 2021 08:08:53 -0500
X-MC-Unique: 3O8HQ2qyN9il4u5ACZ0c0Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 n22-20020adf8b16000000b001a22f61b29cso4643099wra.23
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 05:08:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+H0snWjbE4wdwVi9kzGKSFgNPpapyoaZPJ8CJ0hNqyc=;
 b=d1E8JOtP7qCv1zTI1SI1zmINyG+C5Lc1PMglrdRf5h74DFBYAwk0dHnzCn3r/i6Kax
 6zocx8ovzh909Or8TJuWVUNFnWLHL+qBNsRnsa2Mqb7bUV+/uDQMIp84gu5r5fmuMMp5
 ay60DYDPShWJw980icOZz0EB3eh4Onr7XCkBmvU11X8IpuOt9V7cLY3YqBCt8YMS0P2z
 ScKRE9EZAj0Vc1F9iHZyDa1jHIpT/wqDvdhpta5KzZe12Zd9IWTao7+rNFy/jUSVaIW7
 +KEcK/B7VNOpugB9XfwNkxquN6fbk9w2H2blU7G3ZZ4U0BwSlvfU5cMApt3z0QaaeFF8
 pkUA==
X-Gm-Message-State: AOAM532jBxlsYkB45v895IhxP1bq9+GsfTf1gzvbs3eX0crDJknOC5Db
 8PKM6x39VH1m6n+pqYBTTOZOfKE1HBXIcXtb4Q71wapvPBKoFxXfG1txrSLY977j3hKwFwKYfCV
 a0qAcDT+iGBrOY8A=
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr2587284wrc.686.1640092132151; 
 Tue, 21 Dec 2021 05:08:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4XpZxGI+dH3f1CBKmPtXVfZ3VL7FrONA1v1Us7S14MWSASOiZmj/yZJFHnUIIJHwleQkshg==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr2587273wrc.686.1640092131949; 
 Tue, 21 Dec 2021 05:08:51 -0800 (PST)
Received: from xz-m1.local ([85.203.46.179])
 by smtp.gmail.com with ESMTPSA id bg34sm2498495wmb.47.2021.12.21.05.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 05:08:51 -0800 (PST)
Date: Tue, 21 Dec 2021 21:08:45 +0800
From: Peter Xu <peterx@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PATCH v2 7/8] migration: Finer grained tracepoints for
 POSTCOPY_LISTEN
Message-ID: <YcHR3V/9BuhUVp/h@xz-m1.local>
References: <20211220085355.2284-1-peterx@redhat.com>
 <20211220085355.2284-8-peterx@redhat.com>
 <cunwnjyl10t.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cunwnjyl10t.fsf@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 10:12:34AM +0000, David Edmondson wrote:
> On Monday, 2021-12-20 at 16:53:54 +08, Peter Xu wrote:
> 
> > The enablement of postcopy listening has a few steps, add a few tracepoints to
> > be there ready for some basic measurements for them.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  migration/savevm.c     | 9 ++++++++-
> >  migration/trace-events | 2 +-
> >  2 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index 7f7af6f750..25face6de0 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -1947,9 +1947,10 @@ static void *postcopy_ram_listen_thread(void *opaque)
> >  static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> >  {
> >      PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
> > -    trace_loadvm_postcopy_handle_listen();
> >      Error *local_err = NULL;
> >
> > +    trace_loadvm_postcopy_handle_listen("enter");
> > +
> >      if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
> >          error_report("CMD_POSTCOPY_LISTEN in wrong postcopy state (%d)", ps);
> >          return -1;
> > @@ -1964,6 +1965,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> >          }
> >      }
> >
> > +    trace_loadvm_postcopy_handle_listen("after disgard");
> 
> s/disgard/discard/

Will fix.

> 
> > +
> >      /*
> >       * Sensitise RAM - can now generate requests for blocks that don't exist
> >       * However, at this point the CPU shouldn't be running, and the IO
> > @@ -1976,6 +1979,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> >          }
> >      }
> >
> > +    trace_loadvm_postcopy_handle_listen("after uffd");
> > +
> >      if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
> >          error_report_err(local_err);
> >          return -1;
> > @@ -1990,6 +1995,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
> >      qemu_sem_wait(&mis->listen_thread_sem);
> >      qemu_sem_destroy(&mis->listen_thread_sem);
> >
> > +    trace_loadvm_postcopy_handle_listen("exit");
> > +
> 
> "return" rather than "exit"?

I don't think it matters a lot, but sure.

Thanks,

-- 
Peter Xu


