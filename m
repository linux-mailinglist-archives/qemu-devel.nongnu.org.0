Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7763D2774
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:20:56 +0200 (CEST)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bRP-0006U8-7u
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:20:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6bPs-0005e0-Hz
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:19:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6bPq-0006OY-Fv
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626970757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=br/vRHzkWgqDJ/aXzk0hLg4JNMrrAtNGnPRbK2sJilw=;
 b=cu5REtX8HdfiQTC7Fv93GdLbx3MeYSTyXi7cGAqlKoVRgxXGW4KVOdwD62jXIMdWvO/Fks
 MCpd8avuOH7mJLx2x52dJJERH4N6wAaO/j1HjnoK9ErkBvQ1QmZQUzlsqrubtED3nseqBO
 CGqYXwKWd/Exq4FgkuSOxuZsAwrdMX4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-8MNYYbHsOmetTyY3jkoJiQ-1; Thu, 22 Jul 2021 12:19:16 -0400
X-MC-Unique: 8MNYYbHsOmetTyY3jkoJiQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 z93-20020a0ca5e60000b02902e558bb7a04so3995298qvz.10
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 09:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=br/vRHzkWgqDJ/aXzk0hLg4JNMrrAtNGnPRbK2sJilw=;
 b=IJMZ+Q2IRbcI2uMFlRlFlnI/JhGobCV3rSC2XsakKf2ZH96fFfEjXWx/KFOGALbKag
 mNqbBwXVX1+ocWLaFHNptHFRz6NeGD0A5/Yj5VHF24mnLQY8GtWcdcT2lOTtqCGVZsbf
 1sUGVzK0hNlOBbQmJDusw18Y5VM+lrTOkSOKassJ7PaNxleuj+6aY41uuLx5d4pOHELV
 7JzOGj5NLDbxDHFX6mdvS4GxeGK1vV8nKOVfwrbyUVsKPRF6gDDO28h2oGXDBcxCqnQz
 NJo1B6xg4N/eeif0bx1u3qzlT0HPmy19Yqcxv4RBhdfVBNfdJQaUpgr5yA/up76F68Mr
 y8Sw==
X-Gm-Message-State: AOAM530PXTGkrbDJyNZ23H2ov1aOm79h//eEc1TbhC19kfrD/IuSHk8M
 TCtel3jlt5zs1l25AwWTFi8roY1GXuH0Cu60xlwD9s5KYxgk0d0cwvJeTJLlXITnxuXO9Mg/b1A
 icWePUbbAA4d0FrY=
X-Received: by 2002:ac8:5552:: with SMTP id o18mr418455qtr.51.1626970756091;
 Thu, 22 Jul 2021 09:19:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4fsba34YC9kDPHY5E4KVrn/+GpWiuklND3/V+6xo2BmhAWE+HxIfOYPGKWwGuWgJGp3fHPQ==
X-Received: by 2002:ac8:5552:: with SMTP id o18mr418439qtr.51.1626970755888;
 Thu, 22 Jul 2021 09:19:15 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id o63sm268663qkf.4.2021.07.22.09.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 09:19:15 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:19:14 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 5/5] migration: Move the yank unregister of
 channel_close out
Message-ID: <YPmagh393LlpVSm9@t490s>
References: <20210721193409.910462-1-peterx@redhat.com>
 <20210721193409.910462-6-peterx@redhat.com>
 <YPmOZ3LGm0u7GoBA@work-vm>
MIME-Version: 1.0
In-Reply-To: <YPmOZ3LGm0u7GoBA@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 04:27:35PM +0100, Dr. David Alan Gilbert wrote:
> > @@ -3352,6 +3355,8 @@ static MigThrError postcopy_pause(MigrationState *s)
> >  
> >          /* Current channel is possibly broken. Release it. */
> >          assert(s->to_dst_file);
> > +        /* Unregister yank for current channel */
> > +        migration_ioc_unregister_yank_from_file(s->to_dst_file);
> 
> Should this go inside the lock?

Shouldn't need to; as we've got the assert() right above so otherwise we'll
abrt otherwise :)

The mutex lock/unlock right below this one is not protecting us from someone
changing it but really for being able to wait until someone finished using it
then we won't crash someone else.

I think the rational is to_dst_file is managed by migration thread while
from_dst_file is managed by rp_thread.

Maybe I add a comment above?

Thanks,

-- 
Peter Xu


