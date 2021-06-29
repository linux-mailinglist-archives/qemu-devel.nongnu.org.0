Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3873B7B36
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:18:38 +0200 (CEST)
Received: from localhost ([::1]:35514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyOs9-0006so-Ez
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1lyMNb-0002AM-Ct
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 18:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1lyMNY-0008Rs-TD
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 18:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625006331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Myeryw1W9eerUNYwg33nmZZGLx/uquW6pfgmos05zTo=;
 b=dU1zzFe160rCqs1oKvg3vehMgQpbCoFTuKs2CxaDczSQs7dsCs4kv8mPhv8tO8UpNPLpb9
 0xwixwIXV8cyk4ofZIBCZfLJdQJU194PPhwyB4UQx28R7skBT75hjX7QBG/OM/iCAjoD8F
 vfvfDjLpFY/T4P1YjTNrsvYehLdDBaA=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-7qQy9RSMMuyD7yMZYqD2wg-1; Tue, 29 Jun 2021 18:38:50 -0400
X-MC-Unique: 7qQy9RSMMuyD7yMZYqD2wg-1
Received: by mail-lj1-f199.google.com with SMTP id
 k21-20020a05651c10b5b029017b0db01e8eso79047ljn.22
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 15:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Myeryw1W9eerUNYwg33nmZZGLx/uquW6pfgmos05zTo=;
 b=D40ShgJQiyQ//S/EPVQNA9rYpVE8/eADroY/OR+DDYrsLKRxxhF3+FYiKi2Uvq6fy5
 6zSn+uud17uXLDTP+o7iYi7moWbVMvjIMceE2O49R2P+3IzF0vpZMkqRlb/f9jzQcbm5
 D9dY9DKnpfxV/CRpAGJgFtB+xISDSboXEh7k9Wmx6J1THetgf34lwLpUOJb2Oqf9roDH
 +i1694Ck7ZhtHr5q7MS1a31Kp7qm5/ETzxnVjrCHs5J1/Ezl4GxBPu4D6e90onxPCXVv
 6lLkH9ngE1E0vqhxiiCVCf9FX34zvE4Zh7e8m4VUi4FQcj8jLPxjiXjthLga4kNPgsfP
 crSA==
X-Gm-Message-State: AOAM532dC41WibEzkknQky/GyjJi1WRpi2C9cbT2mvSHYUsWDSechftE
 2ykGcVSqEsL9p14wWIPOKfDxq/Ut3R5Qts3KxT4N7ofIFJ4rRvfs7a2MplqeqRsqv3XI14LmwRv
 eq8V0wFgNI9uMURGYPUKC914a4qyZ6iE=
X-Received: by 2002:ac2:442f:: with SMTP id w15mr25060269lfl.322.1625006328831; 
 Tue, 29 Jun 2021 15:38:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfGAUr1qR4mVDXOVRn7ORWwg+6OY7/iHYpPVsrrtkDtGiqO4rH7AtFzGHq4lyDf2kw/0qZfu9+aoMk27tGTmw=
X-Received: by 2002:ac2:442f:: with SMTP id w15mr25060255lfl.322.1625006328602; 
 Tue, 29 Jun 2021 15:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210629181356.217312-1-peterx@redhat.com>
In-Reply-To: <20210629181356.217312-1-peterx@redhat.com>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Tue, 29 Jun 2021 19:38:32 -0300
Message-ID: <CAJ6HWG4UZroY58qZRhRBabe8vidvWfDCHQ=NdLDK=dNV+H2Trw@mail.gmail.com>
Subject: Re: [PATCH 0/2] migration: Two fixes around yank and postcopy recovery
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Jun 2021 21:17:18 -0400
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
Cc: Lukas Straub <lukasstraub2@web.de>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 3:14 PM Peter Xu <peterx@redhat.com> wrote:
>
> The 1st patch should fix yank with unregister instance; I think it should also
> fix the issue that Leonardo used to fix in this patch:
>
> https://lore.kernel.org/qemu-devel/20210629050522.147057-1-leobras@redhat.com/
>
> The 2nd patch fixes postcopy recovery cannot retry if e.g. the 1st attempt
> provided a wrong port address.
>
> Note that the multifd zstd test may fail if run migration-test with sudo on
> master (which seems to be a known issue now), and it'll still fail after these
> two patches applied, however all running tests keep usual.
>
> (Leo: please let me know if this series didn't fix the issue you used to fix)

It does fix the issue, as far as I tested.

>
> Please review, thanks.
>
> Peter Xu (2):
>   migration: Move yank outside qemu_start_incoming_migration()
>   migration: Allow reset of postcopy_recover_triggered when failed
>
>  migration/migration.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> --
> 2.31.1
>
>


