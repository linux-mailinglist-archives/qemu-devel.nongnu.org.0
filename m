Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34A7300880
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 17:22:31 +0100 (CET)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2zCg-0004sD-Vi
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 11:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2z9T-0003mC-1w
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:19:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2z9N-0005g7-66
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611332342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=38Ax5xJXa7fphoim04bLzHm+wuyZy34FTUDmHm399jo=;
 b=i1UwYEy50UtsIkRHXnK8J6OKtyaCNhYQGOSiGEozKP6Uts/PK3JNMJAFHyeVGelc+oqgmp
 AoNJbv0raoK1XVvb2ojt7cFsNril/8K4oNVOdIc5mRlJ1mIy/71ezMLoDSIAG+ssu30js4
 o37qa+fDx1T7ffn89b6wbcRFpG0ThAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-hTdic4UiM8KsXr3UqlAArw-1; Fri, 22 Jan 2021 11:18:59 -0500
X-MC-Unique: hTdic4UiM8KsXr3UqlAArw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B8A3100C603;
 Fri, 22 Jan 2021 16:18:58 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74E1A5D746;
 Fri, 22 Jan 2021 16:18:53 +0000 (UTC)
Subject: Re: [PATCH v4 10/16] block/io: support int64_t bytes in
 bdrv_co_do_pwrite_zeroes()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <20201211183934.169161-11-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <3990d2d8-cf2c-96cb-f559-005726112fab@redhat.com>
Date: Fri, 22 Jan 2021 10:18:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201211183934.169161-11-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/20 12:39 PM, Vladimir Sementsov-Ogievskiy wrote:
> We are generally moving to int64_t for both offset and bytes parameters
> on all io paths.
> 
> Main motivation is realization of 64-bit write_zeroes operation for
> fast zeroing large disk chunks, up to the whole disk.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> So, prepare bdrv_co_do_pwrite_zeroes() now.
> 
> Callers are safe, as converting int to int64_t is safe. Concentrate on
> 'bytes' usage in the function (thx to Eric Blake):
> 
>     compute 'int tail' via % 'int alignment' - safe
>     fragmentation loop 'int num' - still fragments with a cap on
>       max_transfer
> 
>     use of 'num' within the loop
>     MIN(bytes, max_transfer) as well as %alignment - still works, so
>          calculations in if (head) {} are safe
>     clamp size by 'int max_write_zeroes' - safe
>     drv->bdrv_co_pwrite_zeroes(int) - safe because of clamping
>     clamp size by 'int max_transfer' - safe
>     buf allocation is still clamped to max_transfer
>     qemu_iovec_init_buf(size_t) - safe because of clamping
>     bdrv_driver_pwritev(uint64_t) - safe
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/io.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

And thanks for including the gist of my previous audit - that greatly
speeds things up this time through. ;)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


