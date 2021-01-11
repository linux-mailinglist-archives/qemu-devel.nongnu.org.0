Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C94A2F1B04
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 17:35:56 +0100 (CET)
Received: from localhost ([::1]:51806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0Ac-00040I-PI
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 11:35:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kz085-0002r0-01
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:33:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kz081-0007xn-Gs
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 11:33:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610382792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrzpZLuK0mmo3/DebHEHWvoZZRZIYdeeUBy6NklkoKg=;
 b=ZIjok5WqnSkSLqU2Oofa7vDu0Xo1TE7NJ8xcoMm4ypuYkkxZ6HNpGfCIsqMkYKeSqXvk47
 uWvGr4rIahegQUepnmRzcNSqiPvuhFAMGOu5jlm9Cg69dzOYI8nQIPLR8VnFyuh3K/NjfB
 ZrCpdQZSd18tg2knBWfUqH8Qr+6JiQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-fmGWTN6KNFO2RnpSIiX6vg-1; Mon, 11 Jan 2021 11:33:10 -0500
X-MC-Unique: fmGWTN6KNFO2RnpSIiX6vg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ADC4800050;
 Mon, 11 Jan 2021 16:33:09 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-112-114.ams2.redhat.com
 [10.36.112.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3F1C60BE2;
 Mon, 11 Jan 2021 16:32:58 +0000 (UTC)
Subject: Re: [PATCH] vhost-user-fs: add the "bootindex" property
To: Cornelia Huck <cohuck@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210104132401.5100-1-lersek@redhat.com>
 <20210111172208.59a59109.cohuck@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <dab59f0a-023f-eade-27ce-506200f51ef4@redhat.com>
Date: Mon, 11 Jan 2021 17:32:57 +0100
MIME-Version: 1.0
In-Reply-To: <20210111172208.59a59109.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 virtio-fs@redhat.com, qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/11/21 17:22, Cornelia Huck wrote:
> On Mon,  4 Jan 2021 14:24:01 +0100
> Laszlo Ersek <lersek@redhat.com> wrote:
> 
>> virtio-fs qualifies as a bootable device minimally under OVMF, but
>> currently the necessary "bootindex" property is missing (fw_cfg kernel
>> boot notwithstanding).
>>
>> Add the property. For completeness, add it to the CCW device as well;
>> other virtio-ccw devices seem to have "bootindex" properties too.
>>
>> Example OpenFirmware device path for the "vhost-user-fs-pci" device in the
>> "bootorder" fw_cfg file:
>>
>>   /pci@i0cf8/pci-bridge@1,6/pci1af4,105a@0/filesystem@0
>>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Halil Pasic <pasic@linux.ibm.com>
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> Cc: qemu-s390x@nongnu.org
>> Cc: virtio-fs@redhat.com
>> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
>> ---
>>  include/hw/virtio/vhost-user-fs.h |  1 +
>>  hw/s390x/vhost-user-fs-ccw.c      |  2 ++
>>  hw/virtio/vhost-user-fs-pci.c     |  2 ++
>>  hw/virtio/vhost-user-fs.c         | 10 ++++++++++
>>  4 files changed, 15 insertions(+)
>>
> 
> I agree that you should just drop the ccw hunk for now. The rest of the
> patch looks good to me.
> 

Thank you as well -- with the ccw hunk gone, I guess the CC list will be
shorter in v2, too :)

Dave, Stefan, Michael -- can you please comment? For the files to remain
in v2, "get_maintainer.pl" gives me:

"Dr. David Alan Gilbert" <dgilbert@redhat.com> (supporter:virtiofs)
"Michael S. Tsirkin" <mst@redhat.com> (supporter:vhost)
"Michael S. Tsirkin" <mst@redhat.com> (supporter:virtio)
Stefan Hajnoczi <stefanha@redhat.com> (supporter:virtiofs)

Thanks
Laszlo


