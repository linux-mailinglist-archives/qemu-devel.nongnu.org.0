Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8913B875A
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 19:03:34 +0200 (CEST)
Received: from localhost ([::1]:34510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydcb-0003rX-V4
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 13:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lydap-0003CA-6a
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lydan-0001xY-IC
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 13:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625072500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EFY+X/s5cxCdePZWBYjZOxUwxtv10HSgbQZhn1O11Ic=;
 b=AY0e0/CJ25xDg1hhqIu8D+roJNy1CzdZb6CYY4BA6swWmjtNwnhxf8JTChHqMOnnYMhlne
 MEeaFC6yRAGzUnP0LkqRSA4DN9oFPsGO4AZEDPIYOSYHCYrvnQOj0jXAJU331qrkhZw1XN
 04SnPCTNJogK6jltdtEImPkukfPJ54A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-B68TvYtbNYatSyWPDq5EnA-1; Wed, 30 Jun 2021 13:01:37 -0400
X-MC-Unique: B68TvYtbNYatSyWPDq5EnA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so968865wmh.9
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 10:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EFY+X/s5cxCdePZWBYjZOxUwxtv10HSgbQZhn1O11Ic=;
 b=GsTzqf20m8VaLAMC7vNxmd8Bl9OcE0JxcyOvFDkpX2oCoaURo/X/GWOLkk7FygUh+F
 Pk6oBIO/VABXguIPDTDcZjcPNxol7vZpzXo3oZxrlxnhJmqstOEsKgOFxmm9U5kp5tlk
 ncEj28JKSFee5AOW6L8G9nk7ur15se7Lg+r3evg9p1AIScIbRaf+fGgCNAw17QOI4KCV
 Fp8bZVdgsuwXMYeY4/TcjM/nP0PQCjDRt3bUnWsN57uY6NbXu7y+DLvyHAlsY9uPc0+M
 qdylEwAbviCw+XzIoe7vD1ZnZqnqTmeh/9YTu1DZ/3Gr/i5IBRP6n9TnRbclkhZlMZ/z
 Wg2g==
X-Gm-Message-State: AOAM533IbwVBHM9EJWsU5Bauq1nrfwwBXeKZyPO5v1DuIThuv+Gvdj2s
 a/JmYxRotnwObe2J3b47PDP6wjqjJzwXhW7DWMO6OMAKavV0IO69FeAKc19vxUayLTok1Ko7X9n
 ix4SPZWKhDpJOfZE=
X-Received: by 2002:a1c:9884:: with SMTP id a126mr5781092wme.59.1625072496003; 
 Wed, 30 Jun 2021 10:01:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBB9gCE+ETjsZhE7ZQBlaZpjdDW6wmjyWC+JYa66StUF+kZryzvEKNr1fOf73kJTe2GQZ8Hg==
X-Received: by 2002:a1c:9884:: with SMTP id a126mr5781060wme.59.1625072495722; 
 Wed, 30 Jun 2021 10:01:35 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id y3sm22914836wru.78.2021.06.30.10.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 10:01:35 -0700 (PDT)
Date: Wed, 30 Jun 2021 18:01:32 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 0/2] tests: migration-test: Fix agressive test skip,
 add dirty ring test
Message-ID: <YNyjbEwsopQKeoF5@work-vm>
References: <20210615175523.439830-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210615175523.439830-1-peterx@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Based-on: <20210609014355.217110-1-peterx@redhat.com>
> 
> v2:
> - patch 2: detect dirty ring only for __linux__ [Dave]
> - Add r-b for Dave on both patches

Queued

> 
> Patch 1 is a fix for migration test not really running on new kernels.  The
> problem is uffd check now will constantly fail after upstream commit
> 37cd0575b8510159 - that means any host kernel newer than 5.11.
> 
> Patch 1 makes it slightly better by only skipping the two postcopy tests that
> needs uffd on these kernels.  When we want to run the full test, we can do:
> 
>   $ sudo QTEST_QEMU_BINARY=./qemu-system-x86_64 ./tests/qtest/migration-test
> 
> Then the uffd check will pass, and postcopy tests will be run.
> 
> Patch 2 of this series adds the dirty ring test that just got merged into qemu.
> It needs the other patch "[PATCH] KVM: Fix dirty ring mmap incorrect size due
> to renaming accident", and that's majorly why we need the "Based-on" tag.
> 
> Not sure what's the easiest way for the series as it'll depend on the other kvm
> patch.  Perhaps if I can try to get ack from Dave so Paolo could queue it too
> along with the kvm fix (for either the whole series or patch 2 only)?  I'll
> leave that to maintainers to decide..
> 
> Please review, thanks.
> 
> Peter Xu (2):
>   tests: migration-test: Still run the rest even if uffd missing
>   tests: migration-test: Add dirty ring test
> 
>  tests/qtest/migration-test.c | 69 +++++++++++++++++++++++++++++++-----
>  1 file changed, 60 insertions(+), 9 deletions(-)
> 
> -- 
> 2.31.1
> 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


