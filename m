Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CB833066D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 04:28:21 +0100 (CET)
Received: from localhost ([::1]:42120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ6ZA-00015r-Kd
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 22:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lJ6XT-0000Pv-2F
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:26:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lJ6XQ-0005Nq-VZ
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 22:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615173991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/DXgxrye1GMsuCJN7LGHn57P9Z8tjFwVbk755GZ/kY=;
 b=PSDwHGRBdwx6TA1SOUm9k7N6qMdUA+oBJj/QbrlJVs9ESKXT7p9yB0YZhdrpBNWe/pKUB8
 ld0iHxqEgU5vN3U5GkZJYdyqoB20q7/5KelMT+lV0AclUSy/MQR3a/znepvuWXovDXYO1l
 1/oFrlrdlv8Kl57D98cxKRTQsnStFmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-TyXKGJIZN5-99kRQNfhUsg-1; Sun, 07 Mar 2021 22:26:29 -0500
X-MC-Unique: TyXKGJIZN5-99kRQNfhUsg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 605F326862;
 Mon,  8 Mar 2021 03:26:28 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-193.pek2.redhat.com
 [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBA39179B3;
 Mon,  8 Mar 2021 03:26:24 +0000 (UTC)
Subject: Re: [PATCH V4 00/10] Detect reentrant RX casued by loopback
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-security@nongnu.org
References: <20210305062638.6749-1-jasowang@redhat.com>
 <79eb1502-9bcd-febc-2fd6-b8bd2c47e4f4@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <87835a6a-a3b6-6511-b3b5-a933280b54c8@redhat.com>
Date: Mon, 8 Mar 2021 11:26:23 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <79eb1502-9bcd-febc-2fd6-b8bd2c47e4f4@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alxndr@bu.edu, ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/5 5:38 下午, Philippe Mathieu-Daudé wrote:
> On 3/5/21 7:26 AM, Jason Wang wrote:
>> Hi All:
>>
>> Followed by commit 22dc8663d9 ("net: forbid the reentrant RX"), we
>> still need to fix the issues casued by loopback mode where the NIC
>> usually it via calling nc->info->receive() directly.
>>
>> The fix is to introduce new network helper and check the
>> queue->delivering.
>>
>> This series addresses CVE-2021-3416.
>>
>> Thanks
>>
>> Changes since V3:
>> - clarify CVE number in the commit log
>> - ident fix
>>
>> Changes since V2:
>> - add more fixes from Alexander
>>
>> Changes since V1:
>>
>> - Fix dp8393x compiling
>> - Add rtl8139 fix
>> - Tweak the commit log
>> - Silent patchew warning
>>
>> Alexander Bulekov (4):
>>    rtl8139: switch to use qemu_receive_packet() for loopback
>>    pcnet: switch to use qemu_receive_packet() for loopback
>>    cadence_gem: switch to use qemu_receive_packet() for loopback
>>    lan9118: switch to use qemu_receive_packet() for loopback
>>
>> Jason Wang (6):
>>    net: introduce qemu_receive_packet()
>>    e1000: switch to use qemu_receive_packet() for loopback
>>    dp8393x: switch to use qemu_receive_packet() for loopback packet
>>    msf2-mac: switch to use qemu_receive_packet() for loopback
>>    sungem: switch to use qemu_receive_packet() for loopback
>>    tx_pkt: switch to use qemu_receive_packet_iov() for loopback
>>
>>   hw/net/cadence_gem.c |  4 ++--
>>   hw/net/dp8393x.c     |  2 +-
>>   hw/net/e1000.c       |  2 +-
>>   hw/net/lan9118.c     |  2 +-
>>   hw/net/msf2-emac.c   |  2 +-
>>   hw/net/net_tx_pkt.c  |  2 +-
>>   hw/net/pcnet.c       |  2 +-
>>   hw/net/rtl8139.c     |  2 +-
>>   hw/net/sungem.c      |  2 +-
>>   include/net/net.h    |  5 +++++
>>   include/net/queue.h  |  8 ++++++++
>>   net/net.c            | 38 +++++++++++++++++++++++++++++++-------
>>   net/queue.c          | 22 ++++++++++++++++++++++
>>   13 files changed, 76 insertions(+), 17 deletions(-)
>>
> LGTM, maybe worth adding the "Cc: qemu-stable@nongnu.org" tag
> when applying.


Yes, will do.

Thanks


>


