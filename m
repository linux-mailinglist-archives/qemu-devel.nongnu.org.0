Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776381CE758
	for <lists+qemu-devel@lfdr.de>; Mon, 11 May 2020 23:22:45 +0200 (CEST)
Received: from localhost ([::1]:42370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYFsp-0000Gc-RZ
	for lists+qemu-devel@lfdr.de; Mon, 11 May 2020 17:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jYFrl-0007jQ-0T
 for qemu-devel@nongnu.org; Mon, 11 May 2020 17:21:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43846
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jYFrk-0007Nr-Az
 for qemu-devel@nongnu.org; Mon, 11 May 2020 17:21:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589232095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TR2jGqO+5kRNtV89ZiK2T/UoGvctN4DCMgqWZq6b5eE=;
 b=XbJ4AI5Haen43LEkoACa6GBKKCY1FgdahR269XTsXHEoP/phXrtt/imyb1tXkzd4RuR/ce
 IzfcP+LTB8+jPcf8QBFSYN8VPL4N4Z+Qjg3zP7vz9AorbP+te3zkWxvOZJVVNieIXVMKv0
 3/EMCF/awVyvSS6BGVNUcvk+78939mc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-2cOjLtmTNbGkfpfkcgjKyg-1; Mon, 11 May 2020 17:21:17 -0400
X-MC-Unique: 2cOjLtmTNbGkfpfkcgjKyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C28B18FE875;
 Mon, 11 May 2020 21:21:16 +0000 (UTC)
Received: from [10.3.116.145] (ovpn-116-145.phx2.redhat.com [10.3.116.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6393B5D9DD;
 Mon, 11 May 2020 21:21:15 +0000 (UTC)
Subject: Re: [PATCH v3 3/9] block: Make it easier to learn which BDS support
 bitmaps
From: Eric Blake <eblake@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20200508180340.675712-1-eblake@redhat.com>
 <20200508180340.675712-4-eblake@redhat.com>
 <aba3eddd-1201-9182-6011-9fe0bbca1b76@redhat.com>
 <b6c61cc5-8a7c-ef2c-76f1-def580827e14@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bb0d4599-10ec-0170-50a6-7c8d70e67a25@redhat.com>
Date: Mon, 11 May 2020 16:21:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b6c61cc5-8a7c-ef2c-76f1-def580827e14@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 02:55:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/20 1:16 PM, Eric Blake wrote:
> On 5/11/20 4:21 AM, Max Reitz wrote:

>>> +++ b/include/block/block_int.h
>>> @@ -560,6 +560,7 @@ struct BlockDriver {
>>>                                uint64_t parent_perm, uint64_t 
>>> parent_shared,
>>>                                uint64_t *nperm, uint64_t *nshared);
>>>
>>> +    bool (*bdrv_dirty_bitmap_supported)(BlockDriverState *bs);
>>
>> All BDSs support bitmaps, but only some support persistent dirty
>> bitmaps, so I think the name should reflect that.
> 
> How about .bdrv_dirty_bitmap_supports_persistent?

Bike-shedding myself, it looks like 
.bdrv_supports_persistent_dirty_bitmap is better (if you go by the 
naming convention 'noun-verb-details', it makes more sense that a 'bdrv' 
supports 'persistent dirty bitmaps', than that a 'bdrv dirty bitmap' 
supports 'persistence', particularly when the parameter is a 
BlockDriverState rather than a BdrvDirtyBitmap).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


