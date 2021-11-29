Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82A146204B
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 20:20:48 +0100 (CET)
Received: from localhost ([::1]:43082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrmCk-0003wB-HU
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 14:20:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mrm8b-0001Ih-PE
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:16:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mrm8U-0001EE-Kn
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 14:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638213375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sc1GBVNKj95ClrH5JeB2YfH1Krk2TIm0gwO9XM71Nls=;
 b=TPbtCBHwkcqjnpjfdLVimxXApmLHNKp6ZvwXLKRT6l0IF4vnrX1ghRsFxsMkRLMYR+/C5+
 uiIMPDvKK3Vb+p86d6A8l/UTHWqmDOmeWtI6DlvW/wFfl6aCJ+oWwekFq4L9/VZwywss13
 2vITr//NtYQGlMBtYoaafbrEhJdio70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-ucwe3duTOg2MtEcifkPAaw-1; Mon, 29 Nov 2021 14:16:10 -0500
X-MC-Unique: ucwe3duTOg2MtEcifkPAaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47A4F36393;
 Mon, 29 Nov 2021 19:16:09 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7422A10016F2;
 Mon, 29 Nov 2021 19:16:08 +0000 (UTC)
Date: Mon, 29 Nov 2021 13:16:06 -0600
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC for-6.2] block/nbd: forbid incompatible change of server
 options on reconnect
Message-ID: <20211129191606.4cnbnjpsoywgxeq7@redhat.com>
References: <20211124140951.439684-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211124140951.439684-1-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20211029-26-f6989f
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 24, 2021 at 03:09:51PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> Reconnect feature was never prepared to handle server options changed
> on reconnect. Let's be stricter and check what exactly is changed. If
> server capabilities just got richer don't worry. Otherwise fail and
> drop the established connection.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> +    /*
> +     * No worry if rotational status changed. But other flags are feature flags,
> +     * they should not degrade.
> +     */
> +    dropped_flags = (old->flags & ~new->flags) & ~NBD_FLAG_ROTATIONAL;
> +    if (dropped_flags) {
> +        error_setg(errp, "Server options degrade after reconnect: flags 0x%"
> +                   PRIx32 " are not reported anymore", dropped_flags);
> +        return false;
> +    }

Your logic is good for most flags, but somewhat wrong for
NBD_FLAG_READ_ONLY_BIT.  For cases where we are only using the block
device read-only, we don't care about changes of that bit, in either
direction.  But for cases where we want to use the block device
read-write, the bit changing from clear in the old to set in the new
server is an incompatible change that your logic failed to flag.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


