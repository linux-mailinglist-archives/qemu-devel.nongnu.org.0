Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56222691882
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:30:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQMul-0004FI-Nw; Fri, 10 Feb 2023 01:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQMuj-0004Dk-L2
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:29:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQMuh-00070L-PK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:29:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676010578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o53Yhsr+8bLDtr4zQwQFaMifwBmVGrLVeLdgB0477cA=;
 b=HmF5fZpLal1uFygPBnN8k4twGXsp3POyWamaXtGY03r/c6d9R37F9VP7Qb5gtdQmKJ+fZB
 RLYSnDlShmbgYyDR1Bt2Pt7gFexTbSqiMUY/2NJQJiECrbQTZKhz+Mbq4ox7x6cv82U0f5
 OuIPyxP6uYGieNbhcPh2pjwX+4UTDhk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-OjZ2kQ4cNEWUjoMDCFzh5w-1; Fri, 10 Feb 2023 01:29:34 -0500
X-MC-Unique: OjZ2kQ4cNEWUjoMDCFzh5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1886811E9C;
 Fri, 10 Feb 2023 06:29:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFA7D1121318;
 Fri, 10 Feb 2023 06:29:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B183921E6A1F; Fri, 10 Feb 2023 07:29:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org,  Eduardo Habkost <eduardo@habkost.net>,  Yanan
 Wang <wangyanan55@huawei.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eric Blake <eblake@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH v4 3/4] multifd: Only sync once each full round of memory
References: <20230209233730.38288-1-quintela@redhat.com>
 <20230209233730.38288-4-quintela@redhat.com>
Date: Fri, 10 Feb 2023 07:29:32 +0100
In-Reply-To: <20230209233730.38288-4-quintela@redhat.com> (Juan Quintela's
 message of "Fri, 10 Feb 2023 00:37:29 +0100")
Message-ID: <87a61mxcc3.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

> We need to add a new flag to mean to sync at that point.
> Notice that we still synchronize at the end of setup and at the end of
> complete stages.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> ---
>
> Add missing qemu_fflush(), now it passes all tests always.
> ---

[...]

> diff --git a/migration/migration.c b/migration/migration.c
> index b2844d374f..9eb061319d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2710,8 +2710,6 @@ bool migrate_multifd_sync_after_each_section(void)
>  {
>      MigrationState *s = migrate_get_current();
>  
> -    return true;
> -    // We will change this when code gets in.
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD_SYNC_AFTER_EACH_SECTION];
>  }

Ah, nevermind.

[...]


