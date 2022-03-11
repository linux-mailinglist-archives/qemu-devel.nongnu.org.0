Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C584D6812
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 18:54:53 +0100 (CET)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSjTY-0006MR-DB
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 12:54:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSjRU-0004nG-Bz
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:52:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSjRQ-0006i4-MK
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 12:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647021159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JhVIpTO1o9SOvRBg3LDbQQOIzds8ptiFj+5y1oBSpQQ=;
 b=YJ+Ic0PkTlw+Av6Yb4XfNcZcLGejOxO5rzAQTjxq8R3oV7hkL7BQnDzWV+XTRJlM/t9P31
 cT5dHaiBgCKhczCPS0cL0k4r/JUkcLnaDiHsqDP5l21Ry1tgfQe/rlvycM6mie+pJ9ZOSA
 IsSEdccGV54A7gjnNDs0KPYt3Be2cHk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-EO8_KcPnPcOIUAjDxIB9FA-1; Fri, 11 Mar 2022 12:52:38 -0500
X-MC-Unique: EO8_KcPnPcOIUAjDxIB9FA-1
Received: by mail-wr1-f72.google.com with SMTP id
 k20-20020adfc714000000b001e305cd1597so3067503wrg.19
 for <qemu-devel@nongnu.org>; Fri, 11 Mar 2022 09:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JhVIpTO1o9SOvRBg3LDbQQOIzds8ptiFj+5y1oBSpQQ=;
 b=TX072QmUXv2kWY/hs+g914ZCw4wi0DoH+JesCWVuHPvWOU0iuMqP/byFwg9sbb/5cs
 peL2sY+0H9MVCwd6PQ0D4ipsH6N5H5FCIZg5r5IBaSYTQ9UTwCnfrpmtf1/oV4zNIXhi
 yKm77CDcQ8xSDZorcek7AbusGt/xoXXGup020Oo7S9gKYA7Fi1DAciVVHLGt7GA31+Dl
 uqSKKEN/xNKD/IU6tZeKcz1woJaWpu487Hf32oehQ5z9lSggkj2GtNOUF0iXDo6C+QMx
 R/K+n/jJab4X5bwuOjkSlIz/Byq3SH3uAaypwjyXnKzBTW/I7C+DnYPC3zUWnAVtYvns
 ZEQw==
X-Gm-Message-State: AOAM533k/MCUNZqf4XmfXgr8tv8q5uaV/ois/dLk/8AVZR6T6BGjNKsn
 jgHKclryyY1gudUcRv1s3HCMubA68bliG4Sh9WMxOucDkG7oNt/N81yAMdkxNG10cg7scsTe5CB
 UqIDNANTTlH6QVkc=
X-Received: by 2002:adf:e5cf:0:b0:203:7a50:98bd with SMTP id
 a15-20020adfe5cf000000b002037a5098bdmr8118176wrn.416.1647021156911; 
 Fri, 11 Mar 2022 09:52:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRdDbXdowcn1Fj3ikQf6vya72P56cCM5LVNqTq1BaViHV6FcpQxCWph9TKVZGkTRlu5rdarQ==
X-Received: by 2002:adf:e5cf:0:b0:203:7a50:98bd with SMTP id
 a15-20020adfe5cf000000b002037a5098bdmr8118152wrn.416.1647021156641; 
 Fri, 11 Mar 2022 09:52:36 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c191100b00389a1a68b95sm20648107wmq.27.2022.03.11.09.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Mar 2022 09:52:35 -0800 (PST)
Message-ID: <850e5ecd-3839-d2ca-088a-f80ada626f2a@redhat.com>
Date: Fri, 11 Mar 2022 18:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: 'make check-acceptance' failing on s390 tests?
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <CAFEAcA9uVgPzkYHZk3jFNKj6d-rOh25gNFM_bKz=G7G+0B=1+A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA9uVgPzkYHZk3jFNKj6d-rOh25gNFM_bKz=G7G+0B=1+A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/02/2022 16.04, Peter Maydell wrote:
> Hi; is anybody else seeing 'make check-acceptance' fail on some of
> the s390 tests?
> 
>   (009/183) tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg:
> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
> Timeout reached\nOriginal status: ERROR\n{'name':
> '009-tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg',
> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/clang/tests/results/j...
> (900.20 s)
[...]
> Not sure about the timeout on the boot test: the avocado log
> shows it booting at least as far as
> "Kernel 5.3.7-301.fc31.s390x on an s390x (ttysclp0)"
> and then there's no further output until the timeout.

Now that I've finally been able to run the test again (after
manually tweaking that borked is_port_free() function in
avocado), I've had a closer look at the failing BootLinuxS390X
test: If you're looking at the output of the guest in the log,
you can see that it fails to init the cloud-init stuff and
thus fails to "phone home" at the end.

This used to work fine in older versions, so I just spent a
lot of time bisecting this issue and ended up here:

f83bcecb1ffe25a18367409eaf4ba1453c835c48 is the first bad commit
commit f83bcecb1ffe25a18367409eaf4ba1453c835c48
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue Jul 27 07:48:55 2021 -1000

     accel/tcg: Add cpu_{ld,st}*_mmu interfaces

Richard, could you please have a look at this one, too? ... it
causes the test to fail:

$ git checkout f83bcecb1ffe25a18367409eaf4ba1453c835c48~1
$ ./configure --target-list=s390x-softmmu --disable-docs
$ make -j8
$ make check-venv
$ cd build
$ ./tests/venv/bin/avocado run tests/acceptance/boot_linux.py:BootLinuxS390X
JOB ID     : 0a6d287620d150d52c24417d0a672a1a826b3a82
JOB LOG    : /home/thuth/avocado/job-results/job-2022-03-11T18.30-0a6d287/job.log
  (1/1) tests/acceptance/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg: PASS (130.38 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 136.51 s
$ grep cloud-ini /home/thuth/avocado/job-results/job-2022-03-11T18.30-0a6d287/job.log
...
2022-03-11 18:31:52,745 datadrainer      L0193 DEBUG| [  OK  ] Started Initial cloud-init…ob (metadata service crawler).

$ git checkout f83bcecb1ffe25a18367409eaf4ba1453c835c48
$ make -j8
$ ./tests/venv/bin/avocado run tests/acceptance/boot_linux.py:BootLinuxS390X
JOB ID     : cb143be36631515f74cb6de2b263dfe1bc0f9709
JOB LOG    : /home/thuth/avocado/job-results/job-2022-03-11T18.34-cb143be/job.log
  (1/1) tests/acceptance/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg: INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred: Timeout reached\nOriginal status: ERROR\n{'name': '1-tests/acceptance/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg', 'logdir': '/home/thuth/avocado/job-results/job-2022-03-11T18.34-cb143be/test-res... (900.97 s)
RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 1 | CANCEL 0
JOB TIME   : 907.16 s
$ grep cloud-ini /home/thuth/avocado/job-results/job-2022-03-11T18.34-cb143be/job.log
2022-03-11 18:35:15,106 datadrainer      L0193 DEBUG|          Starting Initial cloud-init job (pre-networking)...
2022-03-11 18:35:21,691 datadrainer      L0193 DEBUG| [FAILED] Failed to start Initial cloud-init job (pre-networking).
...

  Thomas


