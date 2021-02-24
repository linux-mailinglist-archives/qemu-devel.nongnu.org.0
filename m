Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3678323EE2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:54:45 +0100 (CET)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEucm-0006DM-UU
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEuSh-0001bt-4U
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:44:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEuSf-00012Q-43
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614174255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxJqcZxwcf/ebOjr0YCAlPCHliFSNbg/o1cuHny56fc=;
 b=LEXLCrlzcxiTMOm2N+l5aYJyhL4JPOv+nlFuLJ+cnHKHdAi0uX2nMCd0JT3nLyvLCwZuE3
 xiwTaOy38RUsaNJIrQbGCq4U3eU4YItKzBjz0dHsqcvRuc3nMZBIL62GF8K5sVJDJdODcu
 u9clTSDC5jbJHRmqfRmqyue2exOg8dQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-LC3I8b6gMEG3vn89wXvU9w-1; Wed, 24 Feb 2021 08:43:33 -0500
X-MC-Unique: LC3I8b6gMEG3vn89wXvU9w-1
Received: by mail-wr1-f70.google.com with SMTP id i2so1073953wru.1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NxJqcZxwcf/ebOjr0YCAlPCHliFSNbg/o1cuHny56fc=;
 b=Q8Td8c0sGN+N4HwscEYxAYd7dfsvln1FtvateTpxzxCcO9Z5SaDtpp4h+whXJC4BnT
 u6nSTKkORxElNxpGIQN/mVHvZ0uosVg3BwCI87d8P9T+zVpO0yiCRoq/v2KPEFAhWO22
 c5dJtI1J3MY38kAtA9V2EqDiFjX9OxAvh1TllcgyYIKX559noeomYuqmdeuaxR9A+KIL
 eT4Wn3wtxipEe/mSX8gE0rOSzzuPdyJsEDlYWWDgJvkBglAcXAEL4sMSC8qAmk6eixVw
 +1xpTfdhhQTB/CBb80Nhvv+Guwme72/lvRNzmAfT6Rry+kEiRaCV8BrT8nLrTkSunhs4
 7IoA==
X-Gm-Message-State: AOAM531ukezo5lg+YpPC+7K2ssMxmyO5/skWSFCQ2Oe74I/28hbcZDQd
 bD/ZvAXdUg6p81Jb898Pa7V79b2ViuPGuNkN9jnla9O7/a2JLyPB5RLzooFevKMqbOMPiMd9QYX
 KT8nK1qLxLtvq7K4=
X-Received: by 2002:a1c:7f46:: with SMTP id a67mr3799210wmd.94.1614174211901; 
 Wed, 24 Feb 2021 05:43:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+/QFLkxD3/Sm0rdqEQx19nhpnGTM5dca5q7BSOPRV+Xbh+g+2KsiOXD9YGnd4ZErW+yOQKQ==
X-Received: by 2002:a1c:7f46:: with SMTP id a67mr3799198wmd.94.1614174211685; 
 Wed, 24 Feb 2021 05:43:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o9sm3092321wmc.8.2021.02.24.05.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 05:43:31 -0800 (PST)
Subject: Re: [PATCH 1/6] net: introduce qemu_receive_packet()
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-2-jasowang@redhat.com>
 <9e432ff0-793e-64a7-97f3-ff3a374ee98f@redhat.com>
 <b7d39898-d688-70bb-4546-612150a1635b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5386f97e-0fb4-b7bc-6520-698a9c856bf9@redhat.com>
Date: Wed, 24 Feb 2021 14:43:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b7d39898-d688-70bb-4546-612150a1635b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: QEMU Security <qemu-security@nongnu.org>, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 2:17 PM, Jason Wang wrote:
> 
> On 2021/2/24 6:11 下午, Philippe Mathieu-Daudé wrote:
>> On 2/24/21 6:53 AM, Jason Wang wrote:
>>> Some NIC supports loopback mode and this is done by calling
>>> nc->info->receive() directly which in fact suppresses the effort of
>>> reentrancy check that is done in qemu_net_queue_send().
>>>
>>> Unfortunately we can use qemu_net_queue_send() here since for loop
>>> back there's no sender as peer, so this patch introduce a
>>> qemu_receive_packet() which is used for implementing loopback mode
>>> for a NIC with this check.
>> IIUC the guest could trigger an infinite loop and brick the emulated
>> device model. Likely exhausting the stack, so either SEGV by
>> corruption or some ENOMEM?
> 
> 
> Yes.
> 
> 
>>
>> Since this is guest triggerable, shouldn't we contact qemu-security@
>> list and ask for a CVE for this issue, so distributions can track
>> the patches to backport in their stable releases? (it seems to be
>> within the KVM devices boundary).
> 
> 
> That's the plan. I discussed this with Prasad before and he promise to
> ask CVE for this.

Good! We just need to be sure to amend the CVE number to the patches
before committing them.

> 
> But it's a knwon issue, the reentrant DMA which has been discussed
> before[1], unfortuantely we don't make any progress. This patch can only
> fix the NIC RX issue.
> 
> Thanks
> 
> [1] https://mail.gnu.org/archive/html/qemu-devel/2020-09/msg00906.html


