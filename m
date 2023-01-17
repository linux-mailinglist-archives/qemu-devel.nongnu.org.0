Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441CC66E68B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 20:05:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHrFy-0003lK-20; Tue, 17 Jan 2023 14:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pHrFt-0003im-Ja; Tue, 17 Jan 2023 14:04:21 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pHrFr-0003yP-K8; Tue, 17 Jan 2023 14:04:20 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1A80322208;
 Tue, 17 Jan 2023 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673982258; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=igX/hAWhdeyLVUd1sjjff06FwLtEbMuD3RohQNs4foI=;
 b=h+zuAi8tveo1IXTAscMa97oEUrWEXz3h4K11huy211s5cvVZn9Jx5E6kMHXPj0X+xTV8Wc
 VEEV9r5kInhykWW5cHjyq9759zY95K59rJI4lIa/ErwtZLSl3vOjd8Aze++8/tHi0pcnK7
 kLHWntoMT6bVzgsxH59ugIITvidHvJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673982258;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=igX/hAWhdeyLVUd1sjjff06FwLtEbMuD3RohQNs4foI=;
 b=ul2F2JydHyQcTKqxTlJZL6Z8FCU7IO/vc+nC7R9nmdkxZw5/0ctUN94ap6KLli6mJjjgJZ
 l7M+6+kdq/okDyBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E59D1390C;
 Tue, 17 Jan 2023 19:04:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8dAUGjHxxmOZOwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 17 Jan 2023 19:04:17 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
In-Reply-To: <87ilh58c5p.fsf@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de> <87ilh58c5p.fsf@redhat.com>
Date: Tue, 17 Jan 2023 16:04:15 -0300
Message-ID: <878ri10yq8.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
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

Cornelia Huck <cohuck@redhat.com> writes:

> On Fri, Jan 13 2023, Fabiano Rosas <farosas@suse.de> wrote:
>
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>  tests/qtest/arm-cpu-features.c | 24 ++++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>>
>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
>> index 4be1415823..9a052e41fc 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -217,6 +217,15 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
>>      qobject_unref(resp);
>>  }
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
>>  static uint64_t resp_get_sve_vls(QDict *resp)
>>  {
>>      QDict *props;
>> @@ -338,6 +347,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
>>  {
>>      QTestState *qts;
>>  
>> +    if (tcg_disabled()) {
>> +        g_test_skip("TCG support disabled in this build");
>> +        return;
>> +    }
>> +
>>      qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
>>  
>>      assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
>> @@ -373,6 +387,11 @@ static void sve_tests_sve_off(const void *data)
>>  {
>>      QTestState *qts;
>>  
>> +    if (tcg_disabled()) {
>> +        g_test_skip("TCG support is disabled in this build");
>> +        return;
>> +    }
>> +
>>      qts = qtest_init(MACHINE "-cpu max,sve=off");
>>  
>>      /* SVE is off, so the map should be empty. */
>
> I'm wondering whether the invocation of tcg and kvm test cases should be
> reorganized a bit. Currently, we have test cases that use MACHINE (tcg),
> and test cases that use MACHINE_KVM (kvm with a fallback to
> tcg). MACHINE_KVM is used either for aarch64 && kvm
> (test_query_cpu_model_expansion_kvm, which tests behaviour specific to
> kvm), or for aarch64 (sve_tests_sve_off_kvm, which tests behaviour that
> is the same for both kvm and tcg, and therefore tests tcg twice if kvm
> is not available.)
>
> So, should we
> - drop "-accel tcg" from MACHINE_KVM,
> - call sve_tests_sve_off_kvm only if kvm is available, and
> - call the functions you skip here conditionally on tcg being available
>   instead? (not sure whether not calling should be preferred to skipping
>   in general)

I did the last two already for the next version. Good point on dropping
"-accel tcg", I'll do that as well.

