Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D4F36C004
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 09:20:25 +0200 (CEST)
Received: from localhost ([::1]:41952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbI1A-0000z1-P1
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 03:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbHye-0006Rp-Ee
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lbHyc-0008Cs-VN
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 03:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619507866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXsGrOEi5LTWps70knkaehuWV68DlI1Hun21lcvAYGk=;
 b=Qxy1Jqi+J76C7yelW9SvBOe61JRQLAyLGyAWpaWgO+ypoM9vkPlpSRA8wSuV1Xo4KgnvLe
 c4mpaa35PlG988NcsdVr3gdq81uVL3SReHW7DEG1fWm//PD/WlxQ8TLFR6ZT6xMA2jq9V+
 MMlqFG2LtBHGh8YvIdjaw4C8f5ZSlyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-rKZL76s5O_eapdZV-D5fWw-1; Tue, 27 Apr 2021 03:17:44 -0400
X-MC-Unique: rKZL76s5O_eapdZV-D5fWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B39AC108BD13
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:17:43 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-153.pek2.redhat.com
 [10.72.13.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CE74687F8;
 Tue, 27 Apr 2021 07:17:41 +0000 (UTC)
Subject: Re: [PATCH v6 2/9] virtio-pci:decouple virtqueue from interrupt
 setting process
From: Jason Wang <jasowang@redhat.com>
To: Cindy Lu <lulu@redhat.com>, mst@redhat.com, qemu-devel@nongnu.org
References: <20210427033951.29805-1-lulu@redhat.com>
 <20210427033951.29805-3-lulu@redhat.com>
 <78e0debd-a63f-cffc-b252-b138fef4c12d@redhat.com>
Message-ID: <33a2dc11-902e-81c6-7a28-670dbeaf45f9@redhat.com>
Date: Tue, 27 Apr 2021 15:17:40 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <78e0debd-a63f-cffc-b252-b138fef4c12d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/4/27 下午2:40, Jason Wang 写道:
>>   static int virtio_pci_vq_vector_unmask(VirtIOPCIProxy *proxy,
>>                                          unsigned int queue_no,
>>                                          unsigned int vector,
>> -                                       MSIMessage msg)
>> +                                       MSIMessage msg,
>> +                                        EventNotifier *n)
>
>
> So you switch to use EventNotifier but keep using queue_no/vector, 
> this looks kind of duplication.
>
> If we can keep queue_no or virtio_queue_get_guest_notifier working as 
> in the past, I don't see any reason for this effort.


Ok I see it is because we need to support config interrupt.

But using queue_no/vector/n at the same time is a hint that the decouple 
is not done completely.

Thanks


>
> Thanks 


