Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99051909FA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 10:52:20 +0100 (CET)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGgEN-00082d-OG
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 05:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jGgDD-0006vX-B1
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 05:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jGgDC-0003AB-05
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 05:51:06 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:24480)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jGgDB-00039Y-MU
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 05:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585043464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zGzcgyRrkPXX1UqYxTHYZKQRBdLGgo/Z3XISfhaZu84=;
 b=eh7YWSkzL6EcVaW+uX6V3p+dAk7L7fM+BwAkvOEZRf9tQiDCgZbPig0Nvkenm0drGkT7Jg
 3f92Bv8fRm3MIWyHX5tBf+oH271midOVniS4N/2U1tRzisbE0zgIu7vFH7Oa8aVt6/WSaI
 Cm8otu/mGDcg7U9R1eEfPcFJSFuhvlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-P6z3yG8ZOE-lwLc52j5V0A-1; Tue, 24 Mar 2020 05:51:01 -0400
X-MC-Unique: P6z3yG8ZOE-lwLc52j5V0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF53EA1362;
 Tue, 24 Mar 2020 09:50:59 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-119.ams2.redhat.com [10.36.113.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73AD160BE0;
 Tue, 24 Mar 2020 09:50:58 +0000 (UTC)
Date: Tue, 24 Mar 2020 10:50:56 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: Potential Null dereference
Message-ID: <20200324095056.GD5417@linux.fritz.box>
References: <CAGT9xrCJSy6yQ48p3hCRuwgV7t8vPS7eo+83_pOiPp0gDOfvvQ@mail.gmail.com>
 <336bbdf8-140a-e884-d5d1-0610a9b1c6a6@redhat.com>
MIME-Version: 1.0
In-Reply-To: <336bbdf8-140a-e884-d5d1-0610a9b1c6a6@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: vsementsov@virtuozzo.com, Mansour Ahmadi <ManSoSec@gmail.com>,
 qemu-devel@nongnu.org, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.03.2020 um 08:14 hat Philippe Mathieu-Daud=E9 geschrieben:
> On 3/24/20 4:05 AM, Mansour Ahmadi wrote:
> > Hi,
> >=20
> > Nullness of=A0 needs to be checked here:
> > https://github.com/qemu/qemu/blob/c532b954d96f96d361ca31308f75f1b95bd4d=
f76/block/commit.c#L221
> >=20
> > pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),...

Do you have a reproducer? It's not obvious to me how bs->backing could
be NULL here.

> >=20
> > While it is done at 2 other locations:
> > https://github.com/qemu/qemu/blob/c532b954d96f96d361ca31308f75f1b95bd4d=
f76/block/backup-top.c#L113
> > https://github.com/qemu/qemu/blob/c532b954d96f96d361ca31308f75f1b95bd4d=
f76/block/mirror.c#L1477

Commit 18775ff3269 made the change for mirror, however its commit
message is terse and doesn't say anything about the scenario where it
would happen. We also didn't add a test case for it. I would have
expected that failure to add the backing file would immediately error
out and not try to refresh the filename first.

backup-top.c has the check from the beginning. I assume it just copied
it from mirror.

Vladimir, do you remember the details?

Kevin


