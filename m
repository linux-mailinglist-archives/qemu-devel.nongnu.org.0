Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E2669BE2
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:24:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGLnN-0006Vi-Ee; Fri, 13 Jan 2023 10:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGLnG-0006Sz-CU; Fri, 13 Jan 2023 10:16:34 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGLnE-00082S-P7; Fri, 13 Jan 2023 10:16:34 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 69159377DB;
 Fri, 13 Jan 2023 15:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673622989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m0OHjKgIMktckgF3OHq8dy1ejkySu3Cxj6wan8Tsm1g=;
 b=T+NLasW/0S9smKBxw5bFRYgovTvG6zhTot6rJHkDSd2aubyPZ4qH5YXGvxPie+aXgrVweP
 jyosZbnELxAr2EZQ4OCS4TPY+fEvmGOVUzPFYufl2LQSmKwKCrD9GOuWJyS8jD727MHiCf
 nUp/m2kyXse6xGlDiCp6cMn27a6ogqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673622989;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m0OHjKgIMktckgF3OHq8dy1ejkySu3Cxj6wan8Tsm1g=;
 b=2D2U/7HQ/Cx2AsS9hRxRfsAgPCjAnrrN+bcM7pP93HgooQzy6u3JjfAdWP7s1liviCRqww
 r+ydWsV13LbKO+AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E092413913;
 Fri, 13 Jan 2023 15:16:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 99nHKMx1wWMqMwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 15:16:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
In-Reply-To: <81895ce0-ce46-bdff-9865-0721dd4accf1@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de>
 <81895ce0-ce46-bdff-9865-0721dd4accf1@redhat.com>
Date: Fri, 13 Jan 2023 12:16:26 -0300
Message-ID: <878ri6ihx1.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
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

Thomas Huth <thuth@redhat.com> writes:

> On 13/01/2023 15.04, Fabiano Rosas wrote:
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>   tests/qtest/arm-cpu-features.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>> 
>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
>> index 4be1415823..9a052e41fc 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -217,6 +217,15 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
>>       qobject_unref(resp);
>>   }
>>   
>> +static bool tcg_disabled(void)
>> +{
>> +#ifndef CONFIG_TCG
>> +    return true;
>> +#else
>> +    return false;
>> +#endif
>> +}
>> +
>>   static uint64_t resp_get_sve_vls(QDict *resp)
>>   {
>>       QDict *props;
>> @@ -338,6 +347,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
>>   {
>>       QTestState *qts;
>>   
>> +    if (tcg_disabled()) {
>> +        g_test_skip("TCG support disabled in this build");
>> +        return;
>> +    }
>
> Could you please use qtest_has_accel("tcg") instead? ... that's what we use 
> in other spots in the qtests for checking for valid accelerators already.

Ah, that's much better, thanks!

