Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7557CD7275
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 11:46:57 +0200 (CEST)
Received: from localhost ([::1]:38938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKJPs-0000W7-8z
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 05:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iKJOf-0008TD-IB
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 05:45:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iKJOZ-0001Na-CP
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 05:45:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iKJOX-0001Lw-LG
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 05:45:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7D60B4E4E6;
 Tue, 15 Oct 2019 09:45:32 +0000 (UTC)
Received: from localhost (dhcp-192-238.str.redhat.com [10.33.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27EAF5D6A9;
 Tue, 15 Oct 2019 09:45:27 +0000 (UTC)
Date: Tue, 15 Oct 2019 11:45:25 +0200
From: Jens Freimann <jfreimann@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 07/10] migration: add new migration state wait-unplug
Message-ID: <20191015094525.zqq4534ghe3l2ngr@jenstp.localdomain>
References: <20191011112015.11785-1-jfreimann@redhat.com>
 <20191011112015.11785-8-jfreimann@redhat.com>
 <20191011171133.GU3354@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191011171133.GU3354@work-vm>
User-Agent: NeoMutt/20180716-1376-5d6ed1
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 15 Oct 2019 09:45:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: ehabkost@redhat.com, mst@redhat.com, aadam@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, laine@redhat.com,
 ailan@redhat.com, parav@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 11, 2019 at 06:11:33PM +0100, Dr. David Alan Gilbert wrote:
>* Jens Freimann (jfreimann@redhat.com) wrote:
>> This patch adds a new migration state called wait-unplug.  It is entered
>> after the SETUP state and will transition into ACTIVE once all devices
>> were succesfully unplugged from the guest.
>>
>> So if a guest doesn't respond or takes long to honor the unplug request
>> the user will see the migration state 'wait-unplug'.
>>
>> In the migration thread we query failover devices if they're are still
>> pending the guest unplug. When all are unplugged the migration
>> continues. We give it a defined number of iterations including small
>> waiting periods before we proceed.
>>
>> Signed-off-by: Jens Freimann <jfreimann@redhat.com>
[..]
>> @@ -3260,6 +3271,27 @@ static void *migration_thread(void *opaque)
>>
>>      qemu_savevm_state_setup(s->to_dst_file);
>>
>> +    migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>> +                      MIGRATION_STATUS_WAIT_UNPLUG);
>
>I think I'd prefer if you only went into this state if you had any
>devices that were going to need unplugging.

Sure, that makes sense. I'll change it.

>> +    while (i < FAILOVER_UNPLUG_RETRIES &&
>> +           s->state == MIGRATION_STATUS_WAIT_UNPLUG) {
>> +        i++;
>> +        qemu_sem_timedwait(&s->wait_unplug_sem, FAILOVER_GUEST_UNPLUG_WAIT);
>> +        all_unplugged = qemu_savevm_state_guest_unplug_pending();
>> +        if (all_unplugged) {
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (all_unplugged) {
>> +        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
>> +                MIGRATION_STATUS_ACTIVE);
>> +    } else {
>> +        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
>> +                          MIGRATION_STATUS_CANCELLING);
>> +    }
>
>I think you can get rid of both the timeout and the count and just make
>sure that migrate_cancel works at this point.

I see, I need to add the new state to migration_is_setup_or_active() or
a cancel won't work.  

>This pushes the problem up a layer, which I think is fine.

Seems good to me. To be clear, you're saying I should just poll on
the device unplugged state? Like

         while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
                !qemu_savevm_state_guest_unplug_pending()) {
_            /* This block intentionally left blank */
         }

regards,
Jens  

