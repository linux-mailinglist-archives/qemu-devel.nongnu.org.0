Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDF2323E9C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:45:06 +0100 (CET)
Received: from localhost ([::1]:41998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuTR-0001GM-BL
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:45:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lEu2U-0005MT-TB
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:17:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lEu2Q-0006dB-Pk
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hupWbg4zyTMMXDvwKczKsW0TJfmHBBcfoa9ppxyPO0g=;
 b=AC2vZ3IGQea/Qk9vepTV5qaNf+fjiu3bA73iOw5fjptdZxqKDCqALNeFfwBbRvV6i750tQ
 grA84p6szm7sfZKOQaR67y9r21dK/QmiLVWgY+rM2KzixkLr1A6bfiPq+s068tTx4wIVk5
 SbuuK3FREUhehmD3PNJyGckdWGAMguw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-WxCEVboqOJGVFG_L5HhFCg-1; Wed, 24 Feb 2021 08:17:08 -0500
X-MC-Unique: WxCEVboqOJGVFG_L5HhFCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6867A195D560;
 Wed, 24 Feb 2021 13:17:06 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-168.pek2.redhat.com
 [10.72.12.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 065DA60C61;
 Wed, 24 Feb 2021 13:17:04 +0000 (UTC)
Subject: Re: [PATCH 1/6] net: introduce qemu_receive_packet()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-2-jasowang@redhat.com>
 <9e432ff0-793e-64a7-97f3-ff3a374ee98f@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b7d39898-d688-70bb-4546-612150a1635b@redhat.com>
Date: Wed, 24 Feb 2021 21:17:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9e432ff0-793e-64a7-97f3-ff3a374ee98f@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
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


On 2021/2/24 6:11 下午, Philippe Mathieu-Daudé wrote:
> On 2/24/21 6:53 AM, Jason Wang wrote:
>> Some NIC supports loopback mode and this is done by calling
>> nc->info->receive() directly which in fact suppresses the effort of
>> reentrancy check that is done in qemu_net_queue_send().
>>
>> Unfortunately we can use qemu_net_queue_send() here since for loop
>> back there's no sender as peer, so this patch introduce a
>> qemu_receive_packet() which is used for implementing loopback mode
>> for a NIC with this check.
> IIUC the guest could trigger an infinite loop and brick the emulated
> device model. Likely exhausting the stack, so either SEGV by
> corruption or some ENOMEM?


Yes.


>
> Since this is guest triggerable, shouldn't we contact qemu-security@
> list and ask for a CVE for this issue, so distributions can track
> the patches to backport in their stable releases? (it seems to be
> within the KVM devices boundary).


That's the plan. I discussed this with Prasad before and he promise to 
ask CVE for this.

But it's a knwon issue, the reentrant DMA which has been discussed 
before[1], unfortuantely we don't make any progress. This patch can only 
fix the NIC RX issue.

Thanks

[1] https://mail.gnu.org/archive/html/qemu-devel/2020-09/msg00906.html


>
>> NIC that supports loopback mode will be converted to this helper.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   include/net/net.h   |  5 +++++
>>   include/net/queue.h |  8 ++++++++
>>   net/net.c           | 38 +++++++++++++++++++++++++++++++-------
>>   net/queue.c         | 22 ++++++++++++++++++++++
>>   4 files changed, 66 insertions(+), 7 deletions(-)


