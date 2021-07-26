Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C848D3D58CB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:47:38 +0200 (CEST)
Received: from localhost ([::1]:49354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7z57-0002D1-Tf
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7z3I-0000d1-Ej
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7z3G-0001iz-MC
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:45:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627299941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GXIU8OS+7HBqso3cPQettC6w6oIcKOODBf8sCbPSxXI=;
 b=IFpAwdB/UtJe8PI2ubJf2a+lyoSf3lMsOHV1w3Zd9WAmU7B3wRvmYMSYmqLIHnUR1G2yd1
 q8P7OQRcFS4o4CSVqPWjha0Df66D3wit4ZpeiFexfHVzed3WWC1lBQ7P+vaXAaAplLy+Mv
 MnaiLx5GXHvzww/XsUeTJPThPZUZgXU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-k-Rq9-jEPCKe__hJmFLzBQ-1; Mon, 26 Jul 2021 07:45:40 -0400
X-MC-Unique: k-Rq9-jEPCKe__hJmFLzBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k13-20020a05600c1c8db029025018ac4f7dso1401254wms.2
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 04:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GXIU8OS+7HBqso3cPQettC6w6oIcKOODBf8sCbPSxXI=;
 b=Kg9Pc2B8zQ1NKPA5R5/H3MByI1b5PxBqA+brCjvAVlC3OCXa4COKz8uMj3iStiRVOw
 4J23lJMt7G7iyqxws7CWDX+7upS34HuEbDqBFrxbMM3RNdnooXsVusojT+osc6tpAEjL
 xRa+Ev+kYKZSTBtEx6aFc6/+kp8HyIrRScmzGpROqRG3UYTkyhh/nkHZbGKpRyraqI4p
 Yjdwjq/KQIY1LnydWER92b5XrBUq/bpjpGlI28lpGJwWqACZxt9iTyRTXJy1HIVdTYhv
 ODmi5nYhmNrQZP2RxjNFIOC6AkOtpnCxu4m1Fxp8nhAxwegzC/EhGRoNcuQfJZGRqm/s
 gCmQ==
X-Gm-Message-State: AOAM532AwTipKIFRYlAQ9UY1T3wZRoIZ/VNNPRnskl311pIg86zgn/iC
 OBORwWMCMhQzvJyGAi12Lxl5CT8Vv4KYM0NFskjMB9vc51rMzXh6s4bbKJ/ad3V463XluAfLeCv
 rl3vmytX5lICgTqM=
X-Received: by 2002:adf:dd89:: with SMTP id x9mr366152wrl.401.1627299939596;
 Mon, 26 Jul 2021 04:45:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkYdsMTcvnejo9cDPHW6H9tyDbbeUp6owlOBmdK5CBQVuo2u70TmuA2rrPP40iGPiGqndu6w==
X-Received: by 2002:adf:dd89:: with SMTP id x9mr366127wrl.401.1627299939356;
 Mon, 26 Jul 2021 04:45:39 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id g138sm43042246wmg.32.2021.07.26.04.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 04:45:38 -0700 (PDT)
Date: Mon, 26 Jul 2021 12:45:36 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 0/5] migrations: Fix potential rare race of
 migration-test after yank
Message-ID: <YP6gYODsPyyQIDyV@work-vm>
References: <20210722175841.938739-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722175841.938739-1-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> v3:
> - Use WITH_QEMU_LOCK_GUARD() for patch 2 [Eric]
>   (potentially I can also replace other existing uses of qemu_file_lock into
>    WITH_QEMU_LOCK_GUARD, but I decided to took Dave's r-b first and leave that
>    for later)
> - Added r-bs for Dave on patch 2/4
> - Add a comment in patch 5 to explain why it's safe to unregister yank without
>   qemu_file_lock, in postcopy_pause() [Dave]
> 
> v2:
> - Pick r-b for Dave on patch 1/3
> - Move migration_file_get_ioc() from patch 5 to patch 4, meanwhile rename it to
>   qemu_file_get_ioc(). [Dave]
> - Patch 2 "migration: Shutdown src in await_return_path_close_on_source()" is
>   replaced by patch "migration: Make from_dst_file accesses thread-safe" [Dave]
> 
> Patch 1 fixes a possible race that migration thread can accidentally skip
> join() of rp_thread even if the return thread is enabled.  Patch 1 is suspected
> to also be the root cause of the recent hard-to-reproduce migration-test
> failure here reported by PMM:
> 
> https://lore.kernel.org/qemu-devel/YPamXAHwan%2FPPXLf@work-vm/
> 
> I didn't reproduce it myself; but after co-debugged with Dave it's suspected
> that the race of rp_thread could be the cause.  It's not exposed before because
> yank is soo strict on releasing instances, while we're not that strict before,
> and didn't join() on rp_thread wasn't so dangerous after all when migration
> succeeded before.
> 
> Patch 2 fixes another theoretical race on accessing from_dst_file spotted by
> Dave.  I don't think there's known issues with it, but may still worth fixing.
> 
> Patch 3 should be a cleanup on yank that I think would be nice to have.
> 
> Patch 4-5 are further cleanups to remove the ref==1 check in channel_close(),
> finally, as I always thought that's a bit hackish.  So I used explicit
> unregister of the yank function at necessary places to replace that ref==1 one.
> 
> I still think having patch 3-5 altogether would be great, however I think patch
> 1 should still be the most important to be reviewed.  Also it would be great to
> know whether patch 1 could fix the known yank crash.
> 
> Please review, thanks.

Queued with the fix; it survived over a long weekend running about 50k
times OK.

Dave

> Peter Xu (5):
>   migration: Fix missing join() of rp_thread
>   migration: Make from_dst_file accesses thread-safe
>   migration: Introduce migration_ioc_[un]register_yank()
>   migration: Teach QEMUFile to be QIOChannel-aware
>   migration: Move the yank unregister of channel_close out
> 
>  migration/channel.c           | 15 ++-------
>  migration/migration.c         | 57 +++++++++++++++++++++++++++--------
>  migration/migration.h         | 15 +++++++--
>  migration/multifd.c           |  8 ++---
>  migration/qemu-file-channel.c | 11 ++-----
>  migration/qemu-file.c         | 17 ++++++++++-
>  migration/qemu-file.h         |  4 ++-
>  migration/ram.c               |  3 +-
>  migration/savevm.c            | 11 +++++--
>  migration/yank_functions.c    | 42 ++++++++++++++++++++++++++
>  migration/yank_functions.h    |  3 ++
>  11 files changed, 138 insertions(+), 48 deletions(-)
> 
> -- 
> 2.31.1
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


