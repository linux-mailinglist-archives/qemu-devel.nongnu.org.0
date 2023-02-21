Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F1769E291
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTql-00016d-Vo; Tue, 21 Feb 2023 09:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUTqj-00016C-EW
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:42:33 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUTqh-0005bY-Bj
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:42:33 -0500
Received: by mail-ed1-x52b.google.com with SMTP id x10so17303751edd.13
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mZY0kaOEgxwMx5+dj+TF1fKmgOXhba1vgpf5uEMKLqA=;
 b=Moj/JWb5/ohZNNJYy+ZP6CTGRQK4U03RltEy/WvdFNfey6L37bnT0zwcF5NnzaYV8d
 xJv57vZEmSxdp41euEMdWLYKJSh5BoiNwhaCuBxJmJVj1SmoOXe9l2i59PJgqoH+3Cvt
 MCoaFridn8yifKaghnMLLrMB8Vqu5LURbaqlDY7P6ulMHBZJlyHqb3XlZVFzzkRSKiLp
 IiUWbUxdGTpL88DH01ihYYSDqth7EnWIe5lntQafTBhzmKikHJzees9pajMpKsUh/cdW
 UNfZM7dRhHayqMNJXZk8U4DFM1Beo0FoVOuNhzKxUqmlptJW4ueVYkOr+lt0UnMIviRU
 K4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mZY0kaOEgxwMx5+dj+TF1fKmgOXhba1vgpf5uEMKLqA=;
 b=aK/zq+7qJNiTy1UfDWIrytJedYazahiQ+uXl3Z+eYDJEHqSROw/PziAJnn7CI1lGZj
 F+eK0PkxBBaAzQhZ7+A38YVh6gJRpqORMiVoVRDXG48Nt6wUc3/Rcm1Kt/OB97hCJASy
 TxMG5Gjj2EaMh+0PA3gAdenJ7YvFEnagFz+JBPueqjjY7QaVzIXGv8/7Tu/C7DhJ552S
 w+eIboHC7voEuy2IYrYYVbCiSZIvGXQDzZqYj42ZSzyFCuV25d5kA4ax95In7UZkQFUH
 BsvoGujwBqY3yCP3iSZzFEuQwlkt9MC1sYQBFzWEg3pfNk8i75xB7DJbQ16iWbQ9u8VG
 Q3YQ==
X-Gm-Message-State: AO0yUKUNFjBlQ0+nxx3raWMXz2MJHlIdqtBOYuFex8O07oybK/HT4Io9
 999seQVdTQZZuMj3/RvNgRdxcf188vGwpGOX
X-Google-Smtp-Source: AK7set88MtXUOqC/XrK5Ll5qaQdBDcAOJCMUjFCUhdIgqOB525tSP/+GPMwMf8OI1deJMqENJ+mpKQ==
X-Received: by 2002:a05:600c:1e0e:b0:3da:b40f:7a55 with SMTP id
 ay14-20020a05600c1e0e00b003dab40f7a55mr4788821wmb.6.1676990219935; 
 Tue, 21 Feb 2023 06:36:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t23-20020a05600c2f9700b003dc521f336esm4274004wmn.14.2023.02.21.06.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 06:36:59 -0800 (PST)
Message-ID: <601701c5-4cc7-27cd-5ad2-7ed2f81ea19d@linaro.org>
Date: Tue, 21 Feb 2023 15:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] tests: Disable migration-test
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
 <46f7c446-fe44-b703-ba40-0e9e0c16920f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <46f7c446-fe44-b703-ba40-0e9e0c16920f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 21/2/23 15:27, Thomas Huth wrote:
> On 21/02/2023 14.27, Peter Maydell wrote:
>> The migration-test is annoyingly flaky. Examples:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
>> (a FreeBSD job)
>>    32/648 
>> ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
>>
>> on a local macos x86 box:
>> ▶  34/621 
>> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_
>> str_equal(status, "failed")) ERROR
>>   34/621 qemu:qtest+qtest-i386 / 
>> qtest-i386/migration-test                         ERROR          
>> 168.12s   killed by signal 6 SIGABRT
>> ――――――――――――――――――――――――――――――――――――― ✀  
>> ―――――――――――――――――――――――――――――――――――――
>> stderr:
>> qemu-system-i386: Failed to peek at channel
>> query-migrate shows failed migration: Unable to write to socket: 
>> Broken pipe
>> **
>> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
>>
>> (test program exited with status code -6)
>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>
>> ▶  37/621 
>> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed")) ERROR
>>   37/621 qemu:qtest+qtest-x86_64 / 
>> qtest-x86_64/migration-test                     ERROR          
>> 174.37s   killed by signal 6 SIGABRT
>> ――――――――――――――――――――――――――――――――――――― ✀  
>> ―――――――――――――――――――――――――――――――――――――
>> stderr:
>> query-migrate shows failed migration: Unable to write to socket: 
>> Broken pipe
>> **
>> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
>>
>> (test program exited with status code -6)
>> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>>
>> I've seen this on other CI jobs as well, but Gitlab's UI makes it
>> pretty much impossible to re-find failed jobs, since you can't
>> search for them by failure reason at all.
>>
>> I've also seen this fail on the OpenBSD vm build.
>>
>> I've seen the migration-test hang on the s390 private CI runner
>> in such a way that even though the CI job has timed out, the
>> stale QEMU and migration-test processes are still lying around on
>> the host.
>>
>> I've complained about these before, but nobody has either investigated
>> or suggested improvements to the test program that would let us gather
>> more information about what's happening when these fail.
>>   
>> https://lore.kernel.org/qemu-devel/CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com/
>>
>> So this is the big hammer: disable the test entirely, so that we
>> don't keep getting CI job intermittent failures because of it.
>> When somebody has time to investigate, we can fix the underlying
>> cause and reenable the job.

This isn't a negative patch. Flaky tests happen, and if it is hard
to fix them, disabling them is saner than loosing trust in the CI
and the rest of the tests.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> This is an "if you don't want this, propose something else" patch :-)
> 
> I'm also regularly running into issues with this test, so from my side:
> 
> Acked-by: Thomas Huth <thuth@redhat.com>




