Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CA03DE678
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 07:59:38 +0200 (CEST)
Received: from localhost ([::1]:59176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAnSj-0002yK-Hf
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 01:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAnS0-0002DQ-35
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:58:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mAnRy-0005Yg-Hc
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627970329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=msaNgiuwuFT8wXEg0HiEYNN4T878Qi5Ggazgokiaq/4=;
 b=P1v9DuA2mQUVu9C3MSTdbDHbgbfiWWd0v+hpzyuFXc1tR5Ce327f2zl2+oZ+jhrHAdrU//
 V2mBCtSymTI8HTiz256eXtUsiH8nTW/cuNmv/ORUIyKVQiw/ErKqbB3xcYULZQWoDsgWvO
 Wr3gRH0v1EPw1xEskfC5SMkcrV0I1Qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-NMNDPJmpMBCg9c4vghlVTg-1; Tue, 03 Aug 2021 01:58:48 -0400
X-MC-Unique: NMNDPJmpMBCg9c4vghlVTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A379F87D541
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 05:58:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C8955C25A;
 Tue,  3 Aug 2021 05:58:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 18E1011380A0; Tue,  3 Aug 2021 07:58:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 10/16] migration: Handle migration_incoming_setup()
 errors consistently
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-11-armbru@redhat.com>
 <YQgxEGzjyc17PPqX@work-vm>
Date: Tue, 03 Aug 2021 07:58:44 +0200
In-Reply-To: <YQgxEGzjyc17PPqX@work-vm> (David Alan Gilbert's message of "Mon, 
 2 Aug 2021 18:53:20 +0100")
Message-ID: <87sfzrjch7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
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
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 231dc24414..c1c0a48647 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -609,30 +609,25 @@ fail:
>>  }
>>  
>>  /**
>> - * @migration_incoming_setup: Setup incoming migration
>> - *
>> - * Returns 0 for no error or 1 for error
>> - *
>> + * migration_incoming_setup: Setup incoming migration
>>   * @f: file for main migration channel
>>   * @errp: where to put errors
>> + *
>> + * Returns: %true on success, %false on error.
>>   */
>> -static int migration_incoming_setup(QEMUFile *f, Error **errp)
>> +static bool migration_incoming_setup(QEMUFile *f, Error **errp)
>>  {
>>      MigrationIncomingState *mis = migration_incoming_get_current();
>> -    Error *local_err = NULL;
>>  
>> -    if (multifd_load_setup(&local_err) != 0) {
>> -        /* We haven't been able to create multifd threads
>> -           nothing better to do */
>> -        error_report_err(local_err);
>> -        exit(EXIT_FAILURE);
>> +    if (multifd_load_setup(errp) != 0) {
>> +        return false;
>>      }
>
> What I don't know is how well that will survive; for example in
> multifd_load_setup it creates multiple threads and calls the recv_setup
> member on each thread; now if one of those fails what happens - if we
> don't exit, is it cleaned up enough so you can try another
> migrate_incoming or is it just going to fall over?

I don't know, either.

The inconsistent error handling we have is not good.  More consistent
error handling that unmasks bad error handling could be worse, unless we
fix the unmasked badness.

How can we move forward with this patch?

One way *I* could move forward is to tack a FIXME comment to the
problematic exit(1) instead of removing it.

[...]


