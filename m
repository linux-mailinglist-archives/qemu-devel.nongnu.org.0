Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28637500E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 09:22:06 +0200 (CEST)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leYKj-0006AJ-6s
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 03:22:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leYJW-0005cc-J8
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:20:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1leYJS-0003G0-HN
 for qemu-devel@nongnu.org; Thu, 06 May 2021 03:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620285644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnDc12VTn+LodLns8DoZPbV13/LygVebbZiKyVJPZSY=;
 b=dwVMiaD7AE5LCZGIMUryP7+GZHCmMpLDX8UJp1PL04PV32U10K9E46TgTHtY0jtPxyq+1X
 juAbO1/cQO9Grqa8mY03aiiVM4Q9X6Db2qMil7PgqlPdtkHhZNzu8yqOtXDR14Q8cCpJdQ
 04SBdTF3gGXGg90cg4Si27W4CYRPOb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-wYx3fmemOzqoaULXXS4Img-1; Thu, 06 May 2021 03:20:42 -0400
X-MC-Unique: wYx3fmemOzqoaULXXS4Img-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E62BE80059E
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 07:20:41 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-3.pek2.redhat.com
 [10.72.13.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D9DA5B4B5
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 07:20:41 +0000 (UTC)
Subject: Re: [PATCH 0/2] vhost-vDPA: doorbell mapping support
To: qemu-devel@nongnu.org
References: <20210415080444.44645-1-jasowang@redhat.com>
 <20210504043623-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <3aebbc13-bb2d-405e-06f7-b6aec4ca290f@redhat.com>
Date: Thu, 6 May 2021 15:20:39 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210504043623-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/5/4 ÏÂÎç4:38, Michael S. Tsirkin Ð´µÀ:
> On Thu, Apr 15, 2021 at 04:04:42PM +0800, Jason Wang wrote:
>> Hi All:
>>
>> This series tries to implement doorbell mapping support for
>> vhost-vDPA. Tested with virtio-pci vDPA driver.
> BTW I'd rather we used the kick/call terminology from the virtio
> spec. doorbell terminology seems to be originating from e1000
> which has a register named like this.


Ok, will rename in next version.

Thanks


>
>> Please review.
>>
>> Jason Wang (2):
>>    vhost-vdpa: skip ram device from the IOTLB mapping
>>    vhost-vdpa: doorbell mapping support
>>
>>   hw/virtio/vhost-vdpa.c         | 97 ++++++++++++++++++++++++++++++----
>>   include/hw/virtio/vhost-vdpa.h |  7 +++
>>   2 files changed, 94 insertions(+), 10 deletions(-)
>>
>> -- 
>> 2.25.1
>


