Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685E839E5E8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:52:23 +0200 (CEST)
Received: from localhost ([::1]:40520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJQD-0005mN-P3
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lqIoj-0007Nt-38
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lqIof-0005Nq-1M
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 13:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623086012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bmnitD8CLsJykuGGNZPmXLieFrDdGzrfIgNf5w7iUGc=;
 b=ZSZDpbK6KMyR9uXdCNSPOy9H/SHyGXnMDZwx0INAq7dI0HwvEhBypnhFocum18u7IJCBjW
 5GVLx17pPVpmYfTgyuJkBG97gUpNVPhE8XDtupfFnFVZf9MiW0+KBy3en9sf2Uc5RF46J7
 M4I7wMCUD/bHHCGiWEwkuzdXOOh7elY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-y6pzawY6Of2WVLaQ8R7-3A-1; Mon, 07 Jun 2021 13:13:26 -0400
X-MC-Unique: y6pzawY6Of2WVLaQ8R7-3A-1
Received: by mail-qv1-f69.google.com with SMTP id
 v7-20020a0ccd870000b0290219d3e21c4eso13696978qvm.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 10:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bmnitD8CLsJykuGGNZPmXLieFrDdGzrfIgNf5w7iUGc=;
 b=Xm+eKnAXZw0hOtRP6qsnCaN2nRwNNaJDiRITQjNn2dip4aLXa6p7hDEPSbz4XKAe51
 c0Ir21vn62Wi2BWLpdffuiLklbTb18k1EehEThs4TDOB/JeXORNxsbTOQEJluBpX2CZq
 gRE9Atn2ZfZ4k9aQ016jO9HQeidPuf+cxfzbLR1TD9mujD3eVVYzbmfpiuYwiFZfvL+h
 ihSWxpAAY6U7LTC15sV4HcKnSNpNCGrN5vtxRCtlexD5Xknr+6mqhfa67yzaMGzuIxam
 6OnFsbDPeB0owilmAoO+EA2IKNpp4MXfC9m6RsQsABuze/pJaIJO3UTjVJy/ABj/2i6o
 qmkA==
X-Gm-Message-State: AOAM530ezezE49THmys8xlVHzsfWCt/+b2M50AwfjGo1pY8/dWXA4i2r
 xuAMxgJF+m/FQ2bAxYvH4uy2gaYIPYw0PZi1IboHYoX6rUnXL+ZK20I4dO3VfdvnqYWsOlZG1df
 Cuue9L/X74zGCHQY=
X-Received: by 2002:ac8:7215:: with SMTP id a21mr13012704qtp.329.1623086006384; 
 Mon, 07 Jun 2021 10:13:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCzuw3QxQGiUaP3Dm2do89eCVE3RDOYL49X9BWl25/GaOHWdiakBEGrVN5tcYNqy4yNxmmBA==
X-Received: by 2002:ac8:7215:: with SMTP id a21mr13012687qtp.329.1623086006153; 
 Mon, 07 Jun 2021 10:13:26 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id v6sm10006411qkv.54.2021.06.07.10.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:13:25 -0700 (PDT)
Date: Mon, 7 Jun 2021 13:13:24 -0400
From: Peter Xu <peterx@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v3 4/7] migration/dirtyrate: add per-vcpu option for
 calc-dirty-rate
Message-ID: <YL5TtDPZdpSQhmZ+@t490s>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
 <19ad91782f5798844c42e34683fda833f9d1928a.1623027729.git.huangy81@chinatelecom.cn>
 <YL4/U2Kjojyr2wcT@t490s>
 <5ce0a796-f261-6a13-1dc9-27bc52ba033d@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <5ce0a796-f261-6a13-1dc9-27bc52ba033d@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 12:16:03AM +0800, Hyman Huang wrote:

[...]

> > Actually I'm also wondering whether dirty log could be anything useful here in
> > the future as a 3rd mode (then the "*mode" idea should be more useful if so),
> > basically for old kernels where dirty ring is not there, we can timely call
> > memory_global_dirty_log_sync() and calculate dirty pages there just like what
> > we do with dirty rings (without calling migration_bitmap_sync(), so we don't
> > need to deliver dirty bits from kvmslots to ramblocks, just pick them up from
> > kvm and do the accounting for pure dirty rate measurement).  That's a wild idea
> > though, so just raise it up.  Would that be anything useful?
> uh, actually this idea is what i'm working on to stat the memory heat(trying
> to reduce the transferred memory in migration), theoretically it can be used
> for dirty rate measurement also, maybe i could try it after this patchset
> work having done.

Yes, definitely no need to do that in this series; it just proves that "*mode"
parameter is better in case a 3rd one could come.  Thanks,

-- 
Peter Xu


