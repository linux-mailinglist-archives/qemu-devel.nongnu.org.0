Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E503F6F4843
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:24:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsmn-0008HS-8g; Tue, 02 May 2023 12:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ptsmi-0008Gd-Gx; Tue, 02 May 2023 12:23:24 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1ptsmg-0007Vv-ED; Tue, 02 May 2023 12:23:24 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B6CE1FD71;
 Tue,  2 May 2023 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683044600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aGKLtI/cLJ+Zqn1cPCcZAf9lDslZGy8u4GzHL5+Tegs=;
 b=e+gFImhWX8pod0IuRSOz7UwHx2/li290jCUowAUI7W6ze8xhG617plS5KXOqfIWpVIYRlJ
 ptCyENILwCLyeYceBATl7tb7cnY4lxh0EGKOn88cdjHKtuGHB4Tv5QRTyZ52N1fMs5GuE8
 htVcbkRLwEsWoaP6KAy37EjSREr1E9g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683044600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aGKLtI/cLJ+Zqn1cPCcZAf9lDslZGy8u4GzHL5+Tegs=;
 b=GLz3JFTr8LyvndMQhoNg+tejvheIaWT5I3oq+nHKZiK1qOaj3uheDUg9e29FpsrojfO44n
 9wnxcWj0Ef5tu3BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA770139C3;
 Tue,  2 May 2023 16:23:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZAbrK/c4UWQMPwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 02 May 2023 16:23:19 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu?=
 =?utf-8?Q?-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
In-Reply-To: <CAFEAcA-7ci6PRYCOcrPZcGq8x+Wxtx6wwSk1C18cOO=dXOq8Dw@mail.gmail.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
 <CAFEAcA-s6P2Y5nNQMyACeK3+4cuSrFfqqEdFW-BDToy_YXj64g@mail.gmail.com>
 <CAFEAcA-7ci6PRYCOcrPZcGq8x+Wxtx6wwSk1C18cOO=dXOq8Dw@mail.gmail.com>
Date: Tue, 02 May 2023 13:23:17 -0300
Message-ID: <87o7n2itxm.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 2 May 2023 at 15:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 2 May 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>> >
>> > On Wed, 26 Apr 2023 at 19:00, Fabiano Rosas <farosas@suse.de> wrote:
>> > >
>> > > Hi,
>> > >
>> > > Some minor changes:
>> > >
>> > > - new patch to move a test under CONFIG_TCG (broken on master);
>> > > - new patch to document the unsupported CPU test (Philippe);
>> > > - changed the test skip message when no KVM or TCG are present (Igor).
>> >
>> > Applied to target-arm.next; thanks for your persistence in
>> > working through the many versions of this patchset.
>>
>> Update: I had to drop "gitlab-ci: Check building KVM-only aarch64 target"
>> because it enables a CI job that fails on our aarch64 runner
>> (because it wants to run tests using KVM but that machine
>> isn't configured to allow the runner to use KVM).
>
> We fixed the runner config, but the CI still fails on that notcg
> job because it is trying to run tests that explicitly use
> '-accel tcg':
> https://gitlab.com/qemu-project/qemu/-/jobs/4212850809#L3595
>
> Something is weird here, because we built without TCG support
> on an aarch64 host but we still got qemu-system-i386
> and qemu-system-x86_64 binaries, which then don't work
> and cause the tests to fail...
>

Hmm, that's potentially due to Xen. Looks like we need more (!tcg &&
!kvm) checks. Let me try to reproduce it.

