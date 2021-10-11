Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9754289CE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 11:39:51 +0200 (CEST)
Received: from localhost ([::1]:58398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZrmf-0005id-Py
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 05:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZrl0-0004Ju-WC
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:38:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mZrky-0007IM-Ht
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:38:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633945083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5m4v3d5iIKVGet0BwX6OfrI9ulTPb8m0tb8gfSVd4qQ=;
 b=iUsfzxxq7He9y2kJtb5YFemkRtoWq2h3NP/pFj9xhJYB9zaVIRCMpsYuVaXVnaNchDV8VI
 oriO5VQJv3f61TsKzSn7/sgTT9/evuBBsmWQffo6t7pvOAUR3XqLm+8opgyFMu0zEGyBR3
 0o6oPuKiv2A8LHZJZC3iMBxN5+Dpnyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248--74eujPeNr65NF_s52WdfQ-1; Mon, 11 Oct 2021 05:38:01 -0400
X-MC-Unique: -74eujPeNr65NF_s52WdfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44C4610A8E01;
 Mon, 11 Oct 2021 09:38:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C313C60871;
 Mon, 11 Oct 2021 09:37:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1EAB618009D4; Mon, 11 Oct 2021 11:37:58 +0200 (CEST)
Date: Mon, 11 Oct 2021 11:37:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Message-ID: <20211011093758.kpjpw2htfvcra5mb@sirius.home.kraxel.org>
References: <20211005132041.B884E745953@zero.eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <20211005132041.B884E745953@zero.eik.bme.hu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 03:12:05PM +0200, BALATON Zoltan wrote:
> This device is part of a superio/ISA bridge chip and IRQs from it are
> routed to an ISA interrupt set by the Interrupt Line PCI config
> register. Change uhci_update_irq() to allow this and use it from
> vt82c686-uhci-pci.

Hmm, shouldn't this logic be part of the superio bridge emulation?

take care,
  Gerd


