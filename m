Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFF96B4FE4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:17:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pahHL-00075K-Vk; Fri, 10 Mar 2023 13:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pahHJ-00072b-9W; Fri, 10 Mar 2023 13:15:41 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pahHG-0007Lc-TU; Fri, 10 Mar 2023 13:15:40 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA8DD21DF4;
 Fri, 10 Mar 2023 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678472134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDFMG7A5Qxm5smzTuLy+b2qEiocvX2q6me/F86sRkwk=;
 b=pnfFrGDX9nEeYkwRZbi13f8sv1cT1pQ2aF/eYCY7qoRnnlqQcM+xgQmc56hPwDAzWx/Tgz
 IPJRJTYbjKQ4CfWBw9PTJr4Iy0MJ+UyJEvnxxReQT8yF0PJ+wd3Nik1/Pj4x1Mpze/sif2
 bD1W469szWDgHHMuXLGdXJK5J4xxwd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678472134;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDFMG7A5Qxm5smzTuLy+b2qEiocvX2q6me/F86sRkwk=;
 b=3wcA0dW1htjwQy5ylO+V4PKQ9+mJif+HWIxoDKEy8dKAllqwx3IOUZ7jir6xM/TspcL6Ck
 8yVCqnX6GRaB+eDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64B81134F7;
 Fri, 10 Mar 2023 18:15:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NNdgC8ZzC2TwVgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 10 Mar 2023 18:15:34 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, David
 Hildenbrand <david@redhat.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>, Philippe =?utf-8?Q?Mat?=
 =?utf-8?Q?hieu-Daud=C3=A9?=
 <philmd@linaro.org>, Cleber Rosa <crosa@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Luis Machado <luis.machado@arm.com>
Subject: Re: [PATCH 09/11] tests/tcg: disable pauth for aarch64 gdb tests
In-Reply-To: <CAFEAcA_bjTPO+68gV0V7436S2n=iJAoH3qXGw1v9-xhG2N0CLA@mail.gmail.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-10-alex.bennee@linaro.org>
 <CAFEAcA89K6_-Uc0XmEa1q+_z_yuppq1kvh=uPfv9V80MBH=aQg@mail.gmail.com>
 <87wn3ocwqz.fsf@suse.de>
 <CAFEAcA_bjTPO+68gV0V7436S2n=iJAoH3qXGw1v9-xhG2N0CLA@mail.gmail.com>
Date: Fri, 10 Mar 2023 15:15:31 -0300
Message-ID: <87ttyscw1o.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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

> On Fri, 10 Mar 2023 at 18:00, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Fri, 10 Mar 2023 at 10:31, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> You need a very new gdb to be able to run with pauth support otherwise
>> >> your likely to hit asserts and aborts. Disable pauth for now until we
>> >> can properly probe support in gdb.
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >
>> > If it makes gdb fall over, then shouldn't we be disabling
>> > the pauth gdbstub stuff entirely ? Otherwise even if our
>> > tests are fine our users will not be...
>> >
>>
>> Have you seem my message on IRC about changing the feature name in the
>> XML? I think the issue is that we're putting the .xml in a "namespace"
>> where GDB expects to only find stuff which it has code to
>> support. Changing from "org.gnu.gdb.aarch64.pauth" to
>> "org.qemu.aarch64.pauth" made it stop crashing and I can read the
>> registers just fine.
>
> But then presumably a pauth-aware GDB won't actually know
> the values it needs to be able to convert between with-PAC
> and without-PAC addresses for backtracing?
>

Good question. Although that feels to me more like a GDB feature. If we
don't break it even worse by doing that, the QEMU side which is more
about reading the registers should be fine. Note that we already have
other .xml files using a .qemu namespace in the codebase. As I
understand it, gdb simply treats these as extra registers not tied to
any specific feature.

