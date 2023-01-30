Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000D6809B9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 10:38:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMQbj-0007V7-At; Mon, 30 Jan 2023 04:37:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMQbe-0007Up-DJ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:37:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pMQbV-0007nM-B4
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 04:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675071451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ygYGfyXPblvlOuDZPeQFqQBBe+ZjPKUmWOqpKbJTQY8=;
 b=flig3R3yCP72qQsVIdqVodj3iGNgl/0adm2e6STSngYZ1cnx868K0bcYxLTaNuf8lsIS6T
 V0Q4FljDBPTglRTq6ju2pjkHj3rwyk7YTzycE8LeKcDofUxLPVgloSRYekiMA2se1SN4z8
 hTqgWAMDaqkV9PeABAaNUqp1Hm1qFaA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-Jq8p4v5ePyyToMNNY85RJw-1; Mon, 30 Jan 2023 04:37:26 -0500
X-MC-Unique: Jq8p4v5ePyyToMNNY85RJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C312101A55E;
 Mon, 30 Jan 2023 09:37:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07A3A1121315;
 Mon, 30 Jan 2023 09:37:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D13F421E6A1F; Mon, 30 Jan 2023 10:37:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,  Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 08/11] multifd: Add capability to enable/disable
 zero_page
References: <20230130080956.3047-1-quintela@redhat.com>
 <20230130080956.3047-9-quintela@redhat.com>
Date: Mon, 30 Jan 2023 10:37:24 +0100
In-Reply-To: <20230130080956.3047-9-quintela@redhat.com> (Juan Quintela's
 message of "Mon, 30 Jan 2023 09:09:53 +0100")
Message-ID: <87o7qgcqi3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> writes:

> We have to enable it by default until we introduce the new code.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

The subject doesn't quite match the patch to the QAPI schema.  It claims
"capability to enable/disable zero_page", but ...

> ---
>
> Change it to a capability.  As capabilities are off by default, have
> to change MULTIFD_ZERO_PAGE to MAIN_ZERO_PAGE, so it is false for
> default, and true for older versions.
> ---
>  qapi/migration.json   |  8 +++++++-
>  migration/migration.h |  1 +
>  hw/core/machine.c     |  1 +
>  migration/migration.c | 13 ++++++++++++-
>  4 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86ac8..ac5bc071a9 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -472,12 +472,18 @@
>  #                  Requires that QEMU be permitted to use locked memory
>  #                  for guest RAM pages.
>  #                  (since 7.1)
> +#
>  # @postcopy-preempt: If enabled, the migration process will allow postcopy
>  #                    requests to preempt precopy stream, so postcopy requests
>  #                    will be handled faster.  This is a performance feature and
>  #                    should not affect the correctness of postcopy migration.
>  #                    (since 7.1)
>  #
> +# @main-zero-page: If enabled, the detection of zero pages will be
> +#                  done on the main thread.  Otherwise it is done on
> +#                  the multifd threads.

... here, we add a capability to shift certain work to another thread.
No "enable/disable" as far as I can tell.  Which one is right?

What's the default?

Not this patch's fault, but needs fixing: we neglect to document the
default for several other parameters.

Wordsmithing nitpick: suggest "done by the thread" or maybe "done in the
thread".

@main-zero-page suggests this is about a special zero page.  Perhaps I
can think of a clearer name, but first I need to be sure what the thing
is about.

> +#                  (since 8.0)
> +#
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>  #
> @@ -492,7 +498,7 @@
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>             'validate-uuid', 'background-snapshot',
> -           'zero-copy-send', 'postcopy-preempt'] }
> +           'zero-copy-send', 'postcopy-preempt', 'main-zero-page'] }
>  
>  ##
>  # @MigrationCapabilityStatus:


