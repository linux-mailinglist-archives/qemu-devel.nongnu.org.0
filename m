Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869386DD964
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 13:29:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmCBP-0007zh-DL; Tue, 11 Apr 2023 07:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmCBJ-0007xD-1f
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:29:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pmCBH-0002c2-2j
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 07:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681212537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oHtQvIxaeCTWRI6Hpsu3YCwaiAYcQtO27ulLbBtZL1s=;
 b=Ftc/615tOpcsoMNzdICDi4xPBG5L6zspY1h/I8MnTWRcIUO1rOs6Rv5vArxR2pMqXH2XPP
 DDLC7qaPRzL2w+hFRp/v0NuZs+rkrWe/N/X5r7igGjG38jWRkOgsSE1d6CQgw9xsrClV1n
 cdPbDnELSptm+99odrbCDdRI+1TsbnU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-XB7yxK9DOAuvj59NrgSxRA-1; Tue, 11 Apr 2023 07:28:54 -0400
X-MC-Unique: XB7yxK9DOAuvj59NrgSxRA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 401A138221D0;
 Tue, 11 Apr 2023 11:28:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6F3B492B00;
 Tue, 11 Apr 2023 11:28:53 +0000 (UTC)
Date: Tue, 11 Apr 2023 13:28:52 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Lukas Tschoke <lukts330@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [PATCH for-8.0] block/vhdx: fix dynamic VHDX BAT corruption
Message-ID: <ZDVEdCbwDA8Czg7n@redhat.com>
References: <6cfb6d6b-adc5-7772-c8a5-6bae9a0ad668@gmail.com>
 <ZDU/nthNEPzUGcl3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDU/nthNEPzUGcl3@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 11.04.2023 um 13:08 hat Kevin Wolf geschrieben:
> Am 08.04.2023 um 00:11 hat Lukas Tschoke geschrieben:
> > The corruption occurs when a BAT entry aligned to 4096 bytes is changed.
> > 
> > Specifically, the corruption occurs during the creation of the LOG Data
> > Descriptor. The incorrect behavior involves copying 4088 bytes from the
> > original 4096 bytes aligned offset to `tmp[8..4096]` and then copying
> > the new value for the first BAT entry to the beginning `tmp[0..8]`.
> > This results in all existing BAT entries inside the 4K region being
> > incorrectly moved by 8 bytes and the last entry being lost.
> > 
> > This bug did not cause noticeable corruption when only sequentially
> > writing once to an empty dynamic VHDX (e.g.
> > using `qemu-img convert -O vhdx -o subformat=dynamic ...`), but it
> > still resulted in invalid values for the (unused) Sector Bitmap BAT
> > entries.
> > 
> > Importantly, this corruption would only become noticeable after the
> > corrupted BAT is re-read from the file.
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/727
> > Signed-off-by: Lukas Tschoke <lukts330@gmail.com>
> 
> Thanks, applied to the block branch.
> 
> Reviewing this function was a bit confusing, but after understanding
> what each variable means, your change is clearly fixing a local bug and
> therefore an improvement.
> 
> But now I'm wondering if it's really right that we don't have to handle
> the case where we write only a few bytes and therefore can have a
> leading and a trailing part in the same log sector.
> 
> In fact, having everything in the same sector actually seems to be the
> only case that really happens because vhdx_log_write_and_flush() is only
> called with length = 8 and offset = bat_entry_offset, which is a
> multiple of 8.
> 
> Most of the cases should be in the middle of the BAT. vhdx_log_write()
> uses the leading_length != 0 code path for them. This reads the part
> before the written entry from the image, replaces the entry itself, but
> seems to leave the buffer uninitialised for everything after the entry.
> So does that part get corrupted?

Ah, never mind. It actually reads the full sector and then overwrites
part of it. So this should be fine.

Kevin


