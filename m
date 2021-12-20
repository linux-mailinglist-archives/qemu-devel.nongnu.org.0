Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF74B47B338
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 19:50:56 +0100 (CET)
Received: from localhost ([::1]:35980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzNkN-0001qX-29
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 13:50:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKvB-0007wr-3q
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:49:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKv8-00040b-5Z
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:49:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640015379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V3pJBqRb3ipIsDRYES8vr3ytOdhdp3J7wYP9wLcIyLE=;
 b=i2N+YY6ES2TgDMatTXtmWntIpCaSVe/z4s8i3JBcxcgaPR4GdqjYCAkdype429C+HgXV0i
 myVRgeGfveQ2itdA22Il5KRQQl5X3oyuA7TUmFy3mqJ/LJPXD2eHeR0kXqsNAui1K93++l
 f2jWHw2uRSvYKl9VjBTy753Jg3wV/Mk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-_jOcCmhKPpW96h6tTrrwEQ-1; Mon, 20 Dec 2021 04:24:55 -0500
X-MC-Unique: _jOcCmhKPpW96h6tTrrwEQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 b75-20020a1c804e000000b0034569bde713so6181917wmd.9
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 01:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V3pJBqRb3ipIsDRYES8vr3ytOdhdp3J7wYP9wLcIyLE=;
 b=zcAkirj5U6+6AaC8XqnVYbAFZTqCa74w7N59JEGPLyHZxG0AP90KCmDjJYRCqwOIKI
 tdsuB76llnV45tJXOHUSDEWLfTgiDaIdTXSPiop1U2EgAaAW5ANtADDSIoyckCyJfevo
 ulIjdZIzFM4VSGy+4/Q7nRXl/MQY8HjuwkNj+WBnIOvZo4TSa5fHyMwuGXPbiN7G4Xz1
 liTHZH+FFhivEDJ3FXFKyKkjK2oh3jOx5TDvCvvVp3gVNGIG5bg+t/3wdHEMX/9heQZa
 6UQi/BKaJg5oV2K+Y7HU7Tky79fCMgVzV7K6ydyh209l9hWN7ZOCswAV9+DNrWrDyfDk
 ayeg==
X-Gm-Message-State: AOAM530HJU5yMdXxrVPvg+bzpzmG2jpqfs0Wx2ads9gdCPBVpu7p5jXK
 HBQfnt5DO5sv3Rtb+IXLxP/JNs14cTz4weipbp5c7ltICcIpGlMqEFOYZtG3BONFsgjyB7RXO9b
 OgBeZl0ptJbYfx5A=
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr13070294wmg.118.1639992293791; 
 Mon, 20 Dec 2021 01:24:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJziEcvBombtooEfssSxlXlhFXfANWdwC+pURvGW9VCcpwNQMjW9v65McJjZf3I3vvZIkvtO9Q==
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr13070212wmg.118.1639992292465; 
 Mon, 20 Dec 2021 01:24:52 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id l25sm12480524wmh.18.2021.12.20.01.24.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 01:24:52 -0800 (PST)
Message-ID: <c7b79c7b-e8b6-855a-8e7e-dee8f4bb2d34@redhat.com>
Date: Mon, 20 Dec 2021 10:24:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PULL 00/16] qtest and gitlab-CI improvements
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
 <ed66cc5f-cc71-fcf8-3026-6fe775a1c5f8@redhat.com>
 <bc315dd4-d43d-092a-30b2-f609266715a2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <bc315dd4-d43d-092a-30b2-f609266715a2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.608, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Alexander Bulekov <alxndr@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Alex & Paolo

On 12/20/21 07:52, Thomas Huth wrote:
> On 18/12/2021 17.33, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 12/15/21 08:33, Thomas Huth wrote:
>>
>>> ----------------------------------------------------------------
>>> * Add virtio-net failover test
>>> * Make qtests a little bit more flexible with regards to reduced configs
>>> * Move libssh setup from configure to meson.build
>>> * Run device-crash-test in CI
>>> * Add jobs for NetBSD and OpenBSD to the CI
>>> * Test compilation with MSYS2 in the gitlab-ci, too
>>> * Add new virtio-iommu test
>>>
>>> ----------------------------------------------------------------
>>
>>> Laurent Vivier (4):
>>>        qtest/libqos: add a function to initialize secondary PCI buses
>>>        tests/qtest: add some tests for virtio-net failover
>>>        tests/libqtest: add some virtio-net failover migration
>>> cancelling tests
>>>        tests/libqtest: add a migration test with two couples of
>>> failover devices
>>
>> On my ASan build directory I'm sometime getting:
>>
>> Running test qtest-i386/virtio-net-failover
>> (process:1558675): GLib-CRITICAL **: 16:19:12.556: g_rand_int: assertion
>> 'rand != NULL' failed
> 
> Weird, since the test is not using that function?

Well it calls g_test_rand_int(), which calls it:
https://github.com/GNOME/glib/blob/main/glib/gtestutils.c#L1800

> Could you get a
> backtrace?

I'd like to, but for some reason when using ASan I don't get much
(and it only happens with ASan) so I suppose it is something specific
to ASan + rand.


