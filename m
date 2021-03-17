Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320DF33F601
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:47:41 +0100 (CET)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZKe-0005Jd-7S
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMYn4-0006yO-GP
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:13:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMYn1-0003v5-7O
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 12:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615997573;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hpZzmUCIaILTarUnrFjtxu6RGrHKUn/ZIOmdH5r9rPU=;
 b=AskYFkizJWE2cKEzSLrDvRPWn0/M6iUorftz858HqUA5Dxc+LYnclKAkFKxYLsDNF9fHS7
 hM0c9yRY1YPsExT8RZjm7gvNfiBK+3or1HrZ1/8zElgmAR0jEnm3W8kMirH9eeNCz3pp/U
 Ei0Q/SCB6/r+4qCoYjmaWhZ97sbPPEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-Yg9mkTXBN0elc9N-vaL0Lw-1; Wed, 17 Mar 2021 12:12:48 -0400
X-MC-Unique: Yg9mkTXBN0elc9N-vaL0Lw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF7B2A40C1;
 Wed, 17 Mar 2021 16:12:46 +0000 (UTC)
Received: from redhat.com (ovpn-113-247.ams2.redhat.com [10.36.113.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 892FB5C1CF;
 Wed, 17 Mar 2021 16:12:45 +0000 (UTC)
Date: Wed, 17 Mar 2021 16:12:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [RFC PATCH] curl: Allow reading after EOF
Message-ID: <YFIqercny3vOpo34@redhat.com>
References: <20210317151734.41656-1-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210317151734.41656-1-kwolf@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: afrosi@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 17, 2021 at 04:17:34PM +0100, Kevin Wolf wrote:
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
> 
> Any opinions on what the most desirable semantics would be and whether
> we should patch individual drivers until we can have a generic solution?

What valid scenarios are there for wanting to read beyond the bounds
of the protocol driver storage ? Why was file-posix allowing this
so far ?

If I've given file-posix a 10 GB plain file or device and something
requests a read from the 11 GB offset, IMHO, that is a sign of serious
error somewhere and possible impending doom.

For writable storage, I would think that read + write should be
symmetric, by which I mean if a read() at a particular offset
succeeds, then I would also expect a write() at the same offset to
succeed, and have its data later returned by a read().

We generally can't write at an offset beyond the storage (unless we
are intending to auto-enlarge a plain file), so I think we shouldn't
allow reads either.

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
> -- 
> 2.30.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


