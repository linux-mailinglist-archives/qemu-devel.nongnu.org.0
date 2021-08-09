Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385413E43C0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:19:04 +0200 (CEST)
Received: from localhost ([::1]:39400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD2N4-0002YK-UM
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mD2ML-0001sF-Qp
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:18:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mD2MJ-0006Ib-Ll
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 06:18:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628504294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DaT/LZOMBX36WF5LqDCE3UKBPlpYR71enzY4ylnXqik=;
 b=PRabcHWneEDWbsAuZJp7PA3v6Bpq7ng8ep+QSLlwMozAHOG8sTqb7z5pEe8Mx+n+ZVfhUD
 vs6GCY8CtAMakEwI6zsL6nP3daO++QB8xKhCpUai106/K6a4W7HAlPxc7O+OFMJuW5+4G4
 XGiogpUeE/AtRNwMIECmyD9DLl/tR8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-v6vNdDDiOGGFGj6ZfXoO6A-1; Mon, 09 Aug 2021 06:18:11 -0400
X-MC-Unique: v6vNdDDiOGGFGj6ZfXoO6A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B809760C0;
 Mon,  9 Aug 2021 10:18:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 316131036D06;
 Mon,  9 Aug 2021 10:18:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 677B31800981; Mon,  9 Aug 2021 12:18:08 +0200 (CEST)
Date: Mon, 9 Aug 2021 12:18:08 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 3/3] ps2: migration support for command reply queue
Message-ID: <20210809101808.ds3kf37np46gxedc@sirius.home.kraxel.org>
References: <4d1c8467-d976-2c0f-ba54-c767df7b8fe7@t-online.de>
 <20210807121202.6294-3-vr_qemu@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20210807121202.6294-3-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +static bool ps2_keyboard_cqueue_needed(void *opaque)
> +{
> +    PS2KbdState *s = opaque;
> +
> +    return s->common.queue.cwptr != -1; /* the queue is mostly empty */
> +}
> +
> +static const VMStateDescription vmstate_ps2_keyboard_cqueue = {
> +    .name = "ps2kbd/command_reply_queue",
> +    .needed = ps2_keyboard_cqueue_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_INT32(common.queue.cwptr, PS2KbdState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};

Not going to work (the existing vmstate_ps2_keyboard_need_high_bit has
the same problem btw).  Chicken and egg problem on the receiving side:
How you properly evaluate ps2_keyboard_cqueue_needed() without having
common.queue.cwptr received yet?

With "cqueue not needed" being the common case migration will work
nicely in most cases nevertheless, but when the source machine actually
sends cqueue state things will break ...

Looking at data sent via vmstate works but ordering is important.  You
could check write_cmd because that is sent in the migration data stream
before ps2_keyboard_cqueue_needed() will be evaluated (just an random
example for the ordering, probably wouldn't help much in this case).

There is some redundancy in the data stream (wptr + rptr would be
enough, but we also send count).  Maybe that can be used somehow.
Of course the tricky part is to not confuse old qemu versions on
the receiving end.

If we can't find something we can add a property simliar to the one
for the extended keyboard state.

take care,
  Gerd


