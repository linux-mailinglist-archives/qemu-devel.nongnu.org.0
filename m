Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BF62D5B87
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:23:42 +0100 (CET)
Received: from localhost ([::1]:58616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knLv3-0002Ay-FQ
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knLRC-00036T-V7
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:52:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knLRA-0001p5-8K
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 07:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607604766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JxXZJLREWm3t9F17WA4TqEWeB4+MCEkNegI1V45TngA=;
 b=XQNjMA0ccKkXjCEJeJN2XOVxWRHnIZGhSASM49TgDF1AL18iJVNg3Y10Tc7ulJh72qDXVe
 pLyZWjFa3fm8PxYKfDDcoa9eoEsL+23ZKjJ/+chPXXZImCmDKn1qeQ1694jBDKaS37cB4G
 9F6n+RI0Kw03RNqFmzfqvFp+tEQMxbQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-N3Up37c-Oair9fA0kf-eZg-1; Thu, 10 Dec 2020 07:52:42 -0500
X-MC-Unique: N3Up37c-Oair9fA0kf-eZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3E4A100C660;
 Thu, 10 Dec 2020 12:52:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EC4D6F439;
 Thu, 10 Dec 2020 12:52:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EE0BA11336D6; Thu, 10 Dec 2020 13:52:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Andrey Gruzdev via <qemu-devel@nongnu.org>
Subject: Re: [PATCH v6 1/4] migration: introduce 'background-snapshot'
 migration capability
References: <20201209100811.190316-1-andrey.gruzdev@virtuozzo.com>
 <20201209100811.190316-2-andrey.gruzdev@virtuozzo.com>
Date: Thu, 10 Dec 2020 13:52:36 +0100
In-Reply-To: <20201209100811.190316-2-andrey.gruzdev@virtuozzo.com> (Andrey
 Gruzdev via's message of "Wed, 9 Dec 2020 13:08:08 +0300")
Message-ID: <878sa5su0b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrey Gruzdev via <qemu-devel@nongnu.org> writes:

> Add new capability to 'qapi/migration.json' schema.
> Update migrate_caps_check() to validate enabled capability set
> against introduced one. Perform checks for required kernel features
> and compatibility with guest memory backends.
>
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
[...]
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 3c75820527..6291143678 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -442,6 +442,11 @@
>  # @validate-uuid: Send the UUID of the source to allow the destination
>  #                 to ensure it is the same. (since 4.2)
>  #
> +# @background-snapshot: If enabled, the migration stream will be a snapshot
> +#                       of the VM exactly at the point when the migration
> +#                       procedure starts. The VM RAM is saved with running VM.
> +#                       (since 6.0)
> +#
>  # Since: 1.2
>  ##
>  { 'enum': 'MigrationCapability',
> @@ -449,7 +454,7 @@
>             'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram',
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
> -           'x-ignore-shared', 'validate-uuid' ] }
> +           'x-ignore-shared', 'validate-uuid', 'background-snapshot'] }
>  
>  ##
>  # @MigrationCapabilityStatus:

Acked-by: Markus Armbruster <armbru@redhat.com>


