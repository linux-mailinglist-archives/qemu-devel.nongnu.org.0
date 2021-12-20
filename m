Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0DB47B090
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:47:41 +0100 (CET)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzKt2-0002zo-Dg
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKPM-0000qy-6F
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:17:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKOz-0004iu-8I
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNEaZpmPIb8/R5eNTZerYroJ5gNyJub+te7zwrPF9sw=;
 b=Y4s35qGDxQUi3rWqyEzAYW9WyWW98CxMe2snrSWaWptWOCmpn2StBbd+vxVDBWyKUSHaFV
 5/SuS07xBud+EzFO+YKMXAJZpr4qFoxA4mRSGmsBatFn2T83YL7ikUdRWG13K2GNMWiyzL
 84jh/HGcLWCT2h8lFxT7RDxqZpmFF5M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-tizf-ZCzPGOnV63zRV298Q-1; Mon, 20 Dec 2021 04:53:40 -0500
X-MC-Unique: tizf-ZCzPGOnV63zRV298Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 j71-20020a1c234a000000b00342f418ae7cso6234907wmj.1
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 01:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=eNEaZpmPIb8/R5eNTZerYroJ5gNyJub+te7zwrPF9sw=;
 b=xKcwNVk8op9yfvgUKCKaZ0NIaFvGq+8D9FvIZGdebrTlHerlhYzR66xk7/dFfLfg0O
 Z0Jiqx0451bopcHr3mK+Ouzk4u6XB4eBLfKwAuhP94TuE+cSLNRyZraHLjvyXgSEDWkC
 wNhpQOy/HGpGKg/xQJm5EsbExJkfNRcUh8gjH5B5QHUWAkpxEuakjm86dNJ3EzLex0PS
 3uuELKu7ZY+yKaUMgbD4ZWJhvDaAs7KX9ftv8QMog0WbdOl9Yw/EGC8L4rkIw8DixKxi
 qCDuB9Me3WotRf58I0dr4+nXZxwAoKxLaV4XFx60pJOAvoST6mTgUR/WCj1xhpIDV2eK
 I4PA==
X-Gm-Message-State: AOAM531lgWYsMDsHZpH4WW/JUhc8qLC3/C+R3LivwDXQTiHLdYP1VYrl
 /VO3HABLoGI37/UPKGC9Opo+piYBCRbRGVcyXHpN6gdA7vDB+vAnn7pWL402vV56pRAmbhc2L8Y
 kk2ZfRR6pGayFQB4=
X-Received: by 2002:a5d:4883:: with SMTP id g3mr12094000wrq.590.1639994019743; 
 Mon, 20 Dec 2021 01:53:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4dWSa1mlniclfM5h8dqQs3AAj7RCcWgltilKTYa4hXh+m/xpWHgzZf53rFRSinBBC4XNo9Q==
X-Received: by 2002:a5d:4883:: with SMTP id g3mr12093880wrq.590.1639994017523; 
 Mon, 20 Dec 2021 01:53:37 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id c12sm17572093wrr.108.2021.12.20.01.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 01:53:37 -0800 (PST)
Message-ID: <4a46debd-8211-28b1-e293-aa795d24ed01@redhat.com>
Date: Mon, 20 Dec 2021 10:53:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
 <ed66cc5f-cc71-fcf8-3026-6fe775a1c5f8@redhat.com>
 <bc315dd4-d43d-092a-30b2-f609266715a2@redhat.com>
 <c7b79c7b-e8b6-855a-8e7e-dee8f4bb2d34@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PULL 00/16] qtest and gitlab-CI improvements
In-Reply-To: <c7b79c7b-e8b6-855a-8e7e-dee8f4bb2d34@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.209, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/12/2021 10.24, Philippe Mathieu-Daudé wrote:
> +Alex & Paolo
> 
> On 12/20/21 07:52, Thomas Huth wrote:
>> On 18/12/2021 17.33, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> On 12/15/21 08:33, Thomas Huth wrote:
>>>
>>>> ----------------------------------------------------------------
>>>> * Add virtio-net failover test
>>>> * Make qtests a little bit more flexible with regards to reduced configs
>>>> * Move libssh setup from configure to meson.build
>>>> * Run device-crash-test in CI
>>>> * Add jobs for NetBSD and OpenBSD to the CI
>>>> * Test compilation with MSYS2 in the gitlab-ci, too
>>>> * Add new virtio-iommu test
>>>>
>>>> ----------------------------------------------------------------
>>>
>>>> Laurent Vivier (4):
>>>>         qtest/libqos: add a function to initialize secondary PCI buses
>>>>         tests/qtest: add some tests for virtio-net failover
>>>>         tests/libqtest: add some virtio-net failover migration
>>>> cancelling tests
>>>>         tests/libqtest: add a migration test with two couples of
>>>> failover devices
>>>
>>> On my ASan build directory I'm sometime getting:
>>>
>>> Running test qtest-i386/virtio-net-failover
>>> (process:1558675): GLib-CRITICAL **: 16:19:12.556: g_rand_int: assertion
>>> 'rand != NULL' failed
>>
>> Weird, since the test is not using that function?
> 
> Well it calls g_test_rand_int(), which calls it:
> https://github.com/GNOME/glib/blob/main/glib/gtestutils.c#L1800

Ah, right. I think the problem is that g_test_rand_int() must not be called 
before g_test_init().

But actually, I think in this case we even don't want to use 
g_test_rand_int() since it's about generating a true random temporary file 
name, not a random number for a test case that could be influenced with the 
"--seed" CLI option.
So I think using g_random_int() might be the better choice instead?

  Thomas



