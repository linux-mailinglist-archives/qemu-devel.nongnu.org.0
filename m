Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BF53E8919
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 06:09:14 +0200 (CEST)
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDfYH-0002ae-61
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 00:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mDfXQ-0001ig-2Q
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 00:08:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mDfXM-0007xq-9h
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 00:08:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628654895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jO9+RCASsLdbV+w0O6Uyg902HJ1EIY9mwRCxH+iINFg=;
 b=EMQgPeHGNnEErldOzK9NpHzv9vbOu+A6vJ/veqdzQphWEYtaMM070cYYcnQtIsedXfJkOz
 L4kXXuej92X0qX2n1ASOAhZ7z+HYhFTgcR05Y/TDwuh5wa/y09wg3Q2Q6+x+Fi5QUiLH2Z
 h17FaxE32umktYLnBmLKB2XEI7RBsw4=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-MNfUQH7xPwSHgJC32i6b7w-1; Wed, 11 Aug 2021 00:08:12 -0400
X-MC-Unique: MNfUQH7xPwSHgJC32i6b7w-1
Received: by mail-pj1-f69.google.com with SMTP id
 r13-20020a17090a4dcdb0290176dc35536aso727182pjl.8
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 21:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jO9+RCASsLdbV+w0O6Uyg902HJ1EIY9mwRCxH+iINFg=;
 b=Thjje8o9//xmQNfzkVCjOhB0b5/hyTxxJk8P/ZjRkQLZ/j90sYUK8dhTbxFh7vyb6M
 Wow+WRpUca8tfHLe62CvcpkFMyPmIuITZ11KyZ5QUdaR4kptoYwfpcuExP+26LksTflO
 eijninThqwyXnmK2ZUonIK/2Q7RQtVrKDvPFRSf6vJck0XG7/9RHq+OQuSfUsyAc3Kka
 sKurmFwKA2SKYdEe5C7YPitNNdfRbgL5jDELrfpDnFPUVcOqDNBhMew2ahw4mkwAil2h
 zwdivVNUEsDGZvU9IjP2oxK+ZkRlaO3szhf5NuoT6Bohkceo4xQRdhnRLDbA8uPVTccD
 vClA==
X-Gm-Message-State: AOAM530ImGmT5hZJtywOtLNJsIYwHsqgxIL1Mt+0/eo5+xDGLLOrWLe2
 T4moAVxg/5UF01co6MaBoTs0L4KP4PPZGUKM/EtnsaLTqLA/CLFqRLNBkTUKlrkaVYTFJswhFFC
 dxoO0T7LZO5BmCMQ=
X-Received: by 2002:a63:3113:: with SMTP id x19mr161815pgx.260.1628654891251; 
 Tue, 10 Aug 2021 21:08:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGNParcGeA47jX3GAMunwzMEQQ74mTe+NybLH5xmvBNjPxUBbncWGRgS3i2WUp6KFUUV6ZAQ==
X-Received: by 2002:a63:3113:: with SMTP id x19mr161797pgx.260.1628654891009; 
 Tue, 10 Aug 2021 21:08:11 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id m4sm4742741pjl.6.2021.08.10.21.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 21:08:10 -0700 (PDT)
Subject: Re: [PATCH] hw/net: Discard overly fragmented packets
From: Jason Wang <jasowang@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210705084011.814175-1-philmd@redhat.com>
 <adb810ea-a4f3-3ff9-3f4b-9973c3e1f518@redhat.com>
 <40744707-c9ab-a7c2-c509-6d0275a69114@redhat.com>
 <b389e61b-4606-1327-3aa0-b4e056ba8dd3@redhat.com>
Message-ID: <b1ce9a24-0e77-7a15-9532-d3bc7d480492@redhat.com>
Date: Wed, 11 Aug 2021 12:08:05 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <b389e61b-4606-1327-3aa0-b4e056ba8dd3@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


在 2021/8/4 上午9:43, Jason Wang 写道:
>
> 在 2021/8/3 下午5:51, Philippe Mathieu-Daudé 写道:
>> On 8/3/21 11:33 AM, Thomas Huth wrote:
>>> On 05/07/2021 10.40, Philippe Mathieu-Daudé wrote:
>>>> Our infrastructure can handle fragmented packets up to
>>>> NET_MAX_FRAG_SG_LIST (64) pieces. This hard limit has
>>>> been proven enough in production for years. If it is
>>>> reached, it is likely an evil crafted packet. Discard it.
>>>>
>>>> Include the qtest reproducer provided by Alexander Bulekov:
>>>>
>>>>     $ make check-qtest-i386
>>>>     ...
>>>>     Running test qtest-i386/fuzz-vmxnet3-test
>>>>     qemu-system-i386: net/eth.c:334: void
>>>> eth_setup_ip4_fragmentation(const void *, size_t, void *, size_t,
>>>> size_t, size_t, _Bool):
>>>>     Assertion `frag_offset % IP_FRAG_UNIT_SIZE == 0' failed.
>>>>
>>>> Cc: qemu-stable@nongnu.org
>>>> Reported-by: OSS-Fuzz (Issue 35799)
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/460
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>    hw/net/net_tx_pkt.c             |   8 ++
>>>>    tests/qtest/fuzz-vmxnet3-test.c | 195 
>>>> ++++++++++++++++++++++++++++++++
>>>>    MAINTAINERS                     |   1 +
>>>>    tests/qtest/meson.build         |   1 +
>>>>    4 files changed, 205 insertions(+)
>>>>    create mode 100644 tests/qtest/fuzz-vmxnet3-test.c
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>> Jason, I think this would even still qualify for QEMU v6.1 ?
>> Yes, easy one for 6.1.
>
>
> Yes, this will be included for rc3.
>
> Thanks


For some reasons it misses rc3.

I will include it for 6.2.

Sorry.


>
>
>>


