Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C56DD8EA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 13:09:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmBrX-0002V9-Om; Tue, 11 Apr 2023 07:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmBrV-0002Ub-LR
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmBrT-0006LR-MS
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681211310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PTAVC+Gu77GvunnRyxaaGuDO2dI5mDkagaxZULe71yE=;
 b=B77mNYlG0+ccbJ8XfMAitH3t/uFtMAWiaAIAttituo1w/n+1c5qYhuwOz8iQSGBKBr9EJ4
 m5Wbbh/4aKWBVRVtN3h29StpcmnRPn9pcELTyX/n1w/vJt10LCB8Knng4x2mlAuJ5nE+MJ
 l8ypItnn0y92wmuwgYzJMMzesNbmWbo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-yWj-6iehOqu1dkYa-QXznQ-1; Tue, 11 Apr 2023 07:08:27 -0400
X-MC-Unique: yWj-6iehOqu1dkYa-QXznQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA05D885620;
 Tue, 11 Apr 2023 11:08:26 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E61502166B30;
 Tue, 11 Apr 2023 11:08:25 +0000 (UTC)
Date: Tue, 11 Apr 2023 13:08:14 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Lukas Tschoke <lukts330@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH for-8.0] block/vhdx: fix dynamic VHDX BAT corruption
Message-ID: <ZDU/nthNEPzUGcl3@redhat.com>
References: <6cfb6d6b-adc5-7772-c8a5-6bae9a0ad668@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cfb6d6b-adc5-7772-c8a5-6bae9a0ad668@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 08.04.2023 um 00:11 hat Lukas Tschoke geschrieben:
> The corruption occurs when a BAT entry aligned to 4096 bytes is changed.
> 
> Specifically, the corruption occurs during the creation of the LOG Data
> Descriptor. The incorrect behavior involves copying 4088 bytes from the
> original 4096 bytes aligned offset to `tmp[8..4096]` and then copying
> the new value for the first BAT entry to the beginning `tmp[0..8]`.
> This results in all existing BAT entries inside the 4K region being
> incorrectly moved by 8 bytes and the last entry being lost.
> 
> This bug did not cause noticeable corruption when only sequentially
> writing once to an empty dynamic VHDX (e.g.
> using `qemu-img convert -O vhdx -o subformat=dynamic ...`), but it
> still resulted in invalid values for the (unused) Sector Bitmap BAT
> entries.
> 
> Importantly, this corruption would only become noticeable after the
> corrupted BAT is re-read from the file.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/727
> Signed-off-by: Lukas Tschoke <lukts330@gmail.com>

Thanks, applied to the block branch.

Reviewing this function was a bit confusing, but after understanding
what each variable means, your change is clearly fixing a local bug and
therefore an improvement.

But now I'm wondering if it's really right that we don't have to handle
the case where we write only a few bytes and therefore can have a
leading and a trailing part in the same log sector.

In fact, having everything in the same sector actually seems to be the
only case that really happens because vhdx_log_write_and_flush() is only
called with length = 8 and offset = bat_entry_offset, which is a
multiple of 8.

Most of the cases should be in the middle of the BAT. vhdx_log_write()
uses the leading_length != 0 code path for them. This reads the part
before the written entry from the image, replaces the entry itself, but
seems to leave the buffer uninitialised for everything after the entry.
So does that part get corrupted?

I suspect that while your patch fixes some cases, the function still
isn't entirely right.

Do you happen to have a simple reproducer using only qemu-io and
qemu-img for the case you fixed? If so, maybe it could be relatively
easily adjusted to cover these other cases, too.

Kevin


