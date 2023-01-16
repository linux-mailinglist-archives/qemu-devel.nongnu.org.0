Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD9966C152
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:10:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQA0-0000b6-9M; Mon, 16 Jan 2023 09:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pHQ9x-0000aW-7R; Mon, 16 Jan 2023 09:08:25 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pHQ9v-0001be-Jr; Mon, 16 Jan 2023 09:08:24 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EDB2B678BE;
 Mon, 16 Jan 2023 14:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673878101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYpvfBUUQx5AgLWD7HpZ/ikak7btnZaNIlIB9bjuo/4=;
 b=jN7idM75FOXoIf7po8BgPta5c7v69eV9jQFxbHXN3b7ceASf2mmvC+8/gXhKcmBcvUXLtS
 3CkXsTOatimbAIM9mog+nrV7jBNy3mXa8pQWtnstHOWIXLm3UPHIq1C5gVVGLwsRxiHIXg
 11jViQsYkBIwA15kcX1Xh2wqT9PYY6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673878101;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jYpvfBUUQx5AgLWD7HpZ/ikak7btnZaNIlIB9bjuo/4=;
 b=67OQSLJckyjz3TKZi6h/0da2Fu/SPHP5dmYoupUy0h8bM8cTi2oYBSB5bvISvgl0lFqdiX
 ItsLd/T9LCuzGbCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BEE5138FE;
 Mon, 16 Jan 2023 14:08:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KK11EVVaxWO+VwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 16 Jan 2023 14:08:21 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Alex
 =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 20/28] target/arm: Set cortex-a57 as default cpu
 for KVM-only build
In-Reply-To: <CAFEAcA8cUc28JBT7QikUirthUn7yP-BVV3+cibHryAGx5FWE+w@mail.gmail.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-21-farosas@suse.de>
 <bb5f5cd7-6d53-eb69-3e79-db95c9734f07@linaro.org> <874jsqzj7m.fsf@suse.de>
 <CAFEAcA8cUc28JBT7QikUirthUn7yP-BVV3+cibHryAGx5FWE+w@mail.gmail.com>
Date: Mon, 16 Jan 2023 11:08:19 -0300
Message-ID: <87wn5my3l8.fsf@suse.de>
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

> On Mon, 16 Jan 2023 at 13:45, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>> > On 1/13/23 06:04, Fabiano Rosas wrote:
>> >> The cortex-a15 is not present anymore when CONFIG_TCG=n, so use the
>> >> cortex-a57 as default cpu for KVM.
>> >>
>> >> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> >
>> > Ideally there would not be a default at all, requiring the command-line option to be used.
>>
>> We could probably do that now without impact to users, since KVM would
>> always require a -cpu option due to the current default being
>> cortex-a15.
>>
>> >
>> > Second choice would be "host", since that's the only value that's actually usable (except
>> > for the off-chance that you're actually running on an a57, which is less and less likely
>> > as time moves on).
>> >
>>
>> I'll have to go around fixing qtest first, either to add -cpu or to add
>> -accel kvm, otherwise we get:
>>
>> The 'host' CPU type can only be used with KVM or HVF
>
> For a CPU type that will work with either KVM or TCG, that would
> be "max".

Yes, although the issue here is more that there are tests running with
!kvm_enabled (no -accel kvm given) and !tcg_enabled (--disable-tcg).

The "max" cpu does in fact work with qtest because even when
CONFIG_TCG=n, it ends up configuring a "cortex-a57 + extra things" in
aarch64_max_initfn. But that seems a bit too implicit to me, it would be
better for the tests to explicitly set the accel and cpu options.

