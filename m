Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF8A6E6D26
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 21:54:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1porNa-0004Oe-OA; Tue, 18 Apr 2023 15:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1porNZ-0004O3-2l
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 15:52:41 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1porNX-0000Uh-Fg
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 15:52:40 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C4341FD6E;
 Tue, 18 Apr 2023 19:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681847555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ap/Lvrn+k2ZGAZT+DOt/AGxDdzDHUhLkpHf2fRSXqO4=;
 b=xMVl40kcoz+OjOzc9Y+P/DBDCcFvfbtqh8g/HTg0AIJUauqixl6OybChrIQrtFfVsGWhOp
 vWc1WuOcJ5IyfXU7ujwH2sMwsl2EAa6d7ipCZV/hEc9VmVBEHqk+wryXP6mQdP4MNfd2OZ
 3/mXOkKQoGuTSH18TUvKknrhA8A6904=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681847555;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ap/Lvrn+k2ZGAZT+DOt/AGxDdzDHUhLkpHf2fRSXqO4=;
 b=CX115ZqBjdy0ZiikVXogYFjjWr9gF9mleIFkOC9aS8Apn8SVgNCYglfEK+bTL+fN/9I7T3
 Vi6P4XZdowd1tGAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8E37139CC;
 Tue, 18 Apr 2023 19:52:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PRckKAL1PmT1CQAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 18 Apr 2023 19:52:34 +0000
From: Fabiano Rosas <farosas@suse.de>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/2] tests/qtest: make more migration pre-copy scenarios
 run non-live
In-Reply-To: <20230418133100.48799-3-berrange@redhat.com>
References: <20230418133100.48799-1-berrange@redhat.com>
 <20230418133100.48799-3-berrange@redhat.com>
Date: Tue, 18 Apr 2023 16:52:32 -0300
Message-ID: <87cz41ynlr.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

...

> -        qtest_qmp_eventwait(to, "RESUME");
> +        if (!args->live) {
> +            qtest_qmp_discard_response(to, "{ 'execute' : 'cont'}");
> +        }
> +        if (!got_resume) {
> +            qtest_qmp_eventwait(to, "RESUME");
> +        }

Hi Daniel,

On an aarch64 host I'm sometimes (~30%) seeing a hang here on a TLS test:

../configure --target-list=3Daarch64-softmmu --enable-gnutls

... ./tests/qtest/migration-test --tap -k -p /aarch64/migration/precopy/tcp=
/tls/psk/match

(gdb) bt
#0  0x0000fffff7b33f8c in recv () from /lib64/libpthread.so.0
#1  0x0000aaaaaaac8bf4 in recv (__flags=3D0, __n=3D1, __buf=3D0xffffffffe47=
7, __fd=3D5) at /usr/include/bits/socket2.h:44
#2  qmp_fd_receive (fd=3D5) at ../tests/qtest/libqmp.c:73
#3  0x0000aaaaaaac6dbc in qtest_qmp_receive_dict (s=3D0xaaaaaaca7d10) at ..=
/tests/qtest/libqtest.c:713
#4  qtest_qmp_eventwait_ref (s=3D0xaaaaaaca7d10, event=3D0xaaaaaab26ce8 "RE=
SUME") at ../tests/qtest/libqtest.c:837
#5  0x0000aaaaaaac6e34 in qtest_qmp_eventwait (s=3D<optimized out>, event=
=3D<optimized out>) at ../tests/qtest/libqtest.c:850
#6  0x0000aaaaaaabbd90 in test_precopy_common (args=3D0xffffffffe590, args@=
entry=3D0xffffffffe5a0) at ../tests/qtest/migration-test.c:1393
#7  0x0000aaaaaaabc804 in test_precopy_tcp_tls_psk_match () at ../tests/qte=
st/migration-test.c:1564
#8  0x0000fffff7c89630 in ?? () from //usr/lib64/libglib-2.0.so.0
...
#15 0x0000fffff7c89a70 in g_test_run_suite () from //usr/lib64/libglib-2.0.=
so.0
#16 0x0000fffff7c89ae4 in g_test_run () from //usr/lib64/libglib-2.0.so.0
#17 0x0000aaaaaaab7fdc in main (argc=3D<optimized out>, argv=3D<optimized o=
ut>) at ../tests/qtest/migration-test.c:2642

