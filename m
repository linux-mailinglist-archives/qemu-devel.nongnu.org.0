Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EC86D238D
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 17:06:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piGJj-0007mh-LG; Fri, 31 Mar 2023 11:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1piGJh-0007hY-CR
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:05:25 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1piGJf-0003pG-IB
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:05:25 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF92721A91;
 Fri, 31 Mar 2023 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680275119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWyKIOxdAOuLZusZMTX+DyzBrE7iVos89QlMFU3Xi+U=;
 b=R3I1bhrWi1t5CNpo+Li7qLR0EZw+ZDj0kaots7bkQ1K77CqFxnrmXYDLNjXdjqkClLOMXo
 smNyNygWvCJzzyRsUvN1y7qXpth7PlSFEviLZwC8akYUMnmeRpcApIDxKQjIKlxZ1BQVwU
 njLsVfkFtn3h7G6hAopnYYPl9nkbVbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680275119;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YWyKIOxdAOuLZusZMTX+DyzBrE7iVos89QlMFU3Xi+U=;
 b=Ng1uUG29EouCb38GIwptbmYpF+KqSi4lj7TdXnbye5iJNa8qXZdUqEmVLA+SN9agfJupCv
 Tzty17Xe/pt3MVAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 452FD134F7;
 Fri, 31 Mar 2023 15:05:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hEtHA6/2JmSNfAAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 31 Mar 2023 15:05:19 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 jfehlig@suse.com, dfaggioli@suse.com, dgilbert@redhat.com, =?utf-8?Q?Dani?=
 =?utf-8?Q?el_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, Juan Quintela
 <quintela@redhat.com>,
 Nikolay Borisov <nborisov@suse.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
Subject: Re: [RFC PATCH v1 10/26] migration/ram: Introduce 'fixed-ram'
 migration stream capability
In-Reply-To: <ZCYGz3ht61FBQs3e@x1n>
References: <20230330180336.2791-1-farosas@suse.de>
 <20230330180336.2791-11-farosas@suse.de> <ZCYGz3ht61FBQs3e@x1n>
Date: Fri, 31 Mar 2023 12:05:16 -0300
Message-ID: <87bkk9otar.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Peter Xu <peterx@redhat.com> writes:

>> 
>> * pc - refers to the page_size/mr->addr members, so newly added members
>> begin from "bitmap_size".
>
> Could you elaborate more on what's the pc?
>
> I also didn't see this *pc in below migration.rst update.
>

Yeah, you need to be looking at the code to figure that one out. That
was intended to reference some postcopy data that is (already) inserted
into the stream. Literally this:

    if (migrate_postcopy_ram() && block->page_size !=
                                  qemu_host_page_size) {
        qemu_put_be64(f, block->page_size);
    }
    if (migrate_ignore_shared()) {
        qemu_put_be64(f, block->mr->addr);
    }

It has nothing to do with this patch. I need to rewrite that part of the
commit message a bit.

>> 
>> This layout is initialized during ram_save_setup so instead of having a
>> sequential stream of pages that follow the ramblock headers the dirty
>> pages for a ramblock follow its header. Since all pages have a fixed
>> location RAM_SAVE_FLAG_EOS is no longer generated on every migration
>> iteration but there is effectively a single RAM_SAVE_FLAG_EOS right at
>> the end.
>> 
>> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>

...

>> @@ -4390,6 +4432,12 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>>          }
>>      }
>>  
>> +    if (migrate_check_fixed_ram(s, &local_err) < 0) {
>
> This check might be too late afaict, QMP cmd "migrate" could have already
> succeeded.
>
> Can we do an early check in / close to qmp_migrate()?  The idea is we fail
> at the QMP migrate command there.
>

Yes, some of it depends on the QEMUFile being known but I can at least
move part of the verification earlier.

>> +        migrate_fd_cleanup(s);
>> +        migrate_fd_error(s, local_err);
>> +        return;
>> +    }
>> +
>>      if (resume) {
>>          /* Wakeup the main migration thread to do the recovery */
>>          migrate_set_state(&s->state, MIGRATION_STATUS_POSTCOPY_PAUSED,
>> @@ -4519,6 +4567,7 @@ static Property migration_properties[] = {
>>      DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
>>  
>>      /* Migration capabilities */
>> +    DEFINE_PROP_MIG_CAP("x-fixed-ram", MIGRATION_CAPABILITY_FIXED_RAM),
>>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
>>      DEFINE_PROP_MIG_CAP("x-rdma-pin-all", MIGRATION_CAPABILITY_RDMA_PIN_ALL),
>>      DEFINE_PROP_MIG_CAP("x-auto-converge", MIGRATION_CAPABILITY_AUTO_CONVERGE),
>> diff --git a/migration/migration.h b/migration/migration.h
>> index 2da2f8a164..8cf3caecfe 100644
>> --- a/migration/migration.h
>> +++ b/migration/migration.h
>> @@ -416,6 +416,7 @@ bool migrate_zero_blocks(void);
>>  bool migrate_dirty_bitmaps(void);
>>  bool migrate_ignore_shared(void);
>>  bool migrate_validate_uuid(void);
>> +int migrate_fixed_ram(void);
>>  
>>  bool migrate_auto_converge(void);
>>  bool migrate_use_multifd(void);
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 96e8a19a58..56f0f782c8 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -1310,9 +1310,14 @@ static int save_zero_page_to_file(PageSearchStatus *pss,
>>      int len = 0;
>>  
>>      if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
>> -        len += save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
>> -        qemu_put_byte(file, 0);
>> -        len += 1;
>> +        if (migrate_fixed_ram()) {
>> +            /* for zero pages we don't need to do anything */
>> +            len = 1;
>
> I think you wanted to increase the "duplicated" counter, but this will also
> increase ram-transferred even though only 1 byte.
>

Ah, well spotted, that is indeed incorrect.

> Perhaps just pass a pointer to keep the bytes, and return true/false to
> increase the counter (to make everything accurate)?
>

Ok

>> +        } else {
>> +            len += save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
>> +            qemu_put_byte(file, 0);
>> +            len += 1;
>> +        }
>>          ram_release_page(block->idstr, offset);
>>      }
>>      return len;

