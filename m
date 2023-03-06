Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F009D6AC942
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:07:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEIb-0002aU-Ig; Mon, 06 Mar 2023 12:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pZEIX-0002Z3-8P; Mon, 06 Mar 2023 12:06:53 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pZEIV-0003B8-4s; Mon, 06 Mar 2023 12:06:52 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EDC231FDE3;
 Mon,  6 Mar 2023 17:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678122408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SY+TKppUIcSBDyyUoeQbDlkZUeIJF/QuMMulTiWFZWM=;
 b=bwg/7eKHQ/SijSmlNBTza/TrgfVVgyJIKJ199kCJDvJs3MXP/sRgUGMsiqtUwIhr6h1MUo
 HGWyn3MYrlAutn6/SxDD1OsRuF57wB6khVP8CUFOg208g3EQYkG9vZYrrlzhrkuMDn9SFv
 QUApvRhWTrPehsdFGfKKekgGQLnyPqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678122408;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SY+TKppUIcSBDyyUoeQbDlkZUeIJF/QuMMulTiWFZWM=;
 b=KSkOPCDKvnUUDjZNfnAapupiAN6DqRdzUu3cdy/CV2oBvgw6tDUg3OUJx+zfeICnO7pELg
 0TENqACOa4ncc3AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7694B13A66;
 Mon,  6 Mar 2023 17:06:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EdT+D6gdBmTrZQAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Mar 2023 17:06:48 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to
 migration test
In-Reply-To: <CAFEAcA_aw6mc_FM00MqOcOzqFP=xktpq6+Z-_uhhEHKbw-bKNA@mail.gmail.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-6-farosas@suse.de>
 <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com>
 <87pm9pwnym.fsf@suse.de>
 <CAFEAcA_aw6mc_FM00MqOcOzqFP=xktpq6+Z-_uhhEHKbw-bKNA@mail.gmail.com>
Date: Mon, 06 Mar 2023 14:06:45 -0300
Message-ID: <87jzztstay.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
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

> On Fri, 3 Mar 2023 at 20:59, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Tue, 28 Feb 2023 at 19:28, Fabiano Rosas <farosas@suse.de> wrote:
>> >>
>> >> The migration tests are currently broken for an aarch64 host because
>> >> the tests pass no 'machine' and 'cpu' options on the QEMU command
>> >> line.
>> >>
>> >> Add a separate class to each architecture so that we can specify
>> >> 'machine' and 'cpu' options instead of relying on defaults.
>> >>
>> >> Add a skip decorator to keep the current behavior of only running
>> >> migration tests when the qemu target matches the host architecture.
>> >
>> > I still don't understand this patch. Don't we run the
>> > migration-test on all hosts already? David ?
>> >
>>
>> We run on all hosts but for each host we only take the QEMU binary that
>> matches the host architecture. So if you want to test aarch64 migration,
>> you need an aarch64 host.
>>
>> If you run on an x86_64 host (without this patch):
>> $ ../configure #all targets
>> $ make check-avocado AVOCADO_TESTS=../tests/avocado/migration.py
>>
>> You'll see:
>>
>>  (1/3) ... migration.py:Migration.test_migration_with_tcp_localhost: PASS (0.21 s)
>>  (2/3) ... migration.py:Migration.test_migration_with_unix: PASS (0.18 s)
>>  (3/3) ... migration.py:Migration.test_migration_with_exec: PASS (0.21 s)
>>
>> All three tests ran using qemu-system-x86_64.
>>
>> The issue I'm trying to solve is that when run on a aarch64 host, the
>> test will fail because (being generic) it doesn't pass the '-machine
>> virt' option and there is no architecture-specific information in it at
>> all.
>
> But my point is that we already CI on aarch64 hosts, so what is
> happening there that means the test doesn't fail already ?
>

I don't see check-avocado on the custom runners job descriptions
(.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml). It seems we
don't run avocado there at all.

For the regular jobs, there's the avocado-cfi-aarch64 job which depends
on the build-cfi-aarch64 job that is being skipped at the moment. But
that wouldn't catch this bug because it runs on an x86 host and this
particular test gets skipped.

