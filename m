Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B636AC067
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:09:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAZg-0001I7-MR; Mon, 06 Mar 2023 08:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAZe-0001Ht-FZ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:08:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAZc-0002CK-Go
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678108095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5aKunOlzZWpGlIbPgC+zx0VAyeNlJUgrpFXn7RsJlzs=;
 b=Fy/VZwPb85JtH3toTPBCcx4JDQ4VnC8JOGvx2Zm54DFynR/pku/89B6I/kZr8XqDEelboL
 7drOUCwSKuFO8qs4K+ulZrqSS60rpzKxSfe+FTGqBZukaSR3LdhcPk2hdyjC9rqKzFsZfg
 u+rYS5DRx3benfEopkj6br2CNhaNQM8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-Adx4mXzaMvC83Ao7wBPiww-1; Mon, 06 Mar 2023 08:08:14 -0500
X-MC-Unique: Adx4mXzaMvC83Ao7wBPiww-1
Received: by mail-wm1-f72.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so3555002wmk.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678108093;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5aKunOlzZWpGlIbPgC+zx0VAyeNlJUgrpFXn7RsJlzs=;
 b=b2JzfdyDycmjbTFnm9I+vi0zQIAi/+FcEXHMQYc9O7jvDlwJCOcl+GGoLpafVMMScL
 tO6RzjgjlfEr6KvCBPPdHHSG9l7vMx7Ejohzd8QZoD54ovo5XlY1ZlaBe52778uFFFtJ
 WT9ewSeWBfA7xQQRz7bk+X7rnptJTYhLBS0+qLlXvwigV6BnHmVh2utpUzhzUkLBpLb6
 ukUoM3wfzQpJ8nVkM1jtcpp0Ji2oGNAgZaiWKt4pEBgVYRJUzfYwNapHZKjel3b6W5Q7
 vFq8AgaWAKoWe0Ua3iS4EXyRISA5bU4IVzkJlJpQ5nU5z/dV+zk06eCjDrP91YWG7+8j
 CxNg==
X-Gm-Message-State: AO0yUKUvQqRyoI1Zb3tpL5g5eRqzJpCWDzC5yW3SITrihg0dFHyVyV7w
 C+xYFWfPkfciQdqUg/EptRdHaJq7TpFp819bYrWxCcbMxqN5ZK+G96noqVCzACZiP7muvGJSE47
 UxbLLVkCF7Da97Go=
X-Received: by 2002:adf:dc89:0:b0:2c7:1d0d:7183 with SMTP id
 r9-20020adfdc89000000b002c71d0d7183mr6458895wrj.9.1678108092995; 
 Mon, 06 Mar 2023 05:08:12 -0800 (PST)
X-Google-Smtp-Source: AK7set8uRmSvou8A/7610wLnOXNpQQV7tWQZ1zwMWHGSIaO9qAXCU2cQRZ1DSDtnG5mJjvv0TWKEVA==
X-Received: by 2002:adf:dc89:0:b0:2c7:1d0d:7183 with SMTP id
 r9-20020adfdc89000000b002c71d0d7183mr6458880wrj.9.1678108092692; 
 Mon, 06 Mar 2023 05:08:12 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de.
 [109.43.177.59]) by smtp.gmail.com with ESMTPSA id
 z5-20020a5d4c85000000b002c71703876bsm9514347wrs.14.2023.03.06.05.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:08:12 -0800 (PST)
Message-ID: <53ca67e4-fb2f-17ac-2087-9faa7aba5187@redhat.com>
Date: Mon, 6 Mar 2023 14:08:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/migration-test: Disable
 migration/multifd/tcp/plain/cancel
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, quintela@redhat.com
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230302172211.4146376-1-peter.maydell@linaro.org>
 <ZADeLNaltLAZ9BU8@redhat.com> <87edq6i4jf.fsf@secure.mitica>
 <CAFEAcA8aKkFse_nfoKSPA--QdQnB1xVZyMQoQWfqpf4yyxtzDA@mail.gmail.com>
 <188bd1ff-4ea2-6d92-2b6e-6f19af3df232@redhat.com>
 <CAFEAcA-U568vrLKHegfKQWu1RfUCRjdOKZQMoFXSde1yk4V3Wg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-U568vrLKHegfKQWu1RfUCRjdOKZQMoFXSde1yk4V3Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 03/03/2023 13.05, Peter Maydell wrote:
> On Fri, 3 Mar 2023 at 11:29, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 03/03/2023 12.18, Peter Maydell wrote:
>>> On Fri, 3 Mar 2023 at 09:10, Juan Quintela <quintela@redhat.com> wrote:
>>>>
>>>> Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>> On Thu, Mar 02, 2023 at 05:22:11PM +0000, Peter Maydell wrote:
>>>>>> migration-test has been flaky for a long time, both in CI and
>>>>>> otherwise:
>>>>>>
>>>>>> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
>>>>>> (a FreeBSD job)
>>>>>>     32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
>>>>>>
>>>>>> on a local macos x86 box:
>>>
>>>
>>>
>>>> What is really weird with this failure is that:
>>>> - it only happens on non-x86
>>>
>>> No, I have seen it on x86 macos, and x86 OpenBSD
>>>
>>>> - on code that is not arch dependent
>>>> - on cancel, what we really do there is close fd's for the multifd
>>>>     channel threads to get out of the recv, i.e. again, nothing that
>>>>     should be arch dependent.
>>>
>>> I'm pretty sure that it tends to happen when the machine that's
>>> running the test is heavily loaded. You probably have a race condition.
>>
>> I think I can second that. IIRC I've seen it a couple of times on my x86
>> laptop when running "make check -j$(nproc) SPEED=slow" here.
> 
> And another on-x86 failure case, just now, on the FreeBSD x86 CI job:
> https://gitlab.com/qemu-project/qemu/-/jobs/3870165180

And FWIW, I just saw this while doing "make vm-build-netbsd J=4":

▶  31/645 ERROR:../src/tests/qtest/migration-test.c:1841:test_migrate_auto_converge: 'got_stop' should be FALSE ERROR
  31/645 qemu:qtest+qtest-i386 / qtest-i386/migration-test                                  ERROR          25.21s   killed by signal 6 SIGABRT
>>> QTEST_QEMU_BINARY=./qemu-system-i386 MALLOC_PERTURB_=35 G_TEST_DBUS_DAEMON=/home/qemu/qemu-test.fYHKFz/src/tests/dbus-vmstate-daemon.sh QTEST_QEMU_IMG=./qemu-img /home/qemu/qemu-test.fYHKFz/build/tests/qtest/migration-test --tap -k
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
qemu: thread naming not supported on this host
**
ERROR:../src/tests/qtest/migration-test.c:1841:test_migrate_auto_converge: 'got_stop' should be FALSE

(test program exited with status code -6)

  Thomas


