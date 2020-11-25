Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231FE2C448C
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 16:56:47 +0100 (CET)
Received: from localhost ([::1]:59140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khx9x-0002pg-L2
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 10:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1khx8R-0002F2-9Z
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 10:55:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1khx8N-0003RP-Uq
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 10:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606319705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBaXzrtRIr2C0Qm6sHPNk/xFVWr9PTSFrxWZdjT8ob0=;
 b=cbnbfrtXnvLHGFXHCHRAHwkIXXwPSZpyLYWcnPL4clt7XhQFSw/ALWe69toIhMlG0nPRcb
 smSu1BbA5XP9ccSFyVhEgXSIZGFqAT4lG6Lr4Y2ExnF+wo3cipNOkul1b1AhyOXeIkCxbG
 AwfDzo4UjGJ8qlL1fh0TccSKCYE9oME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-QBt13JZyOoOMWXr_CyCTGg-1; Wed, 25 Nov 2020 10:55:02 -0500
X-MC-Unique: QBt13JZyOoOMWXr_CyCTGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C9781074640;
 Wed, 25 Nov 2020 15:55:01 +0000 (UTC)
Received: from [10.36.112.131] (ovpn-112-131.ams2.redhat.com [10.36.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DFCD100AE2D;
 Wed, 25 Nov 2020 15:54:54 +0000 (UTC)
Subject: Re: [PATCH v2] hw/arm/virt enable support for virtio-mem
From: David Hildenbrand <david@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20201105174311.566751-1-Jonathan.Cameron@huawei.com>
 <5b1dff01-7e6b-78d2-d55a-20c0617c3076@redhat.com>
 <20201124181150.0000025f@Huawei.com>
 <f2cfd3cb-27c8-f25b-2b57-6dc983a25a43@redhat.com>
 <20201125145659.00004b3e@Huawei.com>
 <b83a1914-16ae-4f1a-318f-59920ecf17e2@redhat.com>
Organization: Red Hat GmbH
Message-ID: <7c635948-b78c-c28f-f170-dc9291af4fac@redhat.com>
Date: Wed, 25 Nov 2020 16:54:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b83a1914-16ae-4f1a-318f-59920ecf17e2@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, linuxarm@huawei.com,
 qemu-devel@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>>>
>>>> 64k guest on 4k host with 512MiB block size seems fine.
>>>>
>>>> If there are any places anyone thinks need particular poking I'd appreciate a hint :)  
>>>
>>> If things seem to work for now, that's great :) Thanks!
>>>
>> Cool.  I'll run a few more comprehensive tests then send out the
>> trivial patch to enable the kernel option + v2 of the qemu support.
> 
> Perfect, thanks!

Oh, btw, I have no idea what the state of vfio-pci + QEMU on arm64 is.
In case it's supposed to work, you could give

https://lkml.kernel.org/r/20201119153918.120976-1-david@redhat.com

to see what we're missing.

I added a short virtio-pci guide to

https://virtio-mem.gitlab.io/user-guide/user-guide-qemu.html

-- 
Thanks,

David / dhildenb


