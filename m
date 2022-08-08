Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B1958CC84
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:05:04 +0200 (CEST)
Received: from localhost ([::1]:59272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL6Ba-00079U-LP
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oL67k-0004UJ-7h
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oL67a-0001tS-CG
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 13:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659978051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKIdwlUyc48A+53CJXhwJ5gXy6GXpk/VVDUMJkZiXtc=;
 b=QajvRhlDk/KRXSnONP5gRFD+JajUSzV31XKYyf+w/YbMaNCEV+KpD0GBpXZ+QC/KmlnR7b
 5ZQ14idMtfq9gdI/WvI7nZUkZyuPVrHv9Gddy+eJRy6APSGUWTvKDH667xw1C9KOGyJqSA
 WJSxLIDggU0D5pRONFGh6awHL+wek7k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-gdIAaseKMG2r0IMZqPdYiA-1; Mon, 08 Aug 2022 13:00:50 -0400
X-MC-Unique: gdIAaseKMG2r0IMZqPdYiA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j36-20020a05600c1c2400b003a540d88677so1383738wms.1
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 10:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=XKIdwlUyc48A+53CJXhwJ5gXy6GXpk/VVDUMJkZiXtc=;
 b=YHdmp6kTag3kC4PoNCn9TVb0Usqzw0H3ptPaFVNtDbIjKdIXiIRv4H9vh/KngI0Ccf
 iQmZF+Qv5dpLClVyY6c9Xw2xqxuJXnWpziHAOfn+vo0IHg1CcNUXDEy9qRVlp1ceDtuK
 YVZaqMORby8U6tvFE72Ogr5NjH/GszmNqOxaWL+9arOg2iX9L/7qwPsr/NnWMl0t50jS
 9Fpd9bxae3fTlN4JBLUPRRxA5YuUY+9L/wltVbT1dDquL3MISMx5Nxv3EMOCGc72lQcK
 pZxgBx0lQeGV2o39s2uwxTuQAvmpKLqz0pVwh6nIrWdZEBLXOAjDlkt6KkV6+q91xals
 vMEg==
X-Gm-Message-State: ACgBeo0GVfbMiHeNl1KdjpbGwdDBRnEGcaSsCtTgv4T3jF5IRWBbKUMC
 35lGKx6mv0CTt0JlMguVt8hEVAvSn8rqtqBqtEtfQYhvl3zyn/OVt8tHG/M09eVvat277y+C922
 8qeYpy47CBE8TC64=
X-Received: by 2002:a5d:5581:0:b0:20f:fc51:7754 with SMTP id
 i1-20020a5d5581000000b0020ffc517754mr12490966wrv.413.1659978047841; 
 Mon, 08 Aug 2022 10:00:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Ysg2QnLsnCCgcrRfJ76fByJcKsJKX7TzJL79Z6fXGcWWbkwQ3bQS8zxJxOHv/o3n7jkazpw==
X-Received: by 2002:a5d:5581:0:b0:20f:fc51:7754 with SMTP id
 i1-20020a5d5581000000b0020ffc517754mr12490950wrv.413.1659978047616; 
 Mon, 08 Aug 2022 10:00:47 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 bn30-20020a056000061e00b002206236ab3dsm11622064wrb.3.2022.08.08.10.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 10:00:46 -0700 (PDT)
Date: Mon, 8 Aug 2022 18:00:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Migration tests are very slow in the CI
Message-ID: <YvFBPJ204rtMx+WC@work-vm>
References: <7bf333f0-7bdc-1ba7-2a45-ffa2894ad809@redhat.com>
 <YvD+FXVf//5xvlgy@redhat.com>
 <41dd9dd2-55bc-5a49-1bf7-757373dac465@redhat.com>
 <YvEIcNZ/CnFzdpkS@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YvEIcNZ/CnFzdpkS@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Mon, Aug 08, 2022 at 02:43:49PM +0200, Thomas Huth wrote:
> > On 08/08/2022 14.14, Daniel P. Berrangé wrote:
> > > On Mon, Aug 08, 2022 at 01:57:17PM +0200, Thomas Huth wrote:
> > > > 
> > > >   Hi!
> > > > 
> > > > Seems like we're getting more timeouts in the CI pipelines since commit
> > > > 2649a72555e ("Allow test to run without uffd") enabled the migration tests
> > > > in more scenarios.
> > > > 
> > > > For example:
> > > > 
> > > >   https://gitlab.com/qemu-project/qemu/-/jobs/2821578332#L49
> > > > 
> > > > You can see that the migration-test ran for more than 20 minutes for each
> > > > target (x86 and aarch64)! I think that's way too much by default.
> > > 
> > > Definitely too much.
> > > 
> > > > I had a check whether there is one subtest taking a lot of time, but it
> > > > rather seems like each of the migration test is taking 40 to 50 seconds in
> > > > the CI:
> > > > 
> > > >   https://gitlab.com/thuth/qemu/-/jobs/2825365836#L44
> > > 
> > > Normally with CI we expect a constant slowdown factor, eg x2.
> > > 
> > > I expect with migration though, we're triggering behaviour whereby
> > > the guest workload is generating dirty pages quicker than we can
> > > migrate them over localhost. The balance in this can quickly tip
> > > to create an exponential slowdown.
> > 
> > If I run the aarch64 migration-test on my otherwise idle x86 laptop, it also
> > takes already ca. 460 seconds to finish, which is IMHO also already too much
> > for a normal "make check" run (without SPEED=slow).
> > 
> > > I'm not sure if  'g_test_slow' gives us enough granularity though, as
> > > if we enable that, it'll impact the whole test suite, not just
> > > migration tests.
> > 
> > We could also check for the GITLAB_CI environment variable, just like we
> > already do it in some of the avocado-based tests ... but given the fact that
> > the migration test is already very slow on my normal x86 laptop, I think I'd
> > prefer if we added some checks with g_test_slow() in there ...
> > 
> > Are there any tests in migration-test.c that are rather redundant and could
> > be easily skipped in quick mode?
> 
> The trouble with migration is that there are alot of subtle permutations
> that interact in wierd ways, so we've got alot of test scenarios, includuing
> many with TLS:
> 
> /x86_64/migration/bad_dest
> /x86_64/migration/fd_proto
> /x86_64/migration/validate_uuid
> /x86_64/migration/validate_uuid_error
> /x86_64/migration/validate_uuid_src_not_set
> /x86_64/migration/validate_uuid_dst_not_set
> /x86_64/migration/auto_converge
> /x86_64/migration/dirty_ring
> /x86_64/migration/vcpu_dirty_limit
> /x86_64/migration/postcopy/unix
> /x86_64/migration/postcopy/plain
> /x86_64/migration/postcopy/recovery/plain
> /x86_64/migration/postcopy/recovery/tls/psk
> /x86_64/migration/postcopy/preempt/plain
> /x86_64/migration/postcopy/preempt/recovery/plain
> /x86_64/migration/postcopy/preempt/recovery/tls/psk
> /x86_64/migration/postcopy/preempt/tls/psk
> /x86_64/migration/postcopy/tls/psk
> /x86_64/migration/precopy/unix/plain
> /x86_64/migration/precopy/unix/xbzrle
> /x86_64/migration/precopy/unix/tls/psk
> /x86_64/migration/precopy/unix/tls/x509/default-host
> /x86_64/migration/precopy/unix/tls/x509/override-host
> /x86_64/migration/precopy/tcp/plain
> /x86_64/migration/precopy/tcp/tls/psk/match
> /x86_64/migration/precopy/tcp/tls/psk/mismatch
> /x86_64/migration/precopy/tcp/tls/x509/default-host
> /x86_64/migration/precopy/tcp/tls/x509/override-host
> /x86_64/migration/precopy/tcp/tls/x509/mismatch-host
> /x86_64/migration/precopy/tcp/tls/x509/friendly-client
> /x86_64/migration/precopy/tcp/tls/x509/hostile-client
> /x86_64/migration/precopy/tcp/tls/x509/allow-anon-client
> /x86_64/migration/precopy/tcp/tls/x509/reject-anon-client
> /x86_64/migration/multifd/tcp/plain/none
> /x86_64/migration/multifd/tcp/plain/cancel
> /x86_64/migration/multifd/tcp/plain/zlib
> /x86_64/migration/multifd/tcp/plain/zstd
> /x86_64/migration/multifd/tcp/tls/psk/match
> /x86_64/migration/multifd/tcp/tls/psk/mismatch
> /x86_64/migration/multifd/tcp/tls/x509/default-host
> /x86_64/migration/multifd/tcp/tls/x509/override-host
> /x86_64/migration/multifd/tcp/tls/x509/mismatch-host
> /x86_64/migration/multifd/tcp/tls/x509/allow-anon-client
> /x86_64/migration/multifd/tcp/tls/x509/reject-anon-client
> 
> Each takes about 4 seconds, except for the xbzrle, autoconverge and
> vcpu-dirty-rate tests which take 8-12 seconds.
> 
> We could short-circuit most of the tls tests, because 90% of what
> they're validating is the initial connection setup phase. We don't
> really need to run the full migration to completion, we can just
> abort once we're running. Just keep 3 doing the full migration
> to completion - one precopy, one postcopy and one multifd.

I'd rather we combined some than cutting stuff off; I was about to
suggest doing zlib with some of the TLS but then that wouldn't have
found the recent zlib one!

Dave

> That'd cut most of thte TLS tests from 4 seconds to 0.5 seconds.
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


