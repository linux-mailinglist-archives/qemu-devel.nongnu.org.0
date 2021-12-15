Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F7B476395
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:43:48 +0100 (CET)
Received: from localhost ([::1]:35238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxb7r-0003fK-Fv
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:43:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxay6-0002HN-Gx
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:33:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxay3-0005Pn-75
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639600418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ROvSsTDg/ijuVO9BqofZK9VxlJt5k1gwk+kN3pMxxFg=;
 b=eNdiiAvnkJoGRrGgBV1JadLhr1V9TIbyH5nn2IntQFSp2+RgqsDzrIDULZCI1VQ/ijCqM9
 QkOXgxQeocjLZUzFZWuaHl1vzW6H0hy0z2trPZ9vIrovZLwX7ZpMXthT/PZnWCFg0leH/R
 NknhZTDNPEHGbLE8QpTWPfmspmi5nP0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-qOECSb2gMyWx3FBRaJYN7A-1; Wed, 15 Dec 2021 15:33:35 -0500
X-MC-Unique: qOECSb2gMyWx3FBRaJYN7A-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay17-20020a05600c1e1100b0033f27b76819so13115890wmb.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ROvSsTDg/ijuVO9BqofZK9VxlJt5k1gwk+kN3pMxxFg=;
 b=pRAzY/TDJOyLaMxvgjLwLhQB+ELNz1bYq4lGDWLZIQtAkWC8LkMQHMC/bWXayJDm3H
 g526hSPB1b2YKT2BTdcLn+/7Yt6JNgyjM/dN53XNMpwelzokv7F5qclX07Kza8v9C3vH
 HXLKtz6q0BQSrOcJZ6cJWSG8ASAN/wJdhzrFkmUHzUiZ4soKSd8XJZcXOVmTFhL9h7PN
 QcdGYsMn9Yx45yDwV3YZIa7qNd0PZiN3zWuv5lWf42qt+qatKus0V4YoMLXLRAu07/5J
 xoFRGGD3qiSwcIa1OrCPZAj6We1qHq9+iyD8InZIvHopuxgdJeLYJRL4oL7j+aRpXw+o
 /O3A==
X-Gm-Message-State: AOAM532UlEnU/McDW/FVv8xmAkB9CvUSbTgaS7nQx70kqDl94rjwM17B
 bhfM64apzhmniPVqUth+Xp9FMFgygmpJlBF6eFx7OWq0mKuDEJRkFHAHsFwRRv3+3Rz6A4SUHTj
 hufIgyELod21BrRw=
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr1872842wmj.30.1639600413927; 
 Wed, 15 Dec 2021 12:33:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTHZgTGarBFh+TSyPlvys3KWHienGjaKaps2Mbkhyu9Taf7o37VQExVexbYDGYO/Xfdwh4xg==
X-Received: by 2002:a7b:c1cb:: with SMTP id a11mr1872826wmj.30.1639600413684; 
 Wed, 15 Dec 2021 12:33:33 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id b19sm6896333wmb.38.2021.12.15.12.33.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 12:33:33 -0800 (PST)
Message-ID: <1e089019-d4ff-cb18-49ab-804b22fd61ef@redhat.com>
Date: Wed, 15 Dec 2021 21:33:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PULL 00/16] qtest and gitlab-CI improvements
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211215073402.144286-1-thuth@redhat.com>
 <8bad026b-d648-e72e-bb2d-c2fea5463a0d@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <8bad026b-d648-e72e-bb2d-c2fea5463a0d@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2021 18.14, Richard Henderson wrote:
