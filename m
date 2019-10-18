Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762EEDBFBB
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 10:19:45 +0200 (CEST)
Received: from localhost ([::1]:36372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLNU8-00026U-DQ
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 04:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iLNR3-0007L4-R4
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 04:16:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iLNR1-0008BO-UD
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 04:16:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58804)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iLNR1-0008Ay-M3
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 04:16:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF4A188384C;
 Fri, 18 Oct 2019 08:16:29 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67E175C1B5;
 Fri, 18 Oct 2019 08:16:28 +0000 (UTC)
Date: Fri, 18 Oct 2019 09:16:25 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Scott Cheloha <cheloha@linux.vnet.ibm.com>, david@gibson.dropbear.id.au,
 lvivier@redhat.com
Subject: Re: [PATCH v2 2/2] migration: savevm_state_handler_insert:
 constant-time element insertion
Message-ID: <20191018081625.GA2990@work-vm>
References: <20191017205953.13122-1-cheloha@linux.vnet.ibm.com>
 <20191017205953.13122-3-cheloha@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017205953.13122-3-cheloha@linux.vnet.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Fri, 18 Oct 2019 08:16:30 +0000 (UTC)
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
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Scott Cheloha (cheloha@linux.vnet.ibm.com) wrote:
> savevm_state's SaveStateEntry TAILQ is a priority queue.  Priority
> sorting is maintained by searching from head to tail for a suitable
> insertion spot.  Insertion is thus an O(n) operation.
> 
> If we instead keep track of the head of each priority's subqueue
> within that larger queue we can reduce this operation to O(1) time.
> 
> savevm_state_handler_remove() becomes slightly more complex to
> accomodate these gains: we need to replace the head of a priority's
> subqueue when removing it.
> 
> With O(1) insertion, booting VMs with many SaveStateEntry objects is
> more plausible.  For example, a ppc64 VM with maxmem=8T has 40000 such
> objects to insert.

Separate from reviewing this patch, I'd like to understand why you've
got 40000 objects.  This feels very very wrong and is likely to cause
problems to random other bits of qemu as well.

Dave

> Signed-off-by: Scott Cheloha <cheloha@linux.vnet.ibm.com>
> ---
>  migration/savevm.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index b2e3b7222a..f7a2d36bba 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -250,6 +250,7 @@ typedef struct SaveStateEntry {
>  
>  typedef struct SaveState {
>      QTAILQ_HEAD(, SaveStateEntry) handlers;
> +    SaveStateEntry *handler_pri_head[MIG_PRI_MAX + 1];
>      int global_section_id;
>      uint32_t len;
>      const char *name;
> @@ -261,6 +262,7 @@ typedef struct SaveState {
>  
>  static SaveState savevm_state = {
>      .handlers = QTAILQ_HEAD_INITIALIZER(savevm_state.handlers),
> +    .handler_pri_head = { [MIG_PRI_DEFAULT ... MIG_PRI_MAX] = NULL },
>      .global_section_id = 0,
>  };
>  
> @@ -709,24 +711,42 @@ static void savevm_state_handler_insert(SaveStateEntry *nse)
>  {
>      MigrationPriority priority = save_state_priority(nse);
>      SaveStateEntry *se;
> +    int i;
>  
>      assert(priority <= MIG_PRI_MAX);
>  
> -    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
> -        if (save_state_priority(se) < priority) {
> +    for (i = priority - 1; i >= 0; i--) {
> +        se = savevm_state.handler_pri_head[i];
> +        if (se != NULL) {
> +            assert(save_state_priority(se) < priority);
>              break;
>          }
>      }
>  
> -    if (se) {
> +    if (i >= 0) {
>          QTAILQ_INSERT_BEFORE(se, nse, entry);
>      } else {
>          QTAILQ_INSERT_TAIL(&savevm_state.handlers, nse, entry);
>      }
> +
> +    if (savevm_state.handler_pri_head[priority] == NULL) {
> +        savevm_state.handler_pri_head[priority] = nse;
> +    }
>  }
>  
>  static void savevm_state_handler_remove(SaveStateEntry *se)
>  {
> +    SaveStateEntry *next;
> +    MigrationPriority priority = save_state_priority(se);
> +
> +    if (se == savevm_state.handler_pri_head[priority]) {
> +        next = QTAILQ_NEXT(se, entry);
> +        if (next != NULL && save_state_priority(next) == priority) {
> +            savevm_state.handler_pri_head[priority] = next;
> +        } else {
> +            savevm_state.handler_pri_head[priority] = NULL;
> +        }
> +    }
>      QTAILQ_REMOVE(&savevm_state.handlers, se, entry);
>  }
>  
> -- 
> 2.23.0
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

