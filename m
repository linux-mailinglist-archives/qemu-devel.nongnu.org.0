Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F90A2F1ABD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:18:11 +0100 (CET)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyztS-00053w-Em
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kyzs6-0004MX-Kq
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kyzrw-0005Sm-SA
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610381795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3M4n0tGy0gX+1wZ4rOYm30H+vF6jfgBgyniuxQsf5DQ=;
 b=Ldcvpxj+0UdbSvQXG4bg8UrAj1P11fDBcsogYWKadJenbfqEfytW9y9Zow3tQ1EIZQbFO1
 9k2as3ets1y9x1k0iRHdwQHo0zhRl4fhdqUIwPtL+P+yBLJRf/PGXzGMaBnGG1KKzBr2nZ
 REDQLaYzVDuN4BdaGpo+GRSzTFxWr0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-y7sEv1P_NduFxKnusnhElg-1; Mon, 11 Jan 2021 11:16:31 -0500
X-MC-Unique: y7sEv1P_NduFxKnusnhElg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42FAA15723;
 Mon, 11 Jan 2021 16:16:30 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-114.ams2.redhat.com
 [10.36.112.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F34019C59;
 Mon, 11 Jan 2021 16:16:19 +0000 (UTC)
Subject: Re: [PATCH] vhost-user-fs: add the "bootindex" property
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu devel list <qemu-devel@nongnu.org>
References: <20210104132401.5100-1-lersek@redhat.com>
 <f296274e-3c4b-bb90-ca4a-273c3bd97f7f@de.ibm.com>
 <d9f913fa-9d1b-8d52-d98b-ae558e4406ca@redhat.com>
 <656f8775-aeb4-3feb-0373-5f9024c6c7aa@de.ibm.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <62389313-313b-ce99-0522-f7d4ccc76c95@redhat.com>
Date: Mon, 11 Jan 2021 17:16:19 +0100
MIME-Version: 1.0
In-Reply-To: <656f8775-aeb4-3feb-0373-5f9024c6c7aa@de.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 qemu-s390x@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/21 11:07, Christian Borntraeger wrote:
> 
> 
> On 11.01.21 11:05, Laszlo Ersek wrote:
>> On 01/11/21 10:46, Christian Borntraeger wrote:
>>>
>>>
>>> On 04.01.21 14:24, Laszlo Ersek wrote:
>>>> virtio-fs qualifies as a bootable device minimally under OVMF, but
>>>> currently the necessary "bootindex" property is missing (fw_cfg kernel
>>>> boot notwithstanding).
>>>>
>>>> Add the property. For completeness, add it to the CCW device as well;
>>>> other virtio-ccw devices seem to have "bootindex" properties too.
>>>
>>> Currently we do not have boot support for virtiofs on s390x (ccw)
>>> Not sure if it is better if we should add the property now or whenever
>>> boot support is implemented. 
>>> As of today we do have bootindex for block and net. Maybe it is better
>>> to defer bootindex for virtio-fs-ccw until we can boot from it? In
>>> that way management software can detect if this is bootable or not?
>>
>> Sure, I can drop the "vhost-user-fs-ccw.c hunk".
>>
>> (I guess I could even lift the property itself (replacing the alias) to
>> "vhost-user-fs-pci.c", for now -- what's everyone's take on that?)
> 
> Keep it as is. This would simplify a later addition to ccw.
> 

Thanks!

I'll wait for some feedback from the other reviewers, before posting v2.

Laszlo


