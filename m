Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EF492255
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 13:28:18 +0200 (CEST)
Received: from localhost ([::1]:48144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzfph-0006xK-OK
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 07:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hzfoS-0005yd-Nw
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:27:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hzfoR-0007EM-KY
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:27:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44998)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hzfoR-0007E3-CZ
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 07:26:59 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A3965C057F31;
 Mon, 19 Aug 2019 11:26:58 +0000 (UTC)
Received: from work-vm (ovpn-116-163.ams2.redhat.com [10.36.116.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C78058CBF6;
 Mon, 19 Aug 2019 11:26:57 +0000 (UTC)
Date: Mon, 19 Aug 2019 12:26:55 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190819112655.GB2765@work-vm>
References: <20190621142739.23703-1-richardw.yang@linux.intel.com>
 <20190819032947.GB18468@richard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819032947.GB18468@richard>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Mon, 19 Aug 2019 11:26:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migrtion: define
 MigrationState/MigrationIncomingState.state as MigrationStatus
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> On Fri, Jun 21, 2019 at 10:27:39PM +0800, Wei Yang wrote:
> >No functional change. Add default case to fix warning.
> >
> 
> Hi, David & Juan
> 
> Do you like this?

See other reply; but you are making patches a bit faster than I can
review them!

Dave

> >Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> >---
> > migration/migration.c | 8 +++++++-
> > migration/migration.h | 6 +++---
> > 2 files changed, 10 insertions(+), 4 deletions(-)
> >
> >diff --git a/migration/migration.c b/migration/migration.c
> >index 2865ae3fa9..0fd2364961 100644
> >--- a/migration/migration.c
> >+++ b/migration/migration.c
> >@@ -946,6 +946,8 @@ static void fill_source_migration_info(MigrationInfo *info)
> >     case MIGRATION_STATUS_CANCELLED:
> >         info->has_status = true;
> >         break;
> >+    default:
> >+        return;
> >     }
> >     info->status = s->state;
> > }
> >@@ -1054,6 +1056,8 @@ static void fill_destination_migration_info(MigrationInfo *info)
> >         info->has_status = true;
> >         fill_destination_postcopy_migration_info(info);
> >         break;
> >+    default:
> >+        return;
> >     }
> >     info->status = mis->state;
> > }
> >@@ -1446,7 +1450,7 @@ void qmp_migrate_start_postcopy(Error **errp)
> > 
> > /* shared migration helpers */
> > 
> >-void migrate_set_state(int *state, int old_state, int new_state)
> >+void migrate_set_state(MigrationStatus *state, int old_state, int new_state)
> > {
> >     assert(new_state < MIGRATION_STATUS__MAX);
> >     if (atomic_cmpxchg(state, old_state, new_state) == old_state) {
> >@@ -1683,6 +1687,8 @@ bool migration_is_idle(void)
> >         return false;
> >     case MIGRATION_STATUS__MAX:
> >         g_assert_not_reached();
> >+    default:
> >+        g_assert_not_reached();
> >     }
> > 
> >     return false;
> >diff --git a/migration/migration.h b/migration/migration.h
> >index 5e8f09c6db..418ee00053 100644
> >--- a/migration/migration.h
> >+++ b/migration/migration.h
> >@@ -65,7 +65,7 @@ struct MigrationIncomingState {
> > 
> >     QEMUBH *bh;
> > 
> >-    int state;
> >+    MigrationStatus state;
> > 
> >     bool have_colo_incoming_thread;
> >     QemuThread colo_incoming_thread;
> >@@ -151,7 +151,7 @@ struct MigrationState
> >     /* params from 'migrate-set-parameters' */
> >     MigrationParameters parameters;
> > 
> >-    int state;
> >+    MigrationStatus state;
> > 
> >     /* State related to return path */
> >     struct {
> >@@ -234,7 +234,7 @@ struct MigrationState
> >     bool decompress_error_check;
> > };
> > 
> >-void migrate_set_state(int *state, int old_state, int new_state);
> >+void migrate_set_state(MigrationStatus *state, int old_state, int new_state);
> > 
> > void migration_fd_process_incoming(QEMUFile *f);
> > void migration_ioc_process_incoming(QIOChannel *ioc, Error **errp);
> >-- 
> >2.19.1
> 
> -- 
> Wei Yang
> Help you, Help me
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

