Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D423E560E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:56:49 +0200 (CEST)
Received: from localhost ([::1]:38802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNZ2-0001vb-Io
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNY4-0000mQ-E0
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:55:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNY2-00073F-PV
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628585745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Auch1iSdcp8j/V5EAEwtAsXQlSI+nekfMPagBEfqkrI=;
 b=SYhHjuR7LgeDr3jKb7Tj4aJgb6s0+KuoFOVxGGdSlrOsXcX1LCFS+LRdpzJla1LFJ8azLB
 lMqMqelw58iRBSrOIk6CVXCVlwuJXn0sDfOjoQQr0F/RC2rUPzdZapra9SFe6Hj+4uU2S2
 aTegF9mmuLb8ZNzNfOtemVSVpgErh9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-C_MVII9NOk-jXLbVos5gvw-1; Tue, 10 Aug 2021 04:55:44 -0400
X-MC-Unique: C_MVII9NOk-jXLbVos5gvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14A60100F76E;
 Tue, 10 Aug 2021 08:55:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1A7860854;
 Tue, 10 Aug 2021 08:55:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 45D0818003AA; Tue, 10 Aug 2021 10:55:41 +0200 (CEST)
Date: Tue, 10 Aug 2021 10:55:41 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH for 6.1] ui/gtk: retry sending VTE console input
Message-ID: <20210810085541.qoxclad5m5hofogy@sirius.home.kraxel.org>
References: <20210810063257.17411-1-vr_qemu@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20210810063257.17411-1-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 08:32:57AM +0200, Volker Rümelin wrote:
> Commit 584af1f1d9 ("ui/gtk: add a keyboard fifo to the VTE
> consoles") changed the VTE chardev backend code to rely on the
> chr_accept_input() callback function. The code expects a
> chr_accept_input() call whenever qemu_chr_be_can_write() bytes
> were written. It turns out this is wrong. Some chardev
> frontends only call this callback after can_write was 0.
> 
> Change the code to send data until the keyboard fifo is empty
> or qemu_chr_be_can_write() returns 0.
> 
> Fixes: 584af1f1d9 ("ui/gtk: add a keyboard fifo to the VTE consoles")
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>

Queued.

thanks,
  Gerd


