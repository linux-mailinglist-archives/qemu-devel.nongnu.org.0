Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6559674276
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:13:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIaKw-00044W-HZ; Thu, 19 Jan 2023 14:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIaKq-00043w-CS; Thu, 19 Jan 2023 14:12:29 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIaKo-0004pg-L1; Thu, 19 Jan 2023 14:12:27 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 00E6C5D20C;
 Thu, 19 Jan 2023 19:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674155545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jHtAAPV03RmdslZrHKe+0O60obGhvacDcX0ABERk9Es=;
 b=Z7ebFUH1IBJFEZaYF/buHWF8vpUI6yAKOW3dTh2AmiLSLtVhH55i3taeXmGFDurFhOYq9E
 uRPPSWBIVZpQYQ6Iu33+3SLuvTnyhowJKZcUKsfo0REmuXrf7i36hnelSb97JdhBiCXcmy
 bsb+Ib4waX8WQIQ6cnSGgoR4TwcjyPg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674155545;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jHtAAPV03RmdslZrHKe+0O60obGhvacDcX0ABERk9Es=;
 b=CZlm1H/XrsAsLOPS6ll+MtizsgEadZRX9hsaEey7UvwiifW6o9iHjjFLXXO4+r2X9B1s2r
 udXsw+YLYdFGhcDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8185F139ED;
 Thu, 19 Jan 2023 19:12:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7rjLEhiWyWP/NwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 19:12:24 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v4 07/15] tests/qtest: Adjust qom-test to always set
 a -cpu option
In-Reply-To: <f014a262-1bb3-c08d-c0f0-ed3be8167789@linaro.org>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-8-farosas@suse.de>
 <f014a262-1bb3-c08d-c0f0-ed3be8167789@linaro.org>
Date: Thu, 19 Jan 2023 16:12:22 -0300
Message-ID: <87k01i49ux.fsf@suse.de>
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

Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/19/23 03:54, Fabiano Rosas wrote:
>> Start using the qtest_get_machine_args function, which explicitly
>> sets the -cpu option according to the machine default.
>> 
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/qtest/qom-test.c | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>> 
>> diff --git a/tests/qtest/qom-test.c b/tests/qtest/qom-test.c
>> index d380261f8f..462e3c4281 100644
>> --- a/tests/qtest/qom-test.c
>> +++ b/tests/qtest/qom-test.c
>> @@ -78,14 +78,28 @@ static void test_properties(QTestState *qts, const char *path, bool recurse)
>>       qobject_unref(response);
>>   }
>>   
>> +static const char *arch_get_cpu(const char *machine)
>> +{
>> +    const char *arch = qtest_get_arch();
>> +
>> +    if (g_str_equal(arch, "aarch64")) {
>> +        if (!strncmp(machine, "virt", 4)) {
>> +            return "cortex-a57";
>
> I'm not keen on hard-coding cortex-a57 instead of max, even if they happen to evaluate to 
> mostly the same thing currently for -accel qtest.

Ok.

> Nor am I keen on replicating this N times across N qtest files.
> Better perhaps in libqtest.c, or something?
> Or even directly in qtest_get_machine_args()?

Ah right, this was a callback in a previous version so there was no
"cpu" parameter to qtest_get_machine_args. Now I could indeed move
arch_get_cpu into libqtest.c somewhere.


