Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D913166653
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 19:30:23 +0100 (CET)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4qab-0001jy-KC
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 13:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1j4qZg-00011j-IL
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 13:29:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1j4qZb-0006Hq-FG
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 13:29:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38197
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1j4qZb-0006Eq-6a
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 13:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582223356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=841MbPFiw6BPQwdVimJEVs87ftQmyqJ6qNQEONuXdmw=;
 b=O51bdL9RSHckQhNQqHXAEBSNrSEZv632xESZv1x0ipWlWSce80GqX4SOT3HkCFnEFpa2qo
 woVkttN1ZZ3NMDmcZkKQNikxk3q7bA0OPHlOHcGvX5d6xS1JTNg7n1X5vzPmSDW5HooV6A
 ZV7MSjZ9aCDPWnIb9c+2cBbkQ2gArMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-WY5nAVj_NeCa3eywQZARdw-1; Thu, 20 Feb 2020 13:27:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED688801FAD;
 Thu, 20 Feb 2020 18:27:06 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3710B90CC0;
 Thu, 20 Feb 2020 18:27:04 +0000 (UTC)
Date: Thu, 20 Feb 2020 18:27:01 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Subject: Re: [PATCH 0/3] Optimize VM's downtime while do checkpoint in COLO
Message-ID: <20200220182701.GG2836@work-vm>
References: <20200217012049.22988-1-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200217012049.22988-1-zhang.zhanghailiang@huawei.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: WY5nAVj_NeCa3eywQZARdw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: danielcho@qnap.com, chen.zhang@intel.com, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Hailiang Zhang (zhang.zhanghailiang@huawei.com) wrote:
> Hi,
>=20
> This is an untested serial that tries to reduce VM's pause time
> while do checkpoint in COLO state.
>=20
> The second patch tries to reduce the total number of dirty pages
> while do checkpoint with VM been paused, instead of sending all
> dirty pages while VM been pause, it sends part of dirty pages during
> the gap time of two checkpoints when SVM and PVM are running.
>=20
> The third patch tries to reduce the pause time of backup ram into
> cache in secondary part.

This is quite nice; I've asked for a clarification on the last one, but
it's only a tidy up.

I guess this really helps continuous-COLO as well, because it means
that restarting to the sync to the new secondary is a lot simpler?

Dave

>=20
> Hailiang Zhang (3):
>   migration/colo: wrap incoming checkpoint process into new helper
>   COLO: Migrate dirty pages during the gap of checkpointing
>   COLO: Optimize memory back-up process
>=20
>  migration/colo.c       | 332 +++++++++++++++++++++++++----------------
>  migration/migration.h  |   1 +
>  migration/ram.c        |  35 ++++-
>  migration/ram.h        |   1 +
>  migration/trace-events |   1 +
>  qapi/migration.json    |   4 +-
>  6 files changed, 234 insertions(+), 140 deletions(-)
>=20
> --=20
> 2.21.0
>=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


