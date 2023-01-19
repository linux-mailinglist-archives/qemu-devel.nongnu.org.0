Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E51673C95
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 15:43:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIW4V-0002Ai-P2; Thu, 19 Jan 2023 09:39:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIW4T-00028c-5j; Thu, 19 Jan 2023 09:39:17 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pIW4R-0007lM-Hx; Thu, 19 Jan 2023 09:39:16 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 510C821E4F;
 Thu, 19 Jan 2023 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674139153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1GIvdkOTXlKxnBEquwvZZPXfR47HKfI3DYtRrAbRCYM=;
 b=F9367bnDVeSOcwzNOEyd6I4pZuhVHRlnf5SCvmQEAjWIYUOWC1HH3YTw1NmnUh/KvOu4gF
 8TYbIOSkx50D2fE7ODRnR7/l5LHR96x8+rzXy017/M+51Zrj5XDVqF2LaXyeOm9wWr9AIl
 iVBOqPNrv51vLZTEeAcFvt8YiBZx3G0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674139153;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1GIvdkOTXlKxnBEquwvZZPXfR47HKfI3DYtRrAbRCYM=;
 b=sszIGyUmZUwgrmWPA+mzBTQyMqwU6KrhDqSGH93qMwyUkR17HyF89FDUHtZX2TJitna3rn
 ihEgUsG1BMhPmuCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3B27139ED;
 Thu, 19 Jan 2023 14:39:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vQUBJxBWyWOKLAAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 19 Jan 2023 14:39:12 +0000
From: Fabiano Rosas <farosas@suse.de>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn?=
 =?utf-8?Q?=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v4 08/15] tests/qtest: Adjust test-hmp to always
 pass -cpu option
In-Reply-To: <Y8lOeRqfcAUljaJN@work-vm>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-9-farosas@suse.de> <Y8lOeRqfcAUljaJN@work-vm>
Date: Thu, 19 Jan 2023 11:39:10 -0300
Message-ID: <874jsm1tdd.fsf@suse.de>
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

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Fabiano Rosas (farosas@suse.de) wrote:
>> Signed-off-by: Fabiano Rosas <farosas@suse.de>
>> ---
>>  tests/qtest/test-hmp.c | 34 +++++++++++++++++++++++++++++++---
>>  1 file changed, 31 insertions(+), 3 deletions(-)
>> 
>> diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
>> index f8b22abe4c..c367612d4a 100644
>> --- a/tests/qtest/test-hmp.c
>> +++ b/tests/qtest/test-hmp.c
>> @@ -121,21 +121,49 @@ static void test_info_commands(QTestState *qts)
>>      g_free(info_buf);
>>  }
>>  
>> +static const char *arch_get_cpu(const char *machine)
>> +{
>> +    const char *arch = qtest_get_arch();
>> +
>> +    if (g_str_equal(arch, "aarch64")) {
>> +        if (!strncmp(machine, "virt", 4)) {
>> +            return "cortex-a57";
>
> Won't that break on a kvm host on a different CPU?
> Would -cpu max   work on everything?

These tests run with -accel qtest only. No TCG or KVM. So this won't
break a KVM host with a different CPU. But we also cannot expect that
cpu to do anything useful. This is more to avoid initial configuration
code to break due to lack of cpu.

About -cpu max, before this series, it works because of a nuance of the
code which does:

aarch64_max_initfn:
if kvm || hvf
    host
else
    cortex-a57
    extra_features that depend on TCG

After this series this becomes roughly (see patch 01):

aarch64_max_initfn:
if kvm || hvf
    host
else if qtest
    cortex-a57
#ifdef CONFIG_TCG    
else if tcg
    cortex-a57
    extra_features that depend on TCG
#endif

The above routine causes us to have two different -cpu max depending on
whether TCG is built in or not, so I'm basically bypassing it and
hardcoding cortex-a57 to be consistent.

