Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7174677E32
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 15:39:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJxxO-0005n3-Dt; Mon, 23 Jan 2023 09:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pJxxK-0005mk-0s; Mon, 23 Jan 2023 09:37:54 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pJxxH-0008C8-T6; Mon, 23 Jan 2023 09:37:53 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 56CE01F6E6;
 Mon, 23 Jan 2023 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674484669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRBfuVJOiA1LbWZ1vB6Nts7q9j6NIBs1DY5AgfpKRRc=;
 b=F5RcxJYepoqhM++iOxK8ftsiaIPSZThfeGVz08kQZu0J/1SFlyT4B3MxiFpqTcd4GG84AG
 rCqogvBpJiebnJl0VaxMDjbcNlIhfPdsrgQ5OMEHht8o9PpxE9o3l3rt0FqfFrv+zrMR+M
 Gdekpoh/7QqwLNrzDZX1LyhMOcS++FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674484669;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRBfuVJOiA1LbWZ1vB6Nts7q9j6NIBs1DY5AgfpKRRc=;
 b=vYFA8kOrAZ15HYX96HxmK0ewrrWHR2nabmMhHogiXn5oyx014kF8PX0d6JjdCxNbKo1RFK
 R24jHBnwBkU9YcCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CEB07134F5;
 Mon, 23 Jan 2023 14:37:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9yHDJLybzmNoNwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 23 Jan 2023 14:37:48 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration
 test on aarch64
In-Reply-To: <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-8-farosas@suse.de>
 <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org>
Date: Mon, 23 Jan 2023 11:37:46 -0300
Message-ID: <874jshco5h.fsf@suse.de>
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 20/1/23 19:48, Fabiano Rosas wrote:
>> The migration tests are currently broken for an aarch64 host because
>> the tests pass no 'machine' and 'cpu' options on the QEMU command
>> line. Most other architectures define a default value in QEMU for
>> these options, but arm does not.
>
> There was some discussions around that in the past:
> https://lore.kernel.org/qemu-devel/20190621153806.13489-1-wainersm@redhat=
.com/
> https://lore.kernel.org/qemu-devel/CAFEAcA9NBu+L4wHfkLTv93wy90wjnV05EZ12P=
T6PmLjdZ5h_YA@mail.gmail.com/

There's more than one topic being discussed, specially in this last
thread, but here's my two cents.

About defaults: It's probably best to be explicit in tests. And if we
wanted, have a separate test to make sure the lack of an option still
does what it's expected, either outputting a message or behaving the
same as the explicit version.

About host architecture-specific tests: Unless we're talking about KVM,
I see no point. Having to change hosts to test agnostic features makes
no sense (the migration test is one example).

About generic tests: If a feature is required to behave the same for all
architectures/machines/cpus then sure. But most low level stuff would be
quite dependent on specifics.

>> Add these options to the test class in case the test is being executed
>> in an aarch64 host.
>
> I'm not sure what we are aiming to test here.
>
> Migration in general? If so, any random machine should work.
> By hardcoding the 'virt' machine, at least this test is reproducible.

Yeah, I cannot say for sure there isn't some machine property that gets
transferred during migration. It seemed more conservative to define a
specific one.

> I'd rather fix that generically as "if a test requires a default
> machine and the target doesn't provide any default, then SKIP the
> test". Then adding machine-specific tests. Can be done on top, so

I agree, but the only tests that should *require* a default are the ones
that test the command line parsing or adjacent features. We could always
test "-machine foo" and then separately test that the lack of a machine
option still gives the Foo machine.

The fact that we sometimes use defaults to be able to have the same-ish
command line for every case is more of a limitation of our testing
infrastructure in my opinion.

