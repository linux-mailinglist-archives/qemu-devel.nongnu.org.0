Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC269E249
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:29:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTcW-0003Ic-FW; Tue, 21 Feb 2023 09:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUTcR-0003Gt-Rp
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:27:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUTcO-0001pu-Un
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:27:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676989663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ttw71sZ1JAXb2K/z6278I846bs3eb+7IQ1wdHzLcA+A=;
 b=TZWZdBjtUTl6QL+46zwkmjXvITPJs0VWf35CIwi++igkDyTvT1aN3NHDBgdRLV2lTgTl8A
 +Dgeanl2WQWs2oaztKTReDhC6r2pYK6qbePcZJs2ni6Vp77qKmudcM6ebobaSjmciiWrKR
 SrG14fN/Sbpe7VQ/HV3tCsXmQ/Os8go=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-312-zqaDkV3JMXmQfP2RS2LS8g-1; Tue, 21 Feb 2023 09:27:41 -0500
X-MC-Unique: zqaDkV3JMXmQfP2RS2LS8g-1
Received: by mail-wr1-f69.google.com with SMTP id
 z6-20020a5d4c86000000b002c54ce46094so1041949wrs.17
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:27:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ttw71sZ1JAXb2K/z6278I846bs3eb+7IQ1wdHzLcA+A=;
 b=J10sHrJendMYOIp34jTmMLx1bxs1mkCLitSHOYRt5IO577eRSRRZzvAFORBYbx/NBT
 UwgSppPjcuoU25ws1fPFv9quYl7dA4BwNMGbCmNBrvGrzkuNtyKyAthD4nP50ui0e/g1
 QjGZ45zFdk3dYMkTS8lcZqmJgjJkTphBjkDRUZvAOxCFjRe0CIUCFX+IsNKzYdqcw/JY
 wBej0JP9o7Ar5z/6Cy/RrOaWIqktmkJA6TJnD9pvVaq7PQxn8STi+GFWqHSaUpk0Zzt3
 Fr67/ELSU5qfd0iHy68QfbUNMQrt8cZdLGXOlYQ+Yw2p7AyiWnDbWPg/8kG3KIrR6WVn
 BswQ==
X-Gm-Message-State: AO0yUKVhXytPBlERBR24qAnH9DQhaeXUIn2TRYMdz+jAL1lfTu76cfTe
 YVoAMryMa0Mcu1CL0csEOb3LFSbaVQCETGd/X54TI1f118Jhue8rkB8uajke1936iEuKXvyvwm+
 opoaKIcZv7woq5gQ=
X-Received: by 2002:a05:6000:1f10:b0:2c5:54a7:3647 with SMTP id
 bv16-20020a0560001f1000b002c554a73647mr2263067wrb.19.1676989660811; 
 Tue, 21 Feb 2023 06:27:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+KQ4HWV8KHEFvy4oQAwr++FJa5uzeS1ugDBqYijK5H3kCEsf2ukuaOyWNqzBPpZlAAH87KmQ==
X-Received: by 2002:a05:6000:1f10:b0:2c5:54a7:3647 with SMTP id
 bv16-20020a0560001f1000b002c554a73647mr2263058wrb.19.1676989660513; 
 Tue, 21 Feb 2023 06:27:40 -0800 (PST)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a5d4c88000000b002c5598c14acsm5765463wrs.6.2023.02.21.06.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 06:27:38 -0800 (PST)
Message-ID: <46f7c446-fe44-b703-ba40-0e9e0c16920f@redhat.com>
Date: Tue, 21 Feb 2023 15:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests: Disable migration-test
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230221132726.2892383-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 21/02/2023 14.27, Peter Maydell wrote:
> The migration-test is annoyingly flaky. Examples:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3806090216
> (a FreeBSD job)
>    32/648 ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status: assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT) ERROR
> 
> on a local macos x86 box:
> ▶  34/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_
> str_equal(status, "failed")) ERROR
>   34/621 qemu:qtest+qtest-i386 / qtest-i386/migration-test                         ERROR          168.12s   killed by signal 6 SIGABRT
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> qemu-system-i386: Failed to peek at channel
> query-migrate shows failed migration: Unable to write to socket: Broken pipe
> **
> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
> 
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> ▶  37/621 ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed")) ERROR
>   37/621 qemu:qtest+qtest-x86_64 / qtest-x86_64/migration-test                     ERROR          174.37s   killed by signal 6 SIGABRT
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> query-migrate shows failed migration: Unable to write to socket: Broken pipe
> **
> ERROR:../../tests/qtest/migration-helpers.c:151:migrate_query_not_failed: assertion failed: (!g_str_equal(status, "failed"))
> 
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> I've seen this on other CI jobs as well, but Gitlab's UI makes it
> pretty much impossible to re-find failed jobs, since you can't
> search for them by failure reason at all.
> 
> I've also seen this fail on the OpenBSD vm build.
> 
> I've seen the migration-test hang on the s390 private CI runner
> in such a way that even though the CI job has timed out, the
> stale QEMU and migration-test processes are still lying around on
> the host.
> 
> I've complained about these before, but nobody has either investigated
> or suggested improvements to the test program that would let us gather
> more information about what's happening when these fail.
>   https://lore.kernel.org/qemu-devel/CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com/
> 
> So this is the big hammer: disable the test entirely, so that we
> don't keep getting CI job intermittent failures because of it.
> When somebody has time to investigate, we can fix the underlying
> cause and reenable the job.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is an "if you don't want this, propose something else" patch :-)

I'm also regularly running into issues with this test, so from my side:

Acked-by: Thomas Huth <thuth@redhat.com>


