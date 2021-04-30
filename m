Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96A636F680
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 09:44:34 +0200 (CEST)
Received: from localhost ([::1]:51636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcNpB-0007Ar-ST
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 03:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcNn6-0006DJ-Gl
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:42:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lcNn3-0000tV-Ln
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 03:42:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619768540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gJGX4c2vdR+l3iIt9nNLPh5PbvjNXAyaPw8aIJ1gqvM=;
 b=MQdiCqtBdugpHiGepukvJOIvmYwJvFQFHOGPgvXnvYrhcE8nte3gsaCZc9qIO+Gr0j3IXd
 5AhdRaTxbxOpeLBpZPxEZvy8mZeSas04r2OrmmurWOUo1UGOY8tzDV1GMOk1qQvSJF05bX
 e1JZzRZ/wWqJ59Pn9iunODTC9XNeg/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-TjQ2TbVPO3yqOjwayF7r8g-1; Fri, 30 Apr 2021 03:42:18 -0400
X-MC-Unique: TjQ2TbVPO3yqOjwayF7r8g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8481E8186E8;
 Fri, 30 Apr 2021 07:42:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97E39100EBAF;
 Fri, 30 Apr 2021 07:42:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1CF98113525D; Fri, 30 Apr 2021 09:42:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH] virtio-blk: drop deprecated scsi=on|off property
References: <20210429155221.1226561-1-stefanha@redhat.com>
 <20210429180352.ohhfz4kwyxapbiyl@habkost.net>
Date: Fri, 30 Apr 2021 09:42:05 +0200
In-Reply-To: <20210429180352.ohhfz4kwyxapbiyl@habkost.net> (Eduardo Habkost's
 message of "Thu, 29 Apr 2021 14:03:52 -0400")
Message-ID: <87lf905icy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>, libvir-list@redhat.com, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Christoph Hellwig <hch@lst.de>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Thu, Apr 29, 2021 at 04:52:21PM +0100, Stefan Hajnoczi wrote:
>> The scsi=on|off property was deprecated in QEMU 5.0 and can be removed
>> completely at this point.
>> 
>> Drop the scsi=on|off option. It was only available on Legacy virtio-blk
>> devices. Linux v5.6 already dropped support for it.
>> 
>> Remove the hw_compat_2_4[] property assignment since scsi=on|off no
>> longer exists. Old guests with Legacy virtio-blk devices no longer see
>> the SCSI host features bit.
>> 
>
> This means pc-2.4 will now break guest ABI if using virtio-blk
> devices, correct?
>
> This looks like a sign we should have deprecated pc-2.4 a long
> time ago.

The last batch of PC machine type retiring was pc-1.0 to pc-1.3:
deprecated in 5.0 (commit 30d2a17b4, Dec 2019), dropped in 6.0 (commit
f862ddbb1, just weeks ago).  pc-1.3 was a bit over seven years old when
we released 5.0.  pc-2.4 will be six years old by the time we release
6.1.  Fair game?

>> Live migrating old guests from an old QEMU with the SCSI feature bit
>> enabled will fail with "Features 0x... unsupported. Allowed features:
>> 0x...". We've followed the QEMU deprecation policy so users have been
>> warned...
>> 
>
> Were they really warned, though?  People running
> "-machine pc-i440fx-2.4" might be completely unaware that it was
> silently enabling a deprecated feature.

We've gotten better at documenting deprecations, but we're still bad at
warning on use of deprecated features.

[...]


