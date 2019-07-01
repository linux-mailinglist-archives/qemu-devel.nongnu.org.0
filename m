Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8802D7B7
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 10:25:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49811 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVtty-0003jf-AC
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 04:25:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hVtqx-0001Wj-KW
	for qemu-devel@nongnu.org; Wed, 29 May 2019 04:22:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1hVtqw-0000rN-OS
	for qemu-devel@nongnu.org; Wed, 29 May 2019 04:22:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46486)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hVtqw-0000jF-KE
	for qemu-devel@nongnu.org; Wed, 29 May 2019 04:22:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29D8D9D43B;
	Wed, 29 May 2019 08:22:22 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95AB01A4D9;
	Wed, 29 May 2019 08:22:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
In-Reply-To: <20190529003422.GB24428@richard> (Wei Yang's message of "Wed, 29
	May 2019 08:34:22 +0800")
References: <20190528014703.21030-1-richardw.yang@linux.intel.com>
	<20190528014703.21030-2-richardw.yang@linux.intel.com>
	<87muj780dc.fsf@trasno.org> <20190529003422.GB24428@richard>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Wed, 29 May 2019 10:22:17 +0200
Message-ID: <87muj57jra.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 29 May 2019 08:22:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/4] migration: multifd_save_setup always
 return 0
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> On Tue, May 28, 2019 at 10:11:11AM +0200, Juan Quintela wrote:
>>Wei Yang <richardw.yang@linux.intel.com> wrote:
>>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>>> ---
>>>  migration/migration.c | 7 +------
>>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/migration/migration.c b/migration/migration.c
>>> index d0a0f68f11..3aae4f2734 100644
>>> --- a/migration/migration.c
>>> +++ b/migration/migration.c
>>> @@ -3336,12 +3336,7 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>>>          return;
>>>      }
>>>  
>>> -    if (multifd_save_setup() != 0) {
>>> -        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>>> -                          MIGRATION_STATUS_FAILED);
>>> -        migrate_fd_cleanup(s);
>>> -        return;
>>> -    }
>>> +    multifd_save_setup();
>>>      qemu_thread_create(&s->thread, "live_migration", migration_thread, s,
>>>                         QEMU_THREAD_JOINABLE);
>>>      s->migration_thread_running = true;
>>
>>Nack.
>>
>>On the compression patches that are on list, multifd_save_setup()
>>returns -1 if there is a problem when we allocate a zbuff.
>
> You mean there are some patches in mail list?

Yeap.

