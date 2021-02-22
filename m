Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AC8321E48
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:40:20 +0100 (CET)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEFBz-0005l1-GU
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEF71-0000aH-Pg
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:35:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lEF6z-0000AT-HM
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 12:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614015308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQ7d2RUFB/Is9VuzqAL3aPM01ehb1s+UbydtIkVlhys=;
 b=SiUTYONBum5VHdCP3rNVKSPJiUSWWd4XwnTXciD0cPSB5FOgAaGpd1pVJ5Sdg6uG+/txRV
 AL/nlkFpnsPicZytUF5biDhsiYyct5mZdAwBo8zW+5PeozdzvvZ0IwcvWgDWMmqD00T7vX
 SeNSSUckTuKDIVkky+tpEshrm6ZJ57s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-kYP8lyj9PTGk3GTezvkHog-1; Mon, 22 Feb 2021 12:35:06 -0500
X-MC-Unique: kYP8lyj9PTGk3GTezvkHog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66110100947C;
 Mon, 22 Feb 2021 17:34:24 +0000 (UTC)
Received: from [10.36.115.16] (ovpn-115-16.ams2.redhat.com [10.36.115.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AAC85D9DE;
 Mon, 22 Feb 2021 17:33:28 +0000 (UTC)
Subject: Re: [PATCH v13 0/5] UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>, David Hildenbrand <dhildenb@redhat.com>
References: <20210219224719.GN6669@xz-x1>
 <68564940-6276-465D-9945-A50A900B90BF@redhat.com>
 <20210222172923.GS6669@xz-x1>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <79ce6a7e-c40b-b64e-757e-1ec6e4177310@redhat.com>
Date: Mon, 22 Feb 2021 18:33:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222172923.GS6669@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Den Lunev <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.02.21 18:29, Peter Xu wrote:
> On Sat, Feb 20, 2021 at 02:59:42AM -0500, David Hildenbrand wrote:
>> Live snapshotting ends up reading all guest memory (dirty bitmap starts with all 1s), which is not what we want for virtio-mem - we don’t want to read and migrate memory that has been discarded and has no stable content.
>>
>> For ordinary migration we use the guest page hint API to clear bits in the dirty bitmap after dirty bitmap sync. Well, if we don‘t do bitmap syncs we‘ll never clear any dirty bits. That‘s the problem.
> 
> Using dirty bitmap for that information is less efficient, becase it's
> definitely a larger granularity information than PAGE_SIZE.  If the disgarded
> ranges are always continuous and at the end of a memory region, we should have
> some parameter in the ramblock showing that where we got shrinked then we don't
> check dirty bitmap at all, rather than always assuming used_length is the one.

They are randomly scattered across the whole RAMBlock. Shrinking/growing 
will be done to some degree in the future (but it won't get rid of the 
general sparse layout we can produce).

-- 
Thanks,

David / dhildenb


