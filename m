Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB402209B1E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 10:12:40 +0200 (CEST)
Received: from localhost ([::1]:54576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joMzv-0004zs-Fr
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 04:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joMz6-0004I0-Lr
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 04:11:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51195
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1joMz4-0004sz-7g
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 04:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593072704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pw2R4DLW1UyO5Jn0952A7LpZ2C0YFk/L56ot0pVvlpg=;
 b=IRXAHB+79jzN8pcmOJYwl2iKWhe58NnkMCgnE+UE6O3l98l+EYI7Qn1jedy2GsqzJ0KU+2
 soQYdpg0byK+CVk7dcLahRr0huk0e4pI1P4+kiucbdLl/wt373eH2Jd3nFURP5YkngaRRR
 Qfq5N1d0/nHLzqUH0Mvfgh0hbiIlmZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-uSPZ3pBANkaA38qNNDwasQ-1; Thu, 25 Jun 2020 04:11:41 -0400
X-MC-Unique: uSPZ3pBANkaA38qNNDwasQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A48571005512;
 Thu, 25 Jun 2020 08:11:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1D6778FD9;
 Thu, 25 Jun 2020 08:11:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7CB4211384D4; Thu, 25 Jun 2020 10:11:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: Re: [PATCH v2 3/3] usb/hcd-xhci: Split pci wrapper for xhci base model
References: <1593008176-9629-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1593008176-9629-4-git-send-email-sai.pavan.boddu@xilinx.com>
Date: Thu, 25 Jun 2020 10:11:31 +0200
In-Reply-To: <1593008176-9629-4-git-send-email-sai.pavan.boddu@xilinx.com>
 (Sai Pavan Boddu's message of "Wed, 24 Jun 2020 19:46:16 +0530")
Message-ID: <87y2obzhsc.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ying Fang <fangying1@huawei.com>,
 =?utf-8?Q?'Marc-Andr=C3=A9?= Lureau' <marcandre.lureau@redhat.com>,
 'Philippe =?utf-8?Q?Mathieu-Daud=C3=A9'?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sai Pavan Boddu <sai.pavan.boddu@xilinx.com> writes:

> This patch sets the base to use xhci as sysbus model, for which pci
> specific hooks are moved to hcd-xhci-pci.c. As a part of this requirment
> msi/msix interrupts handling is moved under XHCIPCIState, and XHCIState
> is  non qom object, make use of 'container_of' calls to retrive
> XHCIPciState. Made required changes for qemu-xhci-nec.
>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

I can't see a "sysbus model".  What I can see is

         TYPE_DEVICE
              |
       TYPE_PCI_DEVICE
              |
        TYPE_XHCI_PCI (renamed from TYPE_XHCI)
          /       \
TYPE_QEMU_XHCI TYPE_NEC_XHCI

All but the two leaves are abstract.

Do you intend to add a "sysbus model" in a future patch?


