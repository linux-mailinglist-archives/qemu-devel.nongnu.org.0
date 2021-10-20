Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B037434E15
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:39:47 +0200 (CEST)
Received: from localhost ([::1]:49446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCks-0007wY-Cb
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mdCho-00041j-OS
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:36:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mdChl-0007no-Mw
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 10:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634740592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Hkf5ANvG+xFGgK/0YDaEbiuMVhnqjNausklUUGHqvQ=;
 b=G0kBYOS1ohNwWXXAwCGuSYf30SdGBgXnS91vYsUf4OfRCHTmcfIuGJSU5rlisQiP9oxTlF
 uYstKYoA4g7CgHQ7Y7m/j5AeoMiydJtd3nJPN4bPddRL9sxqrKA+PLnYj/8JOl24AwQ01o
 V4AeJ1puwWE9jtrjpz6IN7MaGwbcRC4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-WFN3eJZvNgeMOS54xORtjw-1; Wed, 20 Oct 2021 10:36:29 -0400
X-MC-Unique: WFN3eJZvNgeMOS54xORtjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DFD71966321;
 Wed, 20 Oct 2021 14:36:27 +0000 (UTC)
Received: from localhost (unknown [10.22.17.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 667245DD68;
 Wed, 20 Oct 2021 14:36:27 +0000 (UTC)
Date: Wed, 20 Oct 2021 10:36:26 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] via-ide: Avoid expensive operations in irq handler
Message-ID: <20211020143626.dvthmwizsljuwqz4@habkost.net>
References: <20211018014059.13E65746353@zero.eik.bme.hu>
 <549ece11-990f-a19b-5dfe-508e315a6163@amsat.org>
 <a36736da-32a0-84fe-f33-32b2f31126bf@eik.bme.hu>
 <31027ddc-b618-9628-d725-1516f7bfd098@amsat.org>
MIME-Version: 1.0
In-Reply-To: <31027ddc-b618-9628-d725-1516f7bfd098@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 12:10:04PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/18/21 11:51, BALATON Zoltan wrote:
> > On Mon, 18 Oct 2021, Philippe Mathieu-Daudé wrote:
> >> On 10/18/21 03:36, BALATON Zoltan wrote:
> >>> Cache the pointer to PCI function 0 (ISA bridge, that this IDE device
> >>> has to use for IRQs) in the PCIIDEState and pass that as the opaque
> >>> data for the interrupt handler to eliminate both the need to look up
> >>> function 0 at every interrupt and also a QOM type cast of the opaque
> >>> pointer as that's also expensive (mainly due to qom-debug being
> >>> enabled by default).
> >>>
> >>> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> >>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >>> ---
> >>>  hw/ide/via.c         | 11 ++++++-----
> >>>  include/hw/ide/pci.h |  1 +
> >>>  2 files changed, 7 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/hw/ide/via.c b/hw/ide/via.c
> >>> index 82def819c4..30566bc409 100644
> >>> --- a/hw/ide/via.c
> >>> +++ b/hw/ide/via.c
> >>> @@ -104,15 +104,15 @@ static void bmdma_setup_bar(PCIIDEState *d)
> >>>
> >>>  static void via_ide_set_irq(void *opaque, int n, int level)
> >>>  {
> >>> -    PCIDevice *d = PCI_DEVICE(opaque);
> >>> +    PCIIDEState *d = opaque;
> >>>
> >>>      if (level) {
> >>> -        d->config[0x70 + n * 8] |= 0x80;
> >>> +        d->parent_obj.config[0x70 + n * 8] |= 0x80;
> >>>      } else {
> >>> -        d->config[0x70 + n * 8] &= ~0x80;
> >>> +        d->parent_obj.config[0x70 + n * 8] &= ~0x80;
> >>>      }
> >>
> >> Better not to access parent_obj, so I'd rather keep the previous
> >> code as it. The rest is OK, thanks. If you don't want to respin
> >> I can fix and take via mips-next.
> > 
> > Why not? If it's OK to access other fields why not parent_obj? That
> > avoids the QOM cast PCI_DEVICE(opaque) or PCI_DEVICE(d) after this
> > patch. We know it's a PCIIDEState and has PCIDevice parent_obj field
> > because we set the opaque pointer when adding this callback so I think
> > this works and is the less expensive way. But feel free to change it any
> > way you like and use it that way. I'd keep it as it is.
> 
> My understanding of QOM is we shouldn't access internal states that
> way, because 1/ this makes object refactors harder and 2/ this is
> not the style/example we want in the codebase, but it doesn't seem
> documented, so Cc'ing Markus/Eduardo for confirmation.

`PCI_DEVICE(d)` is preferred instead `of d.parent_obj` (parent_obj is
just a QOM implementation detail).  If there are real performance
reasons to avoid it, we need numbers to support that.

Also, note that `OBJECT_CHECK(obj)` is just `return obj` if
CONFIG_QOM_CAST_DEBUG is disabled.

-- 
Eduardo


