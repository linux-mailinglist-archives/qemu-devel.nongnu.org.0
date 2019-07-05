Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19C607C5
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 16:23:28 +0200 (CEST)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjP7X-0006YC-DG
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 10:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48780)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hjP3Z-0002Wg-Jp
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 10:19:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hjP3V-0003Uq-JR
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 10:19:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hjP3D-0002GJ-Mr; Fri, 05 Jul 2019 10:18:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3A0A230BC595;
 Fri,  5 Jul 2019 14:18:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFEAC17988;
 Fri,  5 Jul 2019 14:18:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 506EE1132ABF; Fri,  5 Jul 2019 16:18:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
References: <20190703215542.16123-1-jsnow@redhat.com>
 <20190703215542.16123-5-jsnow@redhat.com>
Date: Fri, 05 Jul 2019 16:18:47 +0200
In-Reply-To: <20190703215542.16123-5-jsnow@redhat.com> (John Snow's message of
 "Wed, 3 Jul 2019 17:55:28 -0400")
Message-ID: <87muhsimyg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 05 Jul 2019 14:18:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 04/18] qapi: add BitmapSyncMode enum
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> Depending on what a user is trying to accomplish, there might be a few
> bitmap cleanup actions that occur when an operation is finished that
> could be useful.
>
> I am proposing three:
> - NEVER: The bitmap is never synchronized against what was copied.
> - ALWAYS: The bitmap is always synchronized, even on failures.
> - CONDITIONAL: The bitmap is synchronized only on success.
>
> The existing incremental backup modes use 'conditional' semantics,
> so add just that one for right now.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  qapi/block-core.json | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 7b23efcf13..87eba5a5d9 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1134,6 +1134,20 @@
>  { 'enum': 'MirrorSyncMode',
>    'data': ['top', 'full', 'none', 'incremental'] }
>  
> +##
> +# @BitmapSyncMode:
> +#
> +# An enumeration of possible behaviors for the synchronization of a bitmap
> +# when used for data copy operations.
> +#
> +# @conditional: The bitmap is only synced when the operation is successful.
> +#               This is the behavior always used for 'INCREMENTAL' backups.
> +#
> +# Since: 4.2
> +##
> +{ 'enum': 'BitmapSyncMode',
> +  'data': ['conditional'] }
> +
>  ##
>  # @MirrorCopyMode:
>  #

The name "conditional" makes me go "on what?".  What about "on-success"?

