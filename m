Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9A33FC83F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:31:11 +0200 (CEST)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3r4-0004vw-GX
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL3B0-0006J9-VM
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:47:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mL3Az-0000Fh-0D
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630414060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=acW9ATzo4WPl+YWUoe8fCz/3GZnk+rQyKK2r/jbokM0=;
 b=NpRsg8g8xaMgVWWEAkL4nT86bYwS35SPWpKlWfnjf1caarOT/yqx7Fs6Yihfo9/V/MUf6I
 Z1Ckw+Skh0eqTR2hbsr80JxVcNAG9+dlkBlqu+lH9MSc8fmN5le4Zy6sBPffYCXUDG+vb1
 XY+0dwk0W+y7+OginXS7cyt3uoPqk4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-tlsRf3sQPQeefhje_3eNFg-1; Tue, 31 Aug 2021 08:47:38 -0400
X-MC-Unique: tlsRf3sQPQeefhje_3eNFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E24BD87D546
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 12:47:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B49D527CA1;
 Tue, 31 Aug 2021 12:47:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4C62B11380A9; Tue, 31 Aug 2021 14:47:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 10/16] migration: Handle migration_incoming_setup()
 errors consistently
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-11-armbru@redhat.com>
 <YQgxEGzjyc17PPqX@work-vm> <87sfzrjch7.fsf@dusky.pond.sub.org>
Date: Tue, 31 Aug 2021 14:47:36 +0200
In-Reply-To: <87sfzrjch7.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Tue, 03 Aug 2021 07:58:44 +0200")
Message-ID: <87y28hye53.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> "Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:
>
>> * Markus Armbruster (armbru@redhat.com) wrote:
>>> Commit b673eab4e2 "multifd: Make multifd_load_setup() get an Error
>>> parameter" changed migration_incoming_setup() to take an Error **
>>> argument, and adjusted the callers accordingly.  It neglected to
>>> change adjust multifd_load_setup(): it still exit()s on error.  Clean
>>> that up.
>>> 
>>> The error now gets propagated up two call chains: via
>>> migration_fd_process_incoming() to rdma_accept_incoming_migration(),
>>> and via migration_ioc_process_incoming() to
>>> migration_channel_process_incoming().  Both chain ends report the
>>> error with error_report_err(), but otherwise ignore it.  Behavioral
>>> change: we no longer exit() on this error.
>>> 
>>> This is consistent with how we handle other errors here, e.g. from
>>> multifd_recv_new_channel() via migration_ioc_process_incoming() to
>>> migration_channel_process_incoming().  Wether it's consistently right
>>> or consistently wrong I can't tell.
>>> 
>>> Also clean up the return value from the unusual 0 on success, 1 on
>>> error to the more common true on success, false on error.
>>> 
>>> Cc: Juan Quintela <quintela@redhat.com>
>>> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>  migration/migration.c | 27 +++++++++------------------
>>>  1 file changed, 9 insertions(+), 18 deletions(-)
>>> 
>>> diff --git a/migration/migration.c b/migration/migration.c
>>> index 231dc24414..c1c0a48647 100644
>>> --- a/migration/migration.c
>>> +++ b/migration/migration.c
>>> @@ -609,30 +609,25 @@ fail:
>>>  }
>>>  
>>>  /**
>>> - * @migration_incoming_setup: Setup incoming migration
>>> - *
>>> - * Returns 0 for no error or 1 for error
>>> - *
>>> + * migration_incoming_setup: Setup incoming migration
>>>   * @f: file for main migration channel
>>>   * @errp: where to put errors
>>> + *
>>> + * Returns: %true on success, %false on error.
>>>   */
>>> -static int migration_incoming_setup(QEMUFile *f, Error **errp)
>>> +static bool migration_incoming_setup(QEMUFile *f, Error **errp)
>>>  {
>>>      MigrationIncomingState *mis = migration_incoming_get_current();
>>> -    Error *local_err = NULL;
>>>  
>>> -    if (multifd_load_setup(&local_err) != 0) {
>>> -        /* We haven't been able to create multifd threads
>>> -           nothing better to do */
>>> -        error_report_err(local_err);
>>> -        exit(EXIT_FAILURE);
>>> +    if (multifd_load_setup(errp) != 0) {
>>> +        return false;
>>>      }
>>
>> What I don't know is how well that will survive; for example in
>> multifd_load_setup it creates multiple threads and calls the recv_setup
>> member on each thread; now if one of those fails what happens - if we
>> don't exit, is it cleaned up enough so you can try another
>> migrate_incoming or is it just going to fall over?
>
> I don't know, either.
>
> The inconsistent error handling we have is not good.  More consistent
> error handling that unmasks bad error handling could be worse, unless we
> fix the unmasked badness.
>
> How can we move forward with this patch?
>
> One way *I* could move forward is to tack a FIXME comment to the
> problematic exit(1) instead of removing it.
>
> [...]

I forgot this was still undecided, and included the patch in my pull
request.  It has become commit 7d6f6933aa7.  Feel free to revert it, or
to ask me to restore the exit() on failure.


