Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAF76F70E9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:33:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puco9-0006oa-VD; Thu, 04 May 2023 13:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puYaI-0000sd-BJ; Thu, 04 May 2023 09:01:22 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puYaE-0008MR-W0; Thu, 04 May 2023 09:01:22 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CF988339FE;
 Thu,  4 May 2023 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683205275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0CNvTeBJC9NJbW36bHQEsE9hma/Iv/am1DYHSeKhXYU=;
 b=1XEGdvf6vMCVSTb4QYfLvzlNb6u1HyHFbMjHgKD55zDr7HpvJ7XUQFjbJ7Q7TD++/OEDF/
 /RE6WEG3nDX8EkD1zEnl3OIr7EFTbPPDr5wgR/Iqj0LoNHvuN2XHrCxdBiSfWQiqyNPrIs
 VcXsQOEUNX5cNsN2vOp0P61gRa5IMeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683205275;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0CNvTeBJC9NJbW36bHQEsE9hma/Iv/am1DYHSeKhXYU=;
 b=hYOmSgZtufLv0n6XLuWaojVL1UG5wP0WA83NVrwt0dxN3La5e/f3eqx3bx6ADJWlz7jbSB
 Se/bY6GB7gLugjAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C59813444;
 Thu,  4 May 2023 13:01:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0MicCZusU2TdTwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 04 May 2023 13:01:15 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/3] target/arm: Use CONFIG_SEMIHOSTING instead of TCG
 for semihosting
In-Reply-To: <CABgObfbBTUUAOmvKz9U2Esi3rmdYmbhw3uR5iouFYUwFGoG32Q@mail.gmail.com>
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-2-farosas@suse.de>
 <3f8ed21a-6c05-e7a4-ab9a-c8f6ca041013@redhat.com>
 <CAFEAcA9y0tZVCSz93ziHkwYaM_whaEnCko2=Zzyb=BGFySJyRg@mail.gmail.com>
 <CABgObfbBTUUAOmvKz9U2Esi3rmdYmbhw3uR5iouFYUwFGoG32Q@mail.gmail.com>
Date: Thu, 04 May 2023 10:01:12 -0300
Message-ID: <875y98cktj.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> Il gio 4 mag 2023, 10:59 Peter Maydell <peter.maydell@linaro.org> ha
> scritto:
>
>> On Thu, 4 May 2023 at 08:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> >
>> > On 5/3/23 21:38, Fabiano Rosas wrote:
>> > > When building --without-default-devices, the semihosting code will not
>> > > be available, so check the proper config.
>>
>> I think the changes to the ifdeffery are conceptually
>> fine (only do semihosting if it was configured in), but
>> it sounds like there's a separate problem here.
>> Whether we need semihosting depends on the accelerator (ie
>> "is it TCG or not"), not on what set of devices we're building.
>> So the problem seems to me to be that --without-default-devices
>> is causing the semihosting code not to be built in.
>>
>> > Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>> >
>> > for this change; however, there are two more related issues:
>> >
>> > 1) you still want to leave out the code if !TCG, because KVM is not able
>> > to exit to userspace on semihosting calls as far as I understand
>> >
>> > 2) I am not sure why CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y appears in
>> > config/targets/{arm,riscv32,riscv64}-softmmu/default.mak.
>>
>> Because those are the architectures which have
>> "arm-compatible" semihosting ABIs ?
>>
>
> Yes but is there a reason to do it in configs/ where all the other symbols
> are boards, or was it just overlooked and a "default y" (as I suggested in
> the previous reply) or "imply" is better?

For arm it has been taken out of configs/ and moved into
target/arm/Kconfig:

...
# This config exists just so we can make SEMIHOSTING default when TCG
# is selected without also changing it for other architectures.
config ARM_SEMIHOSTING
    bool
    default y if TCG && ARM
    select ARM_COMPATIBLE_SEMIHOSTING

So I guess we'd need a similar change to what you suggested for ARM_V7M:

config ARM
    bool
    select ARM_V7M if TCG
    select ARM_COMPATIBLE_SEMIHOSTING if TCG

