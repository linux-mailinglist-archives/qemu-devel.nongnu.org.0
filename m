Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A20D933F723
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:34:36 +0100 (CET)
Received: from localhost ([::1]:33776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMa43-0001Et-GX
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMZzB-0007s3-6Q
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMZz8-0003IS-Kf
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616002169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/nDBUWz3CxzQb3EP+Yv27nM+m9+gS0SOkyjqvFoGZb4=;
 b=H9DFOD14pucLRwihB83qNmgnzIK0Jdo8aV0d33PYuFTZMbqCxuq8xyupbamFzYn0t1lM6u
 LzVh7XVUmV8XTnrMCyaWlk8PELmDOuXX1qx1A/dSqQb5nGcykHBEiDsb7BZKCi4CNu4+Un
 JaGSe35FOPEAl89dQUNWURCl+J2sonY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-u_04f-SjOTer0W42ubeBRA-1; Wed, 17 Mar 2021 13:29:26 -0400
X-MC-Unique: u_04f-SjOTer0W42ubeBRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D6EA107B784;
 Wed, 17 Mar 2021 17:29:25 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAEF85D6A1;
 Wed, 17 Mar 2021 17:29:24 +0000 (UTC)
Subject: Re: [RFC PATCH] curl: Allow reading after EOF
To: Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210317151734.41656-1-kwolf@redhat.com>
 <YFIqercny3vOpo34@redhat.com> <YFIxz4V4MuGdL2D0@merkur.fritz.box>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1ad036ed-3e69-26ec-8ecc-ec4dc98b627d@redhat.com>
Date: Wed, 17 Mar 2021 12:29:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFIxz4V4MuGdL2D0@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: afrosi@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 11:43 AM, Kevin Wolf wrote:
>>> It is not entirely clear to me if this is something we want to do. If we
>>> do care about consistency between protocol drivers, something like this
>>> should probably be done in block/io.c eventually - but that would
>>> require converting bs->total_sectors to byte granularity first.
>>>
>>> Any opinions on what the most desirable semantics would be and whether
>>> we should patch individual drivers until we can have a generic solution?
>>
>> What valid scenarios are there for wanting to read beyond the bounds
>> of the protocol driver storage ? Why was file-posix allowing this
>> so far ?
>>

Our block driver already filters all reads larger than the image size
rounded to the nearest sector; so this discussion is ONLY about the 511
bytes possible in an unaligned file at the protocol layer and its
rounded-up size at the block layer.

>> If I've given file-posix a 10 GB plain file or device and something
>> requests a read from the 11 GB offset, IMHO, that is a sign of serious
>> error somewhere and possible impending doom.

The block layer won't permit that; it's too far beyond the 511 bytes of
rounding up a sector-unaligned image.

>>
>> For writable storage, I would think that read + write should be
>> symmetric, by which I mean if a read() at a particular offset
>> succeeds, then I would also expect a write() at the same offset to
>> succeed, and have its data later returned by a read().
>>
>> We generally can't write at an offset beyond the storage (unless we
>> are intending to auto-enlarge a plain file), so I think we shouldn't
>> allow reads either.
> 
> It is definitely related to format drivers that grow their image files.
> I think the reason for allowing this may have been that with O_DIRECT,
> you need aligned requests and when format drivers write just a few
> bytes, we actually do a RMW - and you don't want to get an error during
> the read part just because the image file will only be resized by the
> write.

I like the nbdkit behavior for symmetry: since we can read the tail as
zero, allowing write as zero does not change the size but also avoids an
ENOSPC, while allowing the guest full control over the bytes prior to
the unaligned tail.  But I can also live with the symmetry of reads from
the final sector see zero, but writes to the final sector fail
(basically, the final sector becomes read-only, even if the rest of the
image is writable).

> 
> Since curl is a read-only protocol driver (at the moment, I actually
> have an experimental branch that adds write support so we can run
> iotests for http), this reason doesn't really apply. At the moment, it
> would be just for consistency.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


