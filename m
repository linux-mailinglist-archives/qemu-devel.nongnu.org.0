Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119D557B4B9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 12:49:24 +0200 (CEST)
Received: from localhost ([::1]:37972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE7Gb-0006XL-LV
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 06:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oE7C7-0001yd-71
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oE7C4-0001wi-Tw
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 06:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658313879;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RlD4E3ORnh6Z3eE5tAtTl4lnoht3r/gdEqJYBlRB9ig=;
 b=bWvnbPhjjVd5eMbxDOaxHkBKtMKO0q9oHNpKnpd/nKKLRCk7FCqczLU91V4X6v2c3wqDT6
 RAJQ63M4xSpAStTBP0eXgwBkdOPf2wgEvtSRZx078u2411FncUNMU7bwFFzuM8mqFlJuIV
 GJGrlODFDzVGE1xyn2t06EnoazFHOpo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-nrues-GFN028KROGtQ7GIg-1; Wed, 20 Jul 2022 06:44:36 -0400
X-MC-Unique: nrues-GFN028KROGtQ7GIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F700294EDCD;
 Wed, 20 Jul 2022 10:44:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12AA31121314;
 Wed, 20 Jul 2022 10:44:33 +0000 (UTC)
Date: Wed, 20 Jul 2022 11:44:26 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Roman Kagan <rvkagan@yandex-team.ru>
Cc: qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <Ytfcivbtj8+JnLfz@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220720102555.874394-1-rvkagan@yandex-team.ru>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022 at 01:25:55PM +0300, Roman Kagan wrote:
> It's possible to create non-working configurations by attaching a device
> to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> specifying a slot number other that zero, e.g.:
> 
>     -device pcie-root-port,id=s0,... \
>     -device virtio-blk-pci,bus=s0,addr=4,...
> 
> Make QEMU reject such configurations and only allow addr=0 on the
> secondary bus of a PCIe slot.

What do you mean by 'non-working' in this case.  The guest OS boots
OK, but I indeed don't see the device in the guest, but IIUC it was
said that was just because Linux doesn't scan for a non-zero slot.
That wouldn't be a broken config from QEMU's POV though, merely a
guest OS limitation ?  Or was there some other issue you see ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


