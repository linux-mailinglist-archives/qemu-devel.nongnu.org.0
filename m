Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBCE319BB0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 10:15:17 +0100 (CET)
Received: from localhost ([::1]:40812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAUXk-0005Jq-C0
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 04:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAUWw-0004qY-VJ
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:14:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lAUWt-0000zx-Gu
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 04:14:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613121262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xogdQ6hg0jk48cjZj1bfIUunOC9ycCNvnrXyVgWf8Ys=;
 b=Itxa4d9bD3PJV5L73eUNYo2nK9crZVWSZItSMRiml0M2ZQNuLwnChRb2Mhh3PPNzBmUQWE
 JicuEnDgKBJ/V/L9iMr2GUQtbNDtgKTxBZaX55xMWs0a2UTCtB7vwJmIZ6dQHYeWrSzlYl
 LsP4iOU6JWrhDHzqFlQ3JZBAZLsUib4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-hyBBMHb9M8a6UTK044HmGg-1; Fri, 12 Feb 2021 04:14:18 -0500
X-MC-Unique: hyBBMHb9M8a6UTK044HmGg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E8C3801965;
 Fri, 12 Feb 2021 09:14:17 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-227.ams2.redhat.com
 [10.36.114.227])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A95CE10023AC;
 Fri, 12 Feb 2021 09:14:15 +0000 (UTC)
Subject: Re: [PATCH 2/2] file-posix: Cache next hole
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210211172242.146671-1-mreitz@redhat.com>
 <20210211172242.146671-3-mreitz@redhat.com>
 <feb0d8a5-28b9-852a-186b-618e82dd309a@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d6bfb96e-e841-95fd-e9be-70b89b950b12@redhat.com>
Date: Fri, 12 Feb 2021 10:14:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <feb0d8a5-28b9-852a-186b-618e82dd309a@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.02.21 21:38, Vladimir Sementsov-Ogievskiy wrote:
> 11.02.2021 20:22, Max Reitz wrote:
>> We have repeatedly received reports that SEEK_HOLE and SEEK_DATA are
>> slow on certain filesystems and/or under certain circumstances.  That is
>> why we generally try to avoid it (which is why bdrv_co_block_status()
>> has the @want_zero parameter, and which is why qcow2 has a metadata
>> preallocation detection, so we do not fall through to the protocol layer
>> to discover which blocks are zero, unless that is really necessary
>> (i.e., for metadata-preallocated images)).
>>
>> In addition to those measures, we can also try to speed up zero
>> detection by letting file-posix cache some hole location information,
>> namely where the next hole after the most recently queried offset is.
>> This helps especially for images that are (nearly) fully allocated,
>> which is coincidentally also the case where querying for zero
>> information cannot gain us much.
>>
>> Note that this of course only works so long as we have no concurrent
>> writers to the image, which is the case when the WRITE capability is not
>> shared.
>>
>> Alternatively (or perhaps as an improvement in the future), we could let
>> file-posix keep track of what it knows is zero and what it knows is
>> non-zero with bitmaps, which would help images that actually have a
>> significant number of holes (where this implementation here cannot do
>> much).  But for such images, SEEK_HOLE/DATA are generally faster (they
>> do not need to seek through the whole file), and the performance lost by
>> querying the block status does not feel as bad because it is outweighed
>> by the performance that can be saved by special-cases zeroed areas, so
>> focussing on images that are (nearly) fully allocated is more important.
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
> 
> I'll look at it tomorrow... Just wanted to note that something similar 
> was proposed by Kevin some time ago:
> 
> <20190124141731.21509-1-kwolf@redhat.com>
> https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg06271.html

Interesting.  The reasoning that it doesn’t matter whether anyone writes 
to the assumed-data regions makes sense.

I can’t see a real reason why it was kind of forgotten, apparently...

Max


