Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945AD44D681
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 13:19:00 +0100 (CET)
Received: from localhost ([::1]:39630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml92h-0001FJ-Ns
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 07:18:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml8tG-0000T1-J3
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:09:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml8tE-0003A6-NZ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636632552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6ycDu2jNSIMiq/QCpKSGpM09z5clFzIJtALn29t6Jas=;
 b=MkJRflssobhhIuo6XVG38uVhUhkDw/uN7awBrULpD72GBEorB5ILDvjJmaFVppKIazTi67
 xnkyQd3a2Yp/ffMNsdv3HZxMqGP2OBWsQW5qeIQGIgIwn5zlF+Xba8z2rl7sk+vcqm2RZn
 2J08hxDBD3mzy8GbrKiPaPaVLHZyWK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-WsX1O_S8OUiqEpspVuz6wA-1; Thu, 11 Nov 2021 07:09:10 -0500
X-MC-Unique: WsX1O_S8OUiqEpspVuz6wA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDF6187D542
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 12:09:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 090535C1B4;
 Thu, 11 Nov 2021 12:09:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 819E91800925; Thu, 11 Nov 2021 13:09:05 +0100 (CET)
Date: Thu, 11 Nov 2021 13:09:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 0/6] RfC: try improve native hotplug for pcie root ports
Message-ID: <20211111120905.ozy5iucoqjhhoc72@sirius.home.kraxel.org>
References: <20211011120504.254053-1-kraxel@redhat.com>
 <20211110065942-mutt-send-email-mst@kernel.org>
 <20211111075306.7dvpzewgclsddku6@sirius.home.kraxel.org>
 <20211111031646-mutt-send-email-mst@kernel.org>
 <20211111093425.6x2a37npcnnewdis@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20211111093425.6x2a37npcnnewdis@sirius.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> When the acpihp driver is used the linux kernel will just call the aml
> methods and I suspect the pci device will stay invisible then because
> nobody flips the slot power control bit (with native-hotplug=on, for
> native-hotplug=off this isn't a problem of course).

Hmm, on a quick smoke test with both patch series (mine + igors) applied
everything seems to work fine on a quick glance.  Dunno why.  Maybe the
pcieport driver turns on slot power even in case pciehp is not active.

I still feel a bit nervous about trying the new "both pcie + acpi
hotplug enabled" approach that close to the release date ...

take care,
  Gerd


