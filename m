Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A865F46B6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:30:45 +0200 (CEST)
Received: from localhost ([::1]:46260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjsa-00005z-Er
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofisY-0006MN-L6
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ofiry-0007oX-FN
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664893559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7Qd6jHh7Gqjv9AAlMZcbefqRFB5lydLhRci7/Mda5vU=;
 b=TCS+ow4P64XOKgcf90ro6XEbY7bi5WGU6GagCTFJG8L0pBw2g84rnOscJpdCVL6AGtAISp
 kH543icSID+R9vzC49D++Xox/exrPLKOjlDlcdnEt94lDQ+3ARsQunkF8DqQF+TVmi8bTL
 KMs8VByACCiTMUi1SAFjQHBccWbGxZQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-UXIwCD80NS-h51_MI0gZ4A-1; Tue, 04 Oct 2022 10:25:55 -0400
X-MC-Unique: UXIwCD80NS-h51_MI0gZ4A-1
Received: by mail-qt1-f199.google.com with SMTP id
 w4-20020a05622a134400b0035cbc5ec9a2so9455141qtk.14
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=7Qd6jHh7Gqjv9AAlMZcbefqRFB5lydLhRci7/Mda5vU=;
 b=AnxgJsOSBiml6+hV9FKETp4yXmpt4t8S++oFjKCPj9oipVVh354252VXzh5a1GgBHD
 ACRH+WEAOFBoiEp0B1vYio1h51ErSvx6FI++mCrvFaPPVwweYNNgfgvYHUmOVoGpBvpv
 wvfjTHTt/1i3PopF5SrwdOnu1PKiKfZiKuD2yjEr98YIkJOq8BV18Cyg7NQIMp2l6hCT
 YXbyEFKMxR7jb+5jzI/rhCw/4hH7vbHvC9uX1IHFQZYjUaXIwz/WIe9VY7Yz2+JhmrM2
 Pwc2YvnFryaSGWA64HB+NOPxK7vAiQTMYiF3pAsI4TMyf5eD5c2ZLGlIhYCJC5AguLfM
 fZ5g==
X-Gm-Message-State: ACrzQf0ED0WmhXOiE4pHoHyhLfSkD48nmQebsByU0n4SqN6vjt7R8+zN
 Io+mo6P/0cpg6pH39rVAE7oeBYIg0ht87D649Mi9GQZ1rfVCoGaxx7r/y/MdAnOaxOQOOPZ0UYx
 M3UG5lv3bSK2ha0o=
X-Received: by 2002:ac8:580d:0:b0:35c:3fcc:2442 with SMTP id
 g13-20020ac8580d000000b0035c3fcc2442mr19722319qtg.501.1664893555487; 
 Tue, 04 Oct 2022 07:25:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7voV8amNIAj6BTpxWC+pFbOGNG41Wu7RMmhY/MUOF2twlnaqrurt2jvD8HdQtzWR6Okni+3A==
X-Received: by 2002:ac8:580d:0:b0:35c:3fcc:2442 with SMTP id
 g13-20020ac8580d000000b0035c3fcc2442mr19722296qtg.501.1664893555221; 
 Tue, 04 Oct 2022 07:25:55 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 k4-20020ac84784000000b0033b30e8e7a5sm11545911qtq.58.2022.10.04.07.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:25:54 -0700 (PDT)
Date: Tue, 4 Oct 2022 10:25:53 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 1/5] migration: Fix possible deadloop of ram save process
Message-ID: <YzxCcdPSewXDDwB+@x1n>
References: <20220920223800.47467-1-peterx@redhat.com>
 <20220920223800.47467-2-peterx@redhat.com>
 <Yyx2An+YcgYCbsDx@work-vm> <Yyx+cs9ihNx+WE6G@xz-m1.local>
 <YyyQOlxaSHRbZIK6@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YyyQOlxaSHRbZIK6@work-vm>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 22, 2022 at 05:41:30PM +0100, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > On Thu, Sep 22, 2022 at 03:49:38PM +0100, Dr. David Alan Gilbert wrote:
> > > * Peter Xu (peterx@redhat.com) wrote:
> > > > When starting ram saving procedure (especially at the completion phase),
> > > > always set last_seen_block to non-NULL to make sure we can always correctly
> > > > detect the case where "we've migrated all the dirty pages".
> > > > 
> > > > Then we'll guarantee both last_seen_block and pss.block will be valid
> > > > always before the loop starts.
> > > > 
> > > > See the comment in the code for some details.
> > > > 
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > 
> > > Yeh I guess it can currently only happen during restart?
> > 
> > There're only two places to clear last_seen_block:
> > 
> > ram_state_reset[2683]          rs->last_seen_block = NULL;
> > ram_postcopy_send_discard_bitmap[2876] rs->last_seen_block = NULL;
> > 
> > Where for the reset case:
> > 
> > ram_state_init[2994]           ram_state_reset(*rsp);
> > ram_state_resume_prepare[3110] ram_state_reset(rs);
> > ram_save_iterate[3271]         ram_state_reset(rs);
> > 
> > So I think it can at least happen in two places, either (1) postcopy just
> > started (assume when postcopy starts accidentally when all dirty pages were
> > migrated?), or (2) postcopy recover from failure.
> 
> Oh, (1) is a more general problem then; yeh.
> 
> > In my case I triggered this deadloop when I was debugging the other bug
> > fixed by the next patch where it was postcopy recovery (on tls), but only
> > once..  So currently I'm still not 100% sure whether this is the same
> > problem, but logically it could trigger.
> > 
> > I also remember I used to hit very rare deadloops before too, maybe they're
> > the same thing because I did test recovery a lot.
> 
> Note; 'deadlock' not 'deadloop'.

(Oops I somehow forgot there's still this series pending..)

Here it's not about a lock, or maybe I should add a space ("dead loop")?

-- 
Peter Xu


