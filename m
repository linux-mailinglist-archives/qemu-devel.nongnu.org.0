Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9663D10F1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:14:28 +0200 (CEST)
Received: from localhost ([::1]:53446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CzT-0001zg-8d
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6Cy7-0000cA-9J
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:13:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6Cy5-0004QA-OJ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:13:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626876780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3GVJuRw0tAWtoHr5yxnQtocwwo3qSVJRt2smV+2lFYM=;
 b=J+dpnbJGjkqvTg3m5Qd4AiQHjBhEnRDr/MkeJWPNc31PGWScDtztTUaHEwMZQthh8/WSay
 9qvXvDLFEzLgP9D7i3tCZN0V8KpM9AG5nsfnsjfWNCFHnn3Fv6ds0hVx8Z1oyLKugk4POQ
 WxJOHxpF23RlV1HUUw7wmlxF3TuIUws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-_Hoq3r-1Pw2kxUqXJbmh6w-1; Wed, 21 Jul 2021 10:12:59 -0400
X-MC-Unique: _Hoq3r-1Pw2kxUqXJbmh6w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B76F10086C4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 14:12:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A2311970F;
 Wed, 21 Jul 2021 14:12:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BB2C011326B9; Wed, 21 Jul 2021 16:12:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 10/16] migration: Handle migration_incoming_setup()
 errors consistently
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-11-armbru@redhat.com>
 <20210720185302.dzekdqfpymfxasl7@redhat.com>
Date: Wed, 21 Jul 2021 16:12:56 +0200
In-Reply-To: <20210720185302.dzekdqfpymfxasl7@redhat.com> (Eric Blake's
 message of "Tue, 20 Jul 2021 13:53:02 -0500")
Message-ID: <87im13ah7b.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On Tue, Jul 20, 2021 at 02:54:02PM +0200, Markus Armbruster wrote:
>> Commit b673eab4e2 "multifd: Make multifd_load_setup() get an Error
>> parameter" changed migration_incoming_setup() to take an Error **
>> argument, and adjusted the callers accordingly.  It neglected to
>> change adjust multifd_load_setup(): it still exit()s on error.  Clean
>> that up.
>> 
>> The error now gets propagated up two call chains: via
>> migration_fd_process_incoming() to rdma_accept_incoming_migration(),
>> and via migration_ioc_process_incoming() to
>> migration_channel_process_incoming().  Both chain ends report the
>> error with error_report_err(), but otherwise ignore it.  Behavioral
>> change: we no longer exit() on this error.
>> 
>> This is consistent with how we handle other errors here, e.g. from
>> multifd_recv_new_channel() via migration_ioc_process_incoming() to
>> migration_channel_process_incoming().  Wether it's consistently right
>
> Whether

ACK

>> or consistently wrong I can't tell.
>> 
>> Also clean up the return value from the unusual 0 on success, 1 on
>> error to the more common true on success, false on error.
>> 
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  migration/migration.c | 27 +++++++++------------------
>>  1 file changed, 9 insertions(+), 18 deletions(-)
>>
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!


