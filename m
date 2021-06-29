Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E73B7776
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 19:54:30 +0200 (CEST)
Received: from localhost ([::1]:60518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyHwL-0007aq-VQ
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 13:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyHqj-0005p9-59
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:48:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyHqh-0008JL-FV
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 13:48:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624988918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LR5Z5sA7ge0/lPVDdSZDUvAytJnEL/ba1jjXUG6Pdko=;
 b=QbP6CDYR84MOyIumOt0X1MdcethYRZL8u7/BJDek8ympSSl949D/qTzSJYF4r0fSNl58YI
 mNByn7q2k94Hk07ehxEFS0HPJ+Z+ktW6n+Ppqzzujv7Z6OZOMRofwkKi0SgYE1g2wD1SDw
 Gmn4q9vY5BGOYgdz884a3r2IS9J/y3g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-vb9PXtEqOt6vdGwt_bgNVA-1; Tue, 29 Jun 2021 13:48:36 -0400
X-MC-Unique: vb9PXtEqOt6vdGwt_bgNVA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t82-20020a1cc3550000b02901ee1ed24f94so1575310wmf.9
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 10:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LR5Z5sA7ge0/lPVDdSZDUvAytJnEL/ba1jjXUG6Pdko=;
 b=Y1X7wmODFYMTMDhOiOtMwdr0Tvz29kv5XLyRlweqkSLGAhXIaldQcbVxlcrKuw/D66
 0LH/CwbIKoVG1xAhfTXZC6DTQ3O4RX7G4E4gRYUfQA6cNoaQHsOtLwy+E0YKSyC2Bz33
 5zzQMRYttXMz0X4wUDhCxQDYBV+HLPgwlRnF3JLaqWgQQR6cUopuowl811SCCrgmry+M
 DByZYOi1mFBwWQkUxeJ/FTql6c/LrtnToMWnuaskjgjC89yDdf3Gq3EXEyCTTIXh1G8n
 Xw+MDGNf1GXTt24muu1qo1Ty5f3idJrKwT9gwu5Y6oUUl/3ewkGD4oOyM+tYWNCARbtm
 elSg==
X-Gm-Message-State: AOAM532Ueq8FC8xnbDjmC2PzgnpP66rthG6ErU7aKZ7MEhs953GYWuHt
 mZIhpomHLlK0N9YE4pNvbZC5Iwh3HJdOcBn+akK4QokomiHbqTKp96pNhvdzmRT6MHCzncoA0T2
 UWE25aKoKySaOFck=
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr35879750wrr.162.1624988915185; 
 Tue, 29 Jun 2021 10:48:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFX/4Ky0qUEVrnhvjpQYICIpMKXLfB4879kh40YjiLQv8ydau9zbIAQRdkMakgo4MA8Hz03w==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr35879733wrr.162.1624988914973; 
 Tue, 29 Jun 2021 10:48:34 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id h10sm3514327wmb.40.2021.06.29.10.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 10:48:34 -0700 (PDT)
Date: Tue, 29 Jun 2021 18:48:32 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH 1/2] migration: move wait-unplug loop to its own function
Message-ID: <YNtc8K32iGkDr4wf@work-vm>
References: <20210629155007.629086-1-lvivier@redhat.com>
 <20210629155007.629086-2-lvivier@redhat.com>
 <87mtr8k1fz.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87mtr8k1fz.fsf@secure.mitica>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> Laurent Vivier <lvivier@redhat.com> wrote:
> > The loop is used in migration_thread() and bg_migration_thread(),
> > so we can move it to its own function and call it from these both places.
> >
> > Moreover, in migration_thread() we have a wrong state transition from
> > SETUP to ACTIVE while state could be WAIT_UNPLUG. This is correctly
> > managed in bg_migration_thread() so use this code instead.
> >
> > Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> If you have to repost:
> 
> 
> > +/*
> > + * if failover devices are present, wait they are completely
> > + * unplugged
> > + */
> > +
> > +static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
> > +                                    int new_state)
> 
> old_state and new state are always the same. SETUP -> ACTIVE.  I think
> we can hardcode them.
> 
> 
> > +{
> > +    if (qemu_savevm_state_guest_unplug_pending()) {
> > +        migrate_set_state(&s->state, old_state, MIGRATION_STATUS_WAIT_UNPLUG);
> > +
> > +        while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
> > +               qemu_savevm_state_guest_unplug_pending()) {
> > +            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
> 
> I still don't understand why are we using a semaphore when we just want
> a timer :-(
> 
> Yes, this is independent of this patch.

So yes I was going to ask on the 2nd patch; no one anywhere seems to set
that semaphore?

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


