Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC0D33FD53
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 03:42:19 +0100 (CET)
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMic6-0001BV-PP
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 22:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMib8-0000lx-T8
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 22:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lMib6-0004RI-1l
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 22:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616035274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6qL8GmNFVtMg04lgRNN82hgVlE/gENsGCzcPy0zbzg=;
 b=Rcm+EyJjKkWzGbfbGMf8JDFsvTrFogy3funOJ7eLriE7CFe50gxfn1SdOPFUhR2ng3M32O
 B2invauUnpwf8kkgO1uJOnxKRN0qZQTSJjDjdRDPeb6ZkoO6k2d4jM2RBpPMV2VuyqH/wF
 V4SviDVNxNzMRok5IGWhXqfNmYxyQUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-oohoyAPIM4m_SafOnF6M1Q-1; Wed, 17 Mar 2021 22:41:10 -0400
X-MC-Unique: oohoyAPIM4m_SafOnF6M1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7458C1007467;
 Thu, 18 Mar 2021 02:41:09 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-131.pek2.redhat.com
 [10.72.13.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8A435B4A0;
 Thu, 18 Mar 2021 02:41:06 +0000 (UTC)
Subject: Re: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
To: "Zhang, Chen" <chen.zhang@intel.com>, Lukas Straub <lukasstraub2@web.de>
References: <cover.1605438886.git.lukasstraub2@web.de>
 <2cee934e177e4a778b3bcc8d5085f4f0@intel.com>
 <20210317222358.31864ded@gecko.fritz.box>
 <ea3c4558ebad42c8b12210c9b1b552de@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e50552b2-d9d5-97f0-5d5a-d162266b2084@redhat.com>
Date: Thu, 18 Mar 2021 10:41:05 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ea3c4558ebad42c8b12210c9b1b552de@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/3/18 ÉÏÎç9:22, Zhang, Chen Ð´µÀ:
> Sorry for the delay. Current COLO tree just merged this series,
> I originally wanted to merge other COLO related patches(Lei or me) and submit it together to Jason.
>
> Hi Jason, do you need me to send this series first or do you want to do it together?


We're in soft freeze, so if you can collect all the patches before hard 
free, that would be better.

Thanks


>
> Thanks
> Chen
>
>> -----Original Message-----
>> From: Lukas Straub <lukasstraub2@web.de>
>> Sent: Thursday, March 18, 2021 5:24 AM
>> To: Zhang, Chen <chen.zhang@intel.com>
>> Cc: qemu-devel <qemu-devel@nongnu.org>; Li Zhijian
>> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>
>> Subject: Re: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp packet
>>
>> Hi,
>> This hasn't been merged yet.
>>
>> Regards,
>> Lukas Straub
>>
>> On Mon, 16 Nov 2020 07:32:22 +0000
>> "Zhang, Chen" <chen.zhang@intel.com> wrote:
>>
>>> Queued this series to COLO tree.
>>>
>>> Thanks
>>> Chen
>>>
>>>> -----Original Message-----
>>>> From: Lukas Straub <lukasstraub2@web.de>
>>>> Sent: Sunday, November 15, 2020 7:19 PM
>>>> To: qemu-devel <qemu-devel@nongnu.org>
>>>> Cc: Zhang, Chen <chen.zhang@intel.com>; Li Zhijian
>>>> <lizhijian@cn.fujitsu.com>; Jason Wang <jasowang@redhat.com>
>>>> Subject: [PATCH 0/2] colo-compare: Fix memory leak for non-tcp
>>>> packet
>>>>
>>>> Hello Everyone,
>>>> This fixes a memory leak for non-tcp packets and optimizes the
>>>> removal from the queue.
>>>>
>>>> Lukas Straub (2):
>>>>    net/colo-compare.c: Fix memory leak for non-tcp packet
>>>>    net/colo-compare.c: Optimize removal of secondary packet
>>>>
>>>>   net/colo-compare.c | 3 ++-
>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> --
>>>> 2.20.1
>>
>>
>> --


