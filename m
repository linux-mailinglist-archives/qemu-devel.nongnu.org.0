Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD526D170A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 07:53:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi7fr-0001w0-JJ; Fri, 31 Mar 2023 01:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pi7fg-0001vl-2b
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 01:51:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pi7fc-0004lN-6B
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 01:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680241886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=umS6MVcZWLhynkCz1ep5jR+TQivppk27NVZP29+H55M=;
 b=E/o/uAuZCr3OaKKoffhHzEKnsxK0wNQ6xVnwgr8+jdDiYMGyGw0cEVyzL/HouMeSAoW8gS
 OxZsStpKeBXwDB0yp0ISFJZFV4psVgRBTH0xJDirFE7lp12Q+iLvncIhaPGvbyy34+AzIn
 bNuiSNfQ7goLpFrBqnirkkdvJ/4GC7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-Prq7R1weNHezbSHbmcQ4TQ-1; Fri, 31 Mar 2023 01:50:42 -0400
X-MC-Unique: Prq7R1weNHezbSHbmcQ4TQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40065858289;
 Fri, 31 Mar 2023 05:50:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 111BC404DC50;
 Fri, 31 Mar 2023 05:50:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0363521E6926; Fri, 31 Mar 2023 07:50:40 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org,  Claudio Fontana <cfontana@suse.de>,
 jfehlig@suse.com,  dfaggioli@suse.com,  dgilbert@redhat.com,  Daniel P .
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Juan Quintela
 <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Xu <peterx@redhat.com>,  David Hildenbrand
 <david@redhat.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,  Eric Blake <eblake@redhat.com>
Subject: Re: [RFC PATCH v1 10/26] migration/ram: Introduce 'fixed-ram'
 migration stream capability
References: <20230330180336.2791-1-farosas@suse.de>
 <20230330180336.2791-11-farosas@suse.de>
Date: Fri, 31 Mar 2023 07:50:39 +0200
In-Reply-To: <20230330180336.2791-11-farosas@suse.de> (Fabiano Rosas's message
 of "Thu, 30 Mar 2023 15:03:20 -0300")
Message-ID: <87wn2xo4eo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Fabiano Rosas <farosas@suse.de> writes:

> From: Nikolay Borisov <nborisov@suse.com>
>
> Implement 'fixed-ram' feature. The core of the feature is to ensure that
> each ram page of the migration stream has a specific offset in the
> resulting migration stream. The reason why we'd want such behavior are
> two fold:
>
>  - When doing a 'fixed-ram' migration the resulting file will have a
>    bounded size, since pages which are dirtied multiple times will
>    always go to a fixed location in the file, rather than constantly
>    being added to a sequential stream. This eliminates cases where a vm
>    with, say, 1G of ram can result in a migration file that's 10s of
>    GBs, provided that the workload constantly redirties memory.
>
>  - It paves the way to implement DIO-enabled save/restore of the
>    migration stream as the pages are ensured to be written at aligned
>    offsets.
>
> The feature requires changing the stream format. First, a bitmap is
> introduced which tracks which pages have been written (i.e are
> dirtied) during migration and subsequently it's being written in the
> resulting file, again at a fixed location for every ramblock. Zero
> pages are ignored as they'd be zero in the destination migration as
> well. With the changed format data would look like the following:
>
> |name len|name|used_len|pc*|bitmap_size|pages_offset|bitmap|pages|
>
> * pc - refers to the page_size/mr->addr members, so newly added members
> begin from "bitmap_size".
>
> This layout is initialized during ram_save_setup so instead of having a
> sequential stream of pages that follow the ramblock headers the dirty
> pages for a ramblock follow its header. Since all pages have a fixed
> location RAM_SAVE_FLAG_EOS is no longer generated on every migration
> iteration but there is effectively a single RAM_SAVE_FLAG_EOS right at
> the end.
>
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>

[...]

> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..22eea58ce3 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -485,7 +485,7 @@
>  ##
>  { 'enum': 'MigrationCapability',
>    'data': ['xbzrle', 'rdma-pin-all', 'auto-converge', 'zero-blocks',
> -           'compress', 'events', 'postcopy-ram',
> +           'compress', 'events', 'postcopy-ram', 'fixed-ram',
>             { 'name': 'x-colo', 'features': [ 'unstable' ] },
>             'release-ram',
>             'block', 'return-path', 'pause-before-switchover', 'multifd',

Doc comment update is missing.


