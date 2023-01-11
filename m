Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BC0665B93
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 13:37:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFaLg-00084Y-4x; Wed, 11 Jan 2023 07:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFaLb-000842-V0; Wed, 11 Jan 2023 07:36:51 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pFaLZ-0002Ea-Oe; Wed, 11 Jan 2023 07:36:51 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DBA527593F;
 Wed, 11 Jan 2023 12:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673440606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o7+hc/DFjslwrESw5agfyTFCIkxacbwjNjx4lyXZbpM=;
 b=rMURa6f+YYpM4kpj0XrLxuFq2uYH4JtmcZDiKC+61MNZMYh16QePKUM+lG7rKMXlCI7aMS
 H0Cwo7NgoyXsye+AB7tOVM50DaOduMP7qDkD2swPUBO2z49NFY2rCMZ9iuuaY4EWGjsYoE
 G0/7w9+r6VbktnA3fQNZ78Kw1TKJ0dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673440606;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o7+hc/DFjslwrESw5agfyTFCIkxacbwjNjx4lyXZbpM=;
 b=DJkV+XDhpUkb6QoJ/td1s/muOmB4QV09Tbfta3NlF/4fhli+Vl4CQdhTqLyW3dxn+Kt+WW
 x5TIa6BcpYIeP7Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 66DB313591;
 Wed, 11 Jan 2023 12:36:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Gj3QC16tvmN3TgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 11 Jan 2023 12:36:46 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Claudio Fontana <cfontana@suse.de>, Peter Maydell
 <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard
 Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Laurent
 Vivier <lvivier@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
In-Reply-To: <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de>
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
 <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
 <9fb63a5d-d839-016d-b0a8-4151b6d6946c@suse.de>
Date: Wed, 11 Jan 2023 09:36:43 -0300
Message-ID: <87fschcko4.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Claudio Fontana <cfontana@suse.de> writes:

> On 1/10/23 15:02, Peter Maydell wrote:
>> On Tue, 10 Jan 2023 at 13:36, Fabiano Rosas <farosas@suse.de> wrote:
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>
>>>> On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
>>>>>
>>>>> Thomas Huth <thuth@redhat.com> writes:
>>>>>
>>>>>> On 09/01/2023 23.42, Fabiano Rosas wrote:
>>>>>>> From: Claudio Fontana <cfontana@suse.de>
>>>>>>>
>>>>>>> on ARM we currently list and build all machines, even when
>>>>>>> building KVM-only, without TCG.
>>>>>>>
>>>>>>> Until we fix this (and we only list and build machines that are
>>>>>>> compatible with KVM), only test specifically using the "virt"
>>>>>>> machine in this case.
>>>>>>
>>>>>> Why don't you fix it immediately? ...
>>>>>
>>>>> My idea was to have in this series the minimum to unbreak the
>>>>> --disable-tcg build and later bring the rest of the changes
>>>>> incrementally.
>>>>
>>>> This test is basically checking "all the machines should
>>>> work". That's an important invariant to maintain, so
>>>> I don't think we should just skip it for Arm targets.
>>>
>>> But what does "all machines" mean in a no-TCG build? The original intent
>>> of the patch was that only 'virt' should be present and therefore the
>>> only one tested.
>> 
>> It means "every machine the user can create". If the
>> machine can't run then either we shouldn't compile it
>> in, or else we should be compiling in enough extra stuff
>> to allow it to work.
>> 
>> -- PMM
>
> Hi,
>
> once upon a time there was a series by Philippe to accomplish that (KConfig) right?

Is this it?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777719.html

I have now moved the cpus into the tcg directory:

# ./qemu-system-aarch64 -cpu ? 
Available CPUs:
  a64fx
  cortex-a35
  cortex-a53
  cortex-a55
  cortex-a57
  cortex-a72
  cortex-a76
  host
  max
  neoverse-n1

What remains is changing the Kconfig to not bring all the
machines. Nowadays for KVM is the 'virt' machine the only one we use? I
did some tests yesterday by keeping only CONFIG_ARM_VIRT and was left
with this:

# ./qemu-system-aarch64 -machine ? 
Supported machines are:
none                 empty machine
virt-2.10            QEMU 2.10 ARM Virtual Machine
virt-2.11            QEMU 2.11 ARM Virtual Machine
virt-2.12            QEMU 2.12 ARM Virtual Machine
virt-2.6             QEMU 2.6 ARM Virtual Machine
virt-2.7             QEMU 2.7 ARM Virtual Machine
virt-2.8             QEMU 2.8 ARM Virtual Machine
virt-2.9             QEMU 2.9 ARM Virtual Machine
virt-3.0             QEMU 3.0 ARM Virtual Machine
virt-3.1             QEMU 3.1 ARM Virtual Machine
virt-4.0             QEMU 4.0 ARM Virtual Machine
virt-4.1             QEMU 4.1 ARM Virtual Machine
virt-4.2             QEMU 4.2 ARM Virtual Machine
virt-5.0             QEMU 5.0 ARM Virtual Machine
virt-5.1             QEMU 5.1 ARM Virtual Machine
virt-5.2             QEMU 5.2 ARM Virtual Machine
virt-6.0             QEMU 6.0 ARM Virtual Machine
virt-6.1             QEMU 6.1 ARM Virtual Machine
virt-6.2             QEMU 6.2 ARM Virtual Machine
virt-7.0             QEMU 7.0 ARM Virtual Machine
virt-7.1             QEMU 7.1 ARM Virtual Machine
virt-7.2             QEMU 7.2 ARM Virtual Machine
virt                 QEMU 8.0 ARM Virtual Machine (alias of virt-8.0)
virt-8.0             QEMU 8.0 ARM Virtual Machine
x-remote             Experimental remote machine

But qtest dislikes that even more. I need to figure out why.

The approach of that series seems interesting, moving CONFIG_FOO=y from
default.mak into Kconfig as 'default y if TCG'. Maybe that will yield
better results, I'll try to follow that route.

