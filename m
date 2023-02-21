Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6608669E61C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 18:37:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUWa0-0004YD-Fm; Tue, 21 Feb 2023 12:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUWZm-0004Ke-56
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:37:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pUWZg-0002hY-Fl
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 12:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677001026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dZ0NLV4Gz9Qt9Aq9Z85pe0HIQzdBNs29tAJabN4tXx4=;
 b=K99SDbzNy+YExy7iKzzDq01A0YGZQEjPNOS4KZ5uEnAloRqyt7j0TtGEgsMSO7m7JIbM7+
 +0eMZfUH8aXJJXS2HEyp6NvnKK+5cOoaecSbkSala0IsTDJznnqX9ICKrErcnqmONMWr1t
 +oLnDNMD7YzwU+i/16TpbvvsCCu3qqk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-527-tAdNYR1TNqKfEONZL7rFqg-1; Tue, 21 Feb 2023 12:35:58 -0500
X-MC-Unique: tAdNYR1TNqKfEONZL7rFqg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m28-20020a05600c3b1c00b003e7d4662b83so996403wms.0
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 09:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dZ0NLV4Gz9Qt9Aq9Z85pe0HIQzdBNs29tAJabN4tXx4=;
 b=lnSfGPwZjRKJHAQgo8VqrZPNKKz1iS+gBNJNJv3UZFtfXoRXtSdi2WbpdHlRYUFjWD
 BCD4a6+GftV2fAkDA1eIDrBuN+AE+mhuNHe40ipquCOq0buUJLuiU0TxXFE6f7g7+HDI
 ek2b/Ma6TKbwhoCdzDDkrGeyI8NAA9NzKcCwL4zfXDGxCU6ryrrQuZfvAvIqwKV4ueai
 6rnLzYxT5RJkIHU6CY8kzIDqFuYkTmt4FLTWuhr+Z+9bGWArKJ+mCdIMLbY812IH6zx9
 VQ3waw27nrm+EL7xa6sUN9BXA00ouS+WJ0v6TQBS00Ny6Ds6VzhMhxVo8QPkLElDkuIH
 srsA==
X-Gm-Message-State: AO0yUKUEcSJANgt4DfqVymT0CdvTqqWNFNGcdSJK3T2x6XL+3rP1eYDh
 Ne56NVySxeEenMcPf8NZNWfyDMRDunhYXtY4PXhrNsuUucn2uja+awbVO7gzjOgZ7Sdi7ihFY92
 VmY8gSZi0k3zf3N4=
X-Received: by 2002:a5d:4805:0:b0:2c5:4e3c:d390 with SMTP id
 l5-20020a5d4805000000b002c54e3cd390mr5090654wrq.62.1677000956982; 
 Tue, 21 Feb 2023 09:35:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/O7VHjYwA8RJkO7TUHnPqp8S5nBKhmDdxQIIBfEHhARemNanwCOjzZFS5eHzqhrDQgI93yrg==
X-Received: by 2002:a5d:4805:0:b0:2c5:4e3c:d390 with SMTP id
 l5-20020a5d4805000000b002c54e3cd390mr5090448wrq.62.1677000951884; 
 Tue, 21 Feb 2023 09:35:51 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-151.web.vodafone.de.
 [109.43.179.151]) by smtp.gmail.com with ESMTPSA id
 n3-20020a5d67c3000000b002c59f186739sm6198491wrw.23.2023.02.21.09.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 09:35:50 -0800 (PST)
Message-ID: <194fc94a-b028-92cf-f07a-c7fdaaede1c5@redhat.com>
Date: Tue, 21 Feb 2023 18:35:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests: Disable migration-test
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
 <Y/Thas4efx14JsBi@work-vm>
 <CAFEAcA9=p0XYti45m0sW+iO9qgF9iXpeOPvHd7Xpy32yCUL3sw@mail.gmail.com>
 <Y/TlB36EjrWwr2ne@work-vm>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y/TlB36EjrWwr2ne@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 21/02/2023 16.36, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Tue, 21 Feb 2023 at 15:21, Dr. David Alan Gilbert
>> <dgilbert@redhat.com> wrote:
>>> Damn this is really going to impact the stability of migration if we
>>> don't regularly test.
>>> But fundamentally, I've never been able to debug much of the reports
>>> that come from flakyness in gitlab ci; we're not getting the most basic
>>> information like which subtest or where we're upto in the test which
>>> makes it very very hard to debug.
>>
>> Right, but if you want more information you need to change the
>> tests and/or test harness to provide it.
> 
> I don't think the migration test is doing anything odd in that respect;
> We've just got a bunch of qtest tests; having a test framework which
> doesn't tell you which test failed is very difficult.

FWIW, I just saw another failure, on a s390x host,
last lines of the log are:

ok 10 /s390x/migration/postcopy/recovery/tls/psk
# End of tls tests
# End of recovery tests
# Start of preempt tests
# starting QEMU: exec ./qemu-system-s390x -qtest unix:/tmp/qtest-7847.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-7847.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name source,debug-threads=on -m 128M -serial file:/tmp/migration-test-03MJ01/src_serial -bios /tmp/migration-test-03MJ01/bootsect    -accel qtest
# starting QEMU: exec ./qemu-system-s390x -qtest unix:/tmp/qtest-7847.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-7847.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name target,debug-threads=on -m 128M -serial file:/tmp/migration-test-03MJ01/dest_serial -incoming unix:/tmp/migration-test-03MJ01/migsocket -bios /tmp/migration-test-03MJ01/bootsect    -accel qtest
ok 11 /s390x/migration/postcopy/preempt/plain
# Start of recovery tests
# starting QEMU: exec ./qemu-system-s390x -qtest unix:/tmp/qtest-7847.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-7847.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name source,debug-threads=on -m 128M -serial file:/tmp/migration-test-03MJ01/src_serial -bios /tmp/migration-test-03MJ01/bootsect   2>/dev/null -accel qtest
# starting QEMU: exec ./qemu-system-s390x -qtest unix:/tmp/qtest-7847.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-7847.qmp,id=char0 -mon chardev=char0,mode=control -display none -accel kvm -accel tcg -name target,debug-threads=on -m 128M -serial file:/tmp/migration-test-03MJ01/dest_serial -incoming unix:/tmp/migration-test-03MJ01/migsocket -bios /tmp/migration-test-03MJ01/bootsect   2>/dev/null -accel qtest
----------------------------------- stderr -----------------------------------
Broken pipe
../tests/qtest/libqtest.c:193: kill_qemu() detected QEMU death from signal 11 (Segmentation fault) (core dumped)

(test program exited with status code -6)

  Thomas


