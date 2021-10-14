Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0042D5CB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:15:12 +0200 (CEST)
Received: from localhost ([::1]:60538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mawpT-0002nG-Dy
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:15:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mawnK-0001iT-Pt
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:12:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mawn7-0001vS-Q3
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634202765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y6ly37UDc+gOy8tKTvLdDwTgmoJ/jVAIhfT8IhqUPTo=;
 b=eMgk+PmeSoOxWh93Qm86E8iigjFLYXZviphILZNL9kSMMqvO4qHN+OPObtBR6PefDh3JoJ
 pBoKediokmtXBb9LsUOddFeeGqd4BiBqGPCg0e3VAw6bZdAx0oxIDpn80aKD8mMjO5QfHI
 y6FEypDEODZLYn8wCVLQMqjLXrBU5Hk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-etOaCtkiNPO-45z194sUaQ-1; Thu, 14 Oct 2021 05:12:43 -0400
X-MC-Unique: etOaCtkiNPO-45z194sUaQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0EB1BAF81;
 Thu, 14 Oct 2021 09:12:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82F9D5DA60;
 Thu, 14 Oct 2021 09:12:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C159D18007AC; Thu, 14 Oct 2021 11:12:40 +0200 (CEST)
Date: Thu, 14 Oct 2021 11:12:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Message-ID: <20211014091240.vif3nqeveddc6ru2@sirius.home.kraxel.org>
References: <20211013121929.9E835746333@zero.eik.bme.hu>
 <189eeccd-36fd-d033-7900-30e89fc662df@amsat.org>
MIME-Version: 1.0
In-Reply-To: <189eeccd-36fd-d033-7900-30e89fc662df@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> >      if (s->masterbus) {
> >          USBPort *ports[NB_PORTS];
> 
> usb_uhci_common_realize() should be refactored making it PCI-agnostic.

Not sure this is needed here.  This seems to be more a platform-specific
oddity in IRQ routing than a non-pci UHCI device.

take care,
  Gerd


