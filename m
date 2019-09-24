Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A22BD32D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 21:56:48 +0200 (CEST)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCqvW-0006MY-VP
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 15:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35641)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iCqmz-0007Js-4Y
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 15:47:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iCqmy-0006gY-3G
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 15:47:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41758)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iCqmx-0006em-NI
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 15:47:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D9B4B8980EF
 for <qemu-devel@nongnu.org>; Tue, 24 Sep 2019 18:29:59 +0000 (UTC)
Received: from work-vm (ovpn-117-225.ams2.redhat.com [10.36.117.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4333C10013D9;
 Tue, 24 Sep 2019 18:29:56 +0000 (UTC)
Date: Tue, 24 Sep 2019 19:29:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] migration: Fix postcopy bw for recovery
Message-ID: <20190924182953.GE2725@work-vm>
References: <20190906130103.20961-1-peterx@redhat.com>
 <87muetblm7.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87muetblm7.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 24 Sep 2019 18:29:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Laurent Vivier <lvivier@redhat.com>, Xiaohui Li <xiaohli@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> migration-tests hangs intermittently for me, and git bisect led me
> here.  Test script:
> 
> i=0; while true; do let i++; echo "= $i ="; MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}  QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64 QTEST_QEMU_IMG=qemu-img tests/migration-test -p /x86_64/migration/postcopy/recovery -k; done

Which is fixed by the patch I posted yesterday:

migration/postcopy: Recognise the recovery states as 'in_postcopy'

Good working finding it using a bisect - it was way too unreliable
for me to find repeatably.

The 'Fix postcopy bw for recovery' patch is actually right - it just
exposes another existing race.

Dave

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

