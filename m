Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CB36E0EE7
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 15:37:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmx8J-0001DJ-TR; Thu, 13 Apr 2023 09:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=460663493=bchalios@amazon.es>)
 id 1pmx8I-0001DA-1Q
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:37:02 -0400
Received: from smtp-fw-9103.amazon.com ([207.171.188.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=460663493=bchalios@amazon.es>)
 id 1pmx8F-0007zA-47
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 09:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1681393019; x=1712929019;
 h=message-id:date:mime-version:to:cc:references:from:
 in-reply-to:content-transfer-encoding:subject;
 bh=MNu64Gy/mOg+4hwO98Ip/F/MgJc2bLp7zHk3dNv1bMs=;
 b=g3/8NnQyZZOmQgXwPrkCG0E+sIHDQzD5JAKjUs5RYJxoGV1A8gO9Jifm
 pv55sIHMiV+Be4TkY8Q7E+228fxS2+1Mzv7pGVtzEa3gMQ5u908i3DrJs
 MvqyzPuqvSZwsIV4dT8UfibcyiVBwGDngoKDymuLpKsvwj83m3cb2Wr1/ 4=;
X-IronPort-AV: E=Sophos;i="5.99,193,1677542400"; d="scan'208";a="1122311745"
Subject: Re: [RFC PATCH 0/1] Implement entropy leak reporting for virtio-rng
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-pdx-2c-m6i4x-fad5e78e.us-west-2.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-9103.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 13:36:40 +0000
Received: from EX19D016EUA002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2c-m6i4x-fad5e78e.us-west-2.amazon.com (Postfix)
 with ESMTPS id E1792A06B7; Thu, 13 Apr 2023 13:36:39 +0000 (UTC)
Received: from EX19D037EUB003.ant.amazon.com (10.252.61.119) by
 EX19D016EUA002.ant.amazon.com (10.252.50.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 13 Apr 2023 13:36:38 +0000
Received: from [192.168.5.174] (10.1.212.5) by EX19D037EUB003.ant.amazon.com
 (10.252.61.119) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Thu, 13 Apr
 2023 13:36:34 +0000
Message-ID: <ddcb2bd7-964a-331a-d847-494c74a31667@amazon.es>
Date: Thu, 13 Apr 2023 15:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Amit Shah <amit@infradead.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, <qemu-devel@nongnu.org>,
 <sgarzare@redhat.com>, <graf@amazon.de>, <xmarcalx@amazon.co.uk>
References: <20230403105245.29499-1-bchalios@amazon.es>
 <b6724d973b276a3252e640cf687cad484fe3fbff.camel@infradead.org>
 <CAHmME9ru1tONrB+SV2sXBLBDZey9AuLi1D7R_wzH3y00uUshQg@mail.gmail.com>
From: Babis Chalios <bchalios@amazon.es>
In-Reply-To: <CAHmME9ru1tONrB+SV2sXBLBDZey9AuLi1D7R_wzH3y00uUshQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.1.212.5]
X-ClientProxiedBy: EX19D043UWC003.ant.amazon.com (10.13.139.240) To
 EX19D037EUB003.ant.amazon.com (10.252.61.119)
Precedence: Bulk
Received-SPF: pass client-ip=207.171.188.200;
 envelope-from=prvs=460663493=bchalios@amazon.es; helo=smtp-fw-9103.amazon.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.083, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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



On 11/4/23 18:20, Jason A. Donenfeld wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>
>
>
> On Tue, Apr 11, 2023 at 6:19 PM Amit Shah <amit@infradead.org> wrote:
>> Hey Babis,
>>
>> On Mon, 2023-04-03 at 12:52 +0200, Babis Chalios wrote:
>>> This patchset implements the entropy leak reporting feature proposal [1]
>>> for virtio-rng devices.
>>>
>>> Entropy leaking (as defined in the specification proposal) typically
>>> happens when we take a snapshot of a VM or while we resume a VM from a
>>> snapshot. In these cases, we want to let the guest know so that it can
>>> reset state that needs to be uniqueue, for example.
>>>
>>> This feature is offering functionality similar to what VMGENID does.
>>> However, it allows to build mechanisms on the guest side to notify
>>> user-space applications, like VMGENID for userspace and additionally for
>>> kernel.
>>>
>>> The new specification describes two request types that the guest might
>>> place in the queues for the device to perform, a fill-on-leak request
>>> where the device needs to fill with random bytes a buffer and a
>>> copy-on-leak request where the device needs to perform a copy between
>>> two guest-provided buffers. We currently trigger the handling of guest
>>> requests when saving the VM state and when loading a VM from a snapshot
>>> file.
>>>
>>> This is an RFC, since the corresponding specification changes have not
>>> yet been merged. It also aims to allow testing a respective patch-set
>>> implementing the feature in the Linux front-end driver[2].
>>>
>>> However, I would like to ask the community's opinion regarding the
>>> handling of the fill-on-leak requests. Essentially, these requests are
>>> very similar to the normal virtio-rng entropy requests, with the catch
>>> that we should complete these requests before resuming the VM, so that
>>> we avoid race-conditions in notifying the guest about entropy leak
>>> events. This means that we cannot rely on the RngBackend's API, which is
>>> asynchronous. At the moment, I have handled that using getrandom(), but
>>> I would like a solution which doesn't work only with (relatively new)
>>> Linux hosts. I am inclined to solve that by extending the RngBackend API
>>> with a synchronous call to request for random bytes and I'd like to hear
>>> opinion's on this approach.
>> The patch looks OK - I suggest you add a new sync call that also probes
>> for the availability of getrandom().
> qemu_guest_getrandom_nofail?

That should work, I think. Any objections to this Amit?

Cheers,
Babis

