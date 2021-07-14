Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31433C923C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 22:38:14 +0200 (CEST)
Received: from localhost ([::1]:43742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3le2-00040o-13
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 16:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3ld8-00039r-F1
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:37:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1m3ld6-0002ZG-Tl
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626295036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7eG9Xs5MdXvkkdSmTKk/r2GdLt4IyIcOdTd5UIu+8g=;
 b=QqfevVyQQZ1Qe1D8Zehd7+P5J/BVf5FG0KyditGJ2z60JiiBbvsnd4/eEYJjgyDn3W6Fyb
 fAAVK9dFZaYgRPZi2wGzy46LMxgC19i1WDnOVCFxYDDinUqP/v+T3HVQNv3sS7cllr/XdB
 n4ylKiUpggDutmHcD7xRI1QAycpIJtg=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-RAKpGY1BNpGAekzQTYwSZg-1; Wed, 14 Jul 2021 16:37:12 -0400
X-MC-Unique: RAKpGY1BNpGAekzQTYwSZg-1
Received: by mail-oi1-f199.google.com with SMTP id
 n134-20020acad68c0000b029025a4350857eso1977729oig.8
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 13:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7eG9Xs5MdXvkkdSmTKk/r2GdLt4IyIcOdTd5UIu+8g=;
 b=GCrs/U7mFwAizPKssvuzfkvLuVNoKkQ1Vav7SgFUnB95tGTToWvSGTnrwzjBctwblD
 CxzUAAsCMNI+ZSeOwuPh46ocv+ppwZBlY4VAoIdv4Rie7ig0QaLwnFuG27jNfRYQ6Xmv
 bp84Zi0iOyqgvdETWL/UjRGjg9n4IIa8cjvsm3ViiC113oJeGlA4kMRRAX5syEUh9xMl
 uhdzpjhLE6Tw/FzJ1G1FzCJ5o6qfFwpF3w6ohglRGfhkzB5eAfMu9+8EjWgrbxnXOzYg
 zfwQYrnRg1iS5APgMEzKOj16Km4vW2rhAx+DogNyy0IDn71u3iOCm3Cs0umIS37PavyB
 G8ag==
X-Gm-Message-State: AOAM530a+Fwj0dMNK30m+D0HTRcrqybqZKtOOi+6u62ysEz05OUGe7Ai
 itjUgkngEPn5EkWlU3iRoPyPbmtkXL6Icqe7/HEnqHYPBL13/qF4nqefulEw7FY19vhIJYaYtwE
 G+dz0upU+jzI8BC8=
X-Received: by 2002:aca:6706:: with SMTP id z6mr8891360oix.135.1626295031801; 
 Wed, 14 Jul 2021 13:37:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTvCyM7wJ2gXokt048afcux0K+jv2s+hrAZu1eDHEKGCbuNzKNS3URLWNWJRGoizu5XhgnFQ==
X-Received: by 2002:aca:6706:: with SMTP id z6mr8891341oix.135.1626295031675; 
 Wed, 14 Jul 2021 13:37:11 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id x31sm662326ota.24.2021.07.14.13.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:37:11 -0700 (PDT)
Date: Wed, 14 Jul 2021 14:37:10 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/3] VFIO update 2021-07-13 (for v6.1)
Message-ID: <20210714143710.40546f4d.alex.williamson@redhat.com>
In-Reply-To: <CAFEAcA-m0hk1CTWj2W2bvYnuZgcn9xiUiS48kdopSgV-FkWcKg@mail.gmail.com>
References: <162621155674.487037.8788212042441164398.stgit@omen>
 <CAFEAcA-m0hk1CTWj2W2bvYnuZgcn9xiUiS48kdopSgV-FkWcKg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Pankaj Gupta <pankaj.gupta@ionos.com>,
 Auger Eric <eric.auger@redhat.com>, Cai Huoqing <caihuoqing@baidu.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021 20:45:40 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 13 Jul 2021 at 22:42, Alex Williamson
> <alex.williamson@redhat.com> wrote:
> >
> > The following changes since commit 961fef0ace0b2a997544deec2f01981b9c9c96e3:
> >
> >   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210712' into staging (2021-07-13 17:51:50 +0100)
> >
...
> 
> Something seems to have gone wrong with your pullrequest. Specifically,
> it appears to be based on commit 961fef0ace0b2a997 "Merge remote-tracking
> branch 'remotes/alistair/tags/pull-riscv-to-apply-20210712' into staging",
> which is not a commit that has ever been in master and indeed does not
> compile on all systems. (This is lucky, because if it had compiled
> I might not have noticed the mistake...)
> 
> Pull requests should always be based only on commits in master.

Sorry about that, Peter.  I'm glad you caught it.  I'll respin against
current master.  Thanks,

Alex


