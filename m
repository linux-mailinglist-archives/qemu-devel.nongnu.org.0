Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23BD48E945
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:35:04 +0100 (CET)
Received: from localhost ([::1]:55566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KrH-00055g-EP
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n8KfB-0001oz-1X
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:22:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1n8Kex-0006GE-Go
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642159338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a8tZRPMMIXIK6ScRv8w5RD1FZQgCCYwUiRNTKgINVH4=;
 b=jK3Z7rvIPTb/dBrZUZbTb+2NHnnwYKmvVddsB67nIWwNkjXzQoCw6PiMScMsSzBYZqT6di
 o+FI/+L5QtvhL0UiWX4Hrlpb7+xp/J7jdk9NcScOJYcH2Pt+WmK0mHdCO9SsfBrPlbfEQn
 Fcg4MNWBAoeT3kS7iAWi0sKKb2G92xI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-oCt_OrCINV6CfMH4xLh4bA-1; Fri, 14 Jan 2022 06:22:17 -0500
X-MC-Unique: oCt_OrCINV6CfMH4xLh4bA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38C301006AA6;
 Fri, 14 Jan 2022 11:22:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-9.ams2.redhat.com [10.36.112.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 862F023085;
 Fri, 14 Jan 2022 11:22:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E429C11380A2; Fri, 14 Jan 2022 12:22:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: Re: [PATCH 4/6] migration: Add ram-only capability
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-5-nikita.lapshin@virtuozzo.com>
Date: Fri, 14 Jan 2022 12:22:13 +0100
In-Reply-To: <20211224111148.345438-5-nikita.lapshin@virtuozzo.com> (Nikita
 Lapshin's message of "Fri, 24 Dec 2021 14:11:46 +0300")
Message-ID: <87v8ym36l6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, hreitz@redhat.com, crosa@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nikita Lapshin <nikita.lapshin@virtuozzo.com> writes:

> If this capability is enabled migration stream
> will have RAM section only.
>
> Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index d53956852c..626fc59d14 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -454,6 +454,8 @@
>  #
>  # @no-ram: If enabled, migration stream won't contain any ram in it. (since 7.0)
>  #
> +# @ram-only: If enabled, only RAM sections will be sent. (since 7.0)
> +#

What happens when I ask for 'no-ram': true, 'ram-only': true?

>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>  #
> @@ -467,7 +469,7 @@
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
> -           'validate-uuid', 'background-snapshot', 'no-ram'] }
> +           'validate-uuid', 'background-snapshot', 'no-ram', 'ram-only'] }
>  ##
>  # @MigrationCapabilityStatus:
>  #
> @@ -521,7 +523,8 @@
>  #       {"state": true, "capability": "events"},
>  #       {"state": false, "capability": "postcopy-ram"},
>  #       {"state": false, "capability": "x-colo"},
> -#       {"state": false, "capability": "no-ram"}
> +#       {"state": false, "capability": "no-ram"},
> +#       {"state": false, "capability": "ram-only"}
>  #    ]}
>  #
>  ##


