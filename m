Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76810400058
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:19:40 +0200 (CEST)
Received: from localhost ([::1]:51924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM96Z-0000D2-Cu
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vu-00075y-Ol
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vr-0001MU-Jg
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tR4KxTOwhYCpW1Kh5e9vPj/aC66/ATyw7/blFyRzJhw=;
 b=g53yYE7bTfO8plH+XwuD+8+tYZe+Wsg5VEgperU0qWfuK+/un8xn1RbqN8Vo78pmsvSaLo
 PbfOT8Ziak6WRFaQMBn5Jcvq6ZI2omhR/fxuyP3SrBi/vyhGq3QjSOm2P+R3RF62SYxJq2
 RdV384qZ3q6rmaGKtkVxGZ5zsZcdpj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-oE4vMIpAOEaoFxB0YZNPxg-1; Fri, 03 Sep 2021 09:08:34 -0400
X-MC-Unique: oE4vMIpAOEaoFxB0YZNPxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE463107ACC7;
 Fri,  3 Sep 2021 13:08:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADDE360BF1;
 Fri,  3 Sep 2021 13:08:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DA9471138224; Wed,  1 Sep 2021 13:47:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 18/19] qapi: backup: add immutable-source parameter
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
 <20210827181808.311670-19-vsementsov@virtuozzo.com>
Date: Wed, 01 Sep 2021 13:47:54 +0200
In-Reply-To: <20210827181808.311670-19-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 27 Aug 2021 21:18:07 +0300")
Message-ID: <8735qobjpx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, jsnow@redhat.com,
 hreitz@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> We are on the way to implement internal-backup with fleecing scheme,
> which includes backup job copying from fleecing block driver node
> (which is target of copy-before-write filter) to final target of
> backup. This job doesn't need own filter, as fleecing block driver node
> is a kind of snapshot, it's immutable from reader point of view.
>
> Let's add a parameter for backup to not insert filter but instead
> unshare writes on source. This way backup job becomes a simple copying
> process.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  qapi/block-core.json      | 12 +++++++-
>  include/block/block_int.h |  1 +
>  block/backup.c            | 61 +++++++++++++++++++++++++++++++++++----
>  block/replication.c       |  2 +-
>  blockdev.c                |  1 +
>  5 files changed, 70 insertions(+), 7 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 8a333136f5..995ca16a5e 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1391,6 +1391,15 @@
>  #                    above node specified by @drive. If this option is not given,
>  #                    a node name is autogenerated. (Since: 4.2)
>  #
> +# @immutable-source: If true, assume source is immutable and don't insert filter

Suggest comma after immutable.

> +#                    as no copy-before-write operations are needed. It will
> +#                    fail if there are existing writers on source node, as well,
> +#                    any attempt to add writer to source node during backup will
> +#                    fail. @filter-node-name must not be set.

Suggest to split the sentence like "... fail if there are existing
writers on source node.  Any attempt ... will also fail."

> +#                    If false, insert copy-before-write filter above source node
> +#                    (see also @filter-node-name parameter).
> +#                    Default is false. (Since 6.2)
> +#
>  # @x-perf: Performance options. (Since 6.0)
>  #
>  # Note: @on-source-error and @on-target-error only affect background
> @@ -1407,7 +1416,8 @@
>              '*on-source-error': 'BlockdevOnError',
>              '*on-target-error': 'BlockdevOnError',
>              '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
> -            '*filter-node-name': 'str', '*x-perf': 'BackupPerf'  } }
> +            '*filter-node-name': 'str', '*immutable-source': 'bool',
> +            '*x-perf': 'BackupPerf'  } }
>  
>  ##
>  # @DriveBackup:

[...]


