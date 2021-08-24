Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5C3F6A1A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 21:48:41 +0200 (CEST)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIcPT-0003O2-V0
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 15:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIcO3-0002Q6-KQ
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 15:47:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIcO2-0004qw-4V
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 15:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629834425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVrJtvOB0vCipWDlLTU18X6AiMhmRSECcryFxkvjAoU=;
 b=I545vzOyM2CAx8PMtuOuqZwo4UNtBSxIHLbAjBSCeIxfIksIKQ8HZ9GGFUxWJPdsV60ytG
 R5ctVXuLxefu1xeJ6TogLGDgMMonjNdkkI7ib0TeOlSXIinQaLVfp4dOJQjG8gbYGE9IiX
 Z6eyrinZOPiJGYCZq8l+MB0S0sh4yNY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-aosVZGgSNXmt_YMPiuMNaw-1; Tue, 24 Aug 2021 15:39:21 -0400
X-MC-Unique: aosVZGgSNXmt_YMPiuMNaw-1
Received: by mail-qv1-f69.google.com with SMTP id
 gw9-20020a0562140f0900b0035decb1dfecso15771688qvb.5
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 12:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kVrJtvOB0vCipWDlLTU18X6AiMhmRSECcryFxkvjAoU=;
 b=DD4vfglw6yTRp5GPmUUebA5pcAtaa3FfLb4UBM83LvvHTgparsUeNGJiQWEC47xwbt
 z+JqBc6ByGtmK74MMLXcYVhBznrM3nAgXjc511K9XF2ElbldpRyw8Zuv0cDCx8z1Ogf/
 xnU1JDxfQTQvAwN/czUgWnruIa3L1Mmvbs50I25wgUaQoaMipactkScR6Pjy7m6kCZrs
 a8D9BuwuKy4DZNhof6iTlMl5aO/vFya8XaYmnfjOtx4H0mCp8uFXQC+rOCkxBZJMfsE0
 MTF7lP2vFoOX0fsIvCpvaItbPttfQEwX7uDFuvutLdU7bf5q/DX1zMxt5H+V94XoP91m
 Fkmw==
X-Gm-Message-State: AOAM531S+btv2tA/ViWj5HKgEj3rEIdWu139brKDt9MWVuXkFE7ezLXt
 r5S5s5jsQLuZFl49cORmMoombkZh0pWcJMEzq35P9mbZ6JA1E963+0OKuO3GLbGFUONS0ZAnS4C
 GQcRFSUCXMKk6LYU=
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr8826633qte.363.1629833961171; 
 Tue, 24 Aug 2021 12:39:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSzc5H7p9GEyc2NdxWsSzBp6rH3SQvTQVR4l7X2PQNwTSMZCtC6XuAemteRCC7jiSfKgUE3A==
X-Received: by 2002:ac8:7dd2:: with SMTP id c18mr8826614qte.363.1629833960973; 
 Tue, 24 Aug 2021 12:39:20 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id 12sm4931274qtt.16.2021.08.24.12.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 12:39:20 -0700 (PDT)
Date: Tue, 24 Aug 2021 15:39:19 -0400
From: Peter Xu <peterx@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 2/2] dump-guest-memory: Block live migration
Message-ID: <YSVK5/DR74AE0iZr@t490s>
References: <20210824152721.79747-1-peterx@redhat.com>
 <20210824152721.79747-3-peterx@redhat.com>
 <CAMxuvawNsaL66nTiWaQa72D_kDzRPj_-AWnof4att6ghcBSZkQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvawNsaL66nTiWaQa72D_kDzRPj_-AWnof4att6ghcBSZkQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 24, 2021 at 10:04:19PM +0400, Marc-André Lureau wrote:
> Hi

Hello, Marc-Andre,

> 
> On Tue, Aug 24, 2021 at 7:27 PM Peter Xu <peterx@redhat.com> wrote:
> 
> > Both dump-guest-memory and live migration caches vm state at the beginning.
> > Either of them entering the other one will cause race on the vm state, and
> > even
> > more severe on that (please refer to the crash report in the bug link).
> >
> > Let's block live migration in dump-guest-memory, and that'll also block
> > dump-guest-memory if it detected that we're during a live migration.
> >
> 
> How does it detect that migration is in progress?

migrate_add_blocker() (and the new migrate_add_blocker_internal()) guaranteed
it; it will only succeed if there's no migration, and it should cover both
sides of migration (as I think migration_is_idle() should return true on both
src/dst when there's one):

    if (migration_is_idle()) {
        migration_blockers = g_slist_prepend(migration_blockers, reason);
        return 0;
    }

    error_propagate_prepend(errp, error_copy(reason),
                            "disallowing migration blocker "
                            "(migration in progress) for: ");
    return -EBUSY;

That's why I removed the old check on incoming migration:

-    if (runstate_check(RUN_STATE_INMIGRATE)) {
-        error_setg(errp, "Dump not allowed during incoming migration.");
-        return;
-    }

Because I think it'll cover that case too.

Thanks,

-- 
Peter Xu


