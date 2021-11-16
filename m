Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BFA45343C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 15:33:22 +0100 (CET)
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmzWT-00072V-Mz
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 09:33:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mmzTv-0003HN-Sp
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:30:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mmzTs-0004pN-6J
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 09:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637073039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Dlp0AiUUgRRqP7Y8HuawjyhioZt7MOA4SC8dXUe7KgE=;
 b=SInrppA6jyc+XuTYMsXeQJVqQY2IpXy2cdp+bgwDCxaSE78cDjfbszURr46WVhJvws7TNF
 +eWmpsgwUcNFDUHNm7nmQ75xA9v4avzezx1G9QzfqOGM85IhoHvn0YMh9QeIxzQUksmGGC
 J+gUyIW9k40G63CEDA1tlchHgDUjUwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-ucQbTHCUMdya6kO4QTR4nQ-1; Tue, 16 Nov 2021 09:30:36 -0500
X-MC-Unique: ucQbTHCUMdya6kO4QTR4nQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDC811851722;
 Tue, 16 Nov 2021 14:30:35 +0000 (UTC)
Received: from redhat.com (ovpn-114-146.phx2.redhat.com [10.3.114.146])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E1345C1D5;
 Tue, 16 Nov 2021 14:30:35 +0000 (UTC)
Date: Tue, 16 Nov 2021 08:30:33 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 for-6.2] file-posix: Fix alignment after reopen
 changing O_DIRECT
Message-ID: <20211116143033.zfot2n4ormmg7aiv@redhat.com>
References: <20211116101431.105252-1-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211116101431.105252-1-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-16-b680fe
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 16, 2021 at 11:14:31AM +0100, Hanna Reitz wrote:
> From: Kevin Wolf <kwolf@redhat.com>
> 
> At the end of a reopen, we already call bdrv_refresh_limits(), which
> should update bs->request_alignment according to the new file
> descriptor. However, raw_probe_alignment() relies on s->needs_alignment
> and just uses 1 if it isn't set. We neglected to update this field, so
> starting with cache=writeback and then reopening with cache=none means
> that we get an incorrect bs->request_alignment == 1 and unaligned
> requests fail instead of being automatically aligned.
> 

> v2:
> Don't continue operating on a qcow2 file with an effectively random
> size, but create a new 1 MB file to run our O_DIRECT reopen read tests
> on.  Otherwise, we'll get into permission trouble because qemu-io does
> not take the RESIZE permission by default, which it would need to
> auto-align the file size to the sector size.
> 
> Note that the qcow2 file is not even aligned to 512 byte sectors before
> the test case (its size is 196616), but the error message doesn't appear
> then because qemu internally calculates file sizes in multiples of 512
> bytes (BDRV_SECTOR_SIZE), so a misalignment can only become visible when
> the physical sector size exceeds 512 bytes.
> (That's "OK" because qemu only counts sizes in multiples of 512, so any
> resize below that granularity is not visible as a resize to qemu, and so
> does not need the RESIZE permission.)
> 
> Another way we could solve this problem is by having qemu-io take the
> RESIZE permission, but I believe it would need to retain it not only
> through the reopen, but until the image size is aligned to the sector
> size; that is, we would need to resize the image anyway to be able to
> drop the permission and not keep it constantly.  So it's simpler to just
> create an aligned image from the start.

I concur that your patch is simpler, and since we are in rc phase,
simpler is better.

> +++ b/tests/qemu-iotests/142
> @@ -350,6 +350,35 @@ info block backing-file"
>  
>  echo "$hmp_cmds" | run_qemu -drive "$files","$ids" | grep "Cache"
>  
> +echo
> +echo "--- Alignment after changing O_DIRECT ---"
> +echo
> +
> +# Directly test the protocol level: Can unaligned requests succeed even if
> +# O_DIRECT was only enabled through a reopen and vice versa?
> +
> +# Ensure image size is a multiple of the sector size (required for O_DIRECT)
> +$QEMU_IMG create -f file "$TEST_IMG" 1M | _filter_img_create
> +
> +# And write some data (not strictly necessary, but it feels better to actually
> +# have something to be read)
> +$QEMU_IO -f file -c 'write 0 4096' "$TEST_IMG" | _filter_qemu_io

Looks nice.

> +
> +$QEMU_IO --cache=writeback -f file $TEST_IMG <<EOF | _filter_qemu_io
> +read 42 42
> +reopen -o cache.direct=on
> +read 42 42

This particular region of the disk is a sub-sector, but completely
contained within one sector.  Is it also worth testing the case of an
unaligned read that crosses a 4096-byte boundary?  But we could do
that on top, your patch is already an improvement and catches the
particular problem you set out to solve.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


