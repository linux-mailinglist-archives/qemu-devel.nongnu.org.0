Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3768148085
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 13:23:39 +0200 (CEST)
Received: from localhost ([::1]:46168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hcpjd-0004Jy-TU
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 07:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51339)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hcpiR-0003b3-Eq
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:22:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hcpiO-0006Y8-Ra
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 07:22:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57688)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hcpiJ-0006RS-0Q; Mon, 17 Jun 2019 07:22:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5D9AA81132;
 Mon, 17 Jun 2019 11:22:13 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-99.ams2.redhat.com [10.36.117.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A64287D934;
 Mon, 17 Jun 2019 11:22:11 +0000 (UTC)
Date: Mon, 17 Jun 2019 13:22:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190617112204.GD7397@linux.fritz.box>
References: <1560276131-683243-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1560276131-683243-4-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1960f611-4650-fa6b-4ccf-7eecd5ca5dc0@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1960f611-4650-fa6b-4ccf-7eecd5ca5dc0@virtuozzo.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 17 Jun 2019 11:22:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 3/7] iotests: Valgrind fails to work
 with nonexistent directory
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
Cc: "berrange@redhat.com" <berrange@redhat.com>,
 Denis Lunev <den@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>, Roman Kagan <rkagan@virtuozzo.com>,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.06.2019 um 11:52 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 11.06.2019 21:02, Andrey Shinkevich wrote:
> > The Valgrind uses the exported variable TMPDIR and fails if the
> > directory does not exist. Let us exclude such a test case from
> > being run under the Valgrind.
> > 
> > Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> 
> Hmm, isn't it preferable to skip unsupported by
> valgrind iotests, instead silently disable valgrind in them?

You mean like this at the start of the script?

[ "$VALGRIND_QEMU" == "y" ] && _notrun "valgrind needs a working TMPDIR"

I agree that silently doing something different that the user requested
is bad and visibly skipping the test is often better. On the other hand,
051 is relatively long and it's only one subtest that doesn't work with
valgrind.

Hm... How about we do run the test, but put a note in the casenotrun
file so it's visible that we didn't use valgrind for everything?

Kevin

