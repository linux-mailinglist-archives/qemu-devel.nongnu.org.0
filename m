Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD466678317
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 18:28:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK0ah-0004No-QR; Mon, 23 Jan 2023 12:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pK0ae-0004ND-Sz; Mon, 23 Jan 2023 12:26:40 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pK0ad-0005gk-19; Mon, 23 Jan 2023 12:26:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1F1751F385;
 Mon, 23 Jan 2023 17:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674494797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4yc6+xONXZhHsHwmC58I+3SIqrE99U/Wlxon/l7SBw=;
 b=k4+PJbZ0UFwwreCWSuHMkh3n70Bx+CIHKkLsIAbbzmztzhzf4lqJ8utOhFv9SB9B0KYB0h
 Aqs3UeGWBfDaQ6MA+kRRjHdv7zItVYRKHEfzN3WVgIgtldllDM569NCv1WnIFW2hqLBAUS
 oFhroRz90NcviajhENS+aWUYHglZwp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674494797;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4yc6+xONXZhHsHwmC58I+3SIqrE99U/Wlxon/l7SBw=;
 b=5HQIIWoaWQMlqDSr0InH/N86Ds4j7IUP4zqKmo7+v8Sgym0udJiY/pHQfwfP+d7GPB3r57
 aOZVnYh2iyQs0PAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 97AF31357F;
 Mon, 23 Jan 2023 17:26:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PyQ0GEzDzmOeGgAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 23 Jan 2023 17:26:36 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Juan
 Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert (git)"
 <dgilbert@redhat.com>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH v5 7/9] target/avocado: Pass parameters to migration
 test on aarch64
In-Reply-To: <3f577967-377f-aa6d-1c69-542988a26a26@linaro.org>
References: <20230120184825.31626-1-farosas@suse.de>
 <20230120184825.31626-8-farosas@suse.de>
 <65cf6b01-a6d6-53ca-9ead-ebf50148cce7@linaro.org> <874jshco5h.fsf@suse.de>
 <3f577967-377f-aa6d-1c69-542988a26a26@linaro.org>
Date: Mon, 23 Jan 2023 14:26:34 -0300
Message-ID: <87r0vlxiut.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 23/1/23 15:37, Fabiano Rosas wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:
>>=20
>>> On 20/1/23 19:48, Fabiano Rosas wrote:
>>>> The migration tests are currently broken for an aarch64 host because
>>>> the tests pass no 'machine' and 'cpu' options on the QEMU command
>>>> line. Most other architectures define a default value in QEMU for
>>>> these options, but arm does not.
>>>
>>> There was some discussions around that in the past:
>>> https://lore.kernel.org/qemu-devel/20190621153806.13489-1-wainersm@redh=
at.com/
>>> https://lore.kernel.org/qemu-devel/CAFEAcA9NBu+L4wHfkLTv93wy90wjnV05EZ1=
2PT6PmLjdZ5h_YA@mail.gmail.com/
>>=20
>> There's more than one topic being discussed, specially in this last
>> thread, but here's my two cents.
>>=20
>> About defaults: It's probably best to be explicit in tests. And if we
>> wanted, have a separate test to make sure the lack of an option still
>> does what it's expected, either outputting a message or behaving the
>> same as the explicit version.
>>=20
>> About host architecture-specific tests: Unless we're talking about KVM,
>> I see no point. Having to change hosts to test agnostic features makes
>> no sense (the migration test is one example).
>>=20
>> About generic tests: If a feature is required to behave the same for all
>> architectures/machines/cpus then sure. But most low level stuff would be
>> quite dependent on specifics.
>>=20
>>>> Add these options to the test class in case the test is being executed
>>>> in an aarch64 host.
>>>
>>> I'm not sure what we are aiming to test here.
>>>
>>> Migration in general? If so, any random machine should work.
>>> By hardcoding the 'virt' machine, at least this test is reproducible.
>>=20
>> Yeah, I cannot say for sure there isn't some machine property that gets
>> transferred during migration. It seemed more conservative to define a
>> specific one.
>
> Why did you choose 'virt' and not 'xlnx-versal-virt' or 'sbsa-ref'?

It is the only one guaranteed to be present with both TCG and KVM.

