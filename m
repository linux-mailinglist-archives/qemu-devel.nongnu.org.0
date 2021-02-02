Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64A030C4F6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:08:19 +0100 (CET)
Received: from localhost ([::1]:50722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yDy-0001Xo-Og
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l6xzE-0001kq-5y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:53:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l6xz8-0000Hl-8Y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ebQNjn84pPRPVLM8/ZQdJC8qItai4o4U/kPgI3F44dQ=;
 b=A4CMvrWsyWrQGaGSgVcWCybDR2AvrGF3EsiVpMV9bwjIKiZU4LON18JcpKxV42VG1czIf1
 fbEJk43rN/jmizB5ujVVHJb1ZqkpWF3z3toPMyf044st2IGLGF1TvVZw1XBaEeoo2Ys0K2
 LO1XV3k+cTGMrTtZ9UazjaSckH1ZgQA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-ECCMyzIWPkSUBNeC9SOIzQ-1; Tue, 02 Feb 2021 10:52:52 -0500
X-MC-Unique: ECCMyzIWPkSUBNeC9SOIzQ-1
Received: by mail-qv1-f72.google.com with SMTP id n1so12411693qvi.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 07:52:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ebQNjn84pPRPVLM8/ZQdJC8qItai4o4U/kPgI3F44dQ=;
 b=jpm++oRnLOtAiv+kz4nQblshsas/lKs5xdiCmBXwkVY//YM9mSDSGobQtsKoRWmS6X
 Rz5guuisWuiKYPSwMO1aQW4dfynC1biA3Qcfr3uPKq8pHdkv+xQaf+JaD0HWoESR5Oph
 V8fY13eWuofMZt9gKdaZzVHyLhuh04vZNjrZo+42IbP5VBS1pEkKNE61O1iEV79hKXab
 RP4htNF0Mhr4fK8BUzsJMMIdD93/4SUIN9NT1/cmTxcNNBl5UckosWhQXy24zh0G6+VM
 yHnzxHY9onTzuC9aOL6O0JWsaVhKL+w4Z6VwDRRbaHB++tzEO2JwJ+V+A883VM+gd9aZ
 gXZw==
X-Gm-Message-State: AOAM530X0nJ4hPKP7FzfMWhV9lJjn7u/g9EboIaVbbH/EApwpBA9O+tM
 wm1T4yWnMdZn4zDmpoRRLeXYTGLotCA+IVqFi4LADBdLgXtXPN7OTEoYBTUaiXjOlzjB+X6m66h
 DhpvBPHuaOTAG7Po=
X-Received: by 2002:ac8:5a8a:: with SMTP id c10mr2530369qtc.30.1612281171944; 
 Tue, 02 Feb 2021 07:52:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeXkBDtlBwr7rW8GbPKwUrHwXvB0BqP+jVGF29WYY+Oz20g+RZqSXmGEGbA7uYBmilHOPdpQ==
X-Received: by 2002:ac8:5a8a:: with SMTP id c10mr2530351qtc.30.1612281171746; 
 Tue, 02 Feb 2021 07:52:51 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id a2sm16906189qka.11.2021.02.02.07.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:52:50 -0800 (PST)
Date: Tue, 2 Feb 2021 10:52:49 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/2] migration: Add blocker information
Message-ID: <20210202155249.GB6468@xz-x1>
References: <20210202135522.127380-1-dgilbert@redhat.com>
 <20210202135522.127380-2-dgilbert@redhat.com>
 <b536c8f1-adca-cdec-3298-26d3c506e96a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b536c8f1-adca-cdec-3298-26d3c506e96a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: alex.williamson@redhat.com,
 "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>, laine@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 08:34:06AM -0600, Eric Blake wrote:
> On 2/2/21 7:55 AM, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Modify query-migrate so that it has a flag indicating if outbound
> > migration is blocked, and if it is a list of reasons.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  migration/migration.c | 25 +++++++++++++++++++++++--
> >  migration/savevm.c    | 13 +++++++++++++
> >  migration/savevm.h    |  1 +
> >  qapi/migration.json   |  6 ++++++
> >  4 files changed, 43 insertions(+), 2 deletions(-)
> > 
> 
> > +++ b/qapi/migration.json
> > @@ -224,6 +224,10 @@
> >  #        only returned if VFIO device is present, migration is supported by all
> >  #        VFIO devices and status is 'active' or 'completed' (since 5.2)
> >  #
> > +# @blocked: True if outgoing migration is blocked (since 6.0)
> > +#
> > +# @blocked-reasons: A list of reasons an outgoing migration is blocked (since 6.0)
> 
> A bit of redundancy here; the presence of blocked-reasons is sufficient
> to tell if migration is blocked, without needing a bool.  But having the
> bool is more type-friendly for machines, so I don't mind having both.

Agreed.

Also I'd also think we can directly export the device list to JSON then we can
have {"blockers": { "devices": {...}, "other": {...}}} so upper layer can do
more things like "would you want to unplug the device XXX to make it
migratable?" instead of parsing the error message first.

But non of the above is a big deal, I think:

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


