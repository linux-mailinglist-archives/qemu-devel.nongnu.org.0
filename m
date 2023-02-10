Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E3C692307
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:14:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQW1t-0005iR-FC; Fri, 10 Feb 2023 11:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQW1q-0005hi-5f
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:13:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pQW1o-0003n9-3w
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676045615;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dCsp+zyhfLSNUy1dLuLoUgfB22rMrPgGNFeokUi5t04=;
 b=GvlxtmYBxaUnA+3soxA6pd9550oXn5zrXEm9Gqm/Pl849nXyu8JmlLlcUesWxYF+nEPqog
 n9mESxwp0/mMFa1THHkb6zk7drWGZuDezdR1m030XKgwgcKpqICgmlBocu9ahvwfc+GhPe
 ZqwYEh8C0TP1OJuw4g5K0crC8hXUp4Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-DmqsoAngP_uzi5rvQu6L6g-1; Fri, 10 Feb 2023 11:13:32 -0500
X-MC-Unique: DmqsoAngP_uzi5rvQu6L6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57814185A7A4;
 Fri, 10 Feb 2023 16:13:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 385DF1731B;
 Fri, 10 Feb 2023 16:13:30 +0000 (UTC)
Date: Fri, 10 Feb 2023 16:13:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v3 03/14] migration: Initial support of fixed-ram feature
 for analyze-migration.py
Message-ID: <Y+ZtJ8a/wpKOCU++@redhat.com>
References: <20221028103914.908728-1-nborisov@suse.com>
 <20221028103914.908728-4-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221028103914.908728-4-nborisov@suse.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 01:39:03PM +0300, Nikolay Borisov wrote:
> In order to allow analyze-migration.py script to work with migration
> streams that have the 'fixed-ram' capability set it's required to have
> access to the stream's configuration object. This commit enables this
> by making migration json writer part of MigrationState struct, allowing
> the configuration object be serialized to json.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  migration/migration.c        |  5 ++++
>  migration/migration.h        |  3 +++
>  migration/savevm.c           | 47 ++++++++++++++++++++++------------
>  scripts/analyze-migration.py | 49 +++++++++++++++++++++++++++++++++---
>  4 files changed, 85 insertions(+), 19 deletions(-)

This patch has a minor clash with a patch that's since merged
into git master

  commit e3bf5e68e2a97898f37834c47449101172ced123
  Author: David Hildenbrand <david@redhat.com>
  Date:   Tue Jan 17 12:22:43 2023 +0100

    migration/savevm: Prepare vmdesc json writer in qemu_savevm_state_setup()

so needs some adjustment, but nothing too major

The actual goal of this change makes sense to me.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


