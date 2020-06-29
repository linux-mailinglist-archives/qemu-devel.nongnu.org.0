Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2623A20D59C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 21:40:09 +0200 (CEST)
Received: from localhost ([::1]:41864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpzdP-0007tb-R6
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 15:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jpzcF-0007Ig-90
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 15:38:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22666
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jpzcB-0003xu-QN
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 15:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593459530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rU1Z1MwXy1xGigJIKhV2iTY0dh0M+FDTbMKueoICgY=;
 b=iTq++sHxjSEtLSZgjgxNct1HIOO8KQ/kle1BkwkvQ5HM8h/2axLqQXXDZtrSlfbOnmuvcS
 ZwpKbBZ+wAwr0tBrcqMIk0R4+ddnNG9J2oHB/fg/2OLXr3A06RsDpfg3bf1cjvV72p6v0D
 ZV4GKWOEjIRVgOhldKHqmUB9yLDXpcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-zCcVTHdVPxy-uGNDvsohlg-1; Mon, 29 Jun 2020 15:38:48 -0400
X-MC-Unique: zCcVTHdVPxy-uGNDvsohlg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3716804001;
 Mon, 29 Jun 2020 19:38:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-68.ams2.redhat.com
 [10.36.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55A1D19C71;
 Mon, 29 Jun 2020 19:38:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 42A2031E79; Mon, 29 Jun 2020 21:38:43 +0200 (CEST)
Date: Mon, 29 Jun 2020 21:38:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sai Pavan Boddu <saipava@xilinx.com>
Subject: Re: [PATCH v2 3/3] usb/hcd-xhci: Split pci wrapper for xhci base model
Message-ID: <20200629193843.fufoicpgkpkes6sv@sirius.home.kraxel.org>
References: <1593008176-9629-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1593008176-9629-4-git-send-email-sai.pavan.boddu@xilinx.com>
 <87y2obzhsc.fsf@dusky.pond.sub.org>
 <BY5PR02MB67723A0D247E4D2BC60A0710CA920@BY5PR02MB6772.namprd02.prod.outlook.com>
 <871rm2tkxn.fsf@dusky.pond.sub.org>
 <BY5PR02MB6772B9C9031FD35A9FA8A969CA930@BY5PR02MB6772.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB6772B9C9031FD35A9FA8A969CA930@BY5PR02MB6772.namprd02.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 15:38:50
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
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?utf-8?Q?'Marc-Andr=C3=A9?= Lureau' <marcandre.lureau@redhat.com>,
 Ying Fang <fangying1@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 'Philippe =?utf-8?Q?Mathieu-Daud=C3=A9'?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > >> Do you intend to add a "sysbus model" in a future patch?
> > > [Sai Pavan Boddu]  Yes. I would be sending it along with that a device
> > > which would be using it. (i.e for zynqmp soc ) Let me know, if its good to
> > include hcd-xhci-sysbus.c here ?

I think this would be useful, to see how the code separation plays out
on the sysbus side.

> > Here's a clean way to provide different bus connectors (say PCI and
> > sysbus) for the same core device:
> > 
> > Make the core device a TYPE_DEVICE.
> > 
> > For each desired bus, have a bus-specific device that contains a core device.
> > Use object_initialize_child() for the component.

> This was my V1 implementation.
> Changed it to non-qom structure after some feedback from @Gred. Felt like XHCIState will not be used standalone.

> > Example: core device TYPE_SERIAL, PCI device TYPE_PCI_SERIAL, ISA device
> > TYPE_ISA_SERIAL, sysbus devices TYPE_SERIAL_IO. TYPE_SERIAL_MM.

/me goes check out the serial code ...

For reference: commit which transforms serial into the structure
above is this:

    commit 7781b88ee458ff933459503ade0b0a6ddaad08de
    Author: Marc-André Lureau <marcandre.lureau@redhat.com>
    Date:   Mon Oct 21 23:32:12 2019 +0200

        serial: initial qom-ification

Note that this patch doesn't change structs, so ISASerialState still
looks this way:

struct ISASerialState {
    ISADevice parent_obj;
    [ ... ]
    SerialState state;
};

So you can likewise keep your current "struct XHCIPciState" struct
layout and still turn XHCIState into a device object.  Which is nice to
have as it better models the hardware (xhci core behind pci connector).

take care,
  Gerd


