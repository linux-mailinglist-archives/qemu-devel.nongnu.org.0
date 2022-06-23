Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D0C55801D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 18:42:09 +0200 (CEST)
Received: from localhost ([::1]:58962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4PuC-0003j9-Qx
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 12:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4PqM-0001jS-Hx
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4PqJ-0003eV-3D
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:38:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656002285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvigqjfixdcBqgOaPotw9ZipJ1hlEyIQX2U6p8co/w4=;
 b=dwvZwtGWGj388NkZLJ3qWKUsl82Er1m1zWiiRZUgx0KdN6+xREp3T76xWNXR49Q867VjNZ
 KJWN/UIfEdd7rZF3xL6pQvKasmT818jwI1stVDIBvv3f763E4dGsnNE48Ou4HI93GFIaG3
 yf4fAMvvipGNHfyZTPZYygQkwaJm61o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-uvzr27atO9irDWcLs3odYw-1; Thu, 23 Jun 2022 12:38:04 -0400
X-MC-Unique: uvzr27atO9irDWcLs3odYw-1
Received: by mail-wm1-f72.google.com with SMTP id
 o3-20020a05600c510300b0039743540ac7so7179475wms.5
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 09:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=UvigqjfixdcBqgOaPotw9ZipJ1hlEyIQX2U6p8co/w4=;
 b=ugh/5B6NpYh5NK1g6RWcbClJyJW+ul0a2zUq5W3p/g6hjulVLBu2k2NSXSgm0wpto1
 mr9u+GSFENGjvAryl2VWBJ1ozqIKKaxrNz12MIFnLDl/DOG7P7YV6laucbhjNfc2dFPs
 YyaZjdxU3GHHUh/DhQ45f/YlK0AnoXFAyW+cCCzfHT107Jxf/E3nS4aVaNk3WvcvSeii
 6yRp8VCFHtVrah9hXphTsZn4qmQGrvP+joVgotGdljZ2KGPiPhwtPKWGan06dNN1qRb2
 TIPys+DqEel85ipRqh4yZQjgdhHL1eAfblKF5BmcjBbIzhpEhPVJKCVjXT30+V9xVHAb
 B7Bg==
X-Gm-Message-State: AJIora9RHO0H94cgRRECpZKPg8h/ZR5EKIca2WAXhqEEdUllsm07ZQae
 knu1ydkXMNInRevMjC26DWgzOoRYpF9KSsGJibWUroBb9qw6LXkQwDmJKVQTH93bLd/OBZyIHQV
 BBWoGfs1nZnT5IhI=
X-Received: by 2002:a05:6000:178d:b0:20f:e84c:2f46 with SMTP id
 e13-20020a056000178d00b0020fe84c2f46mr9322559wrg.646.1656002283072; 
 Thu, 23 Jun 2022 09:38:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u56zOyoj3CALl8WG3nu4d7+1Er+UYrLBYYpo3DD8nHZTf7koCs8guGim4DHsyiH8kP3txmHg==
X-Received: by 2002:a05:6000:178d:b0:20f:e84c:2f46 with SMTP id
 e13-20020a056000178d00b0020fe84c2f46mr9322525wrg.646.1656002282767; 
 Thu, 23 Jun 2022 09:38:02 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 co13-20020a0560000a0d00b0021b8bb97a47sm15349840wrb.50.2022.06.23.09.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 09:38:02 -0700 (PDT)
Date: Thu, 23 Jun 2022 17:37:59 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com,
 jdenemar@redhat.com
Subject: Re: [PULL 00/33] migration queue
Message-ID: <YrSW5/OqhTXTnm23@work-vm>
References: <20220623092810.96234-1-dgilbert@redhat.com>
 <9573d33b-5c08-a3f1-80a2-ab74bb055fc2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9573d33b-5c08-a3f1-80a2-ab74bb055fc2@linaro.org>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

* Richard Henderson (richard.henderson@linaro.org) wrote:
> On 6/23/22 02:27, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > The following changes since commit 2b049d2c8dc01de750410f8f1a4eac498c04c723:
> > 
> >    Merge tag 'pull-aspeed-20220622' of https://github.com/legoater/qemu into staging (2022-06-22 07:27:06 -0700)
> > 
> > are available in the Git repository at:
> > 
> >    https://gitlab.com/dagrh/qemu.git tags/pull-migration-20220623a
> > 
> > for you to fetch changes up to 5df0eaff8e24223974bf2516e6dc773695603017:
> > 
> >    tests: Add dirty page rate limit test (2022-06-23 10:18:14 +0100)
> > 
> > ----------------------------------------------------------------
> > Migration pull 2022-06-23
> > 
> > This replaces my pull from yesterday, and Juan's from the day before.
> > 
> > Compared to my pull eysterday:
> >    A one character fix in get_buffer patch spotted by Peter Xu
> > 
> > Compared to Juan's pull:
> >    a) Hopefully fixed non-Linux builds
> >      (Local build test on mingw64 works
> >      Note: the zero-copy capability is now
> >      defined on non-Linux systems)
> >    b) Added Hyman's series - it had been
> >      on queue for a while (sorry for the delay)
> > 
> > In this today migration PULL request:
> > - Dainiel Berrangé - qemufileops cleanup
> > - Leonardo Bras  - cleanups for zero copy
> > - Juan Quintela  - RDMA cleanups
> > - Hyman Huang - per-vcpu dirty ring work
> 
> New build failure on all 32-bit hosts:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2631167210
> 
> ../softmmu/dirtylimit.c: In function ‘vcpu_dirty_rate_get’:
> /builds/qemu-project/qemu/include/qemu/compiler.h:74:36: error: static
> assertion failed: "not expecting: sizeof(*&rates[cpu_index].dirty_rate) >
> ATOMIC_REG_SIZE"
>    74 | #define QEMU_BUILD_BUG_MSG(x, msg) _Static_assert(!(x), msg)
>       |                                    ^~~~~~~~~~~~~~
> /builds/qemu-project/qemu/include/qemu/compiler.h:76:30: note: in expansion
> of macro ‘QEMU_BUILD_BUG_MSG’
>    76 | #define QEMU_BUILD_BUG_ON(x) QEMU_BUILD_BUG_MSG(x, "not expecting: " #x)
>       |                              ^~~~~~~~~~~~~~~~~~
> /builds/qemu-project/qemu/include/qemu/atomic.h:136:5: note: in expansion of
> macro ‘QEMU_BUILD_BUG_ON’
>   136 |     QEMU_BUILD_BUG_ON(sizeof(*ptr) > ATOMIC_REG_SIZE); \
>       |     ^~~~~~~~~~~~~~~~~
> ../softmmu/dirtylimit.c:120:12: note: in expansion of macro ‘qatomic_read’
>   120 |     return qatomic_read(&rates[cpu_index].dirty_rate);
>       |            ^~~~~~~~~~~~
> 
> Still not fixed on non-linux:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2631167373
> 
> ../tests/qtest/migration-test.c:2294:34: error: use of undeclared identifier
> 'DIRTYLIMIT_TOLERANCE_RANGE'
>         if (rate < (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
>                                  ^
> ../tests/qtest/migration-test.c:2316:34: error: use of undeclared identifier
> 'DIRTYLIMIT_TOLERANCE_RANGE'
>         if (rate > (quota_rate + DIRTYLIMIT_TOLERANCE_RANGE)) {
>                                  ^

Sorry about that; hmm these are both from the extra series I added that
weren't in Juan's first version.  I'll drop it.

Dave

> r~
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


