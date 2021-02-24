Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59675324297
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:56:56 +0100 (CET)
Received: from localhost ([::1]:53118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lExT4-0001bN-Sv
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lExQo-0000ht-HH
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:54:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lExQj-0005p7-DV
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614185666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jg+lr1Q23xsv/hReDIvnkFS++6cxr9zDH9cGkdajhGQ=;
 b=VXJfOTvl/QVbdOiquJfoRc1eBwD9TKLfNNxdy+QAbUaxHNA7Wn+KpnPyY5DQ67EMDUjVJ5
 KRSMFjwFdDvl9h1LqEQ2B+ttuFs4ShgBx5Y0mSpMXnG0z6mN7XC7rzHvSyedsedfaJVQ1G
 iILHhSw1s8opSfXN/d7/IZC5WQ/mCsY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-QIVzdrroPJ25RJepyHpBtw-1; Wed, 24 Feb 2021 11:54:24 -0500
X-MC-Unique: QIVzdrroPJ25RJepyHpBtw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D126108C310;
 Wed, 24 Feb 2021 16:54:23 +0000 (UTC)
Received: from [10.36.114.83] (ovpn-114-83.ams2.redhat.com [10.36.114.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E1955D9D7;
 Wed, 24 Feb 2021 16:54:13 +0000 (UTC)
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, Peter Xu <peterx@redhat.com>
References: <20210211210549.GE157159@xz-x1>
 <4E588B57-AAC8-40DD-9260-541836074DB3@redhat.com>
 <20210212030621.GF157159@xz-x1>
 <79c3ebb9-82ba-4714-0cf1-9f2e08eff660@redhat.com>
 <20210212161125.GH157159@xz-x1>
 <add5eef8-ff5b-5708-5383-f76262738e94@virtuozzo.com>
 <20210216233545.GD91264@xz-x1>
 <add9a7f7-9e02-5024-4bfd-2597a8920ec5@virtuozzo.com>
 <20210219205052.GK6669@xz-x1>
 <d5abc500-a7b2-cf25-db88-b6d4284b910f@virtuozzo.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <6bb24cdb-3f0e-6924-2891-5bf695267615@redhat.com>
Date: Wed, 24 Feb 2021 17:54:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d5abc500-a7b2-cf25-db88-b6d4284b910f@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> Anyhow I'm quite sure that adding global MISSING handler for snapshotting
>>> is too heavy and not really needed.
>> UFFDIO_ZEROCOPY installs a zero pfn and that should be all of it.  There'll
>> definitely be overhead, but it may not be that huge as imagined.  Live snapshot
>> is great in that we have point-in-time image of guest without stopping the
>> guest, so taking slightly longer time won't be a huge loss to us too.
>>
>> Actually we can also think of other ways to work around it.  One way is we can
>> pre-fault all guest pages before wr-protect.  Note that we don't need to write
>> to the guest page because read would suffice, since uffd-wp would also work
>> with zero pfn.  It's just that this workaround won't help on saving snapshot
>> disk space, but it seems working.  It would be great if you have other
>> workarounds, maybe as you said UFFDIO_ZEROCOPY is not the only route.
>>
>> Thanks,
>>
> Just to add: one of the good options is too keep track of virtio-baloon discarded pages and
> pre-fault them before migration starts. What do you think?

Just pre-fault everything and inhibit the balloon. That should work.

-- 
Thanks,

David / dhildenb


