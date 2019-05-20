Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A0822C51
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 08:49:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSc7S-0001v5-Qa
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 02:49:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSc6Q-0001bj-UN
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSc6P-0006yO-04
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:48:54 -0400
Received: from mga03.intel.com ([134.134.136.65]:35253)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSc6N-0006vX-3j
	for qemu-devel@nongnu.org; Mon, 20 May 2019 02:48:51 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2019 23:48:47 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga008.jf.intel.com with ESMTP; 19 May 2019 23:48:46 -0700
Date: Mon, 20 May 2019 14:48:16 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190520064816.GD6718@richard>
References: <20190515121544.4597-1-quintela@redhat.com>
	<20190515121544.4597-4-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515121544.4597-4-quintela@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH v3 3/8] tests: Add migration multifd test
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 15, 2019 at 02:15:39PM +0200, Juan Quintela wrote:
>We set multifd-channels.
>
>Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>Reviewed-by: Thomas Huth <thuth@redhat.com>
>Signed-off-by: Juan Quintela <quintela@redhat.com>
>---
> tests/migration-test.c | 48 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 48 insertions(+)
>
>diff --git a/tests/migration-test.c b/tests/migration-test.c
>index 0b25aa3d6c..ff480e0682 100644
>--- a/tests/migration-test.c
>+++ b/tests/migration-test.c
>@@ -1028,6 +1028,53 @@ static void test_precopy_tcp(void)
>     g_free(uri);
> }
> 
>+static void test_multifd_tcp(void)
>+{
>+    char *uri;
>+    QTestState *from, *to;
>+
>+    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", false, false)) {
>+        return;
>+    }
>+
>+    /*
>+     * We want to pick a speed slow enough that the test completes
>+     * quickly, but that it doesn't complete precopy even on a slow
>+     * machine, so also set the downtime.
>+     */
>+    /* 1 ms should make it not converge*/
>+    migrate_set_parameter_int(from, "downtime-limit", 1);
>+    /* 1GB/s */
>+    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
>+
>+    migrate_set_parameter_int(from, "multifd-channels", 2);
>+    migrate_set_parameter_int(to, "multifd-channels", 2);
>+
>+    migrate_set_capability(from, "multifd", "true");
>+    migrate_set_capability(to, "multifd", "true");
>+    /* Wait for the first serial output from the source */
>+    wait_for_serial("src_serial");
>+
>+    uri = migrate_get_socket_address(to, "socket-address");
>+
>+    migrate(from, uri, "{}");
>+
>+    wait_for_migration_pass(from);
>+
>+    /* 300ms it should converge */
>+    migrate_set_parameter_int(from, "downtime-limit", 600);
>+
>+    if (!got_stop) {
>+        qtest_qmp_eventwait(from, "STOP");
>+    }
>+    qtest_qmp_eventwait(to, "RESUME");
>+
>+    wait_for_serial("dest_serial");
>+    wait_for_migration_complete(from);
>+
>+    test_migrate_end(from, to, true);

Miss free uri here?

    g_free(uri);

And

Tested-by: Wei Yang <richardw.yang@linux.intel.com>

>+}
>+
> int main(int argc, char **argv)
> {
>     char template[] = "/tmp/migration-test-XXXXXX";
>@@ -1082,6 +1129,7 @@ int main(int argc, char **argv)
>     qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
>     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
>     qtest_add_func("/migration/xbzrle/unix", test_xbzrle_unix);
>+    qtest_add_func("/migration/multifd/tcp", test_multifd_tcp);
> 
>     ret = g_test_run();
> 
>-- 
>2.21.0
>

-- 
Wei Yang
Help you, Help me

