Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 707456ED67A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 23:02:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr3Jh-0000lL-Kj; Mon, 24 Apr 2023 17:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pr3Jg-0000l8-1Q; Mon, 24 Apr 2023 17:01:44 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pr3Jd-0008VB-R7; Mon, 24 Apr 2023 17:01:43 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D0FBD2197E;
 Mon, 24 Apr 2023 21:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682370099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lBdlOXN8CxhoPU990nmhhydQEMR+lBO0IQi2jC28asw=;
 b=qq9HQRpwALhuascoMjLSUeomwkbqVKq2cjObN5N/xiky2KEN/oUUVAmAwSr005XbGmDsPa
 322o0huizXpnGoive+vpCT8o+urrKDs6E04brDuqsY2TO7mg8+ORnZDgM2t9/JzGu5Tpwt
 1/4FfwbQaWUjtPqGltQjpuPXeQKPMO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682370099;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lBdlOXN8CxhoPU990nmhhydQEMR+lBO0IQi2jC28asw=;
 b=pe4J/oHsnuXHPvGvy/p+44OaC1bblis6CzIBpfKcSEAL+sFEvIGYap9tkkbow31SGsiOXd
 RYsOYLN6DibflGBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5808C1390E;
 Mon, 24 Apr 2023 21:01:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XttaBzPuRmSNHQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 24 Apr 2023 21:01:39 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth
 <thuth@redhat.com>, John Snow <jsnow@redhat.com>, Li Zhijian
 <lizhijian@fujitsu.com>, Juan Quintela <quintela@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Zhang Chen <chen.zhang@intel.com>, Laurent
 Vivier <lvivier@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v2 4/6] tests/qtest: make more migration pre-copy
 scenarios run non-live
In-Reply-To: <20230421171411.566300-5-berrange@redhat.com>
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-5-berrange@redhat.com>
Date: Mon, 24 Apr 2023 18:01:36 -0300
Message-ID: <87jzy1ro3z.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> There are 27 pre-copy live migration scenarios being tested. In all of
> these we force non-convergance and run for one iteration, then let it
> converge and wait for completion during the second (or following)
> iterations. At 3 mbps bandwidth limit the first iteration takes a very
> long time (~30 seconds).
>
> While it is important to test the migration passes and convergance
> logic, it is overkill to do this for all 27 pre-copy scenarios. The
> TLS migration scenarios in particular are merely exercising different
> code paths during connection establishment.
>
> To optimize time taken, switch most of the test scenarios to run
> non-live (ie guest CPUs paused) with no bandwidth limits. This gives
> a massive speed up for most of the test scenarios.
>
> For test coverage the following scenarios are unchanged
>
>  * Precopy with UNIX sockets
>  * Precopy with UNIX sockets and dirty ring tracking
>  * Precopy with XBZRLE
>  * Precopy with multifd
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  tests/qtest/migration-test.c | 60 ++++++++++++++++++++++++++++++------
>  1 file changed, 50 insertions(+), 10 deletions(-)
>
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 6492ffa7fe..40d0f75480 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -568,6 +568,9 @@ typedef struct {
>          MIG_TEST_FAIL_DEST_QUIT_ERR,
>      } result;
>=20=20
> +    /* Whether the guest CPUs should be running during migration */
> +    bool live;
> +
>      /* Postcopy specific fields */
>      void *postcopy_data;
>      bool postcopy_preempt;
> @@ -1324,8 +1327,6 @@ static void test_precopy_common(MigrateCommon *args)
>          return;
>      }
>=20=20
> -    migrate_ensure_non_converge(from);
> -
>      if (args->start_hook) {
>          data_hook =3D args->start_hook(from, to);
>      }
> @@ -1335,6 +1336,31 @@ static void test_precopy_common(MigrateCommon *arg=
s)
>          wait_for_serial("src_serial");
>      }
>=20=20
> +    if (args->live) {
> +        /*
> +         * Testing live migration, we want to ensure that some
> +         * memory is re-dirtied after being transferred, so that
> +         * we exercise logic for dirty page handling. We achieve
> +         * this with a ridiculosly low bandwidth that guarantees
> +         * non-convergance.
> +         */
> +        migrate_ensure_non_converge(from);
> +    } else {
> +        /*
> +         * Testing non-live migration, we allow it to run at
> +         * full speed to ensure short test case duration.
> +         * For tests expected to fail, we don't need to
> +         * change anything.
> +         */
> +        if (args->result =3D=3D MIG_TEST_SUCCEED) {
> +            qtest_qmp_assert_success(from, "{ 'execute' : 'stop'}");
> +            if (!got_stop) {
> +                qtest_qmp_eventwait(from, "STOP");
> +            }
> +            migrate_ensure_converge(from);
> +        }
> +    }
> +
>      if (!args->connect_uri) {
>          g_autofree char *local_connect_uri =3D
>              migrate_get_socket_address(to, "socket-address");
> @@ -1352,19 +1378,29 @@ static void test_precopy_common(MigrateCommon *ar=
gs)
>              qtest_set_expected_status(to, EXIT_FAILURE);
>          }
>      } else {
> -        wait_for_migration_pass(from);
> +        if (args->live) {
> +            wait_for_migration_pass(from);
>=20=20
> -        migrate_ensure_converge(from);
> +            migrate_ensure_converge(from);
>=20=20
> -        /* We do this first, as it has a timeout to stop us
> -         * hanging forever if migration didn't converge */
> -        wait_for_migration_complete(from);
> +            /*
> +             * We do this first, as it has a timeout to stop us
> +             * hanging forever if migration didn't converge
> +             */
> +            wait_for_migration_complete(from);
> +
> +            if (!got_stop) {
> +                qtest_qmp_eventwait(from, "STOP");
> +            }
> +        } else {
> +            wait_for_migration_complete(from);
>=20=20
> -        if (!got_stop) {
> -            qtest_qmp_eventwait(from, "STOP");
> +            qtest_qmp_assert_success(to, "{ 'execute' : 'cont'}");

I retested and the problem still persists. The issue is with this wait +
cont sequence:

wait_for_migration_complete(from);
qtest_qmp_assert_success(to, "{ 'execute' : 'cont'}");

We wait for the source to finish but by the time qmp_cont executes, the
dst is still INMIGRATE, autostart gets set and I never see the RESUME
event.

When the dst migration finishes the VM gets put in RUN_STATE_PAUSED (at
process_incoming_migration_bh):

    if (!global_state_received() ||
        global_state_get_runstate() =3D=3D RUN_STATE_RUNNING) {
        if (autostart) {
            vm_start();
        } else {
            runstate_set(RUN_STATE_PAUSED);
        }
    } else if (migration_incoming_colo_enabled()) {
        migration_incoming_disable_colo();
        vm_start();
    } else {
        runstate_set(global_state_get_runstate());  <-- HERE
    }

Do we need to add something to that routine like this?

    if (autostart &&
        global_state_get_runstate() !=3D RUN_STATE_RUNNING) {
        vm_start();
    }

Otherwise it seems we'll just ignore a 'cont' that was received when the
migration is still ongoing.

>          }
>=20=20
> -        qtest_qmp_eventwait(to, "RESUME");
> +        if (!got_resume) {
> +            qtest_qmp_eventwait(to, "RESUME");
> +        }
>=20=20
>          wait_for_serial("dest_serial");
>      }

