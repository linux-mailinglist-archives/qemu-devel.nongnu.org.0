Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F349A3CF5BD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 10:10:07 +0200 (CEST)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5kpF-0001Ya-R7
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 04:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m5ko6-0000ss-5C
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:08:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m5ko1-0001uk-Sa
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 04:08:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626768524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pMsJxPoWjPBPmA2GN2i858wZcW8mzhy5sj2FUlbfgPk=;
 b=Xh42YtM1o/Pn2+ozQjwXYXtQTVSh9fWgYQK7mK8JEmg1iFobazhinAL2Idd1cQgZ4a5xX1
 9F2YgiQbfnhe9k6RUTJYoPPVYdxAbAi/1Y+my9LcbJBWMaSpj7CyZFug/4kJxB+EXnBI/P
 ejZIIvJxypfir0l8wuBhoPjItC0SNqI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-qwx0nfMkMBe3VdhrhllA3A-1; Tue, 20 Jul 2021 04:08:43 -0400
X-MC-Unique: qwx0nfMkMBe3VdhrhllA3A-1
Received: by mail-wr1-f70.google.com with SMTP id
 r9-20020a5d49890000b02901524df25ad7so313164wrq.8
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 01:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pMsJxPoWjPBPmA2GN2i858wZcW8mzhy5sj2FUlbfgPk=;
 b=FLzTgVr/qqZZUANG0hJZyXH2UIZBTiQlkcp7I2M9W6qjc2ltbZtEZLb4/Ogys1UrYw
 dE8brWuggRD3tmHh+AhttOiZ+E/C0fvZowiYFNSeSlTERVhbQJlgG2vuIsZUHhUdBNFX
 0OeOIl0Sm4FgbIfzpyWl9HU232RTULuY6uK9zjWQISCE5qJ4aMbToM0xDCbtQdD1pCo2
 +AwRIO1WGdt5yyJMfrBKP6+A2oSvMZno395SUnBauh5apqW8FKAJsPJzuVsTQLtVnUb6
 E1uG1VZw+YuOCTbPOq9RbSu+EDTjIUVgxHway1yiyihLLam4gAFlqDqZmBZLO6oFYsBi
 EyYg==
X-Gm-Message-State: AOAM533PGhxcQuvWpysHHu8/8SnS/p8g4DcLwDq86VrwSnn5mXWGdsgh
 kxKe1fFXNEVVdjyf3UrkXrytDWwode0XuKUTw9nrRcwU1v+EgvDwFO670npC5UeVyhrlBwHr3sg
 quDC+Hk8A2/u1JuI=
X-Received: by 2002:a1c:790e:: with SMTP id l14mr35018465wme.119.1626768522772; 
 Tue, 20 Jul 2021 01:08:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysoGRDwiEkeZJFqoYqH9ErNUKfD7NguwA3w4tMRkvEwu9OzdV7Jhfy4q+MrS4srsRdiA/PGA==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr35018450wme.119.1626768522597; 
 Tue, 20 Jul 2021 01:08:42 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id b15sm26769575wrr.27.2021.07.20.01.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 01:08:42 -0700 (PDT)
Date: Tue, 20 Jul 2021 09:08:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: random crash in migration-test, i386 guest, x86-64 host:
Message-ID: <YPaEiJsAyMCqPs5R@work-vm>
References: <CAFEAcA_byx5rCR7Y+yJrZ=K8oifdYEAza041W4yyA+wJkDpn6w@mail.gmail.com>
 <CAFEAcA-VYiFo4aiuOSnenObaLt5Y87dUdO1=amUm+j=2-EnSag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-VYiFo4aiuOSnenObaLt5Y87dUdO1=amUm+j=2-EnSag@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Mon, 19 Jul 2021 at 13:43, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Random crash in migration-tests:
> >
> > MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> > QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qem
> > u-for-merges/tests/dbus-vmstate-daemon.sh
> > QTEST_QEMU_BINARY=./qemu-system-i386
> > QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-
> > storage-daemon tests/qtest/migration-test --tap -k
> > PASS 1 qtest-i386/migration-test /i386/migration/bad_dest
> > PASS 2 qtest-i386/migration-test /i386/migration/fd_proto
> > PASS 3 qtest-i386/migration-test /i386/migration/validate_uuid
> > PASS 4 qtest-i386/migration-test /i386/migration/validate_uuid_error
> > PASS 5 qtest-i386/migration-test /i386/migration/validate_uuid_src_not_set
> > PASS 6 qtest-i386/migration-test /i386/migration/validate_uuid_dst_not_set
> > PASS 7 qtest-i386/migration-test /i386/migration/auto_converge
> > PASS 8 qtest-i386/migration-test /i386/migration/postcopy/unix
> > Broken pipe
> > ../../tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from
> > signal 6 (Aborted) (core dumped)
> > ERROR qtest-i386/migration-test - too few tests run (expected 15, got 8)
> > Makefile.mtest:280: recipe for target 'run-test-33' failed
> > make: *** [run-test-33] Error 1
> 
> And again, different guest architecture, still x86-64 host:
> 
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qem
> u-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-aarch64
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qe
> mu-storage-daemon tests/qtest/migration-test --tap -k
> PASS 1 qtest-aarch64/migration-test /aarch64/migration/bad_dest
> PASS 2 qtest-aarch64/migration-test /aarch64/migration/fd_proto
> PASS 3 qtest-aarch64/migration-test /aarch64/migration/validate_uuid
> PASS 4 qtest-aarch64/migration-test /aarch64/migration/validate_uuid_error
> PASS 5 qtest-aarch64/migration-test /aarch64/migration/validate_uuid_src_not_set
> PASS 6 qtest-aarch64/migration-test /aarch64/migration/validate_uuid_dst_not_set
> PASS 7 qtest-aarch64/migration-test /aarch64/migration/auto_converge
> PASS 8 qtest-aarch64/migration-test /aarch64/migration/postcopy/unix
> Broken pipe
> ../../tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from
> signal 6 (Aborted) (core dumped)

Thanks; I'll sit one in a loop and see if I can get it to fail.

Dave

> ERROR qtest-aarch64/migration-test - too few tests run (expected 15, got 8)
> Makefile.mtest:264: recipe for target 'run-test-31' failed
> 
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


