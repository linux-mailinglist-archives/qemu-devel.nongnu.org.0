Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699BE3D34E1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:57:20 +0200 (CEST)
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6p7X-0000hB-FV
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6p5s-0008Q3-UL
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:55:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6p5q-0006Un-Ri
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627023333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iaDzdIz16MvB7iJZBjj5VZGvfAaWj4QQT3ecnWS+dds=;
 b=LyN6VS5z49JC50/unwdfNfxXO9XCgixsNn02MhC97woxjd0lrJnYPUcRilj1hYhxAbfKj6
 owbmpefR66uHsZvhXh9wPlXUofDuu1F0gSAvUwzZ/Kkgc4P28MViBqZ5W7muT/W8mV58mZ
 oIx0/j12r5IiRkmmU6R15iw6NOvX0+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-jjlPJ4y-MoWgcuvRBf5hqw-1; Fri, 23 Jul 2021 02:55:31 -0400
X-MC-Unique: jjlPJ4y-MoWgcuvRBf5hqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D681618C89CF
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 06:55:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B2D260877;
 Fri, 23 Jul 2021 06:55:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id ACD931800926; Fri, 23 Jul 2021 08:55:27 +0200 (CEST)
Date: Fri, 23 Jul 2021 08:55:27 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/2] qxl: remove assert in qxl_pre_save.
Message-ID: <20210723065527.glqc44gyga2lnqyc@sirius.home.kraxel.org>
References: <20210721093347.338536-1-kraxel@redhat.com>
 <20210721093347.338536-2-kraxel@redhat.com>
 <YPmEZnBuCMwXq98p@work-vm>
 <20210723063233.ktjex5knfgz77pbq@sirius.home.kraxel.org>
 <13c8a40f-a879-a981-12f0-36a5289b39b1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <13c8a40f-a879-a981-12f0-36a5289b39b1@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: armbru@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 08:47:09AM +0200, Philippe Mathieu-Daudé wrote:
> On 7/23/21 8:32 AM, Gerd Hoffmann wrote:
> > On Thu, Jul 22, 2021 at 03:44:54PM +0100, Dr. David Alan Gilbert wrote:
> >> * Gerd Hoffmann (kraxel@redhat.com) wrote:
> >>> Since commit 551dbd0846d2 ("migration: check pre_save return in
> >>> vmstate_save_state") the pre_save hook can fail.  So lets finally
> >>> use that to drop the guest-triggerable assert in qxl_pre_save().
> >>>
> >>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >>> ---
> >>>  hw/display/qxl.c | 4 +++-
> >>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> >>> index 84f99088e0a0..3867b94fe236 100644
> >>> --- a/hw/display/qxl.c
> >>> +++ b/hw/display/qxl.c
> >>> @@ -2283,7 +2283,9 @@ static int qxl_pre_save(void *opaque)
> >>>      } else {
> >>>          d->last_release_offset = (uint8_t *)d->last_release - ram_start;
> >>>      }
> >>> -    assert(d->last_release_offset < d->vga.vram_size);
> >>> +    if (d->last_release_offset < d->vga.vram_size) {
> >>> +        return 1;
> >>
> >> It would be great if there was an error_report or something there
> >> so that we get some idea of what happened.
> > 
> > Hmm.  Strictly speaking qemu_log_mask(LOG_GUEST_ERROR, "..."); would be
> > the correct approach here, but I guess that wouldn't help much for
> > trouble-shooting as the message would only show up with "-d
> > guest_errors".  So better make that error_report("...") ?
> 
> It depends who is interested in such errors.

Migration fails and you want know why.

Reason migration fails is the guest violates qxl specs (which doesn't
cause actual problems unless you want migrate the guest).

take care,
  Gerd