> On 12/14/21 11:33 PM, Thomas Huth wrote:
>>   Hi!
>>
>> The following changes since commit 76b56fdfc9fa43ec6e5986aee33f108c6c6a511e:
>>
>>    Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into 
>> staging (2021-12-14 12:46:18 -0800)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-12-15
>>
>> for you to fetch changes up to 7876cba8fc0cab9a4c803a30f427d4b20b95a868:
>>
>>    gitlab-ci: Test compilation on Windows with MSYS2 (2021-12-15 08:08:59 
>> +0100)
>>
>> ----------------------------------------------------------------
>> * Add virtio-net failover test
>> * Make qtests a little bit more flexible with regards to reduced configs
>> * Move libssh setup from configure to meson.build
>> * Run device-crash-test in CI
>> * Add jobs for NetBSD and OpenBSD to the CI
>> * Test compilation with MSYS2 in the gitlab-ci, too
>> * Add new virtio-iommu test
>>
>> ----------------------------------------------------------------
>> Eric Auger (4):
>>        virtio-iommu: Remove set_config callback
>>        virtio-iommu: Fix endianness in get_config
>>        virtio-iommu: Fix the domain_range end
>>        tests: qtest: Add virtio-iommu test
>>
>> Laurent Vivier (4):
>>        qtest/libqos: add a function to initialize secondary PCI buses
>>        tests/qtest: add some tests for virtio-net failover
>>        tests/libqtest: add some virtio-net failover migration cancelling 
>> tests
>>        tests/libqtest: add a migration test with two couples of failover 
>> devices
>>
>> Thomas Huth (8):
>>        tests/qtest: Run the PPC 32-bit tests with the 64-bit target 
>> binary, too
>>        tests/qtest: Fence the tests that need xlnx-zcu102 with 
>> CONFIG_XLNX_ZYNQMP_ARM
>>        tests/qtest: Add a function that gets a list with available machine 
>> types
>>        tests/qtest: Add a function to check whether a machine is available
>>        Move the libssh setup from configure to meson.build
>>        gitlab-ci.d/buildtest: Add jobs that run the device-crash-test
>>        gitlab-ci: Add cirrus-ci based tests for NetBSD and OpenBSD
>>        gitlab-ci: Test compilation on Windows with MSYS2
>>
>>   .gitlab-ci.d/buildtest.yml        |   23 +
>>   .gitlab-ci.d/cirrus.yml           |   35 +
>>   .gitlab-ci.d/cirrus/kvm-build.yml |   31 +
>>   .gitlab-ci.d/qemu-project.yml     |    1 +
>>   .gitlab-ci.d/windows.yml          |   98 +++
>>   configure                         |   27 -
>>   hw/virtio/trace-events            |    3 +-
>>   hw/virtio/virtio-iommu.c          |   42 +-
>>   include/hw/pci/pci_bridge.h       |    8 +
>>   meson.build                       |   13 +-
>>   meson_options.txt                 |    2 +
>>   scripts/meson-buildoptions.sh     |    3 +
>>   tests/qtest/boot-serial-test.c    |    3 +-
>>   tests/qtest/cdrom-test.c          |    8 +-
>>   tests/qtest/libqos/libqtest.h     |    8 +
>>   tests/qtest/libqos/meson.build    |    1 +
>>   tests/qtest/libqos/pci.c          |  119 ++++
>>   tests/qtest/libqos/pci.h          |    1 +
>>   tests/qtest/libqos/virtio-iommu.c |  126 ++++
>>   tests/qtest/libqos/virtio-iommu.h |   40 ++
>>   tests/qtest/libqtest.c            |   79 ++-
>>   tests/qtest/meson.build           |    9 +-
>>   tests/qtest/prom-env-test.c       |    8 +-
>>   tests/qtest/virtio-iommu-test.c   |  326 +++++++++
>>   tests/qtest/virtio-net-failover.c | 1352 
>> +++++++++++++++++++++++++++++++++++++
>>   25 files changed, 2290 insertions(+), 76 deletions(-)
>>   create mode 100644 .gitlab-ci.d/cirrus/kvm-build.yml
>>   create mode 100644 .gitlab-ci.d/windows.yml
>>   create mode 100644 tests/qtest/libqos/virtio-iommu.c
>>   create mode 100644 tests/qtest/libqos/virtio-iommu.h
>>   create mode 100644 tests/qtest/virtio-iommu-test.c
>>   create mode 100644 tests/qtest/virtio-net-failover.c
> 
> Applied, thanks.

Thanks!

... hmm, looking at the latest builds, it seems like the new msys2-64bit job 
timed out a couple of times after 60 minutes, e.g.:

  https://gitlab.com/qemu-project/qemu/-/jobs/1889554588

And I already put a "timeout: 70m" in there, so I wonder why this wasn't 
taken into account? Maybe it does not work for the Windows machines?
Let's keep an eye on this - if this keeps happening, we either got to 
disable that job again or switch to another target CPU that has less code to 
compile and test.

  Thomas



