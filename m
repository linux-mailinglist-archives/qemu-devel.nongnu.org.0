Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4AC68C096
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:56:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2uv-0006Ee-Mz; Mon, 06 Feb 2023 09:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP2ut-0006E2-NQ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:56:24 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP2us-0005ZP-3a
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:56:23 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 377B020D1E;
 Mon,  6 Feb 2023 14:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675695380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BeWts+k/wNwsN8p/ooYU7FGJQOPazNN6VgtxU0m6Owg=;
 b=V8ot7HzKSV8DF4xC4+PwIufSkgBehKv5PgU5tVTWQc10eJCfIGhihqN1W46nBNHm0Ocnlv
 DQgzXydxu80pbsHMo9Jpok7APv72n3V7CjNrZ/cwPsouoMsRRlN1Whe57aEz/jM9iGtikl
 DSTMr1VQQR9nai8ujZd4sweWBTZWa/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675695380;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BeWts+k/wNwsN8p/ooYU7FGJQOPazNN6VgtxU0m6Owg=;
 b=Abzcaso1B5eH1PjporfgtibqOV5BMJRaycBNIGRKHC/ur+jXnv6sYXbNjXzvRuqY3pP2x6
 gPSB9Y+hrjMH1/CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BBA0C138E8;
 Mon,  6 Feb 2023 14:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yYseIRMV4WNSWgAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:56:19 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 00/10] Kconfig vs. default devices
In-Reply-To: <CAFEAcA9VkFU_bh=aBAOoXCUCeSm1xuR+H+uerd468=vVuDrJEg@mail.gmail.com>
References: <20230206140809.26028-1-farosas@suse.de>
 <CAFEAcA9VkFU_bh=aBAOoXCUCeSm1xuR+H+uerd468=vVuDrJEg@mail.gmail.com>
Date: Mon, 06 Feb 2023 11:56:17 -0300
Message-ID: <87ttzyc06m.fsf@suse.de>
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

> On Mon, 6 Feb 2023 at 14:14, Fabiano Rosas <farosas@suse.de> wrote:
>>
>> We currently have a situation where disabling a Kconfig might result
>> in a runtime error when QEMU selects the corresponding device as a
>> default value for an option. But first a disambiguation:
>>
>> Kconfig default::
>>   a device "Foo" for which there's "config FOO default y" or "config X
>>   imply FOO" in Kconfig.
>>
>> QEMU hardcoded default::
>>   a fallback; a device "Foo" that is chosen in case no corresponding
>>   option is given in the command line.
>>
>> The issue I'm trying to solve is that there is no link between the two
>> "defaults" above, which means that when the user at build time
>> de-selects a Kconfig default, either via configs/devices/*/*.mak or
>> --without-default-devices, the subsequent invocation at runtime might
>> continue to try to create the missing device due to QEMU defaults.
>>
>> Even a experienced user that tweaks the build via .mak files is not
>> required to know about what QEMU developers chose to use as fallbacks
>> in the code. Moreover, the person/entity that builds the code might
>> not be the same that runs it, which makes it even more confusing.
>>
>> We do have -nodefaults in the command line, but that doesn't include
>> all types of fallbacks that might be set in the code. It also does not
>> cover individual CONFIGs and their respective use as a fallback in the
>> code.
>>
>> So my proposal here is actually simple: Let's make sure every fallback
>> device creation *without* a validation check gets a hard dependency in
>> Kconfig. A validation check being something like:
>>
>> if (has_defaults && object_get_class("foo") {
>>    create_foo();
>> }
>
> So we could do one of several things to resolve any particular
> one of these:
>  (1) make the Kconfig force the device to be compiled in
>  (2) make QEMU silently fall back to "don't provide device"
>      rather than "provide this default device" if the
>      device isn't compiled in
>  (3) make QEMU emit an error message saying that the
>      command line implies that the machine should have
>      (default) device X but X support wasn't compiled in
>
> I don't strongly care which approach we take, but shouldn't
> we be consistent about what we do? AFAICT your patch 1
> here takes approach (2) but the others take approach (1).

Good point. The one from patch 1 (isa-parallel) is a bit different since
it is used in the -nodefaults logic, but I could probably use the (1)
approach with it as well, let me give it a try.

