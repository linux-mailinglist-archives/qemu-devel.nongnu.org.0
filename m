Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94FD68F8CA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 21:26:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPr0a-0002Z9-Lh; Wed, 08 Feb 2023 15:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pPr0X-0002XE-Q8
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:25:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pPr0W-0003Nx-AO
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 15:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675887930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IDEeVAEK3HM1sKUBiRMONicX5F2C4ylpCnPgBrRmrEk=;
 b=jAB5hdoMn4IdKCjRBXcmfxdNfh5mmsuLihFuL3GGQwoTltF6D+q1/vuTgIvP33y8HZGb8G
 b+ModIkEp7Q8hf+KO13+YTZ6jlI8BtRyDXQ6M/4GUIt0yQQg3jDM/W41j2Fcc8nAfKJVJ2
 DFPazDpSPRo+sVtpRw1tXwfFFYr0EFM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-c_lbMb0UOgqsX5FiI-Lgaw-1; Wed, 08 Feb 2023 15:25:29 -0500
X-MC-Unique: c_lbMb0UOgqsX5FiI-Lgaw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21B3029DD981;
 Wed,  8 Feb 2023 20:25:29 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43EC71121314;
 Wed,  8 Feb 2023 20:25:28 +0000 (UTC)
Date: Wed, 8 Feb 2023 14:25:26 -0600
From: Eric Blake <eblake@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 1/6] multifd: Create property
 multifd-sync-after-each-section
Message-ID: <20230208202526.p2jmikndw5lx2ong@redhat.com>
References: <20230208133010.17323-1-quintela@redhat.com>
 <20230208133010.17323-2-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208133010.17323-2-quintela@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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

On Wed, Feb 08, 2023 at 02:30:05PM +0100, Juan Quintela wrote:
> We used to synchronize all channels at the end of each RAM section
> sent.  That is not needed, so preparing to only synchronize once every
> full round in latests patches.
> 
> Notice that we initialize the property as true.  We will change the
> default when we introduce the new mechanism.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> 
> Rename each-iteration to after-each-section
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  qapi/migration.json   |  9 ++++++++-
>  migration/migration.h |  1 +
>  hw/core/machine.c     |  1 +
>  migration/migration.c | 15 +++++++++++++--
>  4 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..d712b082c8 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -478,6 +478,12 @@
>  #                    should not affect the correctness of postcopy migration.
>  #                    (since 7.1)
>  #
> +# @multifd-sync-after-each-section: Synchronize channels after each
> +#                                   section is sent.  We used to do
> +#                                   that on the past, but it is

s/on/in/

> +#                                   suboptimal.
> +#                                   (since 7.1)

Shouldn't this be 8.0 now?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


