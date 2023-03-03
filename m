Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FD6AA0CA
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 22:01:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYCVB-0004dG-HS; Fri, 03 Mar 2023 15:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pYCV8-0004cm-V4; Fri, 03 Mar 2023 15:59:38 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pYCV6-0008S8-6N; Fri, 03 Mar 2023 15:59:37 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1B5FA1F750;
 Fri,  3 Mar 2023 20:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677877173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5/F8bcSdTvKkxYkAx6kmxgBeHgBpoB3AT/OMccsBdoA=;
 b=HLMggIjgsyZ8FUpEAbrqZfKCpBuYVzBzjgaj1n68DazuWZJDe9xWtik/gLQMcP1iqV13L8
 Nf3NVrw9nJwAgGYoy2o+iUV9D8usUP4lBvUyXzRhiC+Fzw/Jr5BFPTnlvs1gRxFWpeEXz/
 XqZ6c/EucTsZvmITrIt3cdTG6wisbcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677877173;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5/F8bcSdTvKkxYkAx6kmxgBeHgBpoB3AT/OMccsBdoA=;
 b=9SvSFgWzGtYOWrA+4fmEEkU7Gup68p1WgJeIZHjxpc+vXwmGlULZ8B+SuTHLcyBhevz3lO
 ft6/azhgbj479lDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90B3A1329E;
 Fri,  3 Mar 2023 20:59:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id O05dFbRfAmRYUwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 03 Mar 2023 20:59:32 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to
 migration test
In-Reply-To: <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-6-farosas@suse.de>
 <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
Date: Fri, 03 Mar 2023 17:59:29 -0300
Message-ID: <87pm9pwnym.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 28 Feb 2023 at 19:28, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> The migration tests are currently broken for an aarch64 host because
>> the tests pass no 'machine' and 'cpu' options on the QEMU command
>> line.
>>
>> Add a separate class to each architecture so that we can specify
>> 'machine' and 'cpu' options instead of relying on defaults.
>>
>> Add a skip decorator to keep the current behavior of only running
>> migration tests when the qemu target matches the host architecture.
>
> I still don't understand this patch. Don't we run the
> migration-test on all hosts already? David ?
>

We run on all hosts but for each host we only take the QEMU binary that
matches the host architecture. So if you want to test aarch64 migration,
you need an aarch64 host.

If you run on an x86_64 host (without this patch):
$ ../configure #all targets
$ make check-avocado AVOCADO_TESTS=../tests/avocado/migration.py

You'll see:

 (1/3) ... migration.py:Migration.test_migration_with_tcp_localhost: PASS (0.21 s)
 (2/3) ... migration.py:Migration.test_migration_with_unix: PASS (0.18 s)
 (3/3) ... migration.py:Migration.test_migration_with_exec: PASS (0.21 s)

All three tests ran using qemu-system-x86_64.

The issue I'm trying to solve is that when run on a aarch64 host, the
test will fail because (being generic) it doesn't pass the '-machine
virt' option and there is no architecture-specific information in it at
all.

If we need to pass '-machine virt' to the arm machine, then something
needs to change to add architecture-specific knowledge into the test. My
first version hardcoded the usual "if arch == foo". That was frowned
upon, so this version creates a class for each architecture like other
tests do (e.g. boot_linux.py).

The downside of this is that we need to explicitly enumerate the host
architectures on which we want the test to run. I chose a few of the
obvious, but we might need to add more.

The upside is that we could now enable the test to run with all the
targets present in the build. If we remove the @skip decorators from
this patch, we'd get (note the arch strings):

 (01/12) ... migration.py:Aarch64.test_migration_with_tcp_localhost: PASS (0.19 s)
 (02/12) ... migration.py:Aarch64.test_migration_with_unix: PASS (0.16 s)
 (03/12) ... migration.py:Aarch64.test_migration_with_exec: PASS (0.20 s)
                          ^
 (04/12) ... migration.py:X86_64.test_migration_with_tcp_localhost: PASS (0.21 s)
 (05/12) ... migration.py:X86_64.test_migration_with_unix: PASS (0.18 s)
 (06/12) ... migration.py:X86_64.test_migration_with_exec: PASS (0.21 s)
                          ^
 (07/12) ... migration.py:PPC64.test_migration_with_tcp_localhost: PASS (0.20 s)
 (08/12) ... migration.py:PPC64.test_migration_with_unix: PASS (0.17 s)
 (09/12) ... migration.py:PPC64.test_migration_with_exec: PASS (0.20 s)
                          ^

