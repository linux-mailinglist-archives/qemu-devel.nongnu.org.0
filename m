Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2402628E049
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 14:08:24 +0200 (CEST)
Received: from localhost ([::1]:55542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSfZv-0000Ib-65
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 08:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSfYb-0007eo-8B
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 08:07:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSfYY-0002g2-VL
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 08:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602677215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRjheYlcht7isnnL+Bpegz1QVYfpsa+BtyM3LdyxH2w=;
 b=KL4+bbgif/hXVKCH0YGiLRYgpvEYGxfVd540ncwYSK1UbTDxPfhwErkd5wD/FWasi9SV38
 mdEyH8hj2P/IT6SAWW/DdVbqmKrpGQbx4KP+HexGgKQm75nNHyiAFOL7lstHIFWW4ppRHq
 Vvd4kGcEET6XAuUAozIu2CSJHDqME/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-YD-osvK_PbucyTAqCyxZCQ-1; Wed, 14 Oct 2020 08:06:54 -0400
X-MC-Unique: YD-osvK_PbucyTAqCyxZCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA46356BE6;
 Wed, 14 Oct 2020 12:06:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EF645D9DD;
 Wed, 14 Oct 2020 12:06:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4D78F9CA5; Wed, 14 Oct 2020 14:06:50 +0200 (CEST)
Date: Wed, 14 Oct 2020 14:06:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paul Zimmerman <pauldzim@gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-dwc2: fix divide-by-zero in
 dwc2_handle_packet()
Message-ID: <20201014120650.btvwfynrlpdf5hz3@sirius.home.kraxel.org>
References: <20201012150356.79670-1-mcascell@redhat.com>
 <CADBGO7-w7txnd6MHAY0ge3k3LRcn0FfGDU9znQU7qxQddJQT0A@mail.gmail.com>
 <20201013070423.ahsq7dvpwcsl6ouj@sirius.home.kraxel.org>
 <CADBGO7-BuSh04JctYpQkHoG02cANfet6Zy2fAHVx0gq0cL96jQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADBGO7-BuSh04JctYpQkHoG02cANfet6Zy2fAHVx0gq0cL96jQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 03:37:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: gaoning.pgn@antgroup.com, Mauro Matteo Cascella <mcascell@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, linyi.lxw@antfin.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I sent you a patch to fix up several assert()s, including that one, about a
> month ago. Did you miss it?
> https://lore.kernel.org/qemu-devel/20200920021449.830-1-pauldzim@gmail.com

Seems I missed that, or deleted by accident.
Added to qemu queue now.

thanks,
  Gerd


