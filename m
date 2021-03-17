Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334D33F42C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:48:17 +0100 (CET)
Received: from localhost ([::1]:33146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYPA-00017h-JF
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMY9r-0003NN-FA
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lMY9p-0005j6-7V
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615995144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A/aGj4OMJNHPPIfjtpKwQnlGLqsjOFosTh5EkcYfXZ0=;
 b=PqyhcWV8gmFxtlFP4VzPLKOdIm80cKyIXrfS4n7JIw0QzkIq7UWpppMJvvaLYLC0SDdRIy
 I7r9jlZ/HZD3c2U7VgoMzhrrWup+LlmReVy4TRIwR0nvEUH8GcgrPOpaquFwL5PGwzy69G
 aoDVfF/RBZ1fHNyILvJDdHhaisbQbtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-ZoAFejGdOrCWRP_scDoQJQ-1; Wed, 17 Mar 2021 11:32:22 -0400
X-MC-Unique: ZoAFejGdOrCWRP_scDoQJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F7EB107ACCA;
 Wed, 17 Mar 2021 15:32:21 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E2795D9C0;
 Wed, 17 Mar 2021 15:32:21 +0000 (UTC)
Subject: Re: [RFC PATCH] curl: Allow reading after EOF
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210317151734.41656-1-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <79654a81-d1aa-f2a2-a6a3-59737798e0e8@redhat.com>
Date: Wed, 17 Mar 2021 10:32:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317151734.41656-1-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: afrosi@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/17/21 10:17 AM, Kevin Wolf wrote:
> This makes the curl driver more consistent with file-posix in that it
> doesn't return errors any more for reading after the end of the remote
> file. Instead, zeros are returned for these areas.
> 
> This inconsistency was reported in:
> https://bugzilla.redhat.com/show_bug.cgi?id=1935061
> 
> Note that the image used in this bug report has a corrupted snapshot
> table, which means that the qcow2 driver tries to do a zero-length read
> after EOF on its image file.
> 
> The old behaviour of the curl driver can hardly be called a bug, but the
> inconsistency turned out to be confusing.
> 
> Reported-by: Alice Frosi <afrosi@redhat.com>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
> 
> It is not entirely clear to me if this is something we want to do. If we
> do care about consistency between protocol drivers, something like this
> should probably be done in block/io.c eventually - but that would
> require converting bs->total_sectors to byte granularity first.

Something that's been (low priority) on my todo list for a while.  NBD
has the same problem.

> 
> Any opinions on what the most desirable semantics would be and whether
> we should patch individual drivers until we can have a generic solution?

In nbdkit, we took the following approach in the 'truncate' driver:

If presented with an image that is not a multiple of the desired block
size, we round the image size up (corner cases for images with sizes
near 2^63 where rounding would wrap to negative; and since qemu enforces
a max image size at 2^63-2^32 to avoid 32-bit operations ever
overflowing).  Reads of the virtual tail come back as zero, writes to
the virtual tail are allowed if they would write zero into the tail, and
fail with ENOSPC otherwise.

Doing that in the block layer makes more sense than doing it per-driver.

Thus, I'm not sure if I'm a fan of this patch.

> 
>  block/curl.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/block/curl.c b/block/curl.c
> index 50e741a0d7..a8d87a1813 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -898,6 +898,7 @@ out:
>  static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
>          uint64_t offset, uint64_t bytes, QEMUIOVector *qiov, int flags)
>  {
> +    BDRVCURLState *s = bs->opaque;
>      CURLAIOCB acb = {
>          .co = qemu_coroutine_self(),
>          .ret = -EINPROGRESS,
> @@ -906,6 +907,15 @@ static int coroutine_fn curl_co_preadv(BlockDriverState *bs,
>          .bytes = bytes
>      };
>  
> +    if (offset > s->len || bytes > s->len - offset) {
> +        uint64_t req_bytes = offset > s->len ? 0 : s->len - offset;
> +        qemu_iovec_memset(qiov, req_bytes, 0, bytes - req_bytes);
> +        bytes = req_bytes;
> +    }
> +    if (bytes == 0) {
> +        return 0;
> +    }
> +
>      curl_setup_preadv(bs, &acb);
>      while (acb.ret == -EINPROGRESS) {
>          qemu_coroutine_yield();
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


