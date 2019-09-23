Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B741BBB64F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 16:14:03 +0200 (CEST)
Received: from localhost ([::1]:57102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCP6I-0005Ee-Q7
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 10:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iCP4g-0004Ka-PY
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:12:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iCP4e-00056W-MK
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:12:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52047)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iCP4e-00055L-AE
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 10:12:20 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 40F35757C6;
 Mon, 23 Sep 2019 14:12:18 +0000 (UTC)
Received: from dhcp-17-179.bos.redhat.com (dhcp-17-179.bos.redhat.com
 [10.18.17.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DE871001B30;
 Mon, 23 Sep 2019 14:12:12 +0000 (UTC)
Date: Mon, 23 Sep 2019 10:12:11 -0400
From: Cleber Rosa <crosa@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/2] tests/migration: Fail on unexpected migration states
Message-ID: <20190923141211.GA9445@dhcp-17-179.bos.redhat.com>
References: <20190923131022.15498-1-dgilbert@redhat.com>
 <20190923131022.15498-2-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923131022.15498-2-dgilbert@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 23 Sep 2019 14:12:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: thuth@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 23, 2019 at 02:10:21PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> We've got various places where we wait for a migration to enter
> a given state; but if we enter an unexpected state we tend to fail
> in odd ways; add a mechanism for explicitly testing for any state
> which we shouldn't be in.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tests/migration-test.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/migration-test.c b/tests/migration-test.c
> index 258aa064d4..9c62ee5331 100644
> --- a/tests/migration-test.c
> +++ b/tests/migration-test.c
> @@ -255,15 +255,19 @@ static void read_blocktime(QTestState *who)
>  }
>  
>  static void wait_for_migration_status(QTestState *who,
> -                                      const char *goal)
> +                                      const char *goal,
> +                                      const char **ungoals)
>  {
>      while (true) {
>          bool completed;
>          char *status;
> +        const char **ungoal;
>  
>          status = migrate_query_status(who);
>          completed = strcmp(status, goal) == 0;
> -        g_assert_cmpstr(status, !=,  "failed");
> +        for (ungoal = ungoals; *ungoal; ungoal++) {
> +            g_assert_cmpstr(status, !=,  *ungoal);
> +        }
>          g_free(status);
>          if (completed) {
>              return;
> @@ -274,7 +278,8 @@ static void wait_for_migration_status(QTestState *who,
>  
>  static void wait_for_migration_complete(QTestState *who)
>  {
> -    wait_for_migration_status(who, "completed");
> +    wait_for_migration_status(who, "completed",
> +                              (const char * []) { "failed", NULL });
>  }
>  
>  static void wait_for_migration_pass(QTestState *who)
> @@ -809,7 +814,9 @@ static void test_postcopy_recovery(void)
>       * Wait until postcopy is really started; we can only run the
>       * migrate-pause command during a postcopy
>       */
> -    wait_for_migration_status(from, "postcopy-active");
> +    wait_for_migration_status(from, "postcopy-active",
> +                              (const char * []) { "failed",
> +                                                  "completed", NULL });
>  
>      /*
>       * Manually stop the postcopy migration. This emulates a network
> @@ -822,7 +829,9 @@ static void test_postcopy_recovery(void)
>       * migrate-recover command can only succeed if destination machine
>       * is in the paused state
>       */
> -    wait_for_migration_status(to, "postcopy-paused");
> +    wait_for_migration_status(to, "postcopy-paused",
> +                              (const char * []) { "failed", "active",
> +                                                  "completed", NULL });
>  
>      /*
>       * Create a new socket to emulate a new channel that is different
> @@ -836,7 +845,9 @@ static void test_postcopy_recovery(void)
>       * Try to rebuild the migration channel using the resume flag and
>       * the newly created channel
>       */
> -    wait_for_migration_status(from, "postcopy-paused");
> +    wait_for_migration_status(from, "postcopy-paused",
> +                              (const char * []) { "failed", "active",
> +                                                  "completed", NULL });
>      migrate(from, uri, "{'resume': true}");
>      g_free(uri);
>  
> -- 
> 2.21.0
> 
>

LGTM (tested with x86_64 and aarch64 targets on an x86_64 host).

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

