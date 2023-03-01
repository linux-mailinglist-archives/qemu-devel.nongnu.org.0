Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C76B6A6D4D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:44:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXMjy-0000GM-7V; Wed, 01 Mar 2023 08:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pXMjv-0000Fo-EQ; Wed, 01 Mar 2023 08:43:27 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pXMjt-00005D-LW; Wed, 01 Mar 2023 08:43:27 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D8FE41FE14;
 Wed,  1 Mar 2023 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677678203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q2cQhrtzPh68xvCEtMo+2lOAGLfGo7T8/hYfaExXG0k=;
 b=QBV5dztPy0+2isxcwS5XREIsEdOEdxDQWacC4fwaM96kp27xJm3cbfN0lNb5UtcncrTr5f
 DQC8SdHqA2YiALAIwhLp9E1aglM7pgO6VssF7MIQISR5Z3cqxvHdACTYevQ1tmNZ8OlGKx
 nWjnX0F0hli54QjOVM4TRoWiyYe/5f4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677678203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q2cQhrtzPh68xvCEtMo+2lOAGLfGo7T8/hYfaExXG0k=;
 b=/zkKMxWqq3MwMzquArMUNVroZWYdGOs1oBamfcL/j6/WasA+YH/DDOx8Lyi444tVdYeyGO
 VbWiuIESfKRGBzCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C34B13A3E;
 Wed,  1 Mar 2023 13:43:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 31f/CXtW/2NoHgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 01 Mar 2023 13:43:23 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>, Laurent
 Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
In-Reply-To: <87v8jkk37n.fsf@suse.de>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de>
 <11be1f6c-2fc3-f6cd-bbf6-c6bdd790dec8@redhat.com> <87v8jkk37n.fsf@suse.de>
Date: Wed, 01 Mar 2023 10:43:20 -0300
Message-ID: <87o7pck2o7.fsf@suse.de>
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

Fabiano Rosas <farosas@suse.de> writes:

> Thomas Huth <thuth@redhat.com> writes:
>
>> On 28/02/2023 20.26, Fabiano Rosas wrote:
>>> It is possible to have a build with both TCG and KVM disabled due to
>>> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
>>> host.
>>> 
>>> If we build with --disable-tcg on the aarch64 host, we will end-up
>>> with a QEMU binary (x86) that does not support TCG nor KVM.
>>> 
>>> Fix tests that crash or hang in the above scenario. Do not include any
>>> test cases if TCG and KVM are missing.
>>> 
>>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>>> ---
>> ...
>>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
>>> index 3aef3a97a9..45490f5931 100644
>>> --- a/tests/qtest/boot-serial-test.c
>>> +++ b/tests/qtest/boot-serial-test.c
>>> @@ -17,6 +17,9 @@
>>>   #include "libqtest.h"
>>>   #include "libqos/libqos-spapr.h"
>>>   
>>> +static bool has_tcg;
>>> +static bool has_kvm;
>>
>> Any special reason for putting these here instead of making them local 
>> variables in the main() function?
>>
>
> Yes, Phillipe was doing work in the same file and I put it here to
> minimize conflicts.
>
> https://lore.kernel.org/r/20230119145838.41835-5-philmd@linaro.org
>
>>>   static const uint8_t bios_avr[] = {
>>>       0x88, 0xe0,             /* ldi r24, 0x08   */
>>>       0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
>>> @@ -285,6 +288,13 @@ int main(int argc, char *argv[])
>>>       const char *arch = qtest_get_arch();
>>>       int i;
>>>   
>>> +    has_tcg = qtest_has_accel("tcg");
>>> +    has_kvm = qtest_has_accel("kvm");
>>> +
>>> +    if (!has_tcg && !has_kvm) {
>>> +        return 0;
>>> +    }
>>> +
>>>       g_test_init(&argc, &argv, NULL);
>>
>> Could you please put the new code below the g_test_init() ?
>> Just to avoid the problem that has been reported here:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg08331.html
>>
>
> I could, but I don't understand why we need this. What does having
> "code" before g_test_init() causes? Should I move the qtest_get_arch()
> that's already there as well?

Oh, the issue is the early return? I guess it makes sense.

