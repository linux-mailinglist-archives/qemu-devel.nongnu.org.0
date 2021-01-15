Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298FF2F8045
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 17:09:10 +0100 (CET)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Rev-0004ou-7q
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 11:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0RdR-0003tS-Qa
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:07:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0RdP-0001ht-E9
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 11:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610726854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3OclrRSy+MW0v80l4OODl6nv0z/M42J1AkqQfDj4cc=;
 b=epVXZC120x3FKCNP9OIGJvW1Tr4Tcm4Bo6udJ3BTqa8JhrCmW6ZQ5O7merYAn+pzweQX9r
 pu4lRULcshAh346f2lqIU/7ZzCIYarQLJ2mx4tc9LrjZcNzy55QMLOPqZRjzxTJNE1laLv
 Mju3Ygg+7ZBs4kJoVUO49PtJlj0s7ko=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-scMr2HP3Nq-g23qmMHv1fg-1; Fri, 15 Jan 2021 11:07:33 -0500
X-MC-Unique: scMr2HP3Nq-g23qmMHv1fg-1
Received: by mail-ej1-f72.google.com with SMTP id x22so3752798ejb.10
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 08:07:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=o3OclrRSy+MW0v80l4OODl6nv0z/M42J1AkqQfDj4cc=;
 b=Xm/MgCB7Z51go6EAwZ+5uuUfK3d6j1T3OPYPe9nlhlzd26J6qt+6CxE1mLP/+P2MQU
 nS52m5R/F0aHGSSs5WBar83ELRbe8Q/2iExr10RqeKiCBbUd7RIYzA20sa4UfglG4JcQ
 WbmZM/A+wrKZs1o3LwLryDaweR6C9eOMERZwSXrQObUQ9GN+TgKFlPBlr5URMq1adcS9
 HG94B37lIDubMoqpxsh6sML/eq39uMH1pDujMPtHpRtVFICY55TUL19op2uSaFCu8Wmh
 XnjUlHdGS0E9bVy/Gt+RWDzDtihP25ksV+A9G90sVKnusU9kqV+F1DqqmCM7AYN3P89D
 Lxyw==
X-Gm-Message-State: AOAM532F0VYAM8m/CoQtnr8rU94OD0P27omEG+RD9BIlJgOpAwgovoNh
 SY6am3rKEsEIE9QRoih3ApfUQVz47pUSpKDJLEF0cSOwDADg2Acq8LK7soX9HKsc+xXNA7g31yK
 U/VENlI81fYaQMgo=
X-Received: by 2002:a05:6402:45:: with SMTP id
 f5mr10158916edu.273.1610726851871; 
 Fri, 15 Jan 2021 08:07:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYw2mgbJbR9rgHqde1httKR429YjMA6ebXhFP9YN+plMDSqJ4aj3dv2LKP7w8zYzqjmln74w==
X-Received: by 2002:a05:6402:45:: with SMTP id
 f5mr10158892edu.273.1610726851755; 
 Fri, 15 Jan 2021 08:07:31 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id oq7sm3962789ejb.63.2021.01.15.08.07.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 08:07:31 -0800 (PST)
Subject: Re: [PATCH 1/4] tests/qtest: Remove TPM tests
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210115150936.3333282-1-philmd@redhat.com>
 <20210115150936.3333282-2-philmd@redhat.com>
 <647c3b2d-a68d-43a1-052f-1f5c08b6f3cc@redhat.com>
 <56096449-e909-0f5e-b458-0aae20132865@linux.ibm.com>
 <a3b60b30-4e7c-5fc8-381f-5f4e6abe11c8@redhat.com>
Message-ID: <67cc68c5-53df-8327-d9a0-316e0c0d62d7@redhat.com>
Date: Fri, 15 Jan 2021 17:07:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a3b60b30-4e7c-5fc8-381f-5f4e6abe11c8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 5:06 PM, Philippe Mathieu-Daudé wrote:
> On 1/15/21 4:53 PM, Stefan Berger wrote:
>> On 1/15/21 10:52 AM, Philippe Mathieu-Daudé wrote:
>>> Subject is incorrect, this is not a removal of the tests, but
>>> removal of their execution. The tests are still in the repository.
>>> This is more of a disablement.
>>
>> How do you compile / run them to have the LeakSanitizer checks?
> 
> I used:
> 
> ../configure --cc=clang --enable-sanitizers && make check-qtest
> 
> $ clang -v
> clang version 10.0.1 (Fedora 10.0.1-3.fc32)
> 
> This was previously covered by patchew CI. I just figured
> patchew is running without the LeakSanitizer since commit
> 6f89ec7442e ("docker: test-debug: disable LeakSanitizer"):
> 
>  docker: test-debug: disable LeakSanitizer
> 
>  There are just too many leaks in device-introspect-test (especially for
>  the plethora of arm and aarch64 boards) to make LeakSanitizer useful;
>  disable it for now.

So if this expected, maybe the correct fix is to have meson use
ASAN_OPTIONS=detect_leaks=0 automatically when running the qtests?


