Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7035E2B7F7A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 15:33:21 +0100 (CET)
Received: from localhost ([::1]:37390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOWO-0000DO-Hm
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 09:33:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfOV6-0007Ya-1C
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:32:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfOV4-0002pE-3c
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 09:31:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605709917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mw5lkVWqjVMhEPIGa0rAXcM9yyOFQUhkqXt2e6A+WKI=;
 b=DpcWdBMW2ZjeyBzLQloSHO+dVLYOWPQT/u0cJMdbcxOv9u3WkCbNpz0CWiZ1qiH+03LVFO
 eKShILc4sMXTXyonhORUXdwJ3qAKyCc70xXJfEpypfanZe33dikvNqfx5MH/3gjbPydAoH
 /KxJ5t78QT92sLHmOPNTTnqLgLROBYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-7ELUQW_6PXi2jFjcjnsqdA-1; Wed, 18 Nov 2020 09:31:46 -0500
X-MC-Unique: 7ELUQW_6PXi2jFjcjnsqdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A91651842161;
 Wed, 18 Nov 2020 14:31:44 +0000 (UTC)
Received: from [10.3.112.188] (ovpn-112-188.phx2.redhat.com [10.3.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3CB5196FD;
 Wed, 18 Nov 2020 14:31:43 +0000 (UTC)
Subject: Re: [PATCH 1/7] Introduce 'track-writes-ram' migration capability.
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org
References: <20201118112233.264530-1-andrey.gruzdev@virtuozzo.com>
 <20201118112233.264530-2-andrey.gruzdev@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <64a0605b-7a16-1aed-df89-4e605306a241@redhat.com>
Date: Wed, 18 Nov 2020 08:31:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118112233.264530-2-andrey.gruzdev@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Den Lunev <den@openvz.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 5:22 AM, Andrey Gruzdev wrote:
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> ---
>  migration/migration.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>  migration/migration.h |  1 +
>  qapi/migration.json   |  7 +++-
>  3 files changed, 103 insertions(+), 1 deletion(-)
> 

Reviewing just the UI:

> +++ b/qapi/migration.json
> @@ -442,6 +442,11 @@
>  # @validate-uuid: Send the UUID of the source to allow the destination
>  #                 to ensure it is the same. (since 4.2)
>  #
> +# @track-writes-ram: If enabled, the migration stream will be a snapshot
> +#                    of the VM exactly at the point when the migration
> +#                    procedure starts. The VM RAM is saved with running VM.
> +#                    (since 5.2)

This is a new feature, so it is too late for 5.2; this will need to be 6.0.

> +#
>  # Since: 1.2
>  ##
>  { 'enum': 'MigrationCapability',
> @@ -449,7 +454,7 @@
>             'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram',
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
> -           'x-ignore-shared', 'validate-uuid' ] }
> +           'x-ignore-shared', 'validate-uuid', 'track-writes-ram'] }
>  
>  ##
>  # @MigrationCapabilityStatus:
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


