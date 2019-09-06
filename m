Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6127ABEDA
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 19:38:30 +0200 (CEST)
Received: from localhost ([::1]:58984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6IBp-0000uu-S9
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 13:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48117)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i6IAq-00009t-I4
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 13:37:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i6IAp-0006dN-Gi
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 13:37:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46916)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i6IAm-0006bE-RH; Fri, 06 Sep 2019 13:37:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BFF04C049E32;
 Fri,  6 Sep 2019 17:37:23 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C57201001925;
 Fri,  6 Sep 2019 17:37:21 +0000 (UTC)
Message-ID: <9a15f1ae0004338919f8f05d5e91aae0c33347b7.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 06 Sep 2019 20:37:20 +0300
In-Reply-To: <20190906173201.7926-1-mlevitsk@redhat.com>
References: <20190906173201.7926-1-mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 06 Sep 2019 17:37:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/3] Fix qcow2+luks corruption introduced
 by commit 8ac0f15f335
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-stable <qemu-stable@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2019-09-06 at 20:31 +0300, Maxim Levitsky wrote:
> Commit 8ac0f15f335 accidently broke the COW of non changed areas
> of newly allocated clusters, when the write spans multiple clusters,
> and needs COW both prior and after the write.
> This results in 'after' COW area beeing encrypted with wrong
> sector address, which render it corrupted.
> 
> Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1745922
> 
> CC: qemu-stable <qemu-stable@nongnu.org>

I forgot to mention, huge thanks to Kevin Wolf,
for helping me to define the proper fix for this bug.

Best regards,
	Maxim Levitsky


