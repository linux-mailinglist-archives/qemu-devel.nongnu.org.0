Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D8E3DF95C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 03:45:54 +0200 (CEST)
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB5yi-00083l-Mp
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 21:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB5x0-0006nn-Iu
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 21:44:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB5wx-0004gj-BB
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 21:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628041441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3UWZQc2GS5SJkbkaAH7q2CjQCcI1brIS2Qh9d2aLRR0=;
 b=FNKU4fJg25MWEjLXbjlaCc0W1ns6ldq4ITB+Hm1uOTCE/U2U26xa+AmIFl9Ixrgl8gKW4O
 Kdgm8c/9rCPg26uVKIof1BmmX4DQpu2O8v4CDzPWjznzjI3S50BfzkZMo6s19fxQAE4zUz
 NivEtan8mNyCuILEVRD57cTWdlfPQ3A=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-j_VFUvHJOmG6Hk_8UICg8w-1; Tue, 03 Aug 2021 21:44:00 -0400
X-MC-Unique: j_VFUvHJOmG6Hk_8UICg8w-1
Received: by mail-pj1-f72.google.com with SMTP id
 v2-20020a17090ac902b0290176b4310aaeso118733pjt.2
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 18:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3UWZQc2GS5SJkbkaAH7q2CjQCcI1brIS2Qh9d2aLRR0=;
 b=R4wXZbMkJ1QYkfma99fdXkB7HbAf03slqcykxC0NqrdZkTPn1koiRu4zBVqo7nRLNi
 dFweuWJ0ZLKN6YY63j9uJUk78kOkGvelOSAoHvIcOhodQ3iUMMk/fmGkcXuxtdTlSvUA
 4ys2Q1sF0dbq/yeJMqNjl1bbuLtDOMTY47QL2KkcFUJRHdLGnLGWTG4lnvYaXYVIoq1J
 OZtEzHIwjf5NQZgWwnNR/BXe9f6c9K6PrTv2CLH1j3LNnpSeTUZcwkUCyRJY00ATPlh1
 rMDAopLGdmIKf/wjV1pv8SPQrjCw6ntUcmuLvmr0+KQT+mnR8E8PiDGCSfdLfA01dTTq
 j5Kw==
X-Gm-Message-State: AOAM5321Ty+o6S7vJUpLAAcx2nCBnoeyQCmNY4B68GgTHPdiSj7vIP1a
 QIo65kC4DuSYR2r8ALFsv//e2ko6BK0wFe9tRy8M7q14mSk6ZdZxnnAw/P0RmQWRtdbf/6L+aDj
 oO/doz3yUZQp/ez4=
X-Received: by 2002:a17:903:192:b029:12c:bf13:ab28 with SMTP id
 z18-20020a1709030192b029012cbf13ab28mr8604730plg.17.1628041439110; 
 Tue, 03 Aug 2021 18:43:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4McumKwzO/XRvOpMj/t4KWWgOa/3Kt4d12B/82AlYxrQ/y8K+mqIINks0oQMCVE4vZcvjjw==
X-Received: by 2002:a17:903:192:b029:12c:bf13:ab28 with SMTP id
 z18-20020a1709030192b029012cbf13ab28mr8604712plg.17.1628041438875; 
 Tue, 03 Aug 2021 18:43:58 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id r15sm450671pjl.29.2021.08.03.18.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 18:43:58 -0700 (PDT)
Subject: Re: [PATCH] hw/net: Discard overly fragmented packets
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210705084011.814175-1-philmd@redhat.com>
 <adb810ea-a4f3-3ff9-3f4b-9973c3e1f518@redhat.com>
 <40744707-c9ab-a7c2-c509-6d0275a69114@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b389e61b-4606-1327-3aa0-b4e056ba8dd3@redhat.com>
Date: Wed, 4 Aug 2021 09:43:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <40744707-c9ab-a7c2-c509-6d0275a69114@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-stable@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Andrew Melnychenko <andrew@daynix.com>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/8/3 下午5:51, Philippe Mathieu-Daudé 写道:
> On 8/3/21 11:33 AM, Thomas Huth wrote:
>> On 05/07/2021 10.40, Philippe Mathieu-Daudé wrote:
>>> Our infrastructure can handle fragmented packets up to
>>> NET_MAX_FRAG_SG_LIST (64) pieces. This hard limit has
>>> been proven enough in production for years. If it is
>>> reached, it is likely an evil crafted packet. Discard it.
>>>
>>> Include the qtest reproducer provided by Alexander Bulekov:
>>>
>>>     $ make check-qtest-i386
>>>     ...
>>>     Running test qtest-i386/fuzz-vmxnet3-test
>>>     qemu-system-i386: net/eth.c:334: void
>>> eth_setup_ip4_fragmentation(const void *, size_t, void *, size_t,
>>> size_t, size_t, _Bool):
>>>     Assertion `frag_offset % IP_FRAG_UNIT_SIZE == 0' failed.
>>>
>>> Cc: qemu-stable@nongnu.org
>>> Reported-by: OSS-Fuzz (Issue 35799)
>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/460
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>    hw/net/net_tx_pkt.c             |   8 ++
>>>    tests/qtest/fuzz-vmxnet3-test.c | 195 ++++++++++++++++++++++++++++++++
>>>    MAINTAINERS                     |   1 +
>>>    tests/qtest/meson.build         |   1 +
>>>    4 files changed, 205 insertions(+)
>>>    create mode 100644 tests/qtest/fuzz-vmxnet3-test.c
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>> Jason, I think this would even still qualify for QEMU v6.1 ?
> Yes, easy one for 6.1.


Yes, this will be included for rc3.

Thanks


>


