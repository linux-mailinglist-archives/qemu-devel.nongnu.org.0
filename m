Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A51B0CC8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 12:22:46 +0200 (CEST)
Received: from localhost ([::1]:60358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8MFR-0008Ba-4L
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 06:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53911)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1i8MDX-0006wD-91
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:20:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1i8MDV-0007uY-QB
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:20:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60486)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1i8MDV-0007uM-HQ
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 06:20:45 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 763B91DC8;
 Thu, 12 Sep 2019 10:20:44 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70826600C4;
 Thu, 12 Sep 2019 10:20:42 +0000 (UTC)
Date: Thu, 12 Sep 2019 11:20:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Yury Kotov <yury-kotov@yandex-team.ru>
Message-ID: <20190912102039.GE7230@work-vm>
References: <20190903162246.18524-1-yury-kotov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903162246.18524-1-yury-kotov@yandex-team.ru>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Thu, 12 Sep 2019 10:20:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 0/3] UUID validation during migration
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Yury Kotov (yury-kotov@yandex-team.ru) wrote:
> Hi,

> V2:
> * Remove x- prefix from capability name
> * Fix expected status checking
> * Fix description of capability
> 
> This series adds an UUID validation at the start of the migration
> on the target side. The idea is to identify the source of migration.
> 
> Possible case of problem:
> 1. There are 3 servers: A, B and C
> 2. Server A has a VM 1, server B has a VM 2
> 3. VM 1 and VM 2 want to migrate to the server C
> 4. Target of VM 1 starts on the server C and dies too quickly for some reason
> 5. Target of VM 2 starts just after that and listen the same tcp port X, which
>    the target of VM 1 wanted to use
> 6. Source of VM 1 connects to the tcp port X, and migrates to VM 2 source
> 7. It's possible that migration might be successful (e.g., devices are the same)
> 8. So, the target of VM 2 is in undefined state
> 
> The series adds a capability to prevent successful (by mistake) migration.
> 
> The new capability validate-uuid only affects the source so that it sends
> its UUID to the target. The target will validate the received UUID and stop
> the migration if UUIDs are not equal.
> 
> Regards,
> Yury

Queued

> Yury Kotov (3):
>   migration: Add validate-uuid capability
>   tests/libqtest: Allow setting expected exit status
>   tests/migration: Add a test for validate-uuid capability
> 
>  migration/migration.c  |   9 +++
>  migration/migration.h  |   1 +
>  migration/savevm.c     |  45 +++++++++++++
>  qapi/migration.json    |   5 +-
>  tests/libqtest.c       |  36 ++++++-----
>  tests/libqtest.h       |   9 +++
>  tests/migration-test.c | 140 ++++++++++++++++++++++++++++++++---------
>  7 files changed, 199 insertions(+), 46 deletions(-)
> 
> -- 
> 2.17.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

