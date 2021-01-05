Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB77D2EA459
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 05:18:28 +0100 (CET)
Received: from localhost ([::1]:60594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwdnf-0007aW-FR
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 23:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kwdmt-00079U-1c
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 23:17:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kwdmq-0000L5-0B
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 23:17:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609820253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WO7kcsUeaYarXzwxJAAXSorEDpvIrUhETd9VcjbJxpg=;
 b=GhPmjOlWiU82PnlyBD38GitJx8mL0iiIr64xyJZVwHz2piV1bi2u14nchdROxktUF/DUBl
 6Oq2lhtP8HyIiOGkac/39B0YBfWCTuzKTA8yUERmcUl9bp66X1M7HXG/w1p+vbDLMBKyxy
 TzidEd2pj0dMv0oxzOU/ROvRXNC7UuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-swPui4lkOf-AlXPh0w9fOQ-1; Mon, 04 Jan 2021 23:17:29 -0500
X-MC-Unique: swPui4lkOf-AlXPh0w9fOQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAB311005E41;
 Tue,  5 Jan 2021 04:17:28 +0000 (UTC)
Received: from [10.72.13.192] (ovpn-13-192.pek2.redhat.com [10.72.13.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9395D70955;
 Tue,  5 Jan 2021 04:17:26 +0000 (UTC)
Subject: Re: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
To: "Zhang, Chen" <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-2-chen.zhang@intel.com>
 <08fe5c51-1383-12dd-b255-151a868cd6d9@redhat.com>
 <a4adb965911348f4901f72e7e472c07e@intel.com>
 <97d593c2-222d-a3cf-e797-8d77b8701bed@redhat.com>
 <704028b0dbf843ed9ae64b93ecd1db13@intel.com>
 <05999128-75c0-aeaf-255f-8c1ec7699eab@redhat.com>
 <666f41843baf4c84bbafa7f9fdfba96f@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0456c436-40fc-f0e5-2d3b-af348bf5c446@redhat.com>
Date: Tue, 5 Jan 2021 12:17:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <666f41843baf4c84bbafa7f9fdfba96f@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/5 上午11:28, Zhang, Chen wrote:
>
>> -----Original Message-----
>> From: Jason Wang <jasowang@redhat.com>
>> Sent: Wednesday, December 30, 2020 11:57 AM
>> To: Zhang, Chen <chen.zhang@intel.com>; qemu-dev <qemu-
>> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Dr. David Alan
>> Gilbert <dgilbert@redhat.com>; Markus Armbruster <armbru@redhat.com>
>> Cc: Zhang Chen <zhangckid@gmail.com>
>> Subject: Re: [PATCH 1/3] qapi/net: Add new QMP command for COLO
>> passthrough
>>
>>
>> On 2020/12/29 上午10:56, Zhang, Chen wrote:
>>>> I think we can start form COLO. To avoid QMP compatibility issues, I
>>>> would like to add the n tuple and wildcard support now.
>>> OK, I will do this job in next version.
>>> For the QMP compatibility issues, please give me a demo of what we want
>> to see, Like some existing commands.
>>
>>
>> I meant if we start from port and then want to add e.g n-tuple support.
>> Do we need to introduce another command? Or is there any introspection
>> that can let management layer know about this?
> OK, I will add the n-tuple support.
> It looks basic command are add/del connection, Do you think something needs to be introduced?


It looks to me it's fine to start with them.


> For the management layer, I don't know the detail process of how to add new Qemu command support for example libvirt.
> Maybe depend on libvirt community's plan?


So a question here, how COLO is being used now. Is it expected to be 
managed by libvirt or not?

Thanks


>
> Thanks
> Chen
>
>> Thanks
>>
>>
>>> Thanks
>>> Chen
>>>


